
{extends file='checkout/cart.tpl'}

{block name='continue_shopping' append}
  <a href="{$urls.pages.index}" class="mt-5 block">
    <i class="fas fa-angle-left mr-2"></i> {l s='Continue shopping' d='Shop.Theme.Actions'}
  </a>
{/block}

{block name='cart_actions'}
  <div class="checkout text-sm-center card-block">
    <button type="button" class="btn btn-primary disabled" disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
  </div>
{/block}

{block name='continue_shopping'}{/block}
{block name='cart_voucher'}{/block}
{block name='display_reassurance'}{/block}
