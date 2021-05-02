// @ts-ignore
import $ from 'jquery';
// @ts-ignore
import prestashop from 'prestashop';

const createInputFile = () => {
  $(prestashop.themeSelectors.fileInput).on('change', (event: any) => {
    let target;
    let file;

    // eslint-disable-next-line
    if ((target = $(event.currentTarget)[0]) && (file = target.files[0])) {
      $(target).prev().text(file.name);
    }
  });
};

const createProductSpin = () => {
  const quantityInput = $(prestashop.selectors.quantityWanted);

  quantityInput.focusout(() => {
    if (quantityInput.val() === '' || quantityInput.val() < quantityInput.attr('min')) {
      quantityInput.val(quantityInput.attr('min'));
      quantityInput.trigger('change');
    }
  });

  $('body').on('change keyup', prestashop.selectors.quantityWanted, (e: any) => {
    if (quantityInput.val() !== '') {
      $(e.currentTarget).trigger('touchspin.stopspin');
      prestashop.emit('updateProduct', {
        eventType: 'updatedProductQuantity',
        event: e,
      });
    }
  });
};

$(() => {
  createProductSpin();
  createInputFile();

  prestashop.on('updatedProduct', (event: any) => {
    createInputFile();
    if (event && event.product_minimal_quantity) {
      const minimalProductQuantity = parseInt(event.product_minimal_quantity, 10);
      const quantityInputSelector = prestashop.selectors.quantityWanted;
      const quantityInput = $(quantityInputSelector);

      quantityInput.trigger('touchspin.updatesettings', {
        min: minimalProductQuantity,
      });
    }
    $($(prestashop.themeSelectors.product.activeTabs).attr('href')).addClass('active').removeClass('fade');
    $(prestashop.themeSelectors.product.imagesModal).replaceWith(event.product_images_modal);
  });
});
