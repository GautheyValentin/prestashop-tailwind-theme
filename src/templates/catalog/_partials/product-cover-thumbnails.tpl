<div class="images-container">
  {block name='product_cover'}
    <div class="relative max-w-452 w-full thumb-container" @click="showImage = true">
      {if $product.default_image}
        <img
          class="rounded-lg border border-gray-300"
          src="{$product.default_image.bySize.medium_default.url}"
          width="{$product.default_image.bySize.medium_default.width}"
          {if !empty($product.default_image.legend)}
            alt="{$product.default_image.legend}"
            title="{$product.default_image.legend}"
          {else}
            alt="{$product.name}"
          {/if}
          itemprop="image"
          loading="lazy"
        >
        <div class="group absolute top-0 left-0 w-full h-full hover:bg-white hover:bg-opacity-70 flex items-center justify-center cursor-pointer">
          <i class="fas fa-search fa-4x hidden group-hover:block"></i>
        </div>
      {else}
        <img src="{$urls.no_picture_image.bySize.medium_default.url}" style="width:100%;" loading="lazy">
      {/if}
    </div>
  {/block}

  {block name='product_images'}
    <div class="flex items-center space-x-1 mt-5">
      <i class="fas fa-angle-left"></i>

      <ul class="w-11/12">
        {foreach from=$product.images item=image}
          <li class="">
            <img
              class="rounded-lg border-2 {if $image.id_image == $product.default_image.id_image}border-gray-300{/if}"
              data-image-medium-src="{$image.bySize.medium_default.url}"
              data-image-large-src="{$image.bySize.large_default.url}"
              src="{$image.bySize.home_default.url}"
              {if !empty($image.legend)}
                alt="{$image.legend}"
                title="{$image.legend}"
              {else}
                alt="{$product.name}"
              {/if}
              width="100"
              itemprop="image"
              loading="lazy"
            >
          </li>
        {/foreach}
      </ul>
  
      <i class="fas fa-angle-right"></i>

    </div>
  {/block}
  {hook h='displayAfterProductThumbs' product=$product}
</div>
