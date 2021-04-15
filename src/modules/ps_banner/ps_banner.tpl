
<a class="banner" href="{$banner_link}" title="{$banner_desc}">
  {if isset($banner_img)}
    <img src="{$banner_img}" alt="{$banner_desc}" title="{$banner_desc}" class="img-fluid" loading="lazy">
  {else}
    <span>{$banner_desc}</span>
  {/if}
</a>
