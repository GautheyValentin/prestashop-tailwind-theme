
{block name='step'}
  <section  id    = "{$identifier}"
            class = "{[
              'card'            => true,
              'checkout-step'   => true,
              '-current'        => $step_is_current,
              '-reachable'      => $step_is_reachable,
              '-complete'       => $step_is_complete,
              'js-current-step' => $step_is_current
          ]|classnames}"
  >
    <h1 class="text-xl uppercase font-medium step-title">
      <i class="fas fa-check"></i>
      <span>{$position}</span>
      {$title}

      <span class="text-sm float-right step-edit">
        <i class="fas fa-pen"></i> {l s='Edit' d='Shop.Theme.Actions'}
      </span>
    </h1>

    <div class="content">
      {block name='step_content'}DUMMY STEP CONTENT{/block}
    </div>
  </section>
{/block}
