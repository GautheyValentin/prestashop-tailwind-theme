 <div class="flex flex-col mt-5">
   <div>
      <i class="fas fa-lock"></i>
      {l s='100% secure payments' mod='ps_checkout'}
   </div>
   <div class="flex flex-wrap items-center space-x-2">
   {foreach from=$paymentOptions item=paymentOption}
      {if $paymentOption == 'card'}
        <i class="fab fa-cc-amex fa-2x"></i>
        <i class="fab fa-cc-visa fa-2x"></i>
        <i class="fab fa-cc-mastercard fa-2x"></i>
      {elseif $paymentOption == 'paypal'} <i class="fab fa-cc-paypal fa-2x"></i>
      {else}
        <img class="w-7" src="{$modulePath}views/img/{$paymentOption}.svg" alt="{$paymentOption}">
      {/if}
   {/foreach}
   </div>
 </div>
 
 {if isset($cart) and $payIn4XisOrderPageEnabled == true}
   <hr />
   <div
     data-pp-message
     data-pp-placement="cart"
     data-pp-style-layout="text"
     data-pp-style-logo-type="inline"
     data-pp-style-text-color="black"
     data-pp-amount="{$cart.totals.total.amount}"></div>
   <script>
     window.ps_checkoutPayPalSdkInstance
       && window.ps_checkoutPayPalSdkInstance.Messages
       && window.ps_checkoutPayPalSdkInstance.Messages().render('[data-pp-message]');
   </script>
 {/if}
 