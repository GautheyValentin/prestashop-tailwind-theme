
{block name='step'}
  <section  id    = "{$identifier}"
            class = "card"
  >
    <h1 class="text-xl uppercase font-medium">
      <i class="fas fa-check"></i>
      <span>{$position}</span>
      {$title}

      <span class="text-sm float-right">
        <i class="fas fa-pen"></i> {l s='Edit' d='Shop.Theme.Actions'}
      </span>
    </h1>

    <div class="content">
      {block name='step_content'}DUMMY STEP CONTENT{/block}
    </div>
  </section>
{/block}
