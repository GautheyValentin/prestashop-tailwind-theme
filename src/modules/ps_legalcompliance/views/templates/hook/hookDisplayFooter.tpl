

<div class="col-md-2 links wrapper">
  <h3 class="hidden-sm-down">{l s='Information' d='Modules.Legalcompliance.Shop'}</h3>
  <div class="title clearfix hidden-md-up" data-target="#footer_eu_about_us_list" data-toggle="collapse">
    <span class="h3">{l s='Information' d='Modules.Legalcompliance.Shop'}</span>
    <span class="float-xs-right">
      <span class="navbar-toggler collapse-icons">
        <i class="material-icons add">&#xE313;</i>
        <i class="material-icons remove">&#xE316;</i>
      </span>
    </span>
  </div>
  <ul class="collapse" id="footer_eu_about_us_list">
    {foreach from=$cms_links item=cms_link}
      <li>
        <a href="{$cms_link.link}" class="cms-page-link" title="{$cms_link.description|default:''}" id="{$cms_link.id}"> {$cms_link.title} </a>
      </li>
    {/foreach}
  </ul>
</div>
