{if isset($Pagination.NombreTotalPages) && $Pagination.NombreTotalPages > 1}
	<div class="prestablog_pagination">
		{if $Pagination.PageCourante > 1}
				{if $prestablog_categorie_link_rewrite}
		<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartPrecedent p=$Pagination.PagePrecedente c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">&lt;&lt;</a>
				{else}
			<a href="{PrestaBlogUrl}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">&lt;&lt;</a>
{/if}
		{else}
			<span class="disabled">&lt;&lt;</span>
		{/if}

		{foreach from=$Pagination.PremieresPages key=key_page item=value_page}
			{if ($Pagination.PageCourante == $key_page) || (!$Pagination.PageCourante && $key_page == 1)}
				<span class="current">{$key_page|intval}</span>
			{else}
				{if $key_page == 1}
				{if $prestablog_categorie_link_rewrite}
					<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$key_page|intval}</a>
				{else}
				<a href="{PrestaBlogUrl}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">{$key_page|intval}</a>{/if}
				{else}
					<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}"
					>{$key_page|intval}</a>
				{/if}
			{/if}
		{/foreach}
		{if isset($Pagination.Pages) && $Pagination.Pages}
			<span class="more">...</span>
			{foreach from=$Pagination.Pages key=key_page item=value_page}
				{if !in_array($value_page, $Pagination.PremieresPages)}
					{if ($Pagination.PageCourante == $key_page) || (!$Pagination.PageCourante && $key_page == 1)}
						<span class="current">{$key_page|intval}</span>
					{else}
						<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$value_page p=$key_page c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}"
						>{$key_page|intval}</a>
					{/if}
				{/if}
			{/foreach}
		{/if}
		{if $Pagination.PageCourante < $Pagination.NombreTotalPages}
			<a href="{PrestaBlogUrl categorie=$prestablog_categorie_link_rewrite start=$Pagination.StartSuivant p=$Pagination.PageSuivante c=$prestablog_categorie m=$prestablog_month y=$prestablog_year}{$prestablog_search_query|escape:'htmlall':'UTF-8'}">&gt;&gt;</a>
		{else}
			<span class="disabled">&gt;&gt;</span>
		{/if}
	</div>
{/if}
