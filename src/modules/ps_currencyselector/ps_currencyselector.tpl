

<div id="_desktop_currency_selector">
  <div class="currency-selector dropdown js-dropdown">
    <span id="currency-selector-label">{l s='Currency:' d='Shop.Theme.Global'}</span>
    <button data-target="#" data-toggle="dropdown" class="hidden-sm-down btn-unstyle" aria-haspopup="true" aria-expanded="false" aria-label="{l s='Currency dropdown' d='Shop.Theme.Global'}">
      <span class="expand-more _gray-darker">{$current_currency.iso_code}{if $current_currency.iso_code !== $current_currency.sign} {$current_currency.sign}{/if}</span>
      <i class="material-icons expand-more">&#xE5C5;</i>
    </button>
    <ul class="dropdown-menu hidden-sm-down" aria-labelledby="currency-selector-label">
      {foreach from=$currencies item=currency}
        <li {if $currency.current} class="current" {/if}>
          <a title="{$currency.name}" rel="nofollow" href="{$currency.url}" class="dropdown-item">{$currency.iso_code}{if $currency.sign !== $currency.iso_code} {$currency.sign}{/if}</a>
        </li>
      {/foreach}
    </ul>
    <select class="link hidden-md-up" aria-labelledby="currency-selector-label">
      {foreach from=$currencies item=currency}
        <option value="{$currency.url}"{if $currency.current} selected="selected"{/if}>{$currency.iso_code}{if $currency.sign !== $currency.iso_code} {$currency.sign}{/if}</option>
      {/foreach}
    </select>
  </div>
</div>
