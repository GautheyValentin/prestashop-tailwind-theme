{if isset($news)}
  <div id="prestablogfont" itemprop="articleBody" class="card content-style mt-5">
    {PrestaBlogContent return=$news->content}
  </div>
{/if}
