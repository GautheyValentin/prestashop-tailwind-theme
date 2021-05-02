
<h3 class="mt-5 md:mt-0 font-medium text-lg">{l s='Contact us' d='Shop.Theme.Global'}</h3>

<section class="card mt-5">
  <form action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>

    {if $notifications}
      <div class="flex w-full mb-5 {if $notifications.nw_error}text-red-550{else}text-green-500{/if}">
        <ul>
          {foreach $notifications.messages as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </div>
    {/if}

    {if !$notifications || $notifications.nw_error}
      <section class="space-y-4">
        <div class="flex flex-wrap">
          <label class="w-full md:w-3/12">{l s='Subject' d='Shop.Forms.Labels'}</label>
          <div class="w-full md:w-6/12">
            <select name="id_contact" class="w-full">
              {foreach from=$contact.contacts item=contact_elt}
                <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
              {/foreach}
            </select>
          </div>
        </div>

        <div class="flex flex-wrap">
          <label class="w-full md:w-3/12">{l s='Email address' d='Shop.Forms.Labels'}</label>
          <div class="w-full md:w-6/12">
            <input
              class="w-full"
              name="from"
              type="email"
              value="{$contact.email}"
              placeholder="{l s='your@email.com' d='Shop.Forms.Help'}"
            >
          </div>
        </div>

        {if $contact.orders}
          <div class="flex flex-wrap">
            <label class="w-full md:w-3/12">{l s='Order reference' d='Shop.Forms.Labels'}</label>
            <div class="w-full md:w-6/12">
              <select name="id_order" class="form-control form-control-select">
                <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
                {foreach from=$contact.orders item=order}
                  <option value="{$order.id_order}">{$order.reference}</option>
                {/foreach}
              </select>
            </div>
            <span class="col-md-3 form-control-comment">
              {l s='optional' d='Shop.Forms.Help'}
            </span>
          </div>
        {/if}

        {if $contact.allow_file_upload}
          <div class="flex flex-wrap">
            <label class="w-full md:w-3/12">{l s='Attachment' d='Shop.Forms.Labels'}</label>
            <div class="w-full md:w-6/12">
              <input type="file" name="fileUpload" class="" data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
            </div>
            <span class="col-md-3 form-control-comment">
              {l s='optional' d='Shop.Forms.Help'}
            </span>
          </div>
        {/if}

        <div class="flex flex-wrap">
          <label class="w-full md:w-3/12">{l s='Message' d='Shop.Forms.Labels'}</label>
          <div class="w-full md:w-9/12">
            <textarea
              class="w-full"
              name="message"
              placeholder="{l s='How can we help?' d='Shop.Forms.Help'}"
              rows="3"
            >{if $contact.message}{$contact.message}{/if}</textarea>
          </div>
        </div>

        {if isset($id_module)}
          <div class="flex">
            <div class="offset-md-3">
              {hook h='displayGDPRConsent' id_module=$id_module}
            </div>
          </div>
        {/if}

      </section>

      <footer class="text-right">
        <input type="text" name="url" value="" class="hidden"/>
        <input type="hidden" name="token" value="{$token}" />
        <input class="primary-red" type="submit" name="submitMessage" value="{l s='Send' d='Shop.Theme.Actions'}">
      </footer>
    {/if}

  </form>
</section>
