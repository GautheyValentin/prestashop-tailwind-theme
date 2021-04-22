import $ from 'jquery';
import prestashop from 'prestashop';
import ProductSelect from './components/product-select';

$(() => {
  createProductSpin();
  createInputFile();

  prestashop.on('updatedProduct', (event) => {
    createInputFile();
    if (event && event.product_minimal_quantity) {
      const minimalProductQuantity = parseInt(event.product_minimal_quantity, 10);
      const quantityInputSelector = prestashop.selectors.quantityWanted;
      const quantityInput = $(quantityInputSelector);

      // @see http://www.virtuosoft.eu/code/bootstrap-touchspin/ about Bootstrap TouchSpin
      quantityInput.trigger('touchspin.updatesettings', {
        min: minimalProductQuantity,
      });
    }
    $($(prestashop.themeSelectors.product.activeTabs).attr('href')).addClass('active').removeClass('fade');
    $(prestashop.themeSelectors.product.imagesModal).replaceWith(event.product_images_modal);

    const productSelect = new ProductSelect();
    productSelect.init();
  });

  function createInputFile() {
    $(prestashop.themeSelectors.fileInput).on('change', (event) => {
      let target;
      let file;

      // eslint-disable-next-line
      if ((target = $(event.currentTarget)[0]) && (file = target.files[0])) {
        $(target).prev().text(file.name);
      }
    });
  }

  function createProductSpin() {
    if (!prestashop.selectors) return;
    const $quantityInput = $(prestashop.selectors.quantityWanted);

    $quantityInput.TouchSpin({
      verticalbuttons: true,
      verticalupclass: 'material-icons touchspin-up',
      verticaldownclass: 'material-icons touchspin-down',
      buttondown_class: 'btn btn-touchspin js-touchspin',
      buttonup_class: 'btn btn-touchspin js-touchspin',
      min: parseInt($quantityInput.attr('min'), 10),
      max: 1000000,
    });

    $quantityInput.focusout(() => {
      if ($quantityInput.val() === '' || $quantityInput.val() < $quantityInput.attr('min')) {
        $quantityInput.val($quantityInput.attr('min'));
        $quantityInput.trigger('change');
      }
    });

    $('body').on('change keyup', prestashop.selectors.quantityWanted, (e) => {
      if ($quantityInput.val() !== '') {
        $(e.currentTarget).trigger('touchspin.stopspin');
        prestashop.emit('updateProduct', {
          eventType: 'updatedProductQuantity',
          event: e,
        });
      }
    });
  }
});
