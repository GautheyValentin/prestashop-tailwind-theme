// @ts-ignore
import prestashop from 'prestashop';
// @ts-ignore
import $ from 'jquery';

prestashop.blockcart = prestashop.blockcart || {};

prestashop.blockcart.showModal = (html: string) => {
  const getBlockCartModal = () => $('#blockcart-modal');

  let blockCartModal = getBlockCartModal();
  if (blockCartModal.length) {
    blockCartModal.remove();
  }

  $('body').append(html);

  blockCartModal = getBlockCartModal();

  $(blockCartModal).find('[data-dismiss="modal"]').on('click', (event: any) => {
    blockCartModal.remove();
    // $(prestashop.selectors.product.addToCart).prop('disabled', false);
    prestashop.emit('updateProduct', {
      reason: event.currentTarget.dataset,
      event,
    });
  });
};


prestashop.blockcart = prestashop.blockcart || {};

var showModal = prestashop.blockcart.showModal || function (modal: any) {
  var $body = $('body');
  $body.append(modal);
  $body.one('click', '#blockcart-modal', function (event: any) {
    if (event.target.id === 'blockcart-modal') {
      $(event.target).remove();
    }
  });
};

prestashop.on(
  'updateCart',
  function (event: any) {
    var refreshURL = $('.blockcart').data('refresh-url');
    var requestData = {};
    if (event && event.reason && typeof event.resp !== 'undefined' && !event.resp.hasError) {
      requestData = {
        id_customization: event.reason.idCustomization,
        id_product_attribute: event.reason.idProductAttribute,
        id_product: event.reason.idProduct,
        action: event.reason.linkAction
      };
    }
    if (event && event.resp && event.resp.hasError) {
      prestashop.emit('showErrorNextToAddtoCartButton', { errorMessage: event.resp.errors.join('<br/>')});
    }
    $.post(refreshURL, requestData).then(function (resp: any) {
      var html = $('<div />').append($.parseHTML(resp.preview));
      $('.blockcart').replaceWith($(resp.preview));
      if (resp.modal) {
        showModal(resp.modal);
      }
    }).fail(function (resp: any) {
      prestashop.emit('handleError', { eventType: 'updateShoppingCart', resp: resp });
    });
  }
);
