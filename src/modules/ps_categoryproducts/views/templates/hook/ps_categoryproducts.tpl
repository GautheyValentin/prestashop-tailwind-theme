
<section class="featured-products clearfix mt-3">
  <h2>
    {if $products|@count == 1}
      {l s='%s other product in the same category:' sprintf=[$products|@count] d='Shop.Theme.Catalog'}
    {else}
      {l s='%s other products in the same category:' sprintf=[$products|@count] d='Shop.Theme.Catalog'}
    {/if}
  </h2>
  {include file="catalog/_partials/productlist.tpl" products=$products}
</section>
