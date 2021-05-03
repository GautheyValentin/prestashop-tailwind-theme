

{if isset($notifications)}
<aside id="notifications">
  <div class="container mx-auto mb-5 px-5">
    {if $notifications.error}
      {block name='notifications_error'}
        <article class="bg-red-550 bg-opacity-20 rounded p-2 border border-red-550" role="alert" data-alert="danger">
          <ul>
            {foreach $notifications.error as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {if $notifications.warning}
      {block name='notifications_warning'}
        <article class="bg-orange-500 bg-opacity-20 rounded p-2 border border-orange-500" role="alert" data-alert="warning">
          <ul>
            {foreach $notifications.warning as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {if $notifications.success}
      {block name='notifications_success'}
        <article class="bg-green-400 bg-opacity-20 rounded p-2 border border-green-400" role="alert" data-alert="success">
          <ul>
            {foreach $notifications.success as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {if $notifications.info}
      {block name='notifications_info'}
        <article class="bg-blue-500 bg-opacity-20 rounded p-2 border border-blue-500" role="alert" data-alert="info">
          <ul>
            {foreach $notifications.info as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}
  </div>
</aside>
{/if}
