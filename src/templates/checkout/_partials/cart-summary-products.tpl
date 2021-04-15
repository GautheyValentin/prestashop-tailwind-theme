

 <div class="cart-summary-products">
  <p>{$cart.summary_string}</p>

  <p>
    <a href="#" data-toggle="collapse" data-target="#cart-summary-product-list">
      {l s='show details' d='Shop.Theme.Actions'}
      <i class="material-icons">expand_more</i>
    </a>
  </p>

  {block name='cart_summary_product_list'}
    <div class="collapse" id="cart-summary-product-list">
      <ul class="media-list">
        {foreach from=$cart.products item=product}
          <li class="media">{include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}</li>
        {/foreach}
      </ul>
    </div>
  {/block}
</div>
