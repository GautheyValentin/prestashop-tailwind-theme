<div class="flex flex-col w-full lg:w-3/12">
  <a class="flex items-center text-lg hover:text-red-550" href="{$urls.pages.index}">
    <img class="w-16" src="{$shop.logo}" alt="{$shop.name}" loading="lazy">
    <span class="ml-2 font-bold">{$shop.name|strstr:' ':true}</span>
    <span class="ml-1">{$shop.name|strstr:' ':false}</span>
  </a>
  <div class="mt-2">
    {$contact_infos.address.formatted nofilter} <br>
    {if $contact_infos.email && $display_email}
      <br>
      {l s='Email us:' d='Shop.Theme.Global'}
      {mailto address=$contact_infos.email encode="javascript"}
    {/if}
  </div>
</div>