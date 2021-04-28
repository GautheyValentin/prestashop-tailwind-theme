
{block name='address_block_item'}
  <article id="address-{$address.id}" class="address" data-id-address="{$address.id}">
    <div class="address-body">
      <h4>{$address.alias}</h4>
      <address>{$address.formatted nofilter}</address>
      {* Display the extra field values added in an address from using hook 'additionalCustomerAddressFields' *}
      {hook h='displayAdditionalCustomerAddressFields' address=$address}
    </div>

    {block name='address_block_item_actions'}
      <div class="space-x-3">
        <a href="{url entity=address id=$address.id}" data-link-action="edit-address">
          <i class="fas fa-pen"></i>
          <span class="ml-1">{l s='Update' d='Shop.Theme.Actions'}</span>
        </a>
        <a href="{url entity=address id=$address.id params=['delete' => 1, 'token' => $token]}" data-link-action="delete-address">
          <i class="fas fa-trash-alt"></i>
          <span class="ml-1">{l s='Delete' d='Shop.Theme.Actions'}</span>
        </a>
      </div>
    {/block}
  </article>
{/block}
