

{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
      <ul class="p-2">
        {foreach from=$nodes item=node key=key}
          <li x-data="{literal}{isOpen: {/literal}{($key === 0) ? 'true' : 'false'}{literal}}{/literal}" class="flex flex-wrap">
            {if $depth===0}
              <a class="w-10/12" href="{$node.link}">{$node.name}</a>
              {if $node.children}
                <div class="cursor-pointer w-2/12 justify-end flex">
                  <i class="fas fa-angle-down" :class="{literal}{'hidden': isOpen}{/literal}" x-on:click="isOpen = true" x-cloak></i>
                  <i class="fas fa-angle-up" :class="{literal}{'hidden': !isOpen}{/literal}" x-on:click="isOpen = false"></i>
                </div>
                <div class="w-full" :class="{literal}{'hidden': !isOpen}{/literal}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {else}
              <a class="font-light text-sm" href="{$node.link}">{$node.name}</a>
              {if $node.children}
                <div class="float-right">
                  <i class="fas fa-angle-down" :class="{literal}{'hidden': isOpen}{/literal}" x-cloak></i>
                  <i class="fas fa-angle-up" :class="{literal}{'hidden': !isOpen}{/literal}"></i>
                </div>
                <div class="collapse">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {/if}
          </li>
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}

<ul class="flex flex-col bg-gray-200 rounded p-5">
  <li><a class="text-lg font-bold" href="{$categories.link nofilter}">{$categories.name}</a></li>
  <li>{categories nodes=$categories.children}</li>
</ul>