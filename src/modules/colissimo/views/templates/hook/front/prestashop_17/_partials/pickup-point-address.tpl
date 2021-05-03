{if isset($colissimo_pickup_point_error)}
  <div class="alert alert-danger">
    {$colissimo_pickup_point_error}
  </div>
{else}
  {if isset($colissimo_pickup_point) && $colissimo_pickup_point->id}
    <article id="colissimo-pickup-point-address-selected">
      <input type="hidden" name="id_colissimo_pickup_point" value="{$colissimo_pickup_point->id}"/>
      <header>
        <span class="h4">{l s='Selected pickup-point address' mod='colissimo'}</span>
        <br/>
        <a id="colissimo-select-pickup-point" class="colissimo-edit-point">
          {l s='(Choose another pickup point)' mod='colissimo'}
        </a>
        <div class="colissimo-pickup-point-address">
          {$colissimo_pickup_point->company_name}<br>
          {$colissimo_pickup_point->address1}<br>
          {if $colissimo_pickup_point->address2}{$colissimo_pickup_point->address2}<br>{/if}
          {if $colissimo_pickup_point->address3}{$colissimo_pickup_point->address3}<br>{/if}
          {$colissimo_pickup_point->zipcode} {$colissimo_pickup_point->city}<br>
          {$colissimo_pickup_point->country}<br>
          <p class="colissimo-pickup-point-phone">
            <span>
              {l s='Please confirm your mobile phone number.' mod='colissimo'}<br>
              {l s='You will receive text notifications about the delivery progress.' mod='colissimo'}
            </span>
          </p>
          <input type="tel"
                 class="fixed-width-md colissimo-pickup-mobile-phone"
                 id="colissimo-pickup-mobile-phone"
                 value="{$mobile_phone}"
                 name="colissimo_pickup_mobile_phone[main]"/>
          <img src="{$colissimo_img_path}icons/icon_valid.png"
               class="colissimo-mobile-valid js-colissimo-mobile-valid"/>
          <img src="{$colissimo_img_path}icons/icon_invalid.png"
               class="colissimo-mobile-invalid js-colissimo-mobile-invalid"/>
          <input type="hidden" class="js-colissimo-is-mobile-valid" name="colissimo_is_mobile_valid" value=""/>
        </div>
      </header>
    </article>
  {else}
    <button type="button" class="mt-2 primary-red" id="colissimo-select-pickup-point" name="colissimoSelectPickupPoint"
            value="1">
      {l s='Select a pickup point' mod='colissimo'}
    </button>
  {/if}
{/if}
