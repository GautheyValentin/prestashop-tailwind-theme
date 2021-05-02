{*
 * 2008 - 2020 (c) Prestablog
 *
 * MODULE PrestaBlog
 *
 * @author    Prestablog
 * @copyright Copyright (c) permanent, Prestablog
 * @license   Commercial
 *}

<!-- Module Presta Blog START PAGE -->
{extends file=$layout_blog}

{block name='head_seo'}
  <title>{$meta_title|escape:'htmlall':'UTF-8'}</title>
  <meta name="description" content="{$meta_description|escape:'htmlall':'UTF-8'}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords|escape:'htmlall':'UTF-8'}{/block}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots|escape:'htmlall':'UTF-8'}">
  {/if}
    {block name='head_hreflang'}
      {foreach from=$urls.alternative_langs item=pageUrl key=code}
            <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
      {/foreach}
  {/block}
  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical|escape:'htmlall':'UTF-8'}">
  {/if}
  {if isset($Pagination.NombreTotalPages) && $Pagination.NombreTotalPages > 1}
    {foreach from=$Pagination.PremieresPages key=key_page item=value_page}
      {if ($Pagination.PageCourante == $key_page) || (!$Pagination.PageCourante && $key_page == 1)}

      {else}
        {if $Pagination.PageCourante == ($key_page-1)}
          <link rel="next" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">
          {else if $Pagination.PageCourante == $key_page}
          <link rel="prev" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}" >
        {else if $Pagination.PageCourante == ($key_page+1)}
          <link rel="prev" href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">

        {/if}
      {/if}
    {/foreach}
      {/if}


{/block}

	  {block name='content'}

		{if isset($tpl_filtre_cat) && $tpl_filtre_cat}{PrestaBlogContent return=$tpl_filtre_cat}{/if}
		{if isset($tpl_menu_cat) && $tpl_menu_cat}{PrestaBlogContent return=$tpl_menu_cat}{/if}

		{if isset($tpl_title) && $tpl_title}{PrestaBlogContent return=$tpl_title}{/if}
		{if isset($tpl_unique) && $tpl_unique}{PrestaBlogContent return=$tpl_unique}{/if}
		{if isset($tpl_extra) && $tpl_extra}{PrestaBlogContent return=$tpl_extra}{/if}
		{if isset($tpl_comment) && $tpl_comment}{PrestaBlogContent return=$tpl_comment}{/if}
		{if isset($tpl_comment_fb) && $tpl_comment_fb}{PrestaBlogContent return=$tpl_comment_fb}{/if}

		{if isset($tpl_slide) && $tpl_slide}{PrestaBlogContent return=$tpl_slide}{/if}
    {if isset($tpl_cat) && $tpl_cat}{PrestaBlogContent return=$tpl_cat}{/if}
		{if isset($tpl_aut) && $tpl_aut}{PrestaBlogContent return=$tpl_aut}{/if}
		{if isset($tpl_all) && $tpl_all}{PrestaBlogContent return=$tpl_all}{/if}

    {/block}



<!-- /Module Presta Blog END PAGE -->
