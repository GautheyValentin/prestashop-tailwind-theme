

{block name='block_social'}
  <div class="block-social col-lg-4 col-md-12 col-sm-12">
    <ul>
      {foreach from=$social_links item='social_link'}
        <li class="{$social_link.class}"><a href="{$social_link.url}" target="_blank" rel="noopener noreferrer">{$social_link.label}</a></li>
      {/foreach}
    </ul>
  </div>
{/block}
