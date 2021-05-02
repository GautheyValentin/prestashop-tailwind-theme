
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Sitemap' d='Shop.Theme.Global'}
{/block}

{block name='page_content_container'}
  <div class="flex w-full mt-5 flex-wrap space-y-5 md:space-y-0">
      <div class="w-full flex flex-col md:w-1/2 lg:w-3/12 items-center px-5">
        <h2 class="text-lg font-medium mb-2">{$our_offers}</h2>
        {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.offers}
      </div>
      <div class="w-full flex flex-col md:w-1/2 lg:w-3/12 items-center px-5">
        <h2 class="text-lg font-medium mb-2">{$categories}</h2>
        {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.categories}
      </div>
      <div class="w-full flex flex-col md:w-1/2 lg:w-3/12 items-center px-5">
        <h2 class="text-lg font-medium  mb-2">{$your_account}</h2>
        {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.user_account}
      </div>
      <div class="w-full flex flex-col md:w-1/2 lg:w-3/12 items-center px-5">
        <h2 class="text-lg font-medium  mb-2">{$pages}</h2>
        {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.pages}
      </div>
  </div>
{/block}
