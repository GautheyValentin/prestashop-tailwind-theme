{block name='product_miniature_item'}
  <div>
    <article data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
      <div class="relative w-full bg-white border border-solid border-gray-200 rounded">
        {block name='product_thumbnail'}
          {if $product.cover}
            <a href="{$product.url}" class="w-full">
              <img src=" {$product.cover.bySize.home_default.url}" class="w-full rounded-t"
                alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                loading="lazy" data-full-size-image-url="{$product.cover.large.url}" />
            </a>
          {else}
            <a href="{$product.url}" class="w-full">
              <img src="{$urls.no_picture_image.bySize.home_default.url}" loading="lazy" />
            </a>
          {/if}
        {/block}

        <div class="relative w-full p-2 border-t border-solid border-gray-200">
          {block name='product_name'}
            {if $page.page_name == 'index'}
              <h3 class="text-sm text-gray-500 text-center"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h3>
            {else}
              <h2 class="text-sm text-gray-500 text-center"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h2>
            {/if}
          {/block}

          {block name='product_price_and_shipping'}
            {if $product.show_price}
              <div class="flex justify-center">
                {if $product.has_discount}
                  {hook h='displayProductPriceBlock' product=$product type="old_price"}

                  <span class="regular-price"
                    aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
                  {if $product.discount_type === 'percentage'}
                    <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                  {elseif $product.discount_type === 'amount'}
                    <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                  {/if}
                {/if}

                {hook h='displayProductPriceBlock' product=$product type="before_price"}

                <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
                  {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                  {if '' !== $smarty.capture.custom_price}
                    {$smarty.capture.custom_price nofilter}
                  {else}
                    {$product.price}
                  {/if}
                </span>

                {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                {hook h='displayProductPriceBlock' product=$product type='weight'}
              </div>
            {/if}
          {/block}

          {block name='product_reviews'}
            {hook h='displayProductListReviews' product=$product}
          {/block}
        </div>

        {include file='catalog/_partials/product-flags.tpl'}

        <div class="hidden {if !$product.main_variants} no-variants{/if}">

          {block name='product_variants'}
            {if $product.main_variants}
              {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
            {/if}
          {/block}
        </div>
      </div>
    </article>
  </div>
{/block}