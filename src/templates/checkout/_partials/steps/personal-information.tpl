{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  {hook h='displayPersonalInformationTop' customer=$customer}

  {if $customer.is_logged && !$customer.is_guest}

    <p class="identity">
      {* [1][/1] is for a HTML tag. *}
      {l s='Connected as [1]%firstname% %lastname%[/1].'
        d='Shop.Theme.Customeraccount'
        sprintf=[
          '[1]' => "<a href='{$urls.pages.identity}'>",
          '[/1]' => "</a>",
          '%firstname%' => $customer.firstname,
          '%lastname%' => $customer.lastname
        ]
      }
    </p>
    <p>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='Not you? [1]Log out[/1]'
        d='Shop.Theme.Customeraccount'
        sprintf=[
        '[1]' => "<a href='{$urls.actions.logout}'>",
        '[/1]' => "</a>"
        ]
      }
    </p>
    {if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
      <p><small>{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</small></p>
    {/if}

    <div class="flex justify-end">
      <form method="GET" action="{$urls.pages.order}">
        <button
          class="primary-red"
          name="controller"
          type="submit"
          value="order"
        >
          {l s='Continue' d='Shop.Theme.Actions'}
        </button>
      </form>

    </div>

  {else}
  <div x-data="{literal}{show: 0}{/literal}">
      <ul class="flex space-x-4 mt-5 justify-center w-full" role="tablist">
        <li class="">
          <a
            class=""
            @click="show = 0"
            href="#"
            role="tab"
            aria-controls="checkout-guest-form"
            {if !$show_login_form} aria-selected="true"{/if}
            >
            {if $guest_allowed}
              {l s='Order as a guest' d='Shop.Theme.Checkout'}
            {else}
              {l s='Create an account' d='Shop.Theme.Customeraccount'}
            {/if}
          </a>
        </li>

        <li class="">
          <span class=""> | </span>
        </li>

        <li class="">
          <a
            class=""
            href="#"
            @click="show = 1"
            role="tab"
            aria-controls="checkout-login-form"
            {if $show_login_form} aria-selected="true"{/if}
          >
            {l s='Sign in' d='Shop.Theme.Actions'}
          </a>
        </li>
      </ul>

      <div class="">
        <div x-show="show === 0" class="tab-pane" id="checkout-guest-form" role="tabpanel">
          {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
        </div>
        <div x-show="show === 1" class="tab-pane" id="checkout-login-form" role="tabpanel" x-cloak>
          {render file='checkout/_partials/login-form.tpl' ui=$login_form}
        </div>
      </div>
    </div>

  {/if}
{/block}
