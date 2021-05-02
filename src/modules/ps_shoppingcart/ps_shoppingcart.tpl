<div 
  class="flex ml-2 border-solid border-l-2 border-grey-300 pl-2 blockcart {if $cart.products_count > 0}active{else}inactive{/if}"
  
  data-refresh-url="{$refresh_url}"
>
  {if $cart.products_count > 0}
    <a class="flex" rel="nofollow" href="{$cart_url}">
  {/if}
    <div class="relative">
      <i class="fas fa-shopping-cart fa-lg"></i>
      <span class="absolute -top-1 -right-1 bg-red-550 text-white px-1 text-xs rounded-full">{$cart.products_count}</span>
    </div>
    <span class="hidden lg:block ml-2">{l s='Cart' d='Shop.Theme.Checkout'}</span>
    
  {if $cart.products_count > 0}
    </a>
  {/if}
</div>
