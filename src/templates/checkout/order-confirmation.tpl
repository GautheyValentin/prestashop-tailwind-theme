{extends file='page.tpl'}

{block name='page_content_container' prepend}
    <section id="content-hook_order_confirmation" class="card mt-5">
      <div class="card-block">
        <div class="flex flex-col w-full">

            {block name='order_confirmation_header'}
              <h3 class="font-medium text-2xl text-center">
                <i class="fas fa-check"></i>
                {l s='Your order is confirmed' d='Shop.Theme.Checkout'}
              </h3>
            {/block}

            <p class="text-center">
              {l s='An email has been sent to your mail address %email%.' d='Shop.Theme.Checkout' sprintf=['%email%' => $customer.email]}
              {if $order.details.invoice_url}
                {* [1][/1] is for a HTML tag. *}
                {l
                  s='You can also [1]download your invoice[/1]'
                  d='Shop.Theme.Checkout'
                  sprintf=[
                    '[1]' => "<a href='{$order.details.invoice_url}'>",
                    '[/1]' => "</a>"
                  ]
                }
              {/if}
            </p>

            {block name='hook_order_confirmation'}
              {$HOOK_ORDER_CONFIRMATION nofilter}
            {/block}

        </div>
      </div>
    </section>
{/block}

{block name='page_content_container'}
  <section id="content" class="card mt-5">
    <div class="bg-gray-200 p-2 lg:mx-5 lg:p-5 rounded">
      <div class="flex flex-wrap">
        {block name='order_confirmation_table'}
          {include
            file='checkout/_partials/order-confirmation-table.tpl'
            products=$order.products
            subtotals=$order.subtotals
            totals=$order.totals
            labels=$order.labels
            add_product_link=false
          }
        {/block}

        {block name='order_details'}
          <div id="order-details" class="w-full mt-5 md:mt-0 md:w-4/12 md:px-5">
            <h3 class="uppercase font-medium">{l s='Order details' d='Shop.Theme.Checkout'}:</h3>
            <ul class="mt-2 font-light">
              <li>
                {l 
                  s='Order reference: %reference%' 
                  d='Shop.Theme.Checkout' 
                  sprintf=['%reference%' => "<span class='font-medium'>{$order.details.reference}</span>"]
                }
              </li>
              <li>
                {l 
                  s='Payment method: %method%' 
                  d='Shop.Theme.Checkout' 
                  sprintf=['%method%' => "<span class='font-medium'>{$order.details.payment}</span>"]
                }
              </li>
              {if !$order.details.is_virtual}
                <li>
                  {l 
                    s='Shipping method: %method%' 
                    d='Shop.Theme.Checkout' 
                    sprintf=['%method%' => "<span class='font-medium'>{$order.carrier.name}</span>"]
                  }
                  <br>
                  <em>{$order.carrier.delay}</em>
                </li>
              {/if}
            </ul>
          </div>
        {/block}

      </div>
    </div>
  </section>

  {block name='hook_payment_return'}
    {if ! empty($HOOK_PAYMENT_RETURN)}
    <section id="content-hook_payment_return" class="card mt-5">
      <div class="content-style">
        {$HOOK_PAYMENT_RETURN nofilter}
      </div>
    </section>
    {/if}
  {/block}

  {block name='customer_registration_form'}
    {if $customer.is_guest}
      <div id="registration-form" class="card">
        <div class="card-block">
          <h4 class="h4">{l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h4>
          {render file='customer/_partials/customer-form.tpl' ui=$register_form}
        </div>
      </div>
    {/if}
  {/block}

  {block name='hook_order_confirmation_1'}
    {hook h='displayOrderConfirmation1'}
  {/block}

  {block name='hook_order_confirmation_2'}
    <section id="content-hook-order-confirmation-footer">
      {hook h='displayOrderConfirmation2'}
    </section>
  {/block}
{/block}
