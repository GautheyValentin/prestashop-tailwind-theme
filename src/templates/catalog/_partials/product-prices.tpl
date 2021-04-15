{if $product.show_price}
  <div>
    {block name='product_discount'}
      {if $product.has_discount}
        <div>
          {hook h='displayProductPriceBlock' product=$product type="old_price"}
          <span>{$product.regular_price}</span>
        </div>
      {/if}
    {/block}

    {block name='product_price'}
      <div
        class="text-xl h5 {if $product.has_discount}{/if}"
        itemprop="offers"
        itemscope
        itemtype="https://schema.org/Offer"
      >
        <link itemprop="availability" href="{$product.seo_availability}"/>
        <meta itemprop="priceCurrency" content="{$currency.iso_code}">

        <div>
          <span class="text-xl" itemprop="price" content="{$product.rounded_display_price}">
            {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='product_sheet'}{/capture}
            {if '' !== $smarty.capture.custom_price}
              {$smarty.capture.custom_price nofilter}
            {else}
              {$product.price}
            {/if}
          </span>

          {if $product.has_discount}
            {if $product.discount_type === 'percentage'}
              <span>{l s='Save %percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $product.discount_percentage_absolute]}</span>
            {else}
              <span>
                  {l s='Save %amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.discount_to_display]}
              </span>
            {/if}
          {/if}
        </div>

        {block name='product_unit_price'}
          {if $displayUnitPrice}
            <p>{l s='(%unit_price%)' d='Shop.Theme.Catalog' sprintf=['%unit_price%' => $product.unit_price_full]}</p>
          {/if}
        {/block}
      </div>
    {/block}

    {block name='product_without_taxes'}
      {if $priceDisplay == 2}
        <p>{l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}</p>
      {/if}
    {/block}

    {block name='product_pack_price'}
      {if $displayPackPrice}
        <p><span>{l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]}</span></p>
      {/if}
    {/block}

    {block name='product_ecotax'}
      {if $product.ecotax.amount > 0}
        <p>{l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax_tax_inc]}
          {if $product.has_discount}
            {l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}
          {/if}
        </p>
      {/if}
    {/block}

    {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}

    <div class="text-sm">
      {if !$configuration.taxes_enabled}
      {elseif $configuration.display_taxes_label}
        {$product.labels.tax_long}
      {/if}
      {hook h='displayProductPriceBlock' product=$product type="price"}
      {hook h='displayProductPriceBlock' product=$product type="after_price"}
      {if $product.is_virtual	== 0}
        {if $product.additional_delivery_times == 1}
          {if $product.delivery_information}
            <span>{$product.delivery_information}</span>
          {/if}
        {elseif $product.additional_delivery_times == 2}
          {if $product.quantity > 0}
            <span>{$product.delivery_in_stock}</span>
          {elseif $product.quantity <= 0 && $product.add_to_cart_url}
            <span>{$product.delivery_out_stock}</span>
          {/if}
        {/if}
      {/if}
    </div>
  </div>
{/if}
