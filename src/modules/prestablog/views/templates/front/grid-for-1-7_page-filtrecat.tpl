{*
 * 2008 - 2020 (c) Prestablog
 *
 * MODULE PrestaBlog
 *
 * @author    Prestablog
 * @copyright Copyright (c) permanent, Prestablog
 * @license   Commercial
 *}
<!-- Module Presta Blog -->
<div id="categoriesFiltrage">
	{PrestaBlogContent return=$FiltrageCat}
	<form action="{PrestaBlogUrl}" method="post">
		<div id="prestablog_input_filtre_cat">
			{foreach from=$prestablog_search_array_cat item=cat_filtre}
				<input type="hidden" name="prestablog_search_array_cat[]" value="{$cat_filtre|escape:'htmlall':'UTF-8'}" />
			{/foreach}
		</div>
		<input class="search_query form-control ac_input" type="text" value="{$prestablog_search_query|escape:'htmlall':'UTF-8'}" placeholder="{l s='Search again on blog' mod='prestablog'}" name="prestablog_search" autocomplete="off">
		<button class="btn btn-default button-search" type="submit">
			<span>{l s='Search again on blog' mod='prestablog'}</span>
		</button>
		<div class="clear"></div>
	</form>
</div>
<!-- Module Presta Blog -->
