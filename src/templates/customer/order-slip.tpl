
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Credit slips' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {if $credit_slips}
  <section class="card mt-5">
    <h6 class="text-center">{l s='Credit slips you have received after canceled orders.' d='Shop.Theme.Customeraccount'}</h6>
      <table class="hidden sm:table w-full mt-3">
        <thead class="bg-gray-200">
          <tr>
            <th class="text-left p-2">{l s='Order' d='Shop.Theme.Customeraccount'}</th>
            <th class="text-left p-2">{l s='Credit slip' d='Shop.Theme.Customeraccount'}</th>
            <th class="text-left p-2">{l s='Date issued' d='Shop.Theme.Customeraccount'}</th>
            <th class="text-left p-2">{l s='View credit slip' d='Shop.Theme.Customeraccount'}</th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$credit_slips item=slip}
            <tr>
              <td class="text-left p-2"><a href="{$slip.order_url_details}" data-link-action="view-order-details">{$slip.order_reference}</a></td>
              <td class="text-left p-2" scope="row">{$slip.credit_slip_number}</td>
              <td class="text-left p-2">{$slip.credit_slip_date}</td>
              <td class="text-left p-2">
                <a href="{$slip.url}">
                  <i class="fas fa-file-pdf"></i>
                </a>
              </td>
            </tr>
          {/foreach}
        </tbody>
      </table>
      <div class="flex sm:hidden space-y-4 mt-5">
        {foreach from=$credit_slips item=slip}
          <div>
            <ul>
              <li>
                <strong>{l s='Order' d='Shop.Theme.Customeraccount'}</strong>
                <a href="{$slip.order_url_details}" data-link-action="view-order-details">{$slip.order_reference}</a>
              </li>
              <li>
                <strong>{l s='Credit slip' d='Shop.Theme.Customeraccount'}</strong>
                {$slip.credit_slip_number}
              </li>
              <li>
                <strong>{l s='Date issued' d='Shop.Theme.Customeraccount'}</strong>
                {$slip.credit_slip_date}
              </li>
              <li>
                <a href="{$slip.url}">{l s='View credit slip' d='Shop.Theme.Customeraccount'}</a>
              </li>
            </ul>
          </div>
        {/foreach}
      </div>
  </section>
{/if}
{/block}
