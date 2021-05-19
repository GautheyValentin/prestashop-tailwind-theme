
{block name='order_products_table'}
  <div class="hidden md:block card mt-5">
    <table id="order-products" class="w-full">
      <thead class="bg-gray-200">
        <tr>
          <th class="text-left p-2">{l s='Product' d='Shop.Theme.Catalog'}</th>
          <th class="text-left p-2">{l s='Quantity' d='Shop.Theme.Catalog'}</th>
          <th class="text-left p-2">{l s='Unit price' d='Shop.Theme.Catalog'}</th>
          <th class="text-left p-2">{l s='Total price' d='Shop.Theme.Catalog'}</th>
        </tr>
      </thead>
      {foreach from=$order.products item=product}
        <tr>
          <td class="border p-2">
            <span class="font-medium">
              {$product.name}
            </span>

            {if isset($product.download_link)}
              <a  class="ml-5" href="{$product.download_link}"><i class="fas fa-download"></i> {l s='Download' d='Shop.Theme.Actions'}</a>
            {/if}
            
            <br/>
            {if $product.product_reference}
              {l s='Reference' d='Shop.Theme.Catalog'}: {$product.product_reference}<br/>
            {/if}
            {if $product.customizations}
              {foreach from=$product.customizations item="customization"}
                <div class="customization">
                  <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                </div>
                <div id="_desktop_product_customization_modal_wrapper_{$customization.id_customization}">
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
                </div>
              {/foreach}
            {/if}
          </td>
          <td class="border p-2">
            {if $product.customizations}
              {foreach $product.customizations as $customization}
                {$customization.quantity}
              {/foreach}
            {else}
              {$product.quantity}
            {/if}
          </td>
          <td class="border p-2 text-right">{$product.price}</td>
          <td class="border p-2 text-right">{$product.total}</td>
        </tr>
      {/foreach}
      <tfoot>
        {foreach $order.subtotals as $line}
          {if $line.value}
            <tr>
              <td colspan="3" class="border p-2 text-right">{$line.label}</td>
              <td class="border p-2 text-right">{$line.value}</td>
            </tr>
          {/if}
        {/foreach}
        <tr class="font-medium">
          <td colspan="3" class="border p-2 text-right">{$order.totals.total.label}</td>
          <td class="border p-2 text-right">{$order.totals.total.value}</td>
        </tr>
      </tfoot>
    </table>
  </div>

  <div class="card mt-5 md:hidden divide-y">
    {foreach from=$order.products item=product}
        <div class="flex flex-wrap py-2">
          <div class="w-full sm:w-5/12">
            <div class="font-medium">{$product.name}</div>
            {if $product.product_reference}
              <div class="font-medium">{l s='Reference' d='Shop.Theme.Catalog'}: {$product.product_reference}</div>
            {/if}
            {if $product.customizations}
              {foreach $product.customizations as $customization}
                <div class="font-medium">
                  <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                </div>
                <div id="_mobile_product_customization_modal_wrapper_{$customization.id_customization}">
                </div>
              {/foreach}
            {/if}
          </div>
          <div class="w-full sm:w-7/12 flex">
            <div class="w-4/12">
              {$product.price}
            </div>
            <div class="w-4/12">
              {if $product.customizations}
                {foreach $product.customizations as $customization}
                  {$customization.quantity}
                {/foreach}
              {else}
                {$product.quantity}
              {/if}
            </div>
            <div class="w-4/12 text-right">
              {$product.total}
            </div>
          </div>
        </div>
    {/foreach}
  </div>
  <div class="card mt-5 md:hidden">
    {foreach $order.subtotals as $line}
      {if $line.value}
        <div class="flex">
          <div class="w-8/12"><strong>{$line.label}</strong></div>
          <div class="w-4/12 text-right">{$line.value}</div>
        </div>
      {/if}
    {/foreach}
    <div class="flex">
      <div class="w-8/12"><strong>{$order.totals.total.label}</strong></div>
      <div class="w-4/12 text-right">{$order.totals.total.value}</div>
    </div>
  </div>
{/block}
