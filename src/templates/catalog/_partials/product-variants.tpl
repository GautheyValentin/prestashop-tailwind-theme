<div>
  {foreach from=$groups key=id_attribute_group item=group}
    {if !empty($group.attributes)}
    <div>
      <span class="text-sm">{$group.name}{l s=': ' d='Shop.Theme.Catalog'}
          {* {foreach from=$group.attributes key=id_attribute item=group_attribute}
            {if $group_attribute.selected}{$group_attribute.name}{/if}
          {/foreach} *}
      </span>
      <div>
        {if $group.group_type == 'select'}
          <select
            class="classic-input"
            id="group_{$id_attribute_group}"
            data-product-attribute="{$id_attribute_group}"
            name="group[{$id_attribute_group}]">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
            {/foreach}
          </select>
        {elseif $group.group_type == 'color'}
          <ul id="group_{$id_attribute_group}">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li>
                <label aria-label="{$group_attribute.name}">
                  <input type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span
                    {if $group_attribute.texture}
                      style="background-image: url({$group_attribute.texture})"
                    {elseif $group_attribute.html_color_code}
                     style="background-color: {$group_attribute.html_color_code}" 
                    {/if}
                  ><span>{$group_attribute.name}</span></span>
                </label>
              </li>
            {/foreach}
          </ul>
        {elseif $group.group_type == 'radio'}
          <ul id="group_{$id_attribute_group}">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <li>
                <label>
                  <input type="radio" data-product-attribute="{$id_attribute_group}" name="group[{$id_attribute_group}]" value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} checked="checked"{/if}>
                  <span>{$group_attribute.name}</span>
                </label>
              </li>
            {/foreach}
          </ul>
        {/if}
      </div>
    </div>
    {/if}
  {/foreach}
</div>
