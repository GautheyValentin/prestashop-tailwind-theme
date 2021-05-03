// @ts-ignore
import $ from 'jquery';
// @ts-ignore
import prestashop from 'prestashop';

function setUpCheckout() {
  $(prestashop.themeSelectors.checkout.termsLink).on('click', (event: any) => {
    event.preventDefault();
    let url = $(event.target).attr('href');
    if (url) {
      // TODO: Handle request if no pretty URL
      url += '?content_only=1';
      $.get(url, (content: any) => {
        $(prestashop.themeSelectors.modal)
          .find(prestashop.themeSelectors.modalContent)
          .html($(content).find('.page-cms').contents());
      }).fail((resp: any) => {
        prestashop.emit('handleError', { eventType: 'clickTerms', resp });
      });
    }

    $(prestashop.themeSelectors.modal).modal('show');
  });

  $(prestashop.themeSelectors.checkout.giftCheckbox).on('click', () => {
    $('#gift').collapse('toggle');
  });
}

function toggleImage() {
  // Arrow show/hide details Checkout page
  $(prestashop.themeSelectors.checkout.imagesLink).on('click', () => {
    // const icon = $(this).find('i.material-icons');
    // if (icon.text() === 'expand_more') {
    //   icon.text('expand_less');
    // } else {
    //   icon.text('expand_more');
    // }
  });
}

$(() => {
  if ($('body#checkout').length === 1) {
    setUpCheckout();
    toggleImage();
  }

  prestashop.on('updatedDeliveryForm', (params: any) => {
    if (typeof params.deliveryOption === 'undefined' || params.deliveryOption.length === 0) {
      return;
    }

    $(prestashop.themeSelectors.checkout.carrierExtraContent).hide();

    params.deliveryOption.next(prestashop.themeSelectors.checkout.carrierExtraContent).slideDown();
  });
});
