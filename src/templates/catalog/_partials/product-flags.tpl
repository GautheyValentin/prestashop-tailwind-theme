
{block name='product_flags'}
    <ul class="absolute top-2 -left-3">
        {foreach from=$product.flags item=flag}
            <li class="bg-red-550 text-white rounded px-2 py-1 {$flag.type}">{$flag.label}</li>
        {/foreach}
    </ul>
{/block}
