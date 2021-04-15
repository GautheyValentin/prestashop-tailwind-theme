{if $page.page_name == 'index'}
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-5 p-5" itemscope
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