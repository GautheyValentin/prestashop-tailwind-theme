
{block name='cart_detailed_actions'}
  <div class="mt-5">
    {if $cart.minimalPurchaseRequired}
      <div class="alert alert-warning" role="alert">
        {$cart.minimalPurchaseRequired}
      </div>
      <div class="text-sm-center">
        <button type="button" class="primary-red disabled" disabled>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</button>
      </div>
    {elseif empty($cart.products) }
      <div class="text-sm-center">
        <button type="button" class="primary-red disabled" disabled>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</button>
      </div>
    {else}
      <div class="flex justify-center">
        <a href="{$urls.pages.order}" class="primary-red">{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
      </div>
      {hook h='displayExpressCheckout'}
    {/if}
  </div>
{/block}
