
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 mt-5">

      <a class="card text-lg items-center flex justify-center" id="identity-link" href="{$urls.pages.identity}">
        <i class="fas fa-info-circle"></i>
        <span class="ml-2">{l s='Information' d='Shop.Theme.Customeraccount'}</span>
      </a>

      {if $customer.addresses|count}
        <a class="card text-lg items-center flex justify-center" id="addresses-link" href="{$urls.pages.addresses}">
          <i class="fas fa-map-marker-alt"></i>
          <span class="ml-2">{l s='Addresses' d='Shop.Theme.Customeraccount'}</span>
        </a>
      {else}
        <a class="card text-lg items-center flex justify-center" id="address-link" href="{$urls.pages.address}">
          <i class="fas fa-map-marker-alt"></i>
          <span class="ml-2">{l s='Add first address' d='Shop.Theme.Customeraccount'}</span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="card text-lg items-center flex justify-center" id="history-link" href="{$urls.pages.history}">
          <i class="fas fa-history"></i>
          <span class="ml-2">{l s='Order history and details' d='Shop.Theme.Customeraccount'}</span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="card text-lg items-center flex justify-center" id="order-slips-link" href="{$urls.pages.order_slip}">
          <i class="fas fa-clipboard-list"></i>
          <span class="ml-2">{l s='Credit slips' d='Shop.Theme.Customeraccount'}</span>
        </a>
      {/if}

      {if $configuration.voucher_enabled && !$configuration.is_catalog}
        <a class="card text-lg items-center flex justify-center" id="discounts-link" href="{$urls.pages.discount}">
          <i class="fas fa-ticket-alt"></i>
          <span class="ml-2">{l s='Vouchers' d='Shop.Theme.Customeraccount'}</span>
        </a>
      {/if}

      {if $configuration.return_enabled && !$configuration.is_catalog}
        <a class="card text-lg items-center flex justify-center" href="{$urls.pages.order_follow}">
          <i class="fas fa-truck-loading"></i>
          <span class="ml-2">{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}</span>
        </a>
      {/if}

      {block name='display_customer_account'}
        {hook h='displayCustomerAccount'}
      {/block}

      <a class="card text-lg items-center flex justify-center" href="{$urls.actions.logout}" >
        <i class="fas fa-sign-out-alt"></i>
        <span class="ml-2">{l s='Sign out' d='Shop.Theme.Actions'}</span>
      </a>

    </div>
{/block}


{block name='page_footer'}
  {block name='my_account_links'}

  {/block}
{/block}
