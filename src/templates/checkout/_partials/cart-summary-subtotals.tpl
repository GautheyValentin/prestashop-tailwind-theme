

<div class="mt-5 card-block cart-summary-subtotals-container">

  {foreach from=$cart.subtotals item="subtotal"}
    {if $subtotal && $subtotal.value|count_characters > 0 && $subtotal.type !== 'tax'}
      <div class="cart-summary-line cart-summary-subtotals flex justify-between" id="cart-subtotal-{$subtotal.type}">

        <span class="font-medium uppercase">
            {$subtotal.label}
        </span>

        <span class="value">
          {if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}
        </span>
      </div>
    {/if}
  {/foreach}

</div>

