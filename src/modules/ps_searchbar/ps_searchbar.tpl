<div id="search_widget" class="w-full search-widget" data-search-controller-url="{$search_controller_url}">
  <form class="relative" method="get" action="{$search_controller_url}">
    <input type="hidden" name="controller" value="search">
    <input class="w-full pl-7 pr-1 py-1 bg-gray-100 rounded"
      placeholder="{l s='Search' d='Modules.Searchbar.Shop'}..." type="text" name="s" value="{$search_string}">
    <button class="flex items-center h-full absolute left-2 top-0 text-gray-400 focus:outline-none hover:text-grey-800"
      type="submit">
      <i class="fas fa-search"></i>
    </button>
  </form>
</div>