{if isset($news)}
  <article id="prestablogfront" itemscope itemtype="https://schema.org/BlogPosting">
    {if isset($news_Image) && $prestablog_config.prestablog_view_news_img}<img
        src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}thumb_{$news->id|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}"
      class="news" alt="{$news->title|escape:'htmlall':'UTF-8'}" itemprop="image">{/if}
    <h1 id="prestablog_article" data-referenceid="{$news->id|intval}" itemprop="headline" class="font-medium text-xl">
      {$news->title|escape:'htmlall':'UTF-8'}</h1>

    <div class="mt-2 font-light">
      <time itemprop="datePublished" class="date"><span>{l s='Published :' mod='prestablog'}
      {dateFormat date=$news->date|date_format:'%Y-%m-%d' full=0}</span></time>

      <span>

        {if $prestablog_config.prestablog_author_news_actif}
          {if $author_firstname}
          {l s='By :' mod='prestablog'} {/if}
          <a
          href="{PrestaBlogUrl au=$id_author titre={$author_firstname|escape:'htmlall':'UTF-8'}}">{$author_firstname|escape:'htmlall':'UTF-8'}</a>{/if}
      {/if}
      {if sizeof($news->categories)}
        -
        {l s='Categories :' mod='prestablog'}
        {foreach from=$news->categories item=categorie key=key name=current}<a
            href="{PrestaBlogUrl c=$key titre=$categorie.link_rewrite}">{$categorie.title|escape:'htmlall':'UTF-8'}</a>
          {if $prestablog_config.prestablog_uniqnews_rss}<sup><a target="_blank" href="{PrestaBlogUrl rss=$key}"><img
                  src="{$prestablog_theme_dir|escape:'html':'UTF-8'}/img/rss.png" alt="Rss feed"
                align="absmiddle" /></a></sup>{/if}
          {if !$smarty.foreach.current.last},{/if}
        {/foreach}

      </span>

      {if $prestablog_config.prestablog_rating_actif}
        <div class="star_content" itemprop="starRating" itemscope itemtype="http://schema.org/Rating">
          <meta itemprop="ratingValue" content="{$news->average_rating}">
          {section name="i" start=0 loop=5 step=1}
            {if $smarty.section.i.index lt $news->average_rating}
              <div class="material-icons checked">star</div>
            {elseif $news->average_rating == 5}
              <div class="material-icons checked">star</div>
            {else}
              <div class="material-icons">star</div>
            {/if}
          {/section}
        </div>
      {/if}
    </div>
  {/if}