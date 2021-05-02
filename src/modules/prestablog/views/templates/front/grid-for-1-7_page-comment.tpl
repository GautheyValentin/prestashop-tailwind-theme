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
<div id="prestablog-comments">
<h3>{l s='Add a comment' mod='prestablog'}</h3>
{if ($prestablog_config.prestablog_comment_only_login && $isLogged) || !$prestablog_config.prestablog_comment_only_login}
	{if !$isSubmit}
		<form action="{$LinkReal|escape:'html':'UTF-8'}&id={$news->id|intval}" method="post" class="std">
			<fieldset id="prestablog-comment">
				{if sizeof($errors)}
				<p id="errors">{foreach from=$errors item=Ierror name=errors}{$Ierror|escape:'htmlall':'UTF-8'}<br />{/foreach}</p>
				{/if}
				<p class="text">
					<input type="text" class="text{if sizeof($errors) && array_key_exists('name', $errors)} errors{/if}" name="name" id="name" value="{$content_form.name|escape:'htmlall':'UTF-8'}" placeholder="{l s='Name' mod='prestablog'}:" />
				</p>
				<p class="textarea">
					<textarea name="comment" id="comment" cols="26" rows="2" {if sizeof($errors) && array_key_exists('comment', $errors)}class="errors"{/if} placeholder="{l s='Comment' mod='prestablog'}:">{$content_form.comment|escape:'htmlall':'UTF-8'}</textarea>
				</p>
				{if isset($AntiSpam)}
					<p class="text">
						<label for="{$AntiSpam.checksum|escape:'htmlall':'UTF-8'}">{l s='Antispam protection' mod='prestablog'} : <strong>{$AntiSpam.question|escape:'htmlall':'UTF-8'}</strong></label>
						<input type="text" class="text{if sizeof($errors) && array_key_exists($AntiSpam.checksum, $errors)} errors{/if}" name="{$AntiSpam.checksum|escape:'htmlall':'UTF-8'}" id="{$AntiSpam.checksum|escape:'htmlall':'UTF-8'}" value="{$content_form.antispam_checksum|escape:'htmlall':'UTF-8'}" />
					</p>
				{/if}
				 {if $prestablog_config.prestablog_captcha_actif==1}
				 <div class="g-recaptcha" data-sitekey="{$prestablog_config.prestablog_captcha_public_key}"></div>
				{/if}
				<p class="submit">
					<input type="submit" class="btn-primary" name="submitComment" id="submitComment" value="{l s='Submit comment' mod='prestablog'}" />
				</p>
			</fieldset>
		</form>
	{else}
		<form id="submitOk" class="std">
			<fieldset>
				<h3>{l s='Your comment has been successfully sent' mod='prestablog'}</h3>
				{if $prestablog_config.prestablog_comment_auto_actif}
				<p>{l s='This comment is automatically published.' mod='prestablog'}</p>
				{else}
				<p>{l s='Before published, your comment must be approve by an administrator.' mod='prestablog'}</p>
				{/if}
			</fieldset>
		</form>
	{/if}
{else}
	<form class="std">
		<fieldset id="prestablog-comment-register">
			<p style="text-align:center;">
				<a href="{$link->getPageLink('authentication', true)|escape:'html':'UTF-8'}">{l s='You must be register' mod='prestablog'}<br />{l s='Clic here to registered' mod='prestablog'}</a>
			</p>
		</fieldset>
	</form>
{/if}
{if sizeof($comments)}

		{count($comments)|intval} {l s='comments' mod='prestablog'}
		{if $prestablog_config.prestablog_comment_subscription}
			<div id="abo">
			{if $Is_Subscribe}
				<a href="{$LinkReal|escape:'html':'UTF-8'}&d={$news->id|intval}">{l s='Stop my subscription to comments' mod='prestablog'}</a>
			{else}
				<a href="{$LinkReal|escape:'html':'UTF-8'}&a={$news->id|intval}">{l s='Subscribe to comments' mod='prestablog'}</a>
			{/if}
			</div>
{/if}

<div id="comments">
{foreach from=$comments item=comment name=Comment}
	<div class="comment">
		<p><strong>{$comment.name|escape:'htmlall':'UTF-8'} - {dateFormat date=$comment.date full=1}</strong></p>
		<hr />
		<p>{$comment.comment|escape:'htmlall':'UTF-8'}</p>
	</div>
{/foreach}
</div>

{/if}
</div>
<!-- /Module Presta Blog -->
