{if $page.page_name == 'index' || $page.page_name == 'cart' || $page.page_name == 'order-confirmation' || $page.page_name == 'search'}
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-5 px-5" itemscope
    itemtype="https://schema.org/ItemList">
    {foreach from=$products item="product" key="position"}
      {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position}
    {/foreach}
  </div>
{else}
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-5" itemscope
    itemtype="https://schema.org/ItemList">
    {foreach from=$products item="product" key="position"}
      {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position}
    {/foreach}
  </div>
{/if}