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
<span id="comment"></span>
<div id="prestablog-fb-comments"
		data-commentsiso="{$fb_comments_iso|escape:'html':'UTF-8'}"
		data-commentsapi="{if $fb_comments_apiId}&appId={$fb_comments_apiId|escape:'html':'UTF-8'}{/if}" >
	<div id="fb-root"></div>
	<div class="fb-comments"
		data-href="{$fb_comments_url|escape:'html':'UTF-8'}"
		data-numposts="{$fb_comments_nombre|intval}"
		data-width="100%"
		data-mobile="false"></div>
</div>
<!-- /Module Presta Blog -->
