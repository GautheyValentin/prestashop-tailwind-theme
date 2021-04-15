{if !empty($subcategories)}
  {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories) }
    <ul class="mt-3 grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
      {foreach from=$subcategories item=subcategory}
        <li class="flex justify-center rounded bg-gray-100 py-2">
          <div class="subcategory-image">
            <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}"
              title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
              {if $subcategory.image.large.url}
                <img class="replace-2x" src="{$subcategory.image.large.url}" alt="{$subcategory.name|escape:'html':'UTF-8'}"
                  loading="lazy" />
              {/if}
            </a>
          </div>

          <h5><a
              href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</a>
          </h5>
          {* {if $subcategory.description}
            <div class="cat_desc">{$subcategory.description|unescape:'html' nofilter}</div>
          {/if} *}
          </li>
        {/foreach}
      </ul>
    {/if}
  {/if}