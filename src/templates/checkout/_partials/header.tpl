{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_top'}
  <nav class="container">

    <div class="flex w-full items-center p-5 lg:relative">

      <div class="flex w-6/12">
        {if $page.page_name == 'index'}
          <h1>
            <a href="{$urls.pages.index}" class="flex items-center text-lg hover:text-red-550">
              <img class="w-16" src="{$shop.logo}" alt="{$shop.name}" loading="lazy">
              <span class="ml-2 hidden sm:inline-block font-bold">{$shop.name|strstr:' ':true}</span>
              <span class="hidden sm:inline-block ml-1">{$shop.name|strstr:' ':false}</span>
            </a>
          </h1>
        {else}
          <a href="{$urls.pages.index}" class="flex items-center text-lg hover:text-red-550">
            <img class="w-16" src="{$shop.logo}" alt="{$shop.name}" loading="lazy">
            <span class="ml-2 hidden sm:inline-block">{$shop.name|strstr:' ':true}</span>
            <span class="hidden sm:inline-block ml-1">{$shop.name|strstr:' ':false}</span>
          </a>
        {/if}
      </div>

      <div class="flex w-6/12 justify-end items-center">
        {hook h='displayNav2'}
      </div>

    </div>

  </nav>
  {hook h='displayNavFullWidth'}
{/block}