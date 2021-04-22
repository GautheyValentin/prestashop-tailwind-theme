<div class="modal fade js-product-images-modal" id="product-modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        {assign var=imagesCount value=$product.images|count}
        <figure>
          {if $product.default_image}
            <img
              class="js-modal-product-cover product-cover-modal"
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
            <img src="{$urls.no_picture_image.bySize.large_default.url}" loading="lazy" />
          {/if}
          <figcaption class="image-caption">
          {block name='product_description_short'}
            <div id="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
          {/block}
        </figcaption>
        </figure>
        <aside id="thumbnails" class="thumbnails js-thumbnails text-sm-center">
          {block name='product_images'}
            <div class="js-modal-mask mask {if $imagesCount <= 5} nomargin {/if}">
              <ul class="product-images js-modal-product-images">
                {foreach from=$product.images item=image}
                  <li class="thumb-container">
                    <img
                      data-image-large-src="{$image.large.url}"
                      class="thumb js-modal-thumb"
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
            <div class="arrows js-modal-arrows">
              <i class="material-icons arrow-up js-modal-arrow-up">&#xE5C7;</i>
              <i class="material-icons arrow-down js-modal-arrow-down">&#xE5C5;</i>
            </div>
          {/if}
        </aside>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->