
<div class="mt-5">

  {block name='cart_summary_total'}
    {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
      <div class="flex justify-between">
        <span class="font-medium text-lg">{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>
        <span>{$cart.totals.total.value}</span>
      </div>
      <div class="flex justify-betweenl">
        <span class="font-medium text-lg">{$cart.totals.total_including_tax.label}</span>
        <span>{$cart.totals.total_including_tax.value}</span>
      </div>
    {else}
      <div class="flex justify-between">
        <span class="font-medium text-lg">{$cart.totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>
        <span>{$cart.totals.total.value}</span>
      </div>
    {/if}
  {/block}

  {block name='cart_summary_tax'}
    {if $cart.subtotals.tax}
      <div class="flex justify-between">
        <span class="font-medium text-lg">{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}</span>
        <span>{$cart.subtotals.tax.value}</span>
      </div>
    {/if}
  {/block}

</div>
