

<section class="featured-products clearfix mt-3">
  <h2 class="h2 products-section-title text-uppercase">
    {l s='New products' d='Shop.Theme.Catalog'}
  </h2>
  {include file="catalog/_partials/productlist.tpl" products=$products}
  <a class="all-product-link float-xs-left float-md-right h4" href="{$allNewProductsLink}">
    {l s='All new products' d='Shop.Theme.Catalog'}<i class="material-icons">&#xE315;</i>
  </a>
</section>

