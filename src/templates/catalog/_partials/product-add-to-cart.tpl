<div>
  {if !$configuration.is_catalog}
    <span class="control-label text-sm block">{l s='Quantity' d='Shop.Theme.Catalog'}:</span>

    {block name='product_quantity'}
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
    {/block}

</div>

<button
  class="primary-red"
  data-button-action="add-to-cart"
  type="submit"
  {if !$product.add_to_cart_url}
    disabled
  {/if}
>
  {* <i class="material-icons shopping-cart">&#xE547;</i> *}
  {l s='Add to cart' d='Shop.Theme.Actions'}
</button>

<div>
    {block name='product_availability'}
      <span id="product-availability" class="text-sm">
        {if $product.show_availability && $product.availability_message}
          {if $product.availability == 'available'}
            <i class="material-icons rtl-no-flip product-available text-sm">&#xE5CA;</i>
          {elseif $product.availability == 'last_remaining_items'}
            <i class="material-icons product-last-items text-sm">&#xE002;</i>
          {else}
            <i class="material-icons product-unavailable text-sm">&#xE14B;</i>
          {/if}
          {$product.availability_message}
        {/if}
      </span>
    {/block}

    {block name='product_minimal_quantity'}
      <p class="product-minimal-quantity">
        {if $product.minimal_quantity > 1}
          {l
          s='The minimum purchase order quantity for the product is %quantity%.'
          d='Shop.Theme.Checkout'
          sprintf=['%quantity%' => $product.minimal_quantity]
          }
        {/if}
      </p>
    {/block}
  {/if}
</div>
