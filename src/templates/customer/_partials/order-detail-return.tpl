
{block name='order_products_table'}
  <form id="order-return-form" action="{$urls.pages.order_follow}" method="post">

    <div class="card mt-5 hidden md:block">
      <table id="order-products" class="w-full">
        <thead class="bg-gray-200">
          <tr>
            <th class="text-left p-2"><input type="checkbox"/></th>
            <th class="text-left p-2">{l s='Product' d='Shop.Theme.Catalog'}</th>
            <th class="text-left p-2">{l s='Quantity' d='Shop.Theme.Catalog'}</th>
            <th class="text-left p-2">{l s='Returned' d='Shop.Theme.Customeraccount'}</th>
            <th class="text-left p-2">{l s='Unit price' d='Shop.Theme.Catalog'}</th>
            <th class="text-left p-2">{l s='Total price' d='Shop.Theme.Catalog'}</th>
          </tr>
        </thead>
        {foreach from=$order.products item=product name=products}
          <tr>
            <td class="border text-left p-2">
              {if !$product.customizations}
                <span id="_desktop_product_line_{$product.id_order_detail}">
                <input type="checkbox" id="cb_{$product.id_order_detail}" name="ids_order_detail[{$product.id_order_detail}]" value="{$product.id_order_detail}">
              </span>
              {else}
                {foreach $product.customizations  as $customization}
                  <span id="_desktop_product_customization_line_{$product.id_order_detail}_{$customization.id_customization}">
                  <input type="checkbox" id="cb_{$product.id_order_detail}" name="customization_ids[{$product.id_order_detail}][]" value="{$customization.id_customization}">
                </span>
                {/foreach}
              {/if}
            </td>
            <td class="border text-left p-2">
              <strong>{$product.name}</strong><br/>
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
            <td class="border text-left p-2">
              <div class="flex items-center">
              {if !$product.customizations}
                <div class="w-2/12">
                  {$product.quantity}
                </div>
                {if $product.quantity > $product.qty_returned}
                  <div class="w-10/12" id="_desktop_return_qty_{$product.id_order_detail}">
                    <select name="order_qte_input[{$product.id_order_detail}]" class="w-full">
                      {section name=quantity start=1 loop=$product.quantity+1-$product.qty_returned}
                        <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                      {/section}
                    </select>
                  </div>
                {/if}
              {else}
                {foreach $product.customizations as $customization}
                  <div class="current">
                    {$customization.quantity}
                  </div>
                  <div class="select" id="_desktop_return_qty_{$product.id_order_detail}_{$customization.id_customization}">
                    <select
                      name="customization_qty_input[{$customization.id_customization}]"
                      class="form-control form-control-select"
                    >
                      {section name=quantity start=1 loop=$customization.quantity+1}
                        <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                      {/section}
                    </select>
                  </div>
                {/foreach}
              {/if}
              </div>
            </td>
            <td class="border text-right p-2">{$product.qty_returned}</td>
            <td class="border text-right p-2">{$product.price}</td>
            <td class="border text-right p-2">{$product.total}</td>
          </tr>
        {/foreach}
        <tfoot>
          {foreach $order.subtotals as $line}
            {if $line.value}
              <tr>
                <td colspan="5" class="border p-2 text-right">{$line.label}</td>
                <td colspan="2" class="border p-2 text-right">{$line.value}</td>
              </tr>
            {/if}
          {/foreach}
          <tr class="font-medium">
            <td colspan="5" class="border p-2 text-right">{$order.totals.total.label}</td>
            <td colspan="2" class="border p-2 text-right">{$order.totals.total.value}</td>
          </tr>
        </tfoot>
      </table>
    </div>

    <div class="card mt-5 md:hidden">
      {foreach from=$order.products item=product}
        <div class="flex flex-wrap">
          <div class="w-1/12">
            {if !$product.customizations}
              <input type="checkbox" id="cb_{$product.id_order_detail}" name="ids_order_detail[{$product.id_order_detail}]" value="{$product.id_order_detail}">
            {else}
              {foreach $product.customizations  as $customization}
                <input type="checkbox" id="cb_{$product.id_order_detail}" name="ids_order_detail[{$product.id_order_detail}]" value="{$product.id_order_detail}">
              {/foreach}
            {/if}
          </div>
          <div class="w-11/12">
            <div class="flex flex-wrap">
              <div class="w-full sm:w-5/12">
                <div class="font-medium">{$product.name}</div>
                {if $product.product_reference}
                  <div class="ref">{l s='Reference' d='Shop.Theme.Catalog'}: {$product.product_reference}</div>
                {/if}
                {if $product.customizations}
                  {foreach $product.customizations as $customization}
                    <div class="customization">
                      <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                    </div>
                    <div id="_mobile_product_customization_modal_wrapper_{$customization.id_customization}">
                    </div>
                  {/foreach}
                {/if}
              </div>
              <div class="w-full sm:w-7/12">
                <div class="flex">
                  <div class="w-1/3">
                    {$product.price}
                  </div>
                  <div class="w-1/3">
                    {if $product.customizations}
                      {foreach $product.customizations as $customization}
                        <div class="q">{l s='Quantity' d='Shop.Theme.Catalog'}: {$customization.quantity}</div>
                        <div class="s" id="_mobile_return_qty_{$product.id_order_detail}_{$customization.id_customization}"></div>
                      {/foreach}
                    {else}
                      <div class="q">{l s='Quantity' d='Shop.Theme.Catalog'}: {$product.quantity}</div>
                      {if $product.quantity > $product.qty_returned}
                        <div class="s" id="_mobile_return_qty_{$product.id_order_detail}"></div>
                      {/if}
                    {/if}
                    {if $product.qty_returned > 0}
                      <div>{l s='Returned' d='Shop.Theme.Customeraccount'}: {$product.qty_returned}</div>
                    {/if}
                  </div>
                  <div class="w-1/3 text-right">
                    {$product.total}
                  </div>
                </div>
              </div>
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
      <div class="flex font-medium">
        <div class="w-8/12"><strong>{$order.totals.total.label}</strong></div>
        <div class="w-4/12 text-right">{$order.totals.total.value}</div>
      </div>
    </div>

    <div class="card mt-5">
      <header>
        <h3 class="font-medium text-lg">{l s='Merchandise return' d='Shop.Theme.Customeraccount'}</h3>
        <p class="mt-2">{l s='If you wish to return one or more products, please mark the corresponding boxes and provide an explanation for the return. When complete, click the button below.' d='Shop.Theme.Customeraccount'}</p>
      </header>
      <section class="mt-5">
        <textarea rows="3" name="returnText" class="w-full text-sm p-2"></textarea>
      </section>
      <footer class="mt-5 flex justify-end">
        <input type="hidden" name="id_order" value="{$order.details.id}">
        <button class="primary-red" type="submit" name="submitReturnMerchandise">
          {l s='Request a return' d='Shop.Theme.Customeraccount'}
        </button>
      </footer>
    </div>

  </form>
{/block}
