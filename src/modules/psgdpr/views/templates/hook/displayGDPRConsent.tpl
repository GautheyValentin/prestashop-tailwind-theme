<div id="gdpr_consent_{$psgdpr_id_module|escape:'htmlall':'UTF-8'}" class="mt-2">

  <label class="flex items-center space-x-2">
      <input id="psgdpr_consent_checkbox_{$psgdpr_id_module|escape:'htmlall':'UTF-8'}" name="psgdpr_consent_checkbox" type="checkbox" value="1" class="form-checkbox">
      <span>{$psgdpr_consent_message nofilter}</span>
  </label>

</div>

{literal}
<script type="text/javascript">
 var psgdpr_front_controller = "{/literal}{$psgdpr_front_controller|escape:'htmlall':'UTF-8'}{literal}";
 psgdpr_front_controller = psgdpr_front_controller.replace(/\amp;/g,'');
 var psgdpr_id_customer = "{/literal}{$psgdpr_id_customer|escape:'htmlall':'UTF-8'}{literal}";
 var psgdpr_customer_token = "{/literal}{$psgdpr_customer_token|escape:'htmlall':'UTF-8'}{literal}";
 var psgdpr_id_guest = "{/literal}{$psgdpr_id_guest|escape:'htmlall':'UTF-8'}{literal}";
 var psgdpr_guest_token = "{/literal}{$psgdpr_guest_token|escape:'htmlall':'UTF-8'}{literal}";

 document.addEventListener('DOMContentLoaded', function() {
     let psgdpr_id_module = "{/literal}{$psgdpr_id_module|escape:'htmlall':'UTF-8'}{literal}";
     let parentForm = $('#gdpr_consent_' + psgdpr_id_module).closest('form');

     let toggleFormActive = function() {
         let parentForm = $('#gdpr_consent_' + psgdpr_id_module).closest('form');
         let checkbox = $('#psgdpr_consent_checkbox_' + psgdpr_id_module);
         let element = $('#gdpr_consent_' + psgdpr_id_module);
         let iLoopLimit = 0;

         if (element.prop('checked') != true) {
             element.closest('form').find('[type="submit"]').attr('disabled', 'disabled');
         }
         $(document).on("change" ,'#psgdpr_consent_checkbox_' + psgdpr_id_module, function() {
            console.log($(this).prop('checked'))
             if ($(this).prop('checked') == true) {
                 $(this).closest('form').find('[type="submit"]').removeAttr('disabled');
             } else {
                 $(this).closest('form').find('[type="submit"]').attr('disabled', 'disabled');
             }

         });
     }

     toggleFormActive();

     $(document).on('submit', parentForm, function(event) {
         $.ajax({
             data: 'POST',
             url: psgdpr_front_controller,
             data: {
                 ajax: true,
                 action: 'AddLog',
                 id_customer: psgdpr_id_customer,
                 customer_token: psgdpr_customer_token,
                 id_guest: psgdpr_id_guest,
                 guest_token: psgdpr_guest_token,
                 id_module: psgdpr_id_module,
             },
             error: function (err) {
                 console.log(err);
             }
         });
     });
 });
</script>
{/literal}
