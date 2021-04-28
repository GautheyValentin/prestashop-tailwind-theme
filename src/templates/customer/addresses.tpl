
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your addresses' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 mt-5">
    {foreach $customer.addresses as $address}
      <div class="card">
        {block name='customer_address'}
          {include file='customer/_partials/block-address.tpl' address=$address}
        {/block}
      </div>
    {/foreach}
  </div>
  <div class="mt-10">
    <a href="{$urls.pages.address}" data-link-action="add-address">
      <i class="fas fa-plus"></i>
      <span class="ml-1">{l s='Create new address' d='Shop.Theme.Actions'}</span>
    </a>
  </div>
{/block}
