<div>
  {if $listing.pagination.items_shown_from == 1}
    <div class="flex flex-col">
      <h1 class="font-bold text-xl">{$category.name}</h1>
      <div>
        {if $category.description}
          <div>{$category.description nofilter}</div>
        {/if}
        {if !empty($category.image.large.url)}
          <div>
            <img src="{$category.image.large.url}"
              alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}" loading="lazy">
          </div>
        {/if}
      </div>
    </div>
  {/if}
</div>