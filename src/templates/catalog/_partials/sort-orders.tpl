<span>{l s='Sort by:' d='Shop.Theme.Global'}</span>
<div class="ml-5 relative flex items-center" x-data="{literal}{isOpen: false}{/literal}">
  <button class="px-2" rel="nofollow" @click="isOpen = !isOpen" @click.away="isOpen = false">
    {if $listing.sort_selected}{$listing.sort_selected}{else}{l s='Select' d='Shop.Theme.Actions'}{/if}
    <i class="material-icons float-xs-right">&#xE5C5;</i>
  </button>
  <div class="flex flex-col absolute top-7 right-0 z-10 bg-white border border-solid border-gray-200 rounded min-w-max"
    :class="{literal}{'hidden': !isOpen}{/literal}">
    {foreach from=$listing.sort_orders item=sort_order}
      <a rel="nofollow" href="{$sort_order.url}"
        class="hover:bg-gray-200 p-2 {($sort_order.current) ? 'bg-gray-200' : ''}">
        {$sort_order.label}
      </a>
    {/foreach}
  </div>
</div>