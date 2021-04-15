
{extends file='layouts/layout-error.tpl'}

{block name='content'}

  <section id="main">

    {block name='page_header_container'}
      <header class="page-header">
        {block name='page_header_logo'}
          <div class="logo"><img src="{$shop.logo}" alt="logo" loading="lazy"></div>
        {/block}

        {block name='hook_maintenance'}
          {$HOOK_MAINTENANCE nofilter}
        {/block}

        {block name='page_header'}
          <h1>{block name='page_title'}{l s='We\'ll be back soon.' d='Shop.Theme.Global'}{/block}</h1>
        {/block}
      </header>
    {/block}

    {block name='page_content_container'}
      <section id="content" class="page-content page-maintenance">
        {block name='page_content'}
          {$maintenance_text nofilter}
        {/block}
      </section>
    {/block}

    {block name='page_footer_container'}

    {/block}

  </section>

{/block}

{block name='stylesheets'}
  <style>
    body {
      margin: 0;
      padding: 5px;
    }

    #layout-error {
      position: fixed;
      display: flex;
      justify-content: center;
      align-items: center;
      width: calc(100% - 10px);
      height: calc(100% - 10px);
    }

    #main {
      display: flex;
      flex-direction: column;
      width: 100%;
      max-width: 400px; 
      align-items: center;
      border: 1px solid gray;
      border-radius: 5px;
      padding: 5px;
      text-align: center;
    }

    .logo {
      display: flex;
      justify-content: center;
    }

    .page-content {
      text-align: center;
    }
  </style>
{/block}


