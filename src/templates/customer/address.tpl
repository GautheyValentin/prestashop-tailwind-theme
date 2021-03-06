
{extends file='customer/page.tpl'}

{block name='page_title'}
  {if $editing}
    {l s='Update your address' d='Shop.Theme.Customeraccount'}
  {else}
    {l s='New address' d='Shop.Theme.Customeraccount'}
  {/if}
{/block}

{block name='page_content'}
  <div class="max-w-xl w-full mx-auto mt-5 card">
    {render template="customer/_partials/address-form.tpl" ui=$address_form}
  </div>
{/block}
