

<div class="block-contact col-md-2 links wrapper">
  <h3 class="h3 hidden-sm-down">{$title}</h3>
  <div>
    {if $rss_links}
      <ul>
        {foreach from=$rss_links item='rss_link'}
          <li><a href="{$rss_link['link']}" title="{$rss_link['title']}" target="_blank">{$rss_link['title']}</a></li>
        {/foreach}
      </ul>
    {else}
      <p>{l s='No RSS feed added' d='Shop.Theme.Catalog'}</p>
    {/if}
  </div>
</div>
