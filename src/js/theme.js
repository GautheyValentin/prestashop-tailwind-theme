import './selectors';

import './responsive';
import './checkout';
import './customer';
import './listing';
import './product';
import './cart';

import prestashop from 'prestashop';
// eslint-disable-next-line import/no-extraneous-dependencies
import EventEmitter from 'events';
import $ from 'jquery';
import Form from './components/form';
import ProductMinitature from './components/product-miniature';
import ProductSelect from './components/product-select';

import './lib/bootstrap-filestyle.min';
import './lib/jquery.scrollbox.min';

import './components/block-cart';

import 'alpinejs';
/* eslint-enable */

// "inherit" EventEmitter
// eslint-disable-next-line
for (const i in EventEmitter.prototype) {
  prestashop[i] = EventEmitter.prototype[i];
}

$(() => {
  const form = new Form();
  const productMinitature = new ProductMinitature();
  const productSelect = new ProductSelect();
  form.init();
  productMinitature.init();
  productSelect.init();
});