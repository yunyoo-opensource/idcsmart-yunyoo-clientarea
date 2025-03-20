{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg" url=""}
{/if}


<form method="post" class="needs-validation" novalidate>
  <div class="card">
    <div class="card-body px-5 mx-auto w-75"> 
      <h4 class="card-title mb-3">{$Lang.contact_information}</h4>
      <div class="row">
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.email_address}</label>
            <input type="text" class="form-control" value="{$Userinfo.user.email}" placeholder="" readonly>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.phone_number}</label>
            <input type="text" class="form-control" value="{$Userinfo.user.phonenumber}" placeholder="" readonly>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.qq_number}</label>
            <input type="text" data-parsley-type="number" class="form-control" name="qq" value="{$Userinfo.user.qq}"
              placeholder="{$Lang.please_enter_qq_number}" oninput="value=value.replace(/[^\d]/g,'')">
          </div>
        </div>
      </div>
    </div>

    <div class="card-body px-5 mx-auto w-75">
      <h4 class="card-title mb-3">{$Lang.details}</h4>
      <div class="row">
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.real_name}</label>
            <input type="text" class="form-control" name="username" value="{$Userinfo.user.username}" required />
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.corporate_name}</label>
            <input type="text" class="form-control" name="companyname" value="{$Userinfo.user.companyname}"
              placeholder="{$Lang.please_enter_company_name}">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.country}</label>
            <select class="form-control" name="country">
              {foreach $Details.areas.country as $country}
              <option {if $country.name==$Userinfo.user.country}selected{/if} value="{$country.name}">{$country.name}</option>
              {/foreach}
            </select>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.province}</label>
            <input type="text" class="form-control" name="province" value="{$Userinfo.user.province}">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.city}</label>
            <input type="text" class="form-control" name="city" value="{$Userinfo.user.city}">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.region}</label>
            <input type="text" class="form-control" name="region" value="{$Userinfo.user.region}">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.address}</label>
            <input type="text" class="form-control" name="address1" value="{$Userinfo.user.address1}">
          </div>
        </div>
      </div>
    </div>

    <div class="card-body px-5 mx-auto w-75">
      <h4 class="card-title mb-3">{$Lang.other_information}</h4>
      <div class="row">
        <div class="col-sm-12 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.default_payment}</label>
            {if $Userinfo.gateways}
            <select class="form-control" name="defaultgateway">
              {foreach $Userinfo.gateways as $gateway}
              <option value="{$gateway.name}" {if $Userinfo.user.defaultgateway==$gateway.name}selected{/if}>
                {$gateway.title}</option>
              {/foreach}
            </select>
            {/if}
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.user_group}</label>
            <input type="text" class="form-control" value="{$Userinfo.client_group.group_name|default=" 默认分组"}"
              readonly="">
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.marketing_information}</label>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="marketing_emails_opt_in"
                name="marketing_emails_opt_in" value="1" {if $Userinfo.user.marketing_emails_opt_in==1}
                checked="checked" {/if}>
              <label class="custom-control-label" for="marketing_emails_opt_in">{$Lang.accept_marketing_information}</label>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <div class="form-group">
            <label for="formrow-firstname-input">{$Lang.send_close_title}</label>
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="send_close_in"
                     name="send_close" value="1" {if $Userinfo.user.send_close==1}
                checked="checked" {/if}>
              <label class="custom-control-label" for="send_close_in">{$Lang.send_close}</label>
            </div>
          </div>
        </div>
        {foreach $Userinfo.customs as $custom}
        <div class="col-sm-6 col-12">
          <div class="form-group" data-order="{$custom.sortorder}">
            <label for="formrow-firstname-input">{$custom.fieldname}</label>
            {if $custom.fieldtype == 'dropdown'}
            <select class="form-control" name="custom[{$custom.id}]">
              {foreach :explode(",",$custom.fieldoptions) as $field}
              <option {if $field==$custom.value}selected{/if}>{$field}</option>
              {/foreach}
            </select>
            {elseif $custom.fieldtype == 'text'}
            <input type="text" class="form-control" name="custom[{$custom.id}]" value="{$custom.value}"
              placeholder="{$custom.description}" {if $custom.required}required{/if} />
            {elseif $custom.fieldtype == 'password'}
            <input type="password" class="form-control" name="custom[{$custom.id}]" value="{$custom.value}"
              placeholder="{$custom.description}" {if $custom.required}required{/if} />
            {elseif $custom.fieldtype == 'link'}
            <input type="text" class="form-control" name="custom[{$custom.id}]" value="{$custom.value}"
              placeholder="{$custom.description}" {if $custom.required}required{/if} />
            {elseif $custom.fieldtype == 'tickbox'}
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="custom[{$custom.id}]" name="custom[{$custom.id}]">
              <label class="custom-control-label" for="custom[{$custom.id}]">{$custom.description}</label>
            </div>
            {elseif $custom.fieldtype == 'textarea'}
            <textarea class="form-control" name="custom[{$custom.id}]" rows="5"
              placeholder="{$custom.description}">{$custom.value}</textarea>
            {/if}
          </div>
        </div>
        {/foreach}
        <div class="col-sm-12">
          <div class="form-group mb-0">
            <button type="submit" class="btn btn-primary w-xl submitBtn">{$Lang.submit}</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>


