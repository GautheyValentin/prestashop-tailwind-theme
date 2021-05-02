<div id="prestablogauthor">
  <img src="{$prestablog_author_upimg|escape:'html':'UTF-8'}{$author_id|intval}.jpg" class="author"
    alt="{$firstname|escape:'htmlall':'UTF-8'}" />

  <h1 data-referenceid="{$author_id|intval}" class="text-xl font-medium">
    {$pseudo|escape:'htmlall':'UTF-8'}
  </h1>
  <div id="prestablogfont">
    <p itemprop="text">{PrestaBlogContent return=$biography}</p>
  </div>

</div>

<h2>{l s='From the same author' mod='prestablog'}</h2>
{if (sizeof($articles_author))}
<ul class="grid grid-cols-2 gap-4">
    {foreach from=$articles_author item=article key=key name=current}
    {if $article.title}
        <li class="card">
        <div class="block_cont">
            {if $article.image_presente}
            <div class="mb-5">
                <a href="{$article.link|escape:'htmlall':'UTF-8'}" title="{$article.title|escape:'htmlall':'UTF-8'}">
                <img
                    src="{$prestablog_theme_upimg|escape:'html':'UTF-8'}slide_{$key|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}"
                    alt="{$article.title|escape:'htmlall':'UTF-8'}" title="{$article.title|escape:'htmlall':'UTF-8'}"
                    width="508" height="200" class="rounded" />
                </a>
            </div>
            {/if}

            <h3 class="font-medium text-lg">
            {if isset($article.link)}<a href="{$article.link|escape:'htmlall':'UTF-8'}"
                title="{$article.title|escape:'htmlall':'UTF-8'}">{/if}{$article.title|escape:'htmlall':'UTF-8'}{if isset($article.link)}</a>{/if}
            </h3>
            <span class="font-light">
                {l s='Published :' mod='prestablog'}
                {dateFormat date=$article.date full=0}
            </span>
            {if isset($article.link)}
                <div class="text-center">
                <a href="{$article.link|escape:'htmlall':'UTF-8'}" class="primary-red">
                    <i class="fas fa-search"></i>
                    {l s='Read more' mod='prestablog'}</a>
                </div>
            {/if}
            </div>
        </li>
        {/if}
    {/foreach}
    </ul>
{/if}