<div class="flex flex-col w-full mt-5 lg:w-5/12" id="blockEmailSubscription_{$hookName}">
  <p id="block-newsletter-label">{l s='Get our latest news and special sales' d='Shop.Theme.Global'}</p>
  <div class="mt-2">
    <form action="{$urls.current_url}#blockEmailSubscription_{$hookName}" method="post">
      <div class="flex flex-col">
        <input name="email" type="email" value="{$value}"
          class="focus:ring-indigo-500 focus:border-indigo-500 block  w-full md:w-1/2 p-2 sm:text-sm border-gray-300 rounded"
          placeholder="{l s='Your email address' d='Shop.Forms.Labels'}" aria-labelledby="block-newsletter-label"
          required>
        <input type="hidden" name="blockHookName" value="{$hookName}" />
        <input type="hidden" name="action" value="0">
        {if isset($id_module)}
          {hook h='displayGDPRConsent' id_module=$id_module}
        {/if}
        <div class="flex mt-2 items-center">
          <input class="primary-red" name="submitNewsletter" type="submit"
            value="{l s='Subscribe' d='Shop.Theme.Actions'}">
          {if $msg}
            <p class="ml-1 {if $nw_error}text-red-550{else}text-green-500{/if}">
              {$msg}
            </p>
          {/if}
        </div>
      </div>
    </form>
  </div>
  <div class="flex flex-col mt-3 text-sm">
    {if $conditions}
      <p>{$conditions nofilter}</p>
    {/if}
    {hook h='displayNewsletterRegistration'}
  </div>
</div>