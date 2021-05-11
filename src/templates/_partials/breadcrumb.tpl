<nav class="mt-5 lg:mt-0 breadcrumb px-5 {if $breadcrumb.count <=1}hidden{/if}">
  <ol itemscope itemtype="https://schema.org/BreadcrumbList">
    {block name='breadcrumb'}
      {foreach from=$breadcrumb.links item=path name=breadcrumb}
        {block name='breadcrumb_item'}
          {if not $smarty.foreach.breadcrumb.last}
            <li class="inline" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
              <a itemprop="item" href="{$path.url}"><span itemprop="name">{if not $smarty.foreach.breadcrumb.first}> {/if}{$path.title}</span></a>
              <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
            </li>
          {elseif isset($path.title)}
            <li class="inline text-gray-500" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
              <span itemprop="name">{if not $smarty.foreach.breadcrumb.first}> {/if}{$path.title}</span>
              <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
            </li>
          {/if}
        {/block}
      {/foreach}
    {/block}
  </ol>
</nav>