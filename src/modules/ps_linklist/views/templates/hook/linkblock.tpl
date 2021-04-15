<div class="flex w-full lg:mt-0 lg:w-4/12 flex-wrap">
  {foreach $linkBlocks as $linkBlock}
    <div class="flex flex-col mt-3 sm:items-center w-full sm:w-6/12 lg:items-start">
      <p class="text-lg font-bold">{$linkBlock.title}</p>
      <ul class="flex flex-col sm:items-center lg:items-start">
        {foreach $linkBlock.links as $link}
          <li>
            <a id="{$link.id}-{$linkBlock.id}" class="{$link.class}" href="{$link.url}" title="{$link.description}"
              {if !empty($link.target)} target="{$link.target}" {/if}>
              {$link.title}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  {/foreach}
</div>