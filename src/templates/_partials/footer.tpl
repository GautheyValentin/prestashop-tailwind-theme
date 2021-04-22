<div class="flex justify-center mt-10">
  <div class="container">
    {block name='hook_footer_before'}
      {hook h='displayFooterBefore'}
    {/block}
  </div>
</div>
<div class="flex justify-center mt-30 bg-gray-100">
  <div class="container">
    <div class="flex w-full p-5 flex-wrap">
      {block name='hook_footer'}
        {hook h='displayFooter'}
      {/block}
    </div>
    <div class="flex w-full">
      {block name='hook_footer_after'}
        {hook h='displayFooterAfter'}
      {/block}
    </div>
    <div class="flex w-full justify-center p-5">
      {block name='copyright_link'}
        <a href="https://www.gautheyminiatures.fr" target="_blank" rel="noopener noreferrer nofollow">
          {l s='%copyright% %year% - Ecommerce software by %prestashop%' sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
        </a>
      {/block}
    </div>
  </div>
</div>