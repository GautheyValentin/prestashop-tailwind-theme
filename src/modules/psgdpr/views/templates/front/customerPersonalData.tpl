 {extends file='customer/page.tpl'}

 {block name='page_title'}
     {l s='GDPR - Personal data' mod='psgdpr'}
 {/block}
 
 {block name='page_content'}
<section class="grid grid-cols-1 sm:grid-cols-2 gap-4">
  <div class="card mt-5">
      <h2 class="text-lg font-medium">{l s='Access to my data' mod='psgdpr'}</h2>
      <p>{l s='At any time, you have the right to retrieve the data you have provided to our site. Click on "Get my data" to automatically download a copy of your personal data on a pdf or csv file.' mod='psgdpr'}</p>
      <div class="flex justify-end mt-5">
          <a id="exportDataToCsv" class="primary-red" target="_blank" href="{$psgdpr_csv_controller|escape:'htmlall':'UTF-8'}">{l s='GET MY DATA TO CSV' mod='psgdpr'}</a>
          <a id="exportDataToPdf" class="primary-red" target="_blank" href="{$psgdpr_pdf_controller|escape:'htmlall':'UTF-8'}">{l s='GET MY DATA TO PDF' mod='psgdpr'}</a>
      </div>
  </div>
  <div class="card mt-5">
      <h2 class="text-lg font-medium">{l s='Rectification & Erasure requests' mod='psgdpr'}</h2>
      <p>{l s='You have the right to modify all the personal information found in the "My Account" page. For any other request you might have regarding the rectification and/or erasure of your personal data, please contact us through our' mod='psgdpr'} <a href="{$psgdpr_contactUrl|escape:'htmlall':'UTF-8'}">{l s='contact page' mod='psgdpr'}</a>. {l s='We will review your request and reply as soon as possible.' mod='psgdpr'}</p>
  </div>
</section>

 {literal}
 <script type="text/javascript">
     var psgdpr_front_controller = "{/literal}{$psgdpr_front_controller|escape:'htmlall':'UTF-8'}{literal}";
     var psgdpr_id_customer = "{/literal}{$psgdpr_front_controller|escape:'htmlall':'UTF-8'}{literal}";
     var psgdpr_ps_version = "{/literal}{$psgdpr_ps_version|escape:'htmlall':'UTF-8'}{literal}";
 </script>
 {/literal}
 {/block}
 