<div class="fixed z-10 inset-0 overflow-y-auto bg-black bg-opacity-50" id="product-modal" x-show="showImage === true"
  x-cloak>
  <div class="max-w-screen-xl px-5 w-full mx-auto mt-5" role="document">
    <div class="flex justify-center">
      <div @click.away="showImage = false">
        <div class="flex space-x-4" x-data="{literal}{modalSrc: '{/literal}{$product.default_image.bySize.large_default.url}{literal}'}{/literal}">
        <figure>
          {if $product.default_image}
            <img class="rounded w-full max-w-700" width="{$product.default_image.bySize.large_default.width}"
              src="{$product.default_image.bySize.large_default.url}" 
              :src="modalSrc"
              {if !empty($product.default_image.legend)}
                alt="{$product.default_image.legend}" 
                title="{$product.default_image.legend}" 
              {else} 
                alt="{$product.name}"
              {/if} itemprop="image">
          {else}
            <img class="rounded w-full max-w-700" src="{$urls.no_picture_image.bySize.large_default.url}"
              loading="lazy" />
          {/if}
          <figcaption class="mt-5 text-center w-full text-white">
            {block name='product_description_short'}
              <div id="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
            {/block}
          </figcaption>
        </figure>
        <aside id="thumbnails" class="">
          {block name='product_images'}
            <div class="">
              <ul class="flex flex-col space-y-2">
                {foreach from=$product.images item=image}
                  <li class="w-full max-w-90">
                    <img 
                      data-image-large-src="{$image.large.url}" 
                      @click="{literal}modalSrc = '{/literal}{$image.large.url}{literal}'{/literal}" 
                      :class="{literal}{'border-red-550': modalSrc === '{/literal}{$image.large.url}{literal}'}{/literal}"
                      class="cursor-pointer rounded-lg border-2"
                      src="{$image.medium.url}" 
                      {if !empty($image.legend)} alt="{$image.legend}" title="{$image.legend}"
                      {else} alt="{$product.name}" 
                      {/if} width="{$image.medium.width}" itemprop="image">
                  </li>
                {/foreach}
              </ul>
            </div>
          {/block}
          {* <div class="">
              <i class="fas fa-angle-up text-black"></i>
              <i class="fas fa-angle-down text-black"></i>
            </div> *}
        </aside>
        </div>
      </div>
    </div>
  </div>
</div>