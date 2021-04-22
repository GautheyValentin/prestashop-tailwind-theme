{block name='social_sharing'}
  {if $social_share_links}
    <div class="social-sharing">
      <span class="text-sm share-product-title">{l s='Share' d='Shop.Theme.Actions'}</span>
      <div class="space-x-3">
        {foreach from=$social_share_links item='social_share_link'}
          <a href="{$social_share_link.url}" class="text-hide" title="{$social_share_link.label}" target="_blank">
            {if $social_share_link.class === 'facebook'} <i class="fab fa-facebook-f"></i>
            {elseif $social_share_link.class === 'twitter'} <i class="fab fa-twitter"></i>
            {else} <i class="fab fa-pinterest-p"></i> {/if}
          </a>
        {/foreach}
      </div>
    </div>
  {/if}
{/block}