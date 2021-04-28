
<div id="order-items" class="flex flex-col w-full md:w-8/12">
  <div class="flex w-full uppercase font-medium">
    {block name='order_items_table_head'}
      <h3 class="w-full text-center md:text-left md:w-6/12">{l s='Order items' d='Shop.Theme.Checkout'}</h3>
      <h3 class="w-2/12 hidden md:block">{l s='Unit price' d='Shop.Theme.Checkout'}</h3>
      <h3 class="w-2/12 hidden md:block">{l s='Quantity' d='Shop.Theme.Checkout'}</h3>
      <h3 class="w-2/12 hidden md:block">{l s='Total products' d='Shop.Theme.Checkout'}</h3>
    {/block}
  </div>

  <div class="flex flex-col w-full">

    {block name='order_confirmation_table'}
      {foreach from=$products item=product}
        <div class="flex flex-wrap mt-5">
          <div class="w-full md:w-6/12 flex space-x-4">
            {if !empty($product.cover)}
              <img class="rounded-lg border border-gray-300 w-full max-w-90" src="{$product.cover.medium.url}" loading="lazy" />
            {else}
              <img class="rounded-lg border border-gray-300 w-full max-w-90" src="{$urls.no_picture_image.bySize.medium_default.url}" loading="lazy" />
            {/if}
            {if $add_product_link}<a href="{$product.url}" target="_blank">{/if}
              <span>{$product.name}</span>
            {if $add_product_link}</a>{/if}
            {if is_array($product.customizations) && $product.customizations|count}
              {foreach from=$product.customizations item="customization"}
                <div class="customizations">
                  <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                </div>
                <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
                          <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                      </div>
                      <div class="modal-body">
                        {foreach from=$customization.fields item="field"}
                          <div class="product-customization-line row">
                            <div class="col-sm-3 col-xs-4 label">
                              {$field.label}
                            </div>
                            <div class="col-sm-9 col-xs-8 value">
                              {if $field.type == 'text'}
                                {if (int)$field.id_module}
                                  {$field.text nofilter}
                                {else}
                                  {$field.text}
                                {/if}
                              {elseif $field.type == 'image'}
                                <img src="{$field.image.small.url}" loading="lazy">
                              {/if}
                            </div>
                          </div>
                        {/foreach}
                      </div>
                    </div>
                  </div>
                </div>
              {/foreach}
            {/if}
            {hook h='displayProductPriceBlock' product=$product type="unit_price"}
          </div>
          <div class="w-full flex mt-2 md:mt-0 md:w-6/12">
            <div class="w-1/3">{$product.price}</div>
            <div class="w-1/3">{$product.quantity}</div>
            <div class="w-1/3">{$product.total}</div>
          </div>
        </div>
      {/foreach}

      <hr class="border-gray-400 mt-5" />
      <table class="mt-5 w-full">
        {foreach $subtotals as $subtotal}
          {if $subtotal.type !== 'tax' && $subtotal.label !== null}
            <tr class="font-light">
              <td>{$subtotal.label}</td>
              <td class="text-right">{if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}</td>
            </tr>
          {/if}
        {/foreach}

        {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
          <tr class="">
            <td><span class="uppercase font-medium text-lg">{$totals.total.label}&nbsp;{$labels.tax_short}</span></td>
            <td class="text-right font-medium text-lg">{$totals.total.value}</td>
          </tr>
          <tr class="total-value font-weight-bold">
            <td><span class="uppercase font-medium text-lg">{$totals.total_including_tax.label}</span></td>
            <td class="text-right font-medium text-lg">{$totals.total_including_tax.value}</td>
          </tr>
        {else}
          <tr class="">
            <td>
              <span class="uppercase font-medium text-lg">{$totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$labels.tax_short}{/if}</span>
            </td>
            <td class="text-right font-medium text-lg">{$totals.total.value}</td>
          </tr>
        {/if}
        {if $subtotals.tax.label !== null}
          <tr class="">
            <td colspan="2">
              <span class="uppercase font-medium text-lg">{l s='%label%:' sprintf=['%label%' => $subtotals.tax.label] d='Shop.Theme.Global'}</span>
              &nbsp;
              <span class="text-right font-medium text-lg">{$subtotals.tax.value}</span>
            </td>
          </tr>
        {/if}
      </table>
    {/block}

  </div>
</div>
