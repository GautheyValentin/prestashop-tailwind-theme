{extends file='page.tpl'}

{block name='page_header_container'}{/block}

{if $layout === 'layouts/layout-left-column.tpl'}
  {block name="left_column"}
    <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
      {widget name="ps_contactinfo" hook='displayLeftColumn'}
    </div>
  {/block}
{else if $layout === 'layouts/layout-right-column.tpl'}
  {block name="right_column"}
    <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
      {widget name="ps_contactinfo" hook='displayRightColumn'}
    </div>
  {/block}
{/if}

{block name='page_content'}
  {widget name="contactform"}
{/block}
