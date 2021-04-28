
{block name='order_messages_table'}
  {if $order.messages}
    <div class="card mt-5">
      <h3>{l s='Messages' d='Shop.Theme.Customeraccount'}</h3>
      {foreach from=$order.messages item=message}
        <div class="message row">
          <div class="col-sm-4">
            {$message.name}<br/>
            {$message.message_date}
          </div>
          <div class="col-sm-8">
            {$message.message nofilter}
          </div>
        </div>
      {/foreach}
    </div>
  {/if}
{/block}

{block name='order_message_form'}
  <section class="card mt-5">
    <form action="{$urls.pages.order_detail}" method="post">

      <header>
        <h3 class="font-medium text-lg">{l s='Add a message' d='Shop.Theme.Customeraccount'}</h3>
        <p class="mt-2">{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Customeraccount'}</p>
      </header>

      <section class="mt-5 space-y-5">
        <div class="flex flex-wrap">
          <label class="w-full md:w-3/12 md:text-right md:pr-5">{l s='Product' d='Shop.Forms.Labels'}</label>
          <div class="w-full md:w-5/12">
            <select name="id_product" class="white-input w-full">
              <option value="0">{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
              {foreach from=$order.products item=product}
                <option value="{$product.id_product}">{$product.name}</option>
              {/foreach}
            </select>
          </div>
        </div>

        <div class="flex flex-wrap">
          <label class="w-full md:w-3/12"></label>
          <div class="w-full md:w-9/12">
            <textarea rows="3" name="msgText" class="w-full p-2 text-sm"></textarea>
          </div>
        </div>

      </section>

      <footer class="flex justify-end mt-5">
        <input type="hidden" name="id_order" value="{$order.details.id}">
        <button type="submit" name="submitMessage" class="primary-red">
          {l s='Send' d='Shop.Theme.Actions'}
        </button>
      </footer>

    </form>
  </section>
{/block}
