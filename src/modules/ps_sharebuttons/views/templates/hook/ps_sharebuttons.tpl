

{* {block name='social_sharing'}
  {if $social_share_links}
    <div class="social-sharing">
      <span>{l s='Share' d='Shop.Theme.Actions'}</span>
      <ul>
        {foreach from=$social_share_links item='social_share_link'}
          <li class="{$social_share_link.class} icon-gray"><a href="{$social_share_link.url}" class="text-hide" title="{$social_share_link.label}" target="_blank">{$social_share_link.label}</a></li>
        {/foreach}
      </ul>
    </div>
  {/if}
{/block} *}

{block name='social_sharing'}
  {if $social_share_links}
    <div class="social-sharing">
      <span class="text-sm share-product-title">{l s='Share' d='Shop.Theme.Actions'}</span>
      <ul>
        {foreach from=$social_share_links item='social_share_link'}
          <li class="material-icons"><a href="{$social_share_link.url}" class="text-hide" title="{$social_share_link.label}" target="_blank">{$social_share_link.class}</a></li>
        {/foreach}
      </ul>
    </div>
  {/if}
{/block}