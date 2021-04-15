
<section id="content" class="page-content page-not-found">
  {block name='page_content'}

    <h4>{l s='Sorry for the inconvenience.' d='Shop.Theme.Global'}</h4>
    <p>{l s='Search again what you are looking for' d='Shop.Theme.Global'}</p>

    {block name='search'}
      {hook h='displaySearch'}
    {/block}

    {block name='hook_not_found'}
      {hook h='displayNotFound'}
    {/block}

  {/block}
</section>
