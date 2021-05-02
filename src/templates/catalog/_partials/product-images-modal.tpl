<div class="fixed z-10 inset-0 overflow-y-auto bg-black bg-opacity-50" id="product-modal" x-show="showImage === true" x-cloak>
  <div class="max-w-screen-xl px-5 w-full mx-auto mt-5" role="document">
    <div class="flex justify-center">
      <div class="flex space-x-4" @click.away="showImage = false">
        {assign var=imagesCount value=$product.images|count}
        <figure>
          {if $product.default_image}
            <img
              class="rounded w-full max-w-700"
              width="{$product.default_image.bySize.large_default.width}"
              src="{$product.default_image.bySize.large_default.url}"
              {if !empty($product.default_image.legend)}
                alt="{$product.default_image.legend}"
                title="{$product.default_image.legend}"
              {else}
                alt="{$product.name}"
              {/if}
              itemprop="image"
            >
          {else}
            <img class="rounded w-full max-w-700" src="{$urls.no_picture_image.bySize.large_default.url}" loading="lazy" />
          {/if}
          <figcaption class="image-caption">
            {block name='product_description_short'}
              <div id="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
            {/block}
          </figcaption>
        </figure>
        <aside id="thumbnails" class="">
          {block name='product_images'}
            <div class="{if $imagesCount <= 5}{/if}">
              <ul class="flex flex-col">
                {foreach from=$product.images item=image}
                  <li class="w-full max-w-90">
                    <img
                      data-image-large-src="{$image.large.url}"
                      class="rounded"
                      src="{$image.medium.url}"
                      {if !empty($image.legend)}
                        alt="{$image.legend}"
                        title="{$image.legend}"
                      {else}
                        alt="{$product.name}"
                      {/if}
                      width="{$image.medium.width}"
                      itemprop="image"
                    >
                  </li>
                {/foreach}
              </ul>
            </div>
          {/block}
          {if $imagesCount > 5}
            <div class="">
              <i class="fas fa-angle-up text-black"></i>
              <i class="fas fa-angle-down text-black"></i>
            </div>
          {/if}
        </aside>
      </div>
    </div>
  </div>
</div>
