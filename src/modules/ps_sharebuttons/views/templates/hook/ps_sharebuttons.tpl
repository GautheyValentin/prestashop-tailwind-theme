{block name='social_sharing'}
  {if $social_share_links}
    <div class="social-sharing">
      <span class="text-sm share-product-title">{l s='Share' d='Shop.Theme.Actions'}</span>
      <div class="space-x-3">
        {foreach from=$social_share_links item='social_share_link'}
          <a href="{$social_share_link.url}" class="text-hide" title="{$social_share_link.label}" target="_blank"
            rel="noopener noreferrer" aria-label="{$social_share_link.label}">
            {if $social_share_link.class === 'facebook'} <i class="fab fa-facebook-f"></i><span
                class="hidden">{$social_share_link.label}</span>
            {elseif $social_share_link.class === 'twitter'} <i class="fab fa-twitter"></i><span
                class="hidden">{$social_share_link.label}</span>
            {elseif $social_share_link.class === 'pinterest'} <i class="fab fa-pinterest-p"></i><span
              class="hidden">{$social_share_link.label}</span> {/if}
          </a>
        {/foreach}
      </div>
    </div>
  {/if}
{/block}