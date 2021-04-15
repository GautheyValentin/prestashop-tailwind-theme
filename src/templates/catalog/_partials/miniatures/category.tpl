
{block name='category_miniature_item'}
  <section class="category-miniature">
    <a href="{$category.url}">
      <img
        src="{$category.image.medium.url}"
        alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}"
        loading="lazy"
      >
    </a>

    <h1 class="h2">
      <a href="{$category.url}">{$category.name}</a>
    </h1>

    <div class="category-description">{$category.description nofilter}</div>
  </section>
{/block}
