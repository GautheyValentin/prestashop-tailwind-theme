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

<div class="prestablog_slide">
   <div class="sliders_prestablog">
   {foreach from=$ListeBlogNews item=slide name=slides}
     {if $slide.url_associate != ""}
      <a href="{$slide.url_associate}">
         <img src="{$prestablog_theme_slide_upimg|escape:'html':'UTF-8'}{$slide.id_slide|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" class="visu" alt="{$slide.title|escape:'htmlall':'UTF-8'}" title="{$slide.title|escape:'htmlall':'UTF-8'}" />
      </a>
      {else}
      <div>
         <img src="{$prestablog_theme_slide_upimg|escape:'html':'UTF-8'}{$slide.id_slide|intval}.jpg?{$md5pic|escape:'htmlall':'UTF-8'}" class="visu" alt="{$slide.title|escape:'htmlall':'UTF-8'}" title="{$slide.title|escape:'htmlall':'UTF-8'}" />
       </div>
      {/if}
   {/foreach}
    </div>
</div>
<div class="clearfix"></div>
<!-- /Module Presta Blog -->
