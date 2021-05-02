<div class="product-add-to-cart">
  {if !$configuration.is_catalog}
    {block name='product_quantity'}
      <div>
        <span class="control-label text-sm block">{l s='Quantity' d='Shop.Theme.Catalog'}:</span>
          <input
            type="number"
            name="qty"
            id="quantity_wanted"
            inputmode="numeric"
            pattern="[0-9]*"
            {if $product.quantity_wanted}
              value="{$product.quantity_wanted}"
              min="{$product.minimal_quantity}"
            {else}
              value="1"
              min="1"
            {/if}
            class="classic-input w-20"
            aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
          >
          {hook h='displayProductActions' product=$product}
      </div>
      <div class="add">
        <button
          class="primary-red mt-5"
          data-button-action="add-to-cart"
          type="submit"
          {if !$product.add_to_cart_url}
            disabled
          {/if}
        >
          {l s='Add to cart' d='Shop.Theme.Actions'}
        </button>
      </div>
    {/block}


      {block name='product_availability'}
        <div>
          <span id="product-availability" class="text-sm">
            {if $product.show_availability && $product.availability_message}
              {if $product.availability == 'available'}
                <i class="fas fa-surprise"></i>
              {elseif $product.availability == 'last_remaining_items'}
                <i class="fas fa-surprise"></i>
              {else}
                <i class="fas fa-surprise"></i>
              {/if}
              {$product.availability_message}
            {/if}
          </span>
        </div
      {/block}

      {block name='product_minimal_quantity'}
        <div>
          <p class="product-minimal-quantity">
            {if $product.minimal_quantity > 1}
              {l
              s='The minimum purchase order quantity for the product is %quantity%.'
              d='Shop.Theme.Checkout'
              sprintf=['%quantity%' => $product.minimal_quantity]
              }
            {/if}
          </p>
        </div>
      {/block}
    {/if}
</div>




