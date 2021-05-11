
<section class="mt-10 w-full">
  <h2 class="text-xl text-center font-bold mb-5">
    {l s='Popular Products' d='Shop.Theme.Catalog'}
  </h2>
  {include file="catalog/_partials/productlist.tpl" products=$products}
  <a class="float-right flex items-center mt-5" href="{$allProductsLink}">
    {l s='All products' d='Shop.Theme.Catalog'}<i class="fas fa-angle-right ml-2"></i>
  </a>
</section>