
{block name='cart_detailed_actions'}
  <div class="mt-5" id="cart-detailed-actions">
    {if $cart.minimalPurchaseRequired}
      <div class="alert alert-warning" role="alert">
        {$cart.minimalPurchaseRequired}
      </div>
      <div class="flex justify-center">
        <button type="button" class="primary-red" disabled>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</button>
      </div>
    {elseif empty($cart.products) }
      <div class="flex justify-center">
        <button type="button" class="primary-red" disabled>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</button>
      </div>
    {else}
      <div class="flex justify-center">
        <a href="{$urls.pages.order}" class="primary-red" id="checkout-btn">{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
      </div>
    {/if}
    {hook h='displayExpressCheckout'}
  </div>
{/block}
