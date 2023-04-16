import Alpine from 'alpinejs'
 
(window as any).Alpine = Alpine
 
Alpine.start()

// @ts-ignore
import prestashop from 'prestashop';

// THEME ID / CLASS
import './selectors';

// CONNFIRMATION PRODUCT
import './components/block-cart';

// REFRESH PRODUCT AND MODAL IMAGE
import './product';

// REFRESH QUANTITY
import './cart';

// SEARCH MODULE
import './search';

// import './checkout';

// import Form from './components/form';

// $(() => {
//   const form = new Form();
//   const productMinitature = new ProductMinitature();
//   const productSelect = new ProductSelect();
//   form.init();
//   productMinitature.init();
//   productSelect.init();
// });
