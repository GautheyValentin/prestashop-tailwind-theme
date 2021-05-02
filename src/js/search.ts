// @ts-ignore
import $ from 'jquery';

$(() => {
  const searchWidget = $('#search_widget');
  const searchBox = searchWidget.find('input[type=text]');
  const searchURL = searchWidget.attr('data-search-controller-url');

  $.widget('prestashop.Widget', $.ui.autocomplete, {
    // eslint-disable-next-line no-underscore-dangle
    _renderItem(ul: any, product: any) {
      return $('<li>')
        .append($('<a>')
          .append($('<span>').html(product.name).addClass('product'))).appendTo(ul);
    },
  });

  searchBox.Widget({
    source(query: any, response: any) {
      $.post(searchURL, {
        s: query.term,
        resultsPerPage: 10,
      }, null, 'json')
        .then((resp: any) => {
          response(resp.products);
        })
        .fail(response);
    },
    select(event: any, ui: any) {
      const { url } = ui.item;
      window.location.href = url;
    },
  });
});
