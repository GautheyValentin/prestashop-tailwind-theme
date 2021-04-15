{include file="catalog/_partials/productlist.tpl" products=$listing.products cssClass="row"}

{block name='pagination'}
  {include file='_partials/pagination.tpl' pagination=$listing.pagination}
{/block}

<div class="mt-2 flex justify-end hidden">
  <a href="#header">
    {l s='Back to top' d='Shop.Theme.Actions'}
    <i class="material-icons">&#xE316;</i>
  </a>
</div>