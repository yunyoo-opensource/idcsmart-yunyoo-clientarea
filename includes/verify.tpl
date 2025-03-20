{if $Verify.is_captcha==1}
  {if [positon]=='top'}
    <!--  20241015 新增模板钩子 -->
    {php}$hooks=hook('template_custom_clientarea_captcha_html',['id'=>'[type]']);{/php}
    {if !empty($hooks[0])}
      {foreach $hooks as $item}
        {$item}
      {/foreach}
    {else\}
      <div class="form-group [type]">
        <label >图形验证码</label>
        <div class="input-group">
          <input  {if [id]=='[id]'}id="captcha_[type][id]"{else}id="captcha_[type]"{/if} type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
          <div class="input-group-append">
            <img  {if [id]=='[id]'}id="[type][id]"{else}id="[type]"{/if}   width="120px" class="border pointer" alt="验证码" onClick="getVerify('[type]')">
          </div>
        </div>
      </div>
    {/if}

  {else}

    <div class="form-group row">
      <label class="col-sm-3 col-form-label text-right">图形验证码</label>
      <div class="col-sm-8">
        <div class="input-group">
          <input {if [id]=='[id]'}id="captcha_[type][id]"{else}id="captcha_[type]"{/if} type="text" name="captcha" class="form-control "  placeholder="请输入验证码" />
          <div class="input-group-append">
            <img {if [id]=='[id]'}id="[type][id]"{else} id="[type]"{/if}  width="120px" class="border pointer" alt="验证码" onClick="getVerify('[type]','[id]')">
          </div>
        </div>
      </div>
    </div>
  {/if}



  <script>
    getVerify('[type]','[id]')

  </script>
{/if}