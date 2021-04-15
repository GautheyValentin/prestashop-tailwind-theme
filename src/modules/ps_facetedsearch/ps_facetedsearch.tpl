{if isset($listing.rendered_facets)}
  <div id="search_filters_wrapper" class="hidden">
    <div id="search_filter_controls" class="hidden-md-up">
      <span id="_mobile_search_filters_clear_all"></span>
      <button class="btn btn-secondary ok">
        <i class="material-icons rtl-no-flip">&#xE876;</i>
        {l s='OK' d='Shop.Theme.Actions'}
      </button>
    </div>
    {$listing.rendered_facets nofilter}
  </div>
{/if}