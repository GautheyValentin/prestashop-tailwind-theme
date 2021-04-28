
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order details' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {block name='order_infos'}
    <div id="order-infos">
      <div class="card mt-5 ">
          <div class="flex w-full justify-between">
            <strong>
              {l
                s='Order Reference %reference% - placed on %date%'
                d='Shop.Theme.Customeraccount'
                sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
              }
            </strong>
            {if $order.details.reorder_url}
              <a href="{$order.details.reorder_url}" class="button-primary">{l s='Reorder' d='Shop.Theme.Actions'}</a>
            {/if}
          </div>
      </div>

      <div class="card mt-5">
          <ul>
            <li><strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$order.carrier.name}</li>
            <li><strong>{l s='Payment method' d='Shop.Theme.Checkout'}</strong> {$order.details.payment}</li>

            {if $order.details.invoice_url}
              <li>
                <a href="{$order.details.invoice_url}">
                  {l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}
                </a>
              </li>
            {/if}

            {if $order.details.recyclable}
              <li>
                {l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}
              </li>
            {/if}

            {if $order.details.gift_message}
              <li>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</li>
              <li>{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}</li>
            {/if}
          </ul>
      </div>
    </div>
  {/block}

  {block name='order_history'}
    <section id="order-history" class="card mt-5">
      <h3 class="font-bold">{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</h3>

      <div class="w-full space-y-2 mt-5">
        <div class="flex font-medium">
          <div class="w-5/12">{l s='Date' d='Shop.Theme.Global'}</div>
          <div class="w-7/12">{l s='Status' d='Shop.Theme.Global'}</div>
        </div>
        {foreach from=$order.history item=state}
          <div class="flex">
            <div class="w-5/12">{$state.history_date}</div>
            <div class="w-7/12">
              <span class="py-1 px-2 text-white rounded {$state.contrast}" style="background-color:{$state.color}">
                {$state.ostate_name}
              </span>
            </div>
          </div>
        {/foreach}
      </div>
    </section>
  {/block}

  {if $order.follow_up}
    <div class="card mt-5">
      <p>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</p>
      <a href="{$order.follow_up}">{$order.follow_up}</a>
    </div>
  {/if}

  {block name='addresses'}
    <div class="flex flex-wrap mt-5 space-y-5 sm:space-y-0">
      {if $order.addresses.delivery}
        <div class="w-full sm:w-1/2 sm:pr-2.5">
          <article id="delivery-address" class="card">
            <h4>{l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.delivery.alias]}</h4>
            <address>{$order.addresses.delivery.formatted nofilter}</address>
          </article>
        </div>
      {/if}

      <div class="w-full sm:w-1/2 sm:pl-2.5">
        <article id="invoice-address" class="card">
          <h4>{l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}</h4>
          <address>{$order.addresses.invoice.formatted nofilter}</address>
        </article>
      </div>
    </div>
  {/block}

  {$HOOK_DISPLAYORDERDETAIL nofilter}

  {block name='order_detail'}
    {if $order.details.is_returnable}
      {include file='customer/_partials/order-detail-return.tpl'}
    {else}
      {include file='customer/_partials/order-detail-no-return.tpl'}
    {/if}
  {/block}

  {block name='order_carriers'}
    {if $order.shipping}
      <div class="card mt-5">
        <table class="hidden md:table w-full">
          <thead class="bg-gray-200">
            <tr>
              <th class="text-left p-2">{l s='Date' d='Shop.Theme.Global'}</th>
              <th class="text-left p-2">{l s='Carrier' d='Shop.Theme.Checkout'}</th>
              <th class="text-left p-2">{l s='Weight' d='Shop.Theme.Checkout'}</th>
              <th class="text-left p-2">{l s='Shipping cost' d='Shop.Theme.Checkout'}</th>
              <th class="text-left p-2">{l s='Tracking number' d='Shop.Theme.Checkout'}</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$order.shipping item=line}
              <tr>
                <td class="text-left p-2">{$line.shipping_date}</td>
                <td class="text-left p-2">{$line.carrier_name}</td>
                <td class="text-left p-2">{$line.shipping_weight}</td>
                <td class="text-left p-2">{$line.shipping_cost}</td>
                <td class="text-left p-2">{$line.tracking nofilter}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
        <div class="md:hidden">
          {foreach from=$order.shipping item=line}
            <div class="shipping-line">
              <ul>
                <li>
                  <strong>{l s='Date' d='Shop.Theme.Global'}</strong> {$line.shipping_date}
                </li>
                <li>
                  <strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$line.carrier_name}
                </li>
                <li>
                  <strong>{l s='Weight' d='Shop.Theme.Checkout'}</strong> {$line.shipping_weight}
                </li>
                <li>
                  <strong>{l s='Shipping cost' d='Shop.Theme.Checkout'}</strong> {$line.shipping_cost}
                </li>
                <li>
                  <strong>{l s='Tracking number' d='Shop.Theme.Checkout'}</strong> {$line.tracking nofilter}
                </li>
              </ul>
            </div>
          {/foreach}
        </div>
      </div>
    {/if}
  {/block}

  {block name='order_messages'}
    {include file='customer/_partials/order-messages.tpl'}
  {/block}
{/block}
