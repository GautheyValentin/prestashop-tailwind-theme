{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
  {if $nodes|count}
    <ul {if $depth === 0}class="flex flex-col lg:flex-row" {/if} {if $depth === 1}class="lg:flex lg:flex-wrap" {/if} x-cloak
      data-depth="{$depth}">
      {foreach from=$nodes item=node}
        <li {if $depth == 0}class="py-3 px-5 lg:p-5{if $node.current} current {/if}" {/if}
          {if $depth == 1}class="mt-1 lg:mt-0 lg:p-5{if $node.current} current {/if}" {/if} id="{$node.page_identifier}"
          {if $depth === 0} x-data="{ dropdownOpen: false }" @mouseover="dropdownOpen = true" @touchstart.prevent="dropdownOpen = !dropdownOpen"
          @mouseover.away="dropdownOpen = false" {/if}>
          {assign var=_counter value=$_counter+1}
          <a {if $depth === 1}class="uppercase font-bold" {/if} href="{$node.url}" data-depth="{$depth}"
            {if $node.open_in_new_window} target="_blank" {/if}>
            {if $depth === 0 && $node.children|count}
              <span @touchstart.prevent="dropdownOpen = !dropdownOpen" class="lg:hidden">
                <i x-show="dropdownOpen == false" class="fas fa-angle-down"></i>
                <i x-show="dropdownOpen == true" class="fas fa-angle-up"></i>
              </span>
            {/if}
            {$node.label}
          </a>
          {if $node.children|count}
            <div {if $depth === 0}
                class="p-2 mt-2 rounded-md bg-white ring-1 ring-black ring-opacity-5 w-auto lg:mt-2 lg:flex lg:absolute lg:max-w-3xl"
                x-show="dropdownOpen" {/if} {if $depth > 0} class="p-2" {/if} id="top_sub_menu">
                {menu nodes=$node.children depth=$node.depth parent=$node}
              </div>
            {/if}
          </li>
        {/foreach}
      </ul>
    {/if}
  {/function}

  <div x-cloak class="w-full absolute z-10 top-16 left-0 bg-gray-100 lg:bg-transparent lg:top-0 lg:block lg:initial"
    {':class="{\'hidden\': !open, \'block\': open}"' nofilter}>
    {menu nodes=$menu.children}
  </div>