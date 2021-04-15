
<section class="mt-16">
  <h2 class="text-xl text-center font-bold mb-8">
    {l s='Popular Products' d='Shop.Theme.Catalog'}
  </h2>
  {include file="catalog/_partials/productlist.tpl" products=$products}
  <a class="float-right flex items-center" href="{$allProductsLink}">
    {l s='All products' d='Shop.Theme.Catalog'}<i class="material-icons">&#xE315;</i>
  </a>
</section>