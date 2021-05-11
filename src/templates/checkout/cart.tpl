
{extends file=$layout}

{block name='content'}

  <section id="main">
    <h1 class="font-medium text-2xl">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>

    <div class="flex flex-wrap mt-5">
      <div class="w-full md:w-9/12">
        {block name='cart_overview'}
          {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
        {/block}

        {block name='continue_shopping'}
          <div class="mt-5">
            <a href="{$urls.pages.index}">
              <i class="fas fa-angle-left mr-2"></i> {l s='Continue shopping' d='Shop.Theme.Actions'}
            </a>
          </div>
        {/block}

        {block name='hook_shopping_cart_footer'}
          {hook h='displayShoppingCartFooter'}
        {/block}
      </div>

      <div class="w-full md:w-3/12 md:pl-5">

        {block name='cart_summary'}
          <div class="bg-gray-100 p-2 md:p-5 rounded">

            {block name='hook_shopping_cart'}
              {hook h='displayShoppingCart'}
            {/block}

            {block name='cart_totals'}
              {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
            {/block}

            {block name='cart_actions'}
              {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
            {/block}

          </div>
        {/block}

        {block name='hook_reassurance'}
          {hook h='displayReassurance'}
        {/block}

      </div>

      {hook h='displayCrossSellingShoppingCart'}
    </div>
  </section>
{/block}
