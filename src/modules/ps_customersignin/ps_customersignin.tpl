{if $logged}
  <a class="flex md:ml-5" href="{$urls.pages.my_account}"
    title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
    <i class="fas fa-user-circle fa-lg"></i>
    <span class="hidden lg:block ml-1">{$customerName}</span>
  </a>
{else}
  <a class="flex md:ml-5 item-center space-x-1" href="{$urls.pages.my_account}"
    title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}" rel="nofollow">
    <i class="fas fa-user-circle fa-lg"></i>
    <span class="hidden lg:block">
      {l s='Sign in' d='Shop.Theme.Actions'}
    </span>
  </a>
{/if}