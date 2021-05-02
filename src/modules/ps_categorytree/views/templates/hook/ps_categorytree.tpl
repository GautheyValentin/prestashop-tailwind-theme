

{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
    <ul class="ml-2">
        {foreach from=$nodes item=node key=key}
          <li 
            x-data="{literal}{isOpen{/literal}{$node.id}{literal}: {/literal}{($key === 0 && $depth === 0) ? 'true' : 'false'}{literal}}{/literal}" 
            class="flex flex-wrap{if $depth === 0} mt-5{/if}">
              <div class="flex w-full justify-between">
              <a class="{if $depth===0}font-medium{elseif $depth===2}font-light{/if}" href="{$node.link}">{$node.name}</a>
                {if $node.children}
                  <div class="cursor-pointer">
                    <i class="fas fa-angle-down" :class="{literal}{'hidden': isOpen{/literal}{$node.id}{literal}}{/literal}" x-on:click="isOpen{$node.id} = true" x-cloak></i>
                    <i class="fas fa-angle-up" :class="{literal}{'hidden': !isOpen{/literal}{$node.id}{literal}}{/literal}" x-on:click="isOpen{$node.id} = false"></i>
                  </div>
                {/if}
              </div>
              {if $node.children}
                <div class="w-full" :class="{literal}{'hidden': !isOpen{/literal}{$node.id}{literal}}{/literal}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}

          </li>
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}

<ul class="flex flex-col bg-gray-100 rounded p-5">
  <li><a class="text-lg font-bold" href="{$categories.link nofilter}">{$categories.name}</a></li>
  <li>{categories nodes=$categories.children}</li>
</ul>