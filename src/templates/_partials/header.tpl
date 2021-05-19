{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_top'}
  <nav class="container" x-data="{ open: false }">

    <div class="flex w-full items-center p-5 lg:relative justify-between">

      <div class="flex">
        <button class="lg:hidden" @click="open = !open">
          <i class="fas fa-bars fa-lg"></i>
        </button>
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

      <div class="flex">
        {hook h='displayNav1'}
      </div>

      <div class="flex justify-end items-center">
        <div class="hidden lg:flex">
          {hook h='displaySearch'}
        </div>
        {hook h='displayNav2'}
      </div>

    </div>

    <div class="flex w-full justify-center lg:hidden mt-1 px-5">
      {hook h='displaySearch'}
    </div>

  </nav>
  {hook h='displayNavFullWidth'}
{/block}