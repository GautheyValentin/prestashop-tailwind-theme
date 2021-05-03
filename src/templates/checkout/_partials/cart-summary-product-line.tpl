
{block name='cart_summary_product_line'}
  <div class="w-2/12">
    <a href="{$product.url}" title="{$product.name}">
      {if $product.cover}
        <img class="rounded-lg border border-gray-300" src="{$product.cover.small.url}" alt="{$product.name}" loading="lazy">
      {else}
        <img class="rounded-lg border border-gray-300" src="{$urls.no_picture_image.bySize.small_default.url}" loading="lazy" />
      {/if}
    </a>
  </div>
 
  <div class="w-10/12 pl-2">
    <span class="font-medium">
        <a href="{$product.url}" target="_blank" rel="noopener noreferrer nofollow">{$product.name}</a>
    </span>
    <span class="product-quantity">x{$product.quantity}</span>
    <span class="float-right font-medium">{$product.price}</span>
    {hook h='displayProductPriceBlock' product=$product type="unit_price"}
    {foreach from=$product.attributes key="attribute" item="value"}
        <div class="product-line-info product-line-info-secondary text-muted">
            <span class="label">{$attribute}:</span>
            <span class="value">{$value}</span>
        </div>
    {/foreach}
    <br/>
  </div>
{/block}
