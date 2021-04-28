
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order history' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <h6 class="text-center">{l s='Here are the orders you\'ve placed since your account was created.' d='Shop.Theme.Customeraccount'}</h6>

  {if $orders}
  <div class="card mt-5">
    <table class="w-full hidden md:table">
      <thead class="thead-default">
        <tr>
          <th class="text-left">{l s='Order reference' d='Shop.Theme.Checkout'}</th>
          <th class="text-left">{l s='Date' d='Shop.Theme.Checkout'}</th>
          <th class="text-left">{l s='Total price' d='Shop.Theme.Checkout'}</th>
          <th class="text-left hidden lg:table-cell">{l s='Payment' d='Shop.Theme.Checkout'}</th>
          <th class="text-left hidden lg:table-cell">{l s='Status' d='Shop.Theme.Checkout'}</th>
          <th class="text-right">{l s='Invoice' d='Shop.Theme.Checkout'}</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$orders item=order}
          <tr>
            <th class="text-left py-2">{$order.details.reference}</th>
            <td class="text-left py-2">{$order.details.order_date}</td>
            <td class="text-left py-2">{$order.totals.total.value}</td>
            <td class="text-left py-2 hidden lg:table-cell">{$order.details.payment}</td>
            <td class="text-left py-2 hidden lg:table-cell">
              <span
                class="py-1 px-2 text-white rounded {$order.history.current.contrast}"
                style="background-color:{$order.history.current.color}"
              >
                {$order.history.current.ostate_name}
              </span>
            </td>
            <td class="text-right py-2">
              {if $order.details.invoice_url}
                <a href="{$order.details.invoice_url}"><i class="fas fa-file-pdf"></i></a>
              {else}
                -
              {/if}
            </td>
            <td class="text-right space-x-4 py-2">
              <a href="{$order.details.details_url}" data-link-action="view-order-details">
                {l s='Details' d='Shop.Theme.Customeraccount'}
              </a>
              {if $order.details.reorder_url}
                <a href="{$order.details.reorder_url}">{l s='Reorder' d='Shop.Theme.Actions'}</a>
              {/if}
            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>

    <div class="flex flex-col space-y-5 md:hidden">
      {foreach from=$orders item=order}
          <div class="flex w-full px-2 py-2">
            <div class="w-10/12">
              <a href="{$order.details.details_url}">
                <h3 class="font-bold text-lg">{$order.details.reference}</h3>
              </a>
              <div class="font-light">{$order.details.order_date}</div>
              <div class="font-light">{$order.totals.total.value}</div>
              <div class="mt-2">
                <span
                  class="py-1 px-2 text-white rounded {$order.history.current.contrast}"
                  style="background-color:{$order.history.current.color}"
                >
                  {$order.history.current.ostate_name}
                </span>
              </div>
            </div>
            <div class="w-2/12 text-right">
                <a href="{$order.details.details_url}" data-link-action="view-order-details" title="{l s='Details' d='Shop.Theme.Customeraccount'}">
                  <i class="fas fa-search"></i>
                </a>
                {if $order.details.reorder_url}
                  <div>
                    <a href="{$order.details.reorder_url}" title="{l s='Reorder' d='Shop.Theme.Actions'}">
                      <i class="fas fa-shipping-fast"></i>
                    </a>
                  </div>
                {/if}
            </div>
          </div>
      {/foreach}
    </div>
  </div>
  {/if}
{/block}
