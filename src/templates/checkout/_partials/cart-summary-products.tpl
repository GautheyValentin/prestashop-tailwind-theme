

 <div class="cart-summary-products" x-data="{literal}{isOpen: false}{/literal}">

  <div class="w-full">
    {$cart.summary_string}

    <a class="float-right" href="#" @click="isOpen = !isOpen">
      {l s='show details' d='Shop.Theme.Actions'}
      <i x-show="!isOpen" class="fas fa-caret-down"></i>
      <i x-show="isOpen" class="fas fa-caret-up" x-cloack></i>
    </a>
  </div>

  {block name='cart_summary_product_list'}
    <div class="mt-2" x-show="isOpen" id="cart-summary-product-list" x-cloack>
      <ul class="w-full space-y-3">
        {foreach from=$cart.products item=product}
          <li class="w-full flex">
            {include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}
          </li>
        {/foreach}
      </ul>
    </div>
  {/block}
</div>
