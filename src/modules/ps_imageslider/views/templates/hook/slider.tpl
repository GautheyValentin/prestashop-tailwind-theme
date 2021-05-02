{if $homeslider.slides}
  <div x-data='{literal}{items: {/literal}{$homeslider.slides|count}{literal}, active: 0}{/literal}' id="carousel"
    class="relative" data-interval="{$homeslider.speed}" data-wrap="{(string)$homeslider.wrap}"
    data-pause="{$homeslider.pause}" data-touch="true">
    <ul x-ref="slider"
      x-on:scroll.bounce="active = Math.round($event.target.scrollLeft / ($event.target.scrollWidth / {$homeslider.slides|count}))"
      class="slider overflow-hidden relative flex-no-wrap flex transition-all">
      {foreach from=$homeslider.slides item=slide name='homeslider' key=key}
        <li class="flex flex-shrink-0 w-full relative" :key="{$key}">
          <a href="{$slide.url}" target="_blank" rel="noopener noreferrer">
            <figure>
              <img class="object-cover min-h-200 w-full rounded" src="{$slide.image_url}" alt="{$slide.legend|escape}"
                loading="lazy">
              {if $slide.title || $slide.description}
                <figcaption class="absolute bottom-0 p-5 w-3/4 lg:w-1/4">
                  <h2 class="uppercase text-2xl font-bold text-white mb-3">{$slide.title}</h2>
                  <div class="text-sm text-white">{$slide.description nofilter}</div>
                </figcaption>
              {/if}
            </figure>
          </a>
        </li>
      {/foreach}
    </ul>
    <div class="block top-0 left-0 h-full w-full" aria-label="{l s='Carousel buttons' d='Shop.Theme.Global'}">
      <span class="absolute top-1/2 transform -translate-y-1/2 left-2 cursor-pointer" aria-hidden="true"
        aria-label="{l s='Previous' d='Shop.Theme.Global'}"
        x-on:click="$refs.slider.scrollLeft = $refs.slider.scrollLeft - ($refs.slider.scrollWidth / {$homeslider.slides|count})"
        :class="{literal}{'hidden': active === 0}{/literal}">
        <i class="fas fa-angle-left fa-2x text-white"></i>
      </span>
      <span class="absolute top-1/2 transform  -translate-y-1/2 right-2 cursor-pointer" aria-hidden="true"
        aria-label="{l s='Next' d='Shop.Theme.Global'}"
        x-on:click="$refs.slider.scrollLeft = $refs.slider.scrollLeft + ($refs.slider.scrollWidth / {$homeslider.slides|count})"
        :class="{literal}{'hidden': active === {/literal}{$homeslider.slides|count - 1}{literal} }{/literal}">
          <i class="fas fa-angle-right fa-2x text-white"></i>
      </span>
    </div>
    <ol class="absolute bottom-5 flex space-x-2" style="left: calc(50% - ({$homeslider.slides|count} * 14px) / 2);">
      {foreach from=$homeslider.slides item=slide name='homeslider' key=key}
        {capture assign=active}active === {$key}{/capture}

        <li class="slider-rounder rounded-full w-4 h-4 border border-solid border-red-550 cursor-pointer transition-all"
          x-on:click="$refs.slider.scrollLeft = ($refs.slider.scrollWidth / {$homeslider.slides|count}) * {$key}"
          :class="{literal}{'bg-red-550': active === {/literal}{$key}{literal}}{/literal}"></li>
      {/foreach}
    </ol>
  </div>
{/if}