
{extends file='checkout/cart.tpl'}

{block name='continue_shopping' append}
<div class="mt-5">
  <a href="{$urls.pages.index}">
    <i class="fas fa-angle-left mr-2"></i> {l s='Continue shopping' d='Shop.Theme.Actions'}
  </a>
</div>
{/block}

{block name='cart_actions'}
  <div class="flex justify-center mt-5">
    <button type="button" class="primary-red disabled" disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
  </div>
{/block}

{block name='continue_shopping'}{/block}
{block name='cart_voucher'}{/block}
{block name='display_reassurance'}{/block}
