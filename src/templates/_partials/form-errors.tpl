
{if $errors|count}
  <div class="help-block">
    {block name='form_errors'}
      <ul>
        {foreach $errors as $error}
          <li class="alert alert-danger">{$error|nl2br nofilter}</li>
        {/foreach}
      </ul>
    {/block}
  </div>
{/if}
