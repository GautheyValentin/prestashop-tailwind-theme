
{extends file=$layout}

{block name='header'}
  {include file='checkout/_partials/header.tpl'}
{/block}

{block name='content'}
  <section id="content" class="flex flex-wrap">
    <div class="px-5 w-full md:w-8/12">
      {block name='checkout_process'}
        {render file='checkout/checkout-process.tpl' ui=$checkout_process}
      {/block}
    </div>
    <div class="px-5 w-full md:w-4/12">
      {block name='cart_summary'}
        {include file='checkout/_partials/cart-summary.tpl' cart=$cart}
      {/block}
      {hook h='displayReassurance'}
    </div>
  </section>
{/block}

{block name='footer'}
  {include file='checkout/_partials/footer.tpl'}
{/block}
