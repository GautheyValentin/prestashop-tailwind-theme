
<div id="blockcart-modal" class="fixed z-10 inset-0 overflow-y-auto bg-black bg-opacity-50" tabindex="-1" role="dialog" aria-labelledby="blockcart-modal" aria-hidden="true">
  <div class="max-w-screen-lg px-5 w-full mx-auto mt-10" role="document">
    <div class="card">
      <div class="flex justify-between">
        <h4 class="font-medium text-lg">
          <i class="fas fa-check"></i>
          {l s='Product successfully added to your shopping cart' d='Shop.Theme.Checkout'}
        </h4>
        
        <button type="button" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>

      <div class="mt-10">
        <div class="flex flex-wrap">
          <div class="w-full md:w-5/12">
            <div class="flex">
              <div class="w-full md:w-6/12 px-2 md:px-5">
                {if $product.default_image}
                  <img
                    src="{$product.default_image.medium.url}"
                    data-full-size-image-url="{$product.default_image.large.url}"
                    title="{$product.default_image.legend}"
                    alt="{$product.default_image.legend}"
                    itemprop="image"
                    loading="lazy"
                    class="rounded-lg border border-gray-300"
                  >
                {else}
                  <img
                    src="{$urls.no_picture_image.bySize.medium_default.url}"
                    loading="lazy"
                    class="rounded-lg border border-gray-300"
                  />
                {/if}
              </div>
              <div class="w-full md:w-6/12 px-2 md:px-5 space-y-2">
                <h6 class="font-medium">{$product.name}</h6>
                <p class="font-light">{$product.price}</p>
                {hook h='displayProductPriceBlock' product=$product type="unit_price"}
                {foreach from=$product.attributes item="property_value" key="property"}
                <span>{l s='%label%:' sprintf=['%label%' => $property] d='Shop.Theme.Global'}<strong> {$property_value}</strong></span><br>
                {/foreach}
                <span>{l s='Quantity:' d='Shop.Theme.Checkout'}&nbsp;<strong>{$product.cart_quantity}</strong></span>
              </div>
            </div>
          </div>
          <div class="w-full mt-5 md:mt-0 md:w-7/12 px-2 md:px-5">
            {if $cart.products_count > 1}
              <p>{l s='There are %products_count% items in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}</p>
            {else}
              <p>{l s='There is %products_count% item in your cart.' sprintf=['%products_count%' =>$cart.products_count] d='Shop.Theme.Checkout'}</p>
            {/if}

            <p class="flex justify-between mt-5"><span class="label">{l s='Subtotal:' d='Shop.Theme.Checkout'}</span>&nbsp;<span class="value">{$cart.subtotals.products.value}</span></p>
           
            {if $cart.subtotals.shipping.value}
              <p class="flex justify-between"><span>{l s='Shipping:' d='Shop.Theme.Checkout'}</span>&nbsp;<span class="value">{$cart.subtotals.shipping.value} {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}</span></p>
            {/if}

            {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
              <p class="flex justify-between mt-5"><span>{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>&nbsp;<span>{$cart.totals.total.value}</span>/p>
              <p class="flex justify-between font-medium"><span class="label">{$cart.totals.total_including_tax.label}</span>&nbsp;<span class="value">{$cart.totals.total_including_tax.value}</span></p>
            {else}
              <p class="flex justify-between font-medium mt-5"><span class="label">{$cart.totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>&nbsp;<span class="value">{$cart.totals.total.value}</span></p>
            {/if}

            {if $cart.subtotals.tax}
              <p class="flex justify-between font-medium">{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}&nbsp;<span class="value">{$cart.subtotals.tax.value}</span></p>
            {/if}

            {hook h='displayCartModalContent' product=$product}

            <div class="mt-5 flex justify-end space-x-4 items-center">
              <button type="button" data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button>
              <a href="{$cart_url}" class="primary-red">{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
            </div>
          </div>
        </div>
      </div>
      {hook h='displayCartModalFooter' product=$product}
    </div>
  </div>
</div>
