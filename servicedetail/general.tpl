
{include file="includes/modal"}
{include file="includes/pop"}
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-12">
      <div class="card">
        <div class="card-body">
          <div class="row">
            <div class="col-lg-5 mb-1">
              <div class="p-5 bg-primary rounded text-white d-flex flex-column
                                                justify-content-center align-items-center">
                <h1 class="text-white">{$Detail.host_data.productname}</h1>
                <p class="mb-4">{$Detail.host_data.domain}</p>
                <p>
                  <!-- 备注 -->
                  <span class="text-white-50">{$Lang.remarks_infors}： {if
                    $Detail.host_data.remark}{$Detail.host_data.remark}{else}-{/if}</span>
                  <span class="bx bx-edit-alt pointer ml-2" data-toggle="modal" data-target="#modifyRemarkModal"></span>
                </p>
                <span class="badge badge-pill py-1 status-{$Detail.host_data.domainstatus|strtolower}
                  mb-3">
                  {$Detail.host_data.domainstatus_desc}
                </span>
              </div>
            </div>
            <div class="col-lg-7 mb-1">
              <div class="d-flex justify-content-between">
                <div class="table-responsive" style="min-height: auto;">
                  <table class="table mb-0 table-bordered">
                    <tbody>
                      <tr>
                        <th scope="row">{$Lang.price}</th>
                        <td>
                          {$Detail.host_data.firstpaymentamount_desc}
                          <span
                            class="ml-2 badge {$Detail.host_data.format_nextduedate.class}">{if $Detail.host_data.format_nextduedate.msg == '不到期'}  {else} {$Detail.host_data.format_nextduedate.msg} {/if}</span>
                        </td>
                      </tr>
                      <tr>
                        <th scope="row">{$Lang.subscription_date}</th>
                        <td>{$Detail.host_data.regdate|date="Y-m-d H:i"}</td>
                      </tr>
                      <tr>
                        <th scope="row">{$Lang.payment_cycle}</th>
                        <td>{$Detail.host_data.billingcycle_desc}</td>
                      </tr>
                      <tr>
                        <th scope="row">{$Lang.due_date}</th>
                        {if $Detail.host_data.billingcycle == 'free' || $Detail.host_data.billingcycle == 'onetime'}
                        <td>
                          {if $Detail.host_data.billingcycle_desc == '一次性' || $Detail.host_data.billingcycle_desc == '免费'}
                            -
                          {else}
                            {$Detail.host_data.format_nextduedate.msg}
                          {/if}
                        </td>
                        {else}
                        <td>{$Detail.host_data.nextduedate|date="Y-m-d H:i"}</td>
                        {/if}
                      </tr>
                      <tr>
                        <th scope="row">{$Lang.automatic_balance_renewal}</th>
                        <td>
						{if $Detail.host_data.billingcycle != 'onetime' && $Detail.host_data.status == 'Paid' && $Detail.host_data.billingcycle != 'free'}
                          <div class="custom-control custom-switch custom-switch-md mb-3" dir="ltr">
                      <input type="checkbox" {if $Detail.host_data.billingcycle_desc == '一次性' || $Detail.host_data.billingcycle_desc == '免费'} disabled {/if} class="custom-control-input" id="automaticRenewal"
                              onchange="automaticRenewal('{$Think.get.id}')" {if $Detail.host_data.initiative_renew
                              !=0}checked {/if}> <label class="custom-control-label" for="automaticRenewal"></label>
                          </div>
						  {else}
						  -
						  {/if}
                        </td>
                      </tr>
                    </tbody>
                  </table>

                </div>

              </div>


              <div>
                
                <button type="button" class="btn btn-primary" id="logininfo">
                  {$Lang.login_information}

                  <i class="mdi mdi-chevron-down"></i>
                </button>

                {if $Detail.host_data.billingcycle != 'free' && $Detail.host_data.billingcycle != 'onetime' &&
                ($Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Suspended')}
                <button type="button" class="btn btn-primary waves-effect waves-light" id="renew"
                  onclick="renew($(this), '{$Think.get.id}')">{$Lang.renew}</button>
                {/if}
                {if $Detail.host_data.domainstatus == 'Active' && $Detail.host_data.cancel_control}
                <span>
                  {if $Cancel.host_cancel}
                  <button class="btn btn-danger" id="cancelStopBtn"
                    onclick="cancelStop('{$Cancel.host_cancel.type}', '{$Think.get.id}')">{$Lang.stop_when_due}</button>
                  {else}
                  <button class="btn btn-primary" data-toggle="modal"
                    data-target=".cancelrequire">{$Lang.out_service}</button>
                  {/if}
                </span>
                {/if}
                <!--  20210331 增加产品转移hook输出按钮template_after_servicedetail_suspended.3-->
                {php}$hooks=hook('template_after_servicedetail_suspended',['hostid'=>$Detail['host_data']['id']]);{/php}
                {if $hooks}
                  {foreach $hooks as $item}
                    <div class="btn-group ml-0 mr-2">
                      <span>
                      {$item}
                      </span>
                    </div>
                  {/foreach}
                {/if}
                <!-- 结束 -->

                {if $Detail.module_button.control}

                <div class="btn-group">

                  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">{$Lang.control} <i
                      class="mdi mdi-chevron-down"></i></button>

                  <div class="dropdown-menu">

                    {foreach $Detail.module_button.control as $item}

                    <a class="dropdown-item service_module_button" href="javascript:void(0);"
                      onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')"
                      data-func="{$item.func}" data-type="{$item.type}"
                      data-desc="{$item.desc ?: $item.name}">{$item.name}</a>

                    {/foreach}

                  </div>

                </div>
                {/if}
                {if $Detail.module_button.console}

                <div class="btn-group">
                  {if ($Detail.module_button.console|count) == 1}
                  {foreach $Detail.module_button.console as $item}
                  <a class="btn btn-primary service_module_button d-flex align-items-center" href="javascript:void(0);"
                    onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')"
                    data-func="{$item.func}" data-type="{$item.type}" data-desc="">{$item.name}</a>
                  {/foreach}
                  {else}
                  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">{$Lang.console} <i
                      class="mdi mdi-chevron-down"></i></button>

                  <div class="dropdown-menu">

                    {foreach $Detail.module_button.console as $item}

                    <a class="dropdown-item service_module_button" href="javascript:void(0);"
                      onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')"
                      data-func="{$item.func}" data-type="{$item.type}" data-desc="">{$item.name}</a>

                    {/foreach}

                  </div>
                  {/if}
                </div>
                {/if}

              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-12">
      <div class="card">
        <div class="card-body" style="min-height: 500px;">
          <ul class="nav nav-tabs nav-tabs-custom" role="tablist">
            {foreach $Detail.module_client_area as $key=>$item}

            <li class="nav-item">

              <a class="nav-link {if $key==0}active{/if}" data-toggle="tab"
                href="#module_client_area_{$item.key}" role="tab">
                <span>{$item.name}</span>

              </a>

            </li>
            {/foreach}

            {if $Detail.config_options}
            <li class="nav-item">
              <a class="nav-link {if !$Detail.module_client_area}active{/if}" data-toggle="tab" href="#profile1"
                role="tab">
                <span>{$Lang.configuration_option}</span>
              </a>
            </li>
            {/if}

            {if $Detail.host_data.allow_upgrade_config || $Detail.host_data.allow_upgrade_product}
            <li class="nav-item">
              <a class="nav-link {if !$Detail.module_client_area && !$Detail.config_options}active{/if}"
                data-toggle="tab" href="#downgrade" role="tab">
                <span>{$Lang.upgrade_downgrade}</span>
              </a>
            </li>
            {/if}

            <li class="nav-item">
              <a class="nav-link {if !$Detail.module_client_area && !$Detail.config_options && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product}active{/if}"
                data-toggle="tab" href="#finance" role="tab">
                <span>{$Lang.financial_information}</span>
              </a>
            </li>
            {if $Detail.download_data}
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#download" role="tab">
                <span>{$Lang.file_download}</span>
              </a>
            </li>
            {/if}
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#settings1" role="tab">
                <span>{$Lang.journal}</span>
              </a>
            </li>

          </ul>

          <!-- Tab panes -->
          <div class="tab-content p-3 text-muted">
			{if $Detail.config_options}
            <div class="tab-pane  {if !$Detail.module_client_area}active{/if}" id="profile1" role="tabpanel">
              <div class="row">
                {foreach $Detail.config_options as $item}
                <div class="col-md-2 mb-2">
                  <div class="bg-light">
                    <div class="card-body">
                      <p>{$item.name}</p>
                      <span>{$item.sub_name}</span>
                    </div>
                  </div>
                </div>
                {/foreach}
                {foreach $Detail.custom_field_data as $item}
                {if $item.showdetail == 1}
                <div class="col-md-2 mb-2">
                  <div class="bg-light">
                    <div class="card-body">
                      <p>{$item.fieldname}</p>
                      <span>{$item.value}</span>
                    </div>
                  </div>
                </div>
                {/if}
                {/foreach}

              </div>
            </div>
			{/if}
            <div class="tab-pane {if !$Detail.module_client_area && !$Detail.config_options && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product}active{/if}" id="finance" role="tabpanel">

            </div>
            <div class="tab-pane" id="settings1" role="tabpanel">

            </div>
            {if $Detail.download_data}
            <div class="tab-pane" id="download" role="tabpanel">
              {include file="servicedetail/servicedetail-download"}
            </div>
            {/if}
            {if $Detail.host_data.allow_upgrade_config || $Detail.host_data.allow_upgrade_product}
            <div class="tab-pane" id="downgrade" role="tabpanel">
              <div class="container-fluid">
                {if $Detail.host_data.allow_upgrade_product}
                <div class="row mb-3">
                  <div class="col-12">
                    <div class="bg-light  rounded card-body">
                      <div class="row">
                        <div class="col-md-3">

                          <h5>{$Lang.upgrade_downgrade}</h5>
                        </div>
                        <div class="col-md-6">
                          <span>{$Lang.upgrade_downgrade_two}</span>
                        </div>
                        <div class="col-md-3">
                          <button type="button" class="btn btn-primary waves-effect waves-light float-right"
                            id="upgradeProductBtn"
                            onclick="upgradeProduct($(this), '{$Think.get.id}')">{$Lang.upgrade_downgrade}</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                {/if}
                {if $Detail.host_data.allow_upgrade_config}
                <div class="row mb-3">
                  <div class="col-12">
                    <div class="bg-light  rounded card-body">
                      <div class="row">
                        <div class="col-md-3">
                          <h5>{$Lang.upgrade_downgrade_options}</h5>
                        </div>
                        <div class="col-md-6">
                          <span>{$Lang.upgrade_downgrade_description}</span>
                        </div>
                        <div class="col-md-3">
                          <button type="button" class="btn btn-primary waves-effect waves-light float-right"
                            id="upgradeConfigBtn"
                            onclick="upgradeConfig($(this), '{$Think.get.id}')">{$Lang.upgrade_downgrade_options}</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                {/if}
              </div>
            </div>
            {/if}
            {foreach $Detail.module_client_area as $key=>$item}

            <div class="tab-pane {if $key==0}active{/if}" role="tabpanel"
              id="module_client_area_{$item.key}">

              <div class="width:100%">
                <script>
                  $.ajax({
                    url : '/provision/custom/content?id={$Think.get.id}&key={$item.key}&date='+Date.parse(new Date()) 
                    ,type : 'get'
                    ,success : function(res) {
                      $('#module_client_area_{$item.key} > div').html(res);
                    }
                  })
                </script>
              </div>

              <!-- <iframe src="/provision/custom/content?id={$Think.get.id}&key={$item.key}"
                onload="this.height=$($('.main-content .card-body')[1]).height()-72" frameborder="0"
                width="100%"></iframe> -->

            </div>

            {/foreach}
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="deactivateDia" style="display: none;">
    <form>
      <input type="hidden" value="{$Token}" />
      <input type="hidden" name="id" value="{$Think.get.id}" />
      <div class="form-group row mb-4">
        <label class="col-sm-3 col-form-label text-right">{$Lang.cancellation_time}</label>
        <div class="col-sm-8">
          <select class="form-control" class="second_type" name="type">
            <option value="Immediate">{$Lang.remarks_infors}立即</option>
            <option value="Endofbilling" selected>{$Lang.billing_cycle}</option>
          </select>
        </div>
      </div>
      <div class="form-group row mb-0">
        <label class="col-sm-3 col-form-label text-right">{$Lang.cancelreason}</label>
        <div class="col-sm-8">
          <div class="input-group">
            <select class="form-control" class="second_type" name="reason">
              {foreach $Detail.cancelist as $item}
              <option value="{$item.reason}">{$item.reason}</option>
              {/foreach}
            </select>
          </div>
        </div>
    </form>
  </div>
</div>

{include file="includes/cancelrequire"}
<script src="/themes/clientarea/default/assets/libs/clipboard/clipboard.min.js?v={$Ver}"></script>
<script>
  function refresh(type) {
    location.reload();
  }


  // 查看密码
  var showPWd = false
  $('#copyPwdContent').hide()
  function togglePwd() {
    showPWd = !showPWd

    if (showPWd) {
      $('#copyPwdContent').show()
      $('#hidePwdBox').hide()
    }
    if (!showPWd) {
      $('#copyPwdContent').hide()
      $('#hidePwdBox').show()
    }
  }

  // 复制密码
  var clipboard = new ClipboardJS('.btn-copy', {
    text: function (trigger) {
      return $('#copyPwdContent').text()
    }
  });
  clipboard.on('success', function (e) {
    toastr.success('{$Lang.copy_succeeded}');
  })

</script>
<script>
  const logObj = {
    id: '{$Think.get.id}',
    action: 'log_page'
  }
  $.ajax({
    type: "get",
    url: '' + '/servicedetail',
    data: logObj,
    success: function (data) {
      $(data).appendTo('#settings1');
    }
  });
  const financialObj = {
    id: '{$Think.get.id}',
    action: 'billing_page'
  }
  $.ajax({
    type: "get",
    url: '' + '/servicedetail',
    data: financialObj,
    success: function (data) {
      $(data).appendTo('#finance');
    }
  });

  // 复制用户密码
  $(document).on('click', '#logininfo', function () {
    $('#popModal').modal('show')
    $('#popTitle').text('登录信息')

    $('#popContent').html(`
      <div>{$Lang.user_name}：{$Detail.host_data.username}</div>
      <div>
        {$Lang.password}：<span id="poppwd">{$Detail.host_data.password}</span>
        <i class="bx bx-copy pointer text-primary ml-1 btn-copy" id="poppwdcopy" data-clipboard-action="copy" data-clipboard-target="#poppwd"></i>
      </div>
      <div>{$Lang.port}：{if $Detail.host_data.port == '0'}{$Lang.defaults}{else/}{$Detail.host_data.port}{/if}</div>
      
    `)
  });


  $('#popModal').on('shown.bs.modal',function() {
    if (clipboardpoppwd) {
        clipboardpoppwd.destroy()
      }
     clipboardpoppwd = new ClipboardJS('#poppwdcopy', {
      text: function (trigger) {
        return $('#poppwd').text()
      },
      container: document.getElementById('popModal')
    });
    clipboardpoppwd.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
  })
</script>