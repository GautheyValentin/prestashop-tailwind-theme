
{extends file='customer/order-detail.tpl'}

{block name='page_title'}
  {l s='Guest Tracking' d='Shop.Theme.Customeraccount'}
{/block}

{block name='order_detail'}
  {include file='customer/_partials/order-detail-no-return.tpl'}
{/block}

{block name='order_messages'}
{/block}

{if !$is_customer}
{block name='page_content' append}
  {block name='guest_to_customer'}
    <form action="{$urls.pages.guest_tracking}" method="post">
      <header>
        <h1 class="h3">{l s='Transform your guest account into a customer account and enjoy:' d='Shop.Theme.Customeraccount'}</h1>
        <ul>
          <li> -{l s='Personalized and secure access' d='Shop.Theme.Customeraccount'}</li>
          <li> -{l s='Fast and easy checkout' d='Shop.Theme.Customeraccount'}</li>
          <li> -{l s='Easier merchandise return' d='Shop.Theme.Customeraccount'}</li>
        </ul>
      </header>

      <section class="form-fields">

        <label>
          <span>{l s='Set your password:' d='Shop.Forms.Labels'}</span>
          <input type="password" data-validate="isPasswd" name="password" value="">
        </label>

      </section>

      <footer class="form-footer">
        <input type="hidden" name="submitTransformGuestToCustomer" value="1">
        <input type="hidden" name="id_order" value="{$order.details.id}">
        <input type="hidden" name="order_reference" value="{$order.details.reference}">
        <input type="hidden" name="email" value="{$guest_email}">

        <button class="btn btn-primary" type="submit">{l s='Send' d='Shop.Theme.Actions'}</button>
      </footer>

    </form>
  {/block}
{/block}
{/if}
