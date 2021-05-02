{extends file=$layout}

{block name='content'}

  <section id="main" class="min-h-51 md:px-5">

    {block name='page_header_container'}
      {block name='page_title' hide}
        <header class="page-header">
          <h1 class="text-2xl font-medium mt-5 px-5 text-center">{$smarty.block.child}</h1>
        </header>
      {/block}
    {/block}

    {block name='page_content_container'}
      <section id="content" class="max-w-xl w-full mx-auto mt-5 card">
        {block name='page_content_top'}{/block}
        {block name='page_content'}
          <!-- Page content -->
        {/block}
      </section>
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}

  </section>

{/block}
