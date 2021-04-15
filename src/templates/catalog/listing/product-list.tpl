
{extends file=$layout}

{block name='content'}
  <section id="main">

    {block name='product_list_header'}
      <h1 class="h2">{$listing.label}</h1>
    {/block}

    {block name='subcategory_list'}
      {if isset($subcategories) && $subcategories|@count > 0}
        {include file='catalog/_partials/subcategories.tpl' subcategories=$subcategories}
      {/if}
    {/block}

    {hook h="displayHeaderCategory"}

    <section id="products">
      {if $listing.products|count}

        <div>
          {block name='product_list_top'}
            {include file='catalog/_partials/products-top.tpl' listing=$listing}
          {/block}
        </div>

        {block name='product_list_active_filters'}
          <div class="hidden">
            {$listing.rendered_active_filters nofilter}
          </div>
        {/block}

        <div class="mt-5">
          {block name='product_list'}
            {include file='catalog/_partials/products.tpl' listing=$listing}
          {/block}
        </div>

        <div>
          {block name='product_list_bottom'}
            {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
          {/block}
        </div>

      {else}
        <div id="js-product-list-top"></div>

        <div id="js-product-list">
          {include file='errors/not-found.tpl'}
        </div>

        <div id="js-product-list-bottom"></div>
      {/if}
    </section>

    {hook h="displayFooterCategory"}

  </section>
{/block}