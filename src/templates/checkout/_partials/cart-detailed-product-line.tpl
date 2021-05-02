
<div class="flex items-center flex-wrap py-3 md:p-5">

  <div class="w-4/12 md:w-2/12 xl:w-1/12">
    {if $product.cover}
      <img class="rounded-lg border border-gray-300" src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}" loading="lazy">
    {else}
      <img class="rounded-lg border border-gray-300" src="{$urls.no_picture_image.bySize.cart_default.url}" loading="lazy" />
    {/if}
  </div>

  <div class="w-8/12 px-2 md:px-5">
    <a class="font-medium text-lg" href="{$product.url}" data-id_customization="{$product.id_customization|intval}">{$product.name}</a>

    <div class=" {if $product.has_discount}{/if}">
      {if $product.has_discount}
        <div class="">
          <span class="">{$product.regular_price}</span>
          {if $product.discount_type === 'percentage'}
            <span class="">
                -{$product.discount_percentage_absolute}
              </span>
          {else}
            <span class="">
                -{$product.discount_to_display}
              </span>
          {/if}
        </div>
      {/if}
      <div class="">
        <span class="">{$product.price}</span>
        {if $product.unit_price_full}
          <div class="">{$product.unit_price_full}</div>
        {/if}
      </div>
      {hook h='displayProductPriceBlock' product=$product type="unit_price"}
    </div>

    {foreach from=$product.attributes key="attribute" item="value"}
      <div class="">
        <span class="">{$attribute}:</span>
        <span class="">{$value}</span>
      </div>
    {/foreach}

    {if is_array($product.customizations) && $product.customizations|count}
      {block name='cart_detailed_product_line_customization'}
        {foreach from=$product.customizations item="customization"}
          <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
          <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
                    <span aria-hidden="true">&times;</span>
                  </button>
                  <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                </div>
                <div class="modal-body">
                  {foreach from=$customization.fields item="field"}
                    <div class="product-customization-line row">
                      <div class="col-sm-3 col-xs-4 label">
                        {$field.label}
                      </div>
                      <div class="col-sm-9 col-xs-8 value">
                        {if $field.type == 'text'}
                          {if (int)$field.id_module}
                            {$field.text nofilter}
                          {else}
                            {$field.text}
                          {/if}
                        {elseif $field.type == 'image'}
                          <img src="{$field.image.small.url}" loading="lazy">
                        {/if}
                      </div>
                    </div>
                  {/foreach}
                </div>
              </div>
            </div>
          </div>
        {/foreach}
      {/block}
    {/if}
  </div>

  <div class="w-full mt-5 md:mt-0 md:w-2/12 flex justify-around items-center">
    <div>
      {if !empty($product.is_gift)}
        <span class="gift-quantity">{$product.quantity}</span>
      {else}
        <input
          class="max-w-90"
          data-down-url="{$product.down_quantity_url}"
          data-up-url="{$product.up_quantity_url}"
          data-update-url="{$product.update_quantity_url}"
          data-product-id="{$product.id_product}"
          type="number"
          inputmode="numeric"
          pattern="[0-9]*"
          value="{$product.quantity}"
          name="product-quantity-spin"
        />
      {/if}
    </div>
    <span class="">
      {if !empty($product.is_gift)}
        <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
      {else}
        {$product.total}
      {/if}
    </span>

    <div class="">
      <a
          class                       = "remove-from-cart"
          rel                         = "nofollow"
          href                        = "{$product.remove_from_cart_url}"
          data-link-action            = "delete-from-cart"
          data-id-product             = "{$product.id_product|escape:'javascript'}"
          data-id-product-attribute   = "{$product.id_product_attribute|escape:'javascript'}"
          data-id-customization   	  = "{$product.id_customization|escape:'javascript'}"
      >
        {if empty($product.is_gift)}
          <i class="fas fa-trash"></i>
        {/if}
      </a>

      {block name='hook_cart_extra_product_actions'}
        {hook h='displayCartExtraProductActions' product=$product}
      {/block}
  </div>
</div>
