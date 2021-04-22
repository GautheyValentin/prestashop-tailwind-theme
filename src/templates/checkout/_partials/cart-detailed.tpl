
{block name='cart_detailed_product'}
  <div class="bg-gray-100 p-2 rounded" data-refresh-url="{url entity='cart' params=['ajax' => true, 'action' => 'refresh']}">
    {if $cart.products}
    <ul class="divide-y-2">
      {foreach from=$cart.products item=product}
        <li class="">
          {block name='cart_detailed_product_line'}
            {include file='checkout/_partials/cart-detailed-product-line.tpl' product=$product}
          {/block}
        </li>
        {if is_array($product.customizations) && $product.customizations|count >1}<hr>{/if}
      {/foreach}
    </ul>
    {else}
      <span class="no-items">{l s='There are no more items in your cart' d='Shop.Theme.Checkout'}</span>
    {/if}
  </div>
{/block}
