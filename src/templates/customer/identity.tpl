
{extends 'customer/page.tpl'}

{block name='page_title'}
  {l s='Your personal information' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <div class="max-w-xl w-full mx-auto mt-5 card">
    {render file='customer/_partials/customer-form.tpl' ui=$customer_form}
  </div>
{/block}
