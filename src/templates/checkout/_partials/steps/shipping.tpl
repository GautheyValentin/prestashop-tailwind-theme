
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div id="hook-display-before-carrier">
    {$hookDisplayBeforeCarrier nofilter}
  </div>

  <div class="mt-5">
    {if $delivery_options|count}
      <form
        id="js-delivery"
        data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'selectDeliveryOption']}"
        method="post"
      >
          {block name='delivery_options'}
            <div class="space-y-2">
              {foreach from=$delivery_options item=carrier key=carrier_id}
                  <div class="flex bg-gray-200 rounded p-2 justify-around items-center">
                    <input 
                      type="radio" 
                      name="delivery_option[{$id_address}]" 
                      id="delivery_option_{$carrier.id}" 
                      value="{$carrier_id}"
                      {if $delivery_option == $carrier_id} checked{/if}
                    >
                    
                    <label for="delivery_option_{$carrier.id}" class="w-11/12 flex justify-between items-center">
                    
                      <div class="flex items-center">
                        {if $carrier.logo}
                          <img src="{$carrier.logo}" alt="{$carrier.name}" loading="lazy" />
                        {/if}
                        <span class="ml-2 font-light">{$carrier.name}</span>
                      </div>

                      <span class="font-light text-sm">{$carrier.delay}</span>
                      <span class="">{$carrier.price}</span>                        
                    </label>
                  </div>
                  <div class="flex w-full carrier-extra-content"{if $delivery_option != $carrier_id} style="display:none"{/if}>
                    {$carrier.extraContent nofilter}
                  </div>
              {/foreach}
            </div>
          {/block}
          <div class="space-y-5 mt-5">
            <div id="delivery">
              <label for="delivery_message">{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Checkout'}</label>
              <textarea id="delivery_message" name="delivery_message" class="p-2 w-full mt-2">{$delivery_message}</textarea>
            </div>

            {if $recyclablePackAllowed}
              <span class="custom-checkbox">
                <input type="checkbox" id="input_recyclable" name="recyclable" value="1" {if $recyclable} checked {/if}>
                <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                <label for="input_recyclable">{l s='I would like to receive my order in recycled packaging.' d='Shop.Theme.Checkout'}</label>
              </span>
            {/if}

            {if $gift.allowed}
              <span class="custom-checkbox">
                <input class="js-gift-checkbox" id="input_gift" name="gift" type="checkbox" value="1" {if $gift.isGift}checked="checked"{/if}>
                <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                <label for="input_gift">{$gift.label}</label >
              </span>

              <div id="gift" class="collapse{if $gift.isGift} in{/if}">
                <label for="gift_message">{l s='If you\'d like, you can add a note to the gift:' d='Shop.Theme.Checkout'}</label>
                <textarea rows="2" cols="120" id="gift_message" name="gift_message">{$gift.message}</textarea>
              </div>
            {/if}

          </div>
        <div class="flex justify-end mt-5">
          <button type="submit" class="primary-red" name="confirmDeliveryOption" value="1">
            {l s='Continue' d='Shop.Theme.Actions'}
          </button>
        </div>
      </form>
    {else}
      <p class="alert alert-danger">{l s='Unfortunately, there are no carriers available for your delivery address.' d='Shop.Theme.Checkout'}</p>
    {/if}
  </div>

  <div id="hook-display-after-carrier">
    {$hookDisplayAfterCarrier nofilter}
  </div>

  <div id="extra_carrier"></div>
{/block}
