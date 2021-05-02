
{block name='sitemap_item'}
  <ul class="card w-full">
    {foreach $links as $link}
      <li class="mt-0.5">
        <a id="{$link.id}" href="{$link.url}" title="{$link.label}">
          {$link.label}
        </a>
        {if !empty($link.children)}
          {include file='cms/_partials/sitemap-nested-list.tpl' links=$link.children is_nested=true}
        {/if}
      </li>
    {/foreach}
  </ul>
{/block}
