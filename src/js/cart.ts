// @ts-ignore
import $ from 'jquery';
// @ts-ignore
import prestashop from 'prestashop';

prestashop.cart = prestashop.cart || {};

prestashop.cart.active_inputs = null;

const spinnerSelector = 'input[name="product-quantity-spin"]';
let hasError = false;
let isUpdateOperation = false;
let errorMsg = '';

class CheckUpdateQuantityOperations {
  public static switchErrorStat() {
    const checkoutBtn = $('#checkout-btn');
    if ($('#notifications article.alert-danger').length || (errorMsg !== '' && !hasError)) {
      checkoutBtn.addClass('disabled');
    }

    if (errorMsg !== '') {
      const strError = ` <article class="bg-red-550 bg-opacity-20 rounded p-2 border border-red-550" role="alert" data-alert="danger"><ul><li>${errorMsg}</li></ul></article>`;
      $('#notifications .container').html(strError);
      errorMsg = '';
      isUpdateOperation = false;
      if (hasError) {
        checkoutBtn.removeClass('disabled');
      }
    } else if (!hasError && isUpdateOperation) {
      hasError = false;
      isUpdateOperation = false;
      $('#notifications .container').html('');
      checkoutBtn.removeClass('disabled');
    }
  }

  public static checkUpdateOpertation(resp: any) {
    // eslint-disable-next-line no-prototype-builtins
    hasError = resp.hasOwnProperty('hasError');
    const errors = resp.errors || '';

    if (errors instanceof Array) {
      errorMsg = errors.join(' ');
    } else {
      errorMsg = errors;
    }

    isUpdateOperation = true;
  }
}

const promises: any[] = [];

const createSpin = () => {
  CheckUpdateQuantityOperations.switchErrorStat();
};

const camelize = (subject: any) => {
  const actionTypeParts = subject.split('-');
  let i;
  let part;
  let camelizedSubject = '';
  for (i = 0; i < actionTypeParts.length; i += 1) {
    part = actionTypeParts[i];
    if (i !== 0) {
      part = part.substring(0, 1).toUpperCase() + part.substring(1);
    }
    camelizedSubject += part;
  }
  return camelizedSubject;
};

const abortPreviousRequests = () => {
  let promise;
  while (promises.length > 0) {
    promise = promises.pop();
    promise.abort();
  }
};

const handleCartAction = (event: any) => {
  event.preventDefault();

  const target = $(event.currentTarget);
  const { dataset } = event.currentTarget;

  const requestData = {
    ajax: '1',
    action: 'update',
  };

  const cartAction = {
    url: target.attr('href'),
    type: camelize(target.data('link-action')),
  };

  abortPreviousRequests();

  $.ajax({
    url: cartAction.url,
    method: 'POST',
    data: requestData,
    dataType: 'json',
    beforeSend(jqXHR: any) {
      promises.push(jqXHR);
    },
  })
    .then((resp: any) => {
      CheckUpdateQuantityOperations.checkUpdateOpertation(resp);
      const $quantityInput = $(spinnerSelector);
      $quantityInput.val(resp.quantity);

      prestashop.emit('updateCart', {
        reason: dataset,
        resp,
      });
    })
    .fail((resp: any) => {
      prestashop.emit('handleError', {
        eventType: 'updateProductInCart',
        resp,
        cartAction: cartAction.type,
      });
    });
};

const sendUpdateQuantityInCartRequest = (cartUrl: any, requestData: any, target: any) => {
  abortPreviousRequests();

  return $.ajax({
    url: cartUrl,
    method: 'POST',
    data: requestData,
    dataType: 'json',
    beforeSend(jqXHR: any) {
      promises.push(jqXHR);
    },
  })
    .then((resp: any) => {
      CheckUpdateQuantityOperations.checkUpdateOpertation(resp);
      target.val(resp.quantity);

      let dataset;
      if (target && target.dataset) {
        // eslint-disable-next-line
          dataset = target.dataset;
      } else {
        dataset = resp;
      }

      // Refresh cart preview
      prestashop.emit('updateCart', {
        reason: dataset,
        resp,
      });
    })
    .fail((resp: any) => {
      prestashop.emit('handleError', {
        eventType: 'updateProductQuantityInCart',
        resp,
      });
    });
};

const getQuantityChangeType = (quantity: any) => (quantity > 0 ? 'up' : 'down');

const getRequestData = (quantity: any) => ({
  ajax: '1',
  qty: Math.abs(quantity),
  action: 'update',
  op: getQuantityChangeType(quantity),
});

const updateProductQuantityInCart = (event: any) => {
  const target = $(event.currentTarget);
  const updateQuantityInCartUrl = target.data('update-url');
  const baseValue = target.attr('value');

  const targetValue = target.val();

  if (targetValue !== parseInt(targetValue, 10) || targetValue < 0 || Number.isNaN(targetValue)) {
    target.val(baseValue);
    return;
  }

  const qty = targetValue - baseValue;
  if (qty === 0) {
    return;
  }

  target.attr('value', targetValue);
  sendUpdateQuantityInCartRequest(updateQuantityInCartUrl, getRequestData(qty), target);
};

$(() => {
  prestashop.on('updateCart', () => {
    try {
      $('.quickview').modal('hide');
    } catch (e) {
      console.log('No QuickView');
    }
  });

  prestashop.on('updatedCart', () => {
    createSpin();
  });

  createSpin();

  const $body = $('body');

  $body.on('click', '[data-link-action="delete-from-cart"], [data-link-action="remove-voucher"]', handleCartAction);

  const quantityInput = $(spinnerSelector);

  quantityInput.focusout(() => {
    if (quantityInput.val() === '' || quantityInput.val() < quantityInput.attr('min')) {
      quantityInput.val(quantityInput.attr('min'));
      quantityInput.trigger('change');
    }
  });

  quantityInput.on('change keyup', (event: any) => {
    if (event.type === 'keyup') {
      if (event.keyCode === 13) {
        updateProductQuantityInCart(event);
      }
      return false;
    }

    updateProductQuantityInCart(event);

    return false;
  });

  // const $timeoutEffect = 400;

  // $body.on('hidden.bs.collapse', '#promo-code', () => {
  //   $('.display-promo').show($timeoutEffect);
  // });

  // $body.on('click', '.promo-code-button', (event) => {
  //   event.preventDefault();

  //   $('#promo-code').collapse('toggle');
  // });

  // $body.on('click', '.display-promo', (event) => {
  //   $(event.currentTarget).hide($timeoutEffect);
  // });

  // $body.on('click', '.js-discount .code', (event) => {
  //   event.stopPropagation();

  //   const $code = $(event.currentTarget);
  //   const $discountInput = $('[name=discount_name]');

  //   $discountInput.val($code.text());
  //   // Show promo code field
  //   $('#promo-code').collapse('show');
  //   $('.display-promo').hide($timeoutEffect);

  //   return false;
  // });
});
