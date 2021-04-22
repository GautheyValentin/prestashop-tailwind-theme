
{block name='cart_detailed_totals'}
<div class="">

  <div class="">
    {foreach from=$cart.subtotals item="subtotal"}
      {if $subtotal && $subtotal.value|count_characters > 0 && $subtotal.type !== 'tax'}
        <div class="flex justify-between" id="cart-subtotal-{$subtotal.type}">
          <span class="uppercase font-medium{if 'products' === $subtotal.type} {/if}">
            {if 'products' == $subtotal.type}
              {$cart.summary_string}
            {else}
              {$subtotal.label}
            {/if}
          </span>
          <span class="uppercase">
            {if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}
          </span>
        </div>
        {if $subtotal.type === 'shipping'}
          <div><small class="value">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
        {/if}
      {/if}
    {/foreach}
  </div>

  {block name='cart_summary_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}

  {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}
</div>
{/block}
