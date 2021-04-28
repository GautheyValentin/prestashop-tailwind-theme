
{block name='address_selector_blocks'}
  {foreach $addresses as $address}
    <article
      class="p-2 border-2 space-y-4{if $address.id == $selected} border-gray-400 rounded{/if}"
      id="{$name|classname}-address-{$address.id}"
    >
      <header class="h4">
        <label class="text-lg font-medium">
          <input
            type="radio"
            name="{$name}"
            value="{$address.id}"
            {if $address.id == $selected}checked{/if}
          >
          {$address.alias}
        </label>
        <div>{$address.formatted nofilter}</div>
      </header>
      <hr>
      <footer class="text-center space-x-4">
        {if $interactive}
          <a
            data-link-action="edit-address"
            href="{url entity='order' params=['id_address' => $address.id, 'editAddress' => $type, 'token' => $token]}"
          >
            <i class="fas fa-pen"></i>
            <span class="ml-1">{l s='Edit' d='Shop.Theme.Actions'}</span>
          </a>
          <a
            data-link-action="delete-address"
            href="{url entity='order' params=['id_address' => $address.id, 'deleteAddress' => true, 'token' => $token]}"
          >
            <i class="fas fa-trash"></i>
            <span class="ml-1">{l s='Delete' d='Shop.Theme.Actions'}</span>
          </a>
        {/if}
      </footer>
    </article>
  {/foreach}
  {if $interactive}
    <p>
      <button class="ps-hidden-by-js form-control-submit center-block" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
    </p>
  {/if}
{/block}
