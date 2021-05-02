

<div class="mt-5">
  <h4 class="font-medium text-lg">{l s='Store information' d='Shop.Theme.Global'}</h4>
  <div class="flex space-x-4 items-center mt-5">
    <div><i class="fas fa-location-arrow fa-2x"></i></div>
    <div>{$contact_infos.address.formatted nofilter}</div>
  </div>
  {if $contact_infos.phone}
    <hr/>
    <div class="flex space-x-4 items-center mt-5">
      <div><i class="fas fa-phone fa-2x"></i></div>
      <div>
        {l s='Call us:' d='Shop.Theme.Global'}<br/>
        <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>
       </div>
    </div>
  {/if}
  {if $contact_infos.fax}
    <hr/>
    <div class="flex space-x-4 items-center mt-5">
      <div><i class="fas fa-fax fa-2x"></i></div>
      <div>
        {l s='Fax:' d='Shop.Theme.Global'}<br/>
        {$contact_infos.fax}
      </div>
    </div>
  {/if}
  {if $contact_infos.email && $display_email}
    <hr/>
    <div class="flex space-x-4 items-center mt-5">
      <div><i class="fas fa-envelope fa-2x"></i></div>
      <div>
        {l s='Email us:' d='Shop.Theme.Global'}<br/>
        {mailto address=$contact_infos.email encode="javascript"}
      </div>
    </div>
  {/if}
</div>
