
{extends file='page.tpl'}

{block name="breadcrumb"}{/block}

{block name='page_title'}
  {$page.title}
{/block}

{block name='page_content_container'}
  {include file='errors/not-found.tpl'}
{/block}
