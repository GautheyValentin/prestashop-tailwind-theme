<nav class="flex mt-8">
  <div class="flex flex-col w-4/12">
    {block name='pagination_summary'}
      {l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items]}
    {/block}
  </div>

  <div class="flex flex-col w-8/12 items-end">
    {block name='pagination_page_list'}
      {if $pagination.should_be_displayed}
        <ul class="flex items-center">
          {foreach from=$pagination.pages item="page"}


            <li {if $page.current} class="bg-gray-200 py-1 px-2 rounded ml-2" {else} class="ml-2" {/if}>
              {if $page.type === 'spacer'}
                <span class="spacer">&hellip;</span>
              {else}
                <a rel="{if $page.type === 'previous'}prev{elseif $page.type === 'next'}next{else}nofollow{/if}"
                  href="{$page.url}" class="flex items-center {['disabled' => !$page.clickable]|classnames}">
                  {if $page.type === 'previous'}
                    <i class="fas fa-angle-left mr-2"></i>{l s='Previous' d='Shop.Theme.Actions'}
                  {elseif $page.type === 'next'}
                    {l s='Next' d='Shop.Theme.Actions'}<i class="fas fa-angle-right ml-2"></i>
                  {else}
                    {$page.page}
                  {/if}
                </a>
              {/if}
            </li>
          {/foreach}
        </ul>
      {/if}
    {/block}
  </div>

</nav>