{hook h='displaySlider'}
<h1 class="font-medium text-lg">
  {if isset($prestablog_title_h1)}
    {$prestablog_title_h1|escape:'htmlall':'UTF-8'}<br>
  {/if}

  {if $prestablog_config.prestablog_catnews_shownbnews==1}

    <span class="font-light text-sm ">{$NbNews|intval}
      {if $NbNews <> 1}
        {l s='articles' mod='prestablog'}
      {else}
        {l s='article' mod='prestablog'}
      {/if}
      {if isset($prestablog_categorie_obj)}
        {l s='in the category' mod='prestablog'}&nbsp;{$prestablog_categorie_obj->title|escape:'htmlall':'UTF-8'}
      {/if}
    </span>
  {/if}
</h1>
{if sizeof($news)}
  {include file="$prestablog_pagination"}
  {if $prestablog_config.prestablog_article_page==1}
    <ul class="grid grid-cols-1 gap-4 mt-5">
  {else if $prestablog_config.prestablog_article_page==2}
    <ul class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-5">
  {else if $prestablog_config.prestablog_article_page==3}
    <ul class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 mt-5">
  {/if}
    {foreach from=$news item=news_item name=NewsName}
      <li class="card">
          {if isset($news_item.image_presente)}
            <div class="mb-5">
              <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}"
                title="{$news_item.title|escape:'htmlall':'UTF-8'}">
                <img
                  src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}slide_{$news_item.id_prestablog_news|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}"
                  alt="{$news_item.title|escape:'htmlall':'UTF-8'}" width="508" height="200" class="rounded"/>
              </a>
            </div>
          {/if}
          <div class="">
            <h2 class="font-medium">
              <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}"
                title="{$news_item.title|escape:'htmlall':'UTF-8'}">{$news_item.title|escape:'htmlall':'UTF-8'}</a>
            </h2>
            <span class="font-light text-sm mt-2">{l s='Published :' mod='prestablog'}
                {dateFormat date=$news_item.date full=0}
                {if $prestablog_config.prestablog_author_actif}
                  {if $prestablog_config.prestablog_author_cate_actif}
                    
                    {foreach from=$news_item.authors item=author key=key name=current}
                      {if $key=="firstname"}
                        {$firstname = $author}
                      {/if}
                      {if $key=="pseudo"}
                        {$pseudo = $author}
                      {/if}

                    {/foreach}
                    {if $firstname}
                      -
                      {l s='By' mod='prestablog'}
                    {/if}
                    <a
                      href="{PrestaBlogUrl au=$news_item.author_id titre={$firstname|escape:'htmlall':'UTF-8'}}">{$firstname|escape:'htmlall':'UTF-8'}</a>


                  {/if}
                {/if}

                {if sizeof($news_item.categories)} | {l s='Categories :' mod='prestablog'}
                  {foreach from=$news_item.categories item=categorie key=key name=current}
                    <a href="{PrestaBlogUrl c=$key titre=$categorie.link_rewrite}"
                      class="">{$categorie.title|escape:'htmlall':'UTF-8'}</a>
                    {if !$smarty.foreach.current.last},{/if}
                  {/foreach}
                {/if}</span>


              {if $prestablog_config.prestablog_rating_actif}
                <div class="">
                  {section name="i" start=0 loop=5 step=1}
                    {if $smarty.section.i.index lt $news_item.average_rating}
                      <div class="material-icons checked">star</div>
                    {elseif $news_item.average_rating == 5}
                      <div class="material-icons checked">star</div>
                    {else}
                      <div class="material-icons">star</div>
                    {/if}
                  {/section}
                </div>
              {/if}

           
            {if $news_item.paragraph_crop!=''}
              <p class="mt-5">
                {$news_item.paragraph_crop|escape:'htmlall':'UTF-8'}
              </p>
            {/if}
          </div>

          <div class="text-center mt-5">
            <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}"
              class="primary-red"><i class="fas fa-search"></i> {l s='Read more' mod='prestablog'}</a>
            {if $prestablog_config.prestablog_comment_actif==1}
              <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}#comment"
                class="primary-red"><i class="material-icons">comment</i> {$news_item.count_comments|intval}</a>
            {/if}
            {if $prestablog_config.prestablog_read_actif}
              <span><i class="material-icons">remove_red_eye</i> {$news_item.read}</span>
            {/if}
            {if $prestablog_config.prestablog_commentfb_actif==1}
              <a href="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}#comment"
                id="showcomments{$news_item.id_prestablog_news|intval}" class="comments"
                data-commentsurl="{PrestaBlogUrl id=$news_item.id_prestablog_news seo=$news_item.link_rewrite titre=$news_item.title}"
                data-commentsidnews="{$news_item.id_prestablog_news|intval}"><i class="material-icons">comment</i>
                {$news_item.count_comments|intval}
              </a>
            {/if}
          </div>
      </li>
    {/foreach}
  </ul>
      {include file="$prestablog_pagination"}
    {else}
      <p class="warning">{l s='Empty' mod='prestablog'}</p>
    {/if}