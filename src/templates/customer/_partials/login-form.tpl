
{block name='login_form'}

  {block name='login_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form id="login-form" action="{block name='login_form_actionurl'}{$action}{/block}" method="post">

    <section class="space-y-3">
      {block name='login_form_fields'}
        {foreach from=$formFields item="field"}
          {block name='form_field'}
            {form_field field=$field}
          {/block}
        {/foreach}
      {/block}
      <a href="{$urls.pages.password}" rel="nofollow" class="text-center w-full block">
        {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
      </a>
    </section>

    {block name='login_form_footer'}
      <footer class="flex w-full justify-end items-center mt-10 space-x-5">
        <input type="hidden" name="submitLogin" value="1">

        <a href="{$urls.pages.register}" data-link-action="display-register-form">
          {l s='No account? Create one here' d='Shop.Theme.Customeraccount'}
        </a>
        {block name='form_buttons'}
          <button id="submit-login" class="primary-red" data-link-action="sign-in" type="submit" class="form-control-submit">
            {l s='Sign in' d='Shop.Theme.Actions'}
          </button>
        {/block}
      </footer>
    {/block}

  </form>
{/block}
