{extends file=$layout}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  {if $product.cover}
    <meta property="og:image" content="{$product.cover.large.url}">
  {/if}

  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="flex w-full justify-center flex-wrap">
      <div class="flex flex-col w-full sm:w-5/12 p-5 sm:items-end">
        {block name='page_content_container'}
          <section class="" id="content">
            {block name='page_content'}
              {include file='catalog/_partials/product-flags.tpl'}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
            {/block}
          </section>
        {/block}
        </div>
        <div class="flex flex-col w-full sm:w-5/12 p-5">
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="text-3xl font-medium" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
          {/block}
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}

          <div class="mt-5">
            {block name='product_description_short'}
              <div 
                id="product-description-short-{$product.id}" 
                class="text-sm" 
                itemprop="description"
              >{$product.description_short nofilter}</div>
            {/block}


            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}

            <div>
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_pack'}
                    {if $packItems}
                      <section>
                        <p>{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}
                  
                  <hr class="my-5 text-gray-300 w-24" />

                  <div class="space-y-2">
                    {block name='product_variants'}
                      {include file='catalog/_partials/product-variants.tpl'}
                    {/block}

                    {block name='product_add_to_cart'}
                      {include file='catalog/_partials/product-add-to-cart.tpl'}
                    {/block}
                  </div>
                  {block name='product_details'}
                    {include file='catalog/_partials/product-details.tpl'}
                  {/block}

                  <hr class="my-5 text-gray-300 w-24" />

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}

                  {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}{/block}
                </form>
              {/block}

            </div>

            {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}
        </div>
      </div>
    </div>

    <div class="w-full mt-5">
      {block name='product_tabs'}
        <div class="max-w-screen-lg mx-auto px-5" x-data="{ selectedKey: description }">
          <ul class="flex space-x-4" role="tablist">

            {if $product.description}
              <li class="">
                <button
                  @click="selectedKey = description"
                  class="{if $product.description} {/if}"
                  role="tab"
                  aria-controls="description"
                  {if $product.description} aria-selected="true"{/if}>
                    {l s='Description' d='Shop.Theme.Catalog'}
                </button>
              </li>
            {/if}

            {* <li class="">
              <button
                @click="selectedKey = 'product-details'"
                class="{if !$product.description} hidden{/if}"
                role="tab"
                aria-controls="product-details"
                {if !$product.description} aria-selected="true"{/if}>
                  {l s='Product Details' d='Shop.Theme.Catalog'}
              </button>
            </li> *}

            {if $product.attachments}
              <li class="">
                <button
                  @click="selectedKey = attachments"
                  class=""
                  role="tab"
                  aria-controls="attachments">
                    {l s='Attachments' d='Shop.Theme.Catalog'}
                </button>
              </li>
            {/if}

            {foreach from=$product.extraContent item=extra key=extraKey}
              <li class="">
                <button
                  @click="selectedKey = extra-{$extraKey}"
                  class=""
                  role="tab"
                  aria-controls="extra-{$extraKey}">
                    {$extra.title}
                </button>
              </li>
            {/foreach}

          </ul>

          <div class="mt-5" id="tab-content">
            <div x-show="selectedKey === description" class="content-style" id="description" role="tabpanel">
              {block name='product_description'}
                <div class="">{$product.description nofilter}</div>
              {/block}
            </div>

            {block name='product_attachments'}
              {if $product.attachments}
                <div x-show="selectedKey === attachments" class="content-style" id="attachments" role="tabpanel">
                  <section class="product-attachments">
                    <p class="">{l s='Download' d='Shop.Theme.Actions'}</p>
                    {foreach from=$product.attachments item=attachment}
                      <div class="">
                        <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                        <p>{$attachment.description}</p>
                        <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                          {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                        </a>
                      </div>
                    {/foreach}
                  </section>
                </div>
              {/if}
            {/block}

            {foreach from=$product.extraContent item=extra key=extraKey}
              <div 
                x-show="selectedKey === extra-{$extraKey}" 
                class="content-style {$extra.attr.class}" 
                id="extra-{$extraKey}" 
                role="tabpanel" 
                {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}
              >
                {$extra.content nofilter}
              </div>
            {/foreach}
          </div>
        </div>
      {/block}
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="">
          <p class="">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
          <div class="" itemscope itemtype="https://schema.org/ItemList">
            {foreach from=$accessories item="product_accessory" key="position"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {* {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block} *}

    {block name='page_footer_container'}
      <footer class="">
        {block name='page_footer'}

        {/block}
      </footer>
    {/block}
  </section>

{/block}
