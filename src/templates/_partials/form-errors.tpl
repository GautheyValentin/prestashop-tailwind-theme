
{if $errors|count}
  <div>
    {block name='form_errors'}
      <ul>
        {foreach $errors as $error}
          <li class="text-red-550 font-light text-xs">{$error|nl2br nofilter}</li>
        {/foreach}
      </ul>
    {/block}
  </div>
{/if}
