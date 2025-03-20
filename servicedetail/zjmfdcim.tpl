{include file="includes/cancelrequire"}
{include file="includes/pop"}
<style>
  .server_header_box {
    height: auto;
    background-image: linear-gradient(87deg, #4d83ff 0%, #3656ff 100%);
    border-radius: 15px;
    padding: 20px 25px;
    color: #ffffff;
  }

  .left_wrap_btn {
    display: inline-block;
    width: 80px;
    height: 20px;
    background-color: #5f88fe;
    box-shadow: 0px 6px 14px 2px rgba(6, 31, 179, 0.26);
    border-radius: 4px;
    color: #ffffff;
    text-align: center;
    border: none;
  }

  .custom-button {
    background-color: #6f87fc;
    box-shadow: 0px 6px 14px 2px rgba(6, 31, 179, 0.26);
    border-radius: 4px;
    font-size: 12px;
    color: #fff;
    border: none;
  }

  .box_left_wrap {
    border-left: 1px solid rgba(255, 255, 255, 0.25);
    min-height: 74px;
  }

  .aibiao a {
    width: 100%;
    height: 100%;
    display: inline-block;
  }

  @media screen and (max-width: 1367px) {
    .form-control {
      width: 46%;
    }

    .server_header_box {
      height: auto;
    }

    .power_box {
      max-width: 300px;
    }

    .left_wrap_btn {
      width: 60px !important;
    }

    .bottom-box {
      margin-top: 3rem !important;
    }

    .osbox {
      max-width: 150px;
    }
  }

  @media screen and (max-width: 976px) {
    .server_header_box {
      height: auto;
      padding: 20px;
      margin-top: 10px;
    }

    .domain,
    .box_left_wrap {
      margin-bottom: 20px;
      border-left: none;
    }

    .power_box {
      margin-bottom: 20px;
    }
  }

  .tuxian {
    cursor: pointer;
  }

  .tuxian:hover {
    color: rgba(224, 224, 224, 0.877);
  }

  .alarm {
    display: inline-block;
    font-size: 12px;
    cursor: pointer;
    color: #495057;
    font-weight: 300;
  }

  .fr {
    float: right;
  }

  .restall-btn {
    border-radius: 25px;
    margin-left: 20px;
  }

  .login-info-icon {
    color: #5f88fe;
  }

  .dc {
    color: #5f88fe
  }

  .rsb {
    height: 20px;
    padding: 0px 10px;
  }

  .mg-0 {
    margin: 0;
  }

  .plr-0 {
    padding-left: 0px;
    padding-right: 0px;
    margin-bottom: 0;
  }

  #copyIPContent:hover {
    color: #FCA426
  }

  #copyOneIp:hover {
    color: #FCA426
  }

  .text-nowrap {
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
  }

  .text-right {
    text-align: right;
  }

  .pre-money-box {
    background: url("/themes/clientarea/default/assets/images/money.png") no-repeat;
    background-position-x: right;
    background-position-y: bottom;
  }

  .w-75 {
    width: 75% !important;
  }

  .ll-flex {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .xf-bg {
    display: none;
    position: absolute;
    background: #fff;
    padding: 10px 15px;
    border-radius: 4px;
    top: -40px;
    left: 0px;
    box-shadow: 0px 3px 5px 0px rgba(0, 28, 144, 0.21);
    font-size: 12px;
  }

  .xf-bg-text {
    color: #333;
    word-break: break-all;
  }

  .flex-wrap {
    display: flex !important;
    flex-flow: wrap;
  }

  .configuration-btn-down {
    width: 100%;

    text-align: center;
    line-height: 36px;
    color: #5F88FE;
  }

  .configuration-btn-down::after {
    content: '';
    display: inline-block;
    width: 8px;
    height: 8px;
    margin-left: 8px;
    background-color: transparent;
    transform: rotate(225deg);
    border: 1px solid #5F88FE;
    border-bottom: none;
    border-right: none;
    transform-origin: 2px;
    transition: all .2s;
  }

  .configuration-btn-down.isClick::after {
    transform: rotate(45deg);
  }
</style>
<script src="/themes/clientarea/default/assets/libs/echarts/echarts.min.js?v={$Ver}"></script>
<div class="container-fluid">
  <div class="row mb-4">

    <div class="col-12">
      <div class="row align-items-center server_header_box">
        <div class="mr-3 power_box">
          <div class="text-white d-flex">
            <!-- 电源状态 -->
            <div class="mr-3 pointer">
              {if $Detail.module_power_status == '1'}
              <div class="powerimg d-flex justify-content-center align-items-center" id="powerBox">
                <span id="powerStatusIcon" class="bx bx-loader" data-toggle="popover" data-trigger="hover" title=""
                  data-html="true" data-content="{$Lang.loading}..."></span>
              </div>
              {else}
              <div class="powerimg d-flex justify-content-center align-items-center" id="statusBox"></div>
              {/if}
            </div>
            <div>
              <section class="d-flex align-items-center mb-2">
                <h4 class="text-white mb-0 font-weight-bold">{$Detail.host_data.productname}</h4>
                <span class="badge badge-pill ml-2 py-1 status-{$Detail.host_data.domainstatus|strtolower}"
                  style="position: relative;">
                  <div class="xf-bg">
                    <div class="xf-bg-text"><span style="color: #e31519;">暂停原因：</span>{$Detail.host_data.suspendreason
                      ?: $Detail.host_data.suspendreason_type}</div>
                    <font class="sj"></font>
                  </div>
                  {$Detail.host_data.domainstatus_desc}
                </span>
              </section>
              <section>
                <span>{$Detail.host_data.domain}</span>
                <span class="cancelBtn" id="cancelDcimTask" style="display:none;"
                  onclick="cancelDcimTask('{$Think.get.id}')">{$Lang.cancel_task}</span>
              </section>
            </div>
          </div>
        </div>
        <div class="pl-4 mr-3 box_left_wrap osbox">
          <span class="text-white-50 fs-12">{$Lang.operating_system}</span>
          {if $Detail.host_data.domainstatus=="Active"}
          <span class="ml-0">
            <button type="button" class="dcim_service_module_button left_wrap_btn fs-12 restall-btn"
              data-func="reinstall" data-type="default"
              onclick="dcim_service_module_button($(this), '{$Think.get.id}')">{$Lang.reinstall_system}</button>
          </span>
          {/if}
          <h5 class="mt-2 font-weight-bold text-white">{$Detail.host_data.os}</h5>
        </div>

        {foreach $Detail.config_options as $item}

        {if $item.option_type == '6'||$item.option_type == '8'}

        <div class="pl-4 mr-3 box_left_wrap">
          <span class="text-white-50 fs-12">{$item.name}</span>
          <h5 class="mt-2 font-weight-bold text-white">{$item.sub_name}</h5>
        </div>

        {/if}

        {/foreach}

        <div class="pl-4 mr-3 box_left_wrap">

          <span class="text-white-50 fs-12">{$Lang.ip_address}</span>

          <h5 class="mt-2 font-weight-bold text-white">
            <!-- <span data-toggle="popover" data-trigger="hover" title="" data-html="true" data-content="
              {foreach $Detail.host_data.assignedips as $list}
              <div>{$list}</div>
              {/foreach}
            "> -->
            <span>
              {if $Detail.host_data.dedicatedip}
              {if $Detail.host_data.assignedips}
              <!-- <span class="tuxian">{$Detail.host_data.dedicatedip}</span>-->
              <span id="copyIPContent" class="pointer">{$Detail.host_data.dedicatedip}
                ({$Detail.host_data.assignedips|count})</span>
              {else}
              <span id="copyOneIp" class="pointer copyOneIp">{$Detail.host_data.dedicatedip}</span>
              {/if}
              <!-- {if count($Detail.host_data.assignedips) >= 0}
            <i class="bx bx-copy pointer text-white ml-1 btn-copy" id="btnCopyIP" data-clipboard-action="copy"
              data-clipboard-target="#copyIPOne"></i>
            {/if} -->
              {else}
              -
              {/if}
            </span>

            <!-- {if count($Detail.host_data.assignedips) > 0}
        <div class="alarm" id="copyIPContent">
          更多
        </div>
        {/if} -->

          </h5>


        </div>

        <!--
      <div class="pl-4 mr-3 box_left_wrap">
      <span class="text-white-50 fs-12">{$Lang.password}</span>
      <h5 class="mt-2" data-toggle="popover" data-trigger="hover" data-html="true"
        data-content="{$Lang.user_name}：{$Detail.host_data.username}<br>{$Lang.port}：{if $Detail.host_data.port == '0'}{$Lang.defaults}{else/}{$Detail.host_data.port}{/if}">
        <span id="hidePwdBox" class="text-white">***********</span>
        <span id="copyPwdContent" class="text-white">{$Detail.host_data.password}</span>
        <i class="fas fa-eye pointer ml-2 text-white" onclick="togglePwd()"></i>
        <i class="bx bx-copy pointer ml-1 btn-copy text-white" id="btnCopyPwd" data-clipboard-action="copy"
          data-clipboard-target="#copyPwdContent"></i>
      </h5>

    </div>
    -->
        <div class="d-flex justify-content-end flex-shrink-1 flex-grow-1">


          {if $Detail.host_data.type == "dcim" && $Detail.dcim.auth && $Detail.host_data.domainstatus=="Active"}
          <div class="btn-group ml-2 mr-2 mt-2">
            <button type="button" class="btn btn-primary dropdown-toggle custom-button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">{$Lang.control} <i class="mdi mdi-chevron-down"></i></button>
            <div class="dropdown-menu">
              {if $Detail.dcim.auth.on == 'on'}
              <a class="dropdown-item dcim_service_module_button" href="javascript:void(0);"
                onclick="dcim_service_module_button($(this), '{$Think.get.id}')" data-func="on"
                data-des="{$Lang.confirm_turn_on}">{$Lang.batch_operation}</a>
              {/if}
              {if $Detail.dcim.auth.off == 'on'}
              <a class="dropdown-item dcim_service_module_button" href="javascript:void(0);"
                onclick="dcim_service_module_button($(this), '{$Think.get.id}')" data-func="off"
                data-des="{$Lang.confirm_turn_off}">{$Lang.shut_down}</a>
              {/if}
              {if $Detail.dcim.auth.reboot == 'on'}
              <a class="dropdown-item dcim_service_module_button" href="javascript:void(0);"
                onclick="dcim_service_module_button($(this), '{$Think.get.id}')" data-func="reboot"
                data-des="{$Lang.confirm_turn_restart}">{$Lang.restart}</a>
              {/if}
              {if $Detail.dcim.auth.bmc == 'on'}
              <a class="dropdown-item dcim_service_module_button" href="javascript:void(0);"
                onclick="dcim_service_module_button($(this), '{$Think.get.id}')" data-func="bmc"
                data-des="{$Lang.confirm_turn_mbc}">{$Lang.reset_bmc}</a>
              {/if}

              {if $Detail.dcim.auth.rescue == 'on'}
              <a class="dropdown-item dcim_service_module_button" href="javascript:void(0);"
                onclick="dcim_service_module_button($(this), '{$Think.get.id}')"
                data-func="rescue">{$Lang.rescue_system}</a>
              {/if}
            </div>
          </div>
          <div class="btn-group ml-2 mr-2 mt-2">
            <button type="button" class="btn btn-primary dropdown-toggle custom-button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">{$Lang.console} <i class="mdi mdi-chevron-down"></i></button>
            <div class="dropdown-menu">
              {if $Detail.dcim.auth.kvm == 'on'}
              <a class="dropdown-item dcim_service_module_button" href="javascript:void(0);"
                onclick="dcim_service_module_button($(this), '{$Think.get.id}')" data-func="kvm">kvm</a>
              {/if}
              {if $Detail.dcim.auth.ikvm == 'on'}
              <a class="dropdown-item dcim_service_module_button" href="javascript:void(0);"
                onclick="dcim_service_module_button($(this), '{$Think.get.id}')" data-func="ikvm">ikvm</a>
              {/if}
              {if $Detail.dcim.auth.novnc == 'on'}
              <a class="dropdown-item dcim_service_module_button" href="javascript:void(0);"
                onclick="dcim_service_module_button($(this), '{$Think.get.id}');" data-func="vnc">vnc</a>
              {/if}
            </div>
          </div>

          {elseif $Detail.module_button.control}

          <div class="btn-group ml-2 mr-2 mt-2">

            <button type="button" class="btn btn-primary dropdown-toggle custom-button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">{$Lang.control} <i class="mdi mdi-chevron-down"></i></button>

            <div class="dropdown-menu">

              {foreach $Detail.module_button.control as $item}

              {if $item.func != 'crack_pass' && $item.func != 'reinstall'}

              <a class="dropdown-item service_module_button" href="javascript:void(0);"
                onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')"
                data-func="{$item.func}" data-type="{$item.type}"
                data-desc="{$item.desc ?: $item.name}">{$item.name}</a>

              {/if}

              {/foreach}

            </div>

          </div>

          {if $Detail.module_button.console}

          <div class="btn-group ml-2 mr-2 mt-2">
            {if ($Detail.module_button.console|count) == 1}
            {foreach $Detail.module_button.console as $item}
            <a class="btn btn-primary service_module_button d-flex align-items-center" href="javascript:void(0);"
              onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')"
              data-func="{$item.func}" data-type="{$item.type}" data-desc="">{$item.name}</a>
            {/foreach}
            {else}
            <button type="button" class="btn btn-primary dropdown-toggle custom-button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">{$Lang.console} <i class="mdi mdi-chevron-down"></i></button>

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

          {/if}


          <!-- <div class="btn-group ml-2 mr-2 mt-2">
                {if $Detail.host_data.domainstatus == 'Active' && $Detail.host_data.cancel_control}

                <span>

                  {if $Cancel.host_cancel}

                  <button class="btn btn-danger mb-1 h-100" id="cancelStopBtn" onclick="cancelStop('{$Cancel.host_cancel.type}', '{$Think.get.id}')">{if $Cancel.host_cancel.type ==
                    'Immediate'}{$Lang.stop_now}{else}{$Lang.stop_when_due}{/if}</button>

                  {else}

                  <button class="btn btn-primary mb-1 h-100" data-toggle="modal"
                    data-target=".cancelrequire">{$Lang.out_service}</button>

                  {/if}

                </span>

                {/if}
              </div> -->
          <!--  20210331 增加产品转移hook输出按钮template_after_servicedetail_suspended.4-->
          {php}$hooks=hook('template_after_servicedetail_suspended',['hostid'=>$Detail['host_data']['id']]);{/php}
          {if $hooks}
          {foreach $hooks as $item}
          <div class="btn-group ml-2 mr-2 mt-2">
            <span>
              {$item}
            </span>
          </div>
          {/foreach}
          {/if}
          <!-- 结束 -->
        </div>

      </div>

    </div>

  </div>
  <div class="row">
    <div class="col-md-3">
      <div class="card">
        <div class="card-body">
          <!--
          <div class="mb-3 text-center" id="logininfo" style="width: 100px;height: 30px;line-height: 30px;background-color: #ffffff;box-shadow: 0px 4px 20px 2px rgba(6, 75, 179, 0.08);border-radius: 4px;cursor: pointer;">
            {$Lang.login_information}
          </div>
          -->

          <!-- 登录信息start -->
          <div class="row">
            {if $Detail.host_data.domainstatus == 'Active'}
            <div class="col-12 mb-2">
              <div class="bg-light card-body bg-gray">
                <p class="text-gray">
                  {$Lang.login_information}
                  <i class="bx bx-user login-info-icon"></i>
                </p>
                <p class="mb-0">{$Lang.user_name}：{$Detail.host_data.username}</p>
                <p class="mb-0">{$Lang.password}：
                  <!-- <span id="hidePwdBox" class="text-black">***********</span> -->
                  {if $Detail.host_data.password == ''}
                  <span class="text-black btnCopyPwd pointer dc">-</span>
                  {else}
                  <span data-toggle="popover" data-placement="top" data-trigger="hover" data-content="复制"
                    id="copyPwdContent" class="text-black btnCopyPwd pointer dc">{$Detail.host_data.password}</span>
                  {/if}
                  <!-- <i class="fas  fa-eye pointer ml-2 text-black" onclick="togglePwd()"></i> -->
                  <!-- <i class="bx bx-copy pointer ml-1 btn-copy text-black" id="btnCopyPwd" data-clipboard-action="copy"
                    data-clipboard-target="#copyPwdContent"></i> -->
                  {if $Detail.host_data.domainstatus=="Active"}
                  <span>
                    <button type="button"
                      class="btn btn-primary btn-sm waves-effect waves-light dcim_service_module_button fr rsb"
                      onclick="dcim_service_module_button($(this), '{$Think.get.id}')" data-func="crack_pass"
                      data-type="default">{$Lang.crack_password}</button>
                  </span>
                  {/if}
                </p>
                <p class="mb-0">{$Lang.port}：{if $Detail.host_data.port ==
                  '0'}{$Lang.defaults}{else/}{$Detail.host_data.port}{/if}</p>

              </div>
            </div>
            {/if}
            {if ($temp_custom_field_data = array_column($Detail.custom_field_data, 'value', 'fieldname')) &&
            (isset($temp_custom_field_data['panel_address']) || isset($temp_custom_field_data['面板管理地址']) ||
            isset($temp_custom_field_data['panel_passwd']) || isset($temp_custom_field_data['面板管理密码']))}
            <div class="col-12 mb-2">
              <div class="bg-light card-body bg-gray">
                <p class="text-gray">
                  {$Lang.panel_manage_info}
                  <i class="bx bx-receipt dc"></i>
                </p>
                {if isset($temp_custom_field_data['panel_address']) || isset($temp_custom_field_data['面板管理地址'])}
                <p class="mb-0">{$Lang.panel_manage_address}：{$temp_custom_field_data['panel_address'] ??
                  $temp_custom_field_data['面板管理地址']}</p>
                {/if}
                {if isset($temp_custom_field_data['panel_passwd']) || isset($temp_custom_field_data['面板管理密码'])}
                <!-- <p class="mb-0">{$Lang.panel_manage_password}：<span id="hidePanelPasswd">***********</span> -->
                <span data-toggle="popover" data-placement="top" data-trigger="hover" data-content="复制" id="panelPasswd"
                  class="btnCopyPanelPasswd dc pointer">{$temp_custom_field_data['panel_passwd'] ??
                  ($temp_custom_field_data['面板管理密码'] ?:'--')}</span>
                <!-- <i class="fas fa-eye pointer ml-2 text-black" onclick="togglePanelPasswd()"></i>
                  <i class="bx bx-copy pointer ml-1 btn-copy text-black" id="btnCopyPanelPasswd" data-clipboard-action="copy" data-clipboard-target="#panelPasswd"></i> -->
                </p>
                {/if}
              </div>
            </div>
            {/if}
          </div>
          <!-- 登录信息end -->

          <!-- 流量 -->
          {if ($Detail.host_data.domainstatus == 'Active' || ($Detail.host_data.domainstatus == 'Suspended' && $Detail.host_data.suspendreason_type == 'flow')) && $Detail.host_data.bwlimit > 0}
          <!-- <div class="d-flex justify-content-end mb-2">
            <button type="button" class="btn btn-success btn-sm waves-effect waves-light"
              id="orderFlowBtn" onclick="orderFlow($(this), '{$Think.get.id}')">{$Lang.order_flow}</button>
          </div> -->
          <div class="mt-4 mb-3">
            <i class="bx bx-circle" style="color:#f0ad4e"></i> {$Lang.used_flow}：<span id="usedFlowSpan">-</span>
            <i class="bx bx-circle" style="color:#34c38f"></i> {$Lang.residual_flow}：<span id="remainingFlow">-</span>
          </div>
          <div class="mb-4 ll-flex">
            <div class="progress w-75">
              <div class="progress-bar progress-bar-striped bg-success" id="totalProgress" role="progressbar"
                style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%
              </div>
            </div>
            <button type="button" class="btn btn-success btn-sm waves-effect waves-light rsb" id="orderFlowBtn"
              onclick="orderFlow($(this), '{$Think.get.id}')">{$Lang.order_flow}</button>
          </div>
          {/if}
          <!-- 流量end -->
          <!-- 订购价格start -->
          <div class="row">
            <!-- <div class="col-12 my-2">
              <div class="d-flex justify-content-between align-items-center">
                <span>{$Lang.first_order_price}</span>
                {if $Detail.host_data.status == 'Paid'}
                {if $Detail.host_data.billingcycle != 'free' && $Detail.host_data.billingcycle != 'onetime' &&
                ($Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Suspended')}
                <button type="button" class="btn btn-primary btn-sm waves-effect waves-light" id="renew" onclick="renew($(this), '{$Think.get.id}')">{$Lang.immediate_renewal}</button>
                {/if}
                {/if}
                {if $Detail.host_data.status == 'Unpaid'}
                <a href="viewbilling?id={$Detail.host_data.invoice_id}">
                  <button type="button" class="btn btn-primary btn-sm waves-effect waves-light" id="renewpay">{$Lang.immediate_renewal}</button>
                </a>
                {/if}
              </div>
            </div> -->
            <div class="col-12 mb-2">
              <div class="bg-light card-body bg-gray pre-money-box">
                <p class="text-gray">
                  {$Lang.first_order_price}
                  <span class="fr">{if $Detail.host_data.billingcycle == 'free' || $Detail.host_data.billingcycle ==
                    'onetime'}  {else}{$Detail.host_data.format_nextduedate.msg}{/if}</span>
                </p>
                <section class="d-flex align-items-center">
                  <h3 class="mb-0 mr-2 dc">
                    {$Detail.host_data.firstpaymentamount_desc?$Detail.host_data.firstpaymentamount_desc:'-'}</h3>

                  <!-- <span class="badge
                      {$Detail.host_data.format_nextduedate.class}">{if $Detail.host_data.billingcycle == 'free' || $Detail.host_data.billingcycle == 'onetime'} - {else}{$Detail.host_data.format_nextduedate.msg}{/if}</span> -->
                </section>

                <section class="d-flex align-items-center flex-wrap">
                  {if $Detail.host_data.billingcycle != 'free' && $Detail.host_data.billingcycle != 'onetime' &&
                  $Detail.host_data.status == 'Paid'}
                  <span>{$Lang.automatic_balance_renewal}</span>
                  <div class="custom-control custom-switch custom-switch-md mb-4 ml-2" dir="ltr">
                    <input type="checkbox" class="custom-control-input" id="automaticRenewal"
                      onchange="automaticRenewal('{$Think.get.id}')" {if $Detail.host_data.initiative_renew !=0}checked
                      {/if}> <label class="custom-control-label" for="automaticRenewal"></label>
                  </div>
                  {/if}
                  {if $Detail.host_data.billingcycle != 'free' && $Detail.host_data.billingcycle != 'onetime' &&
                  ($Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Suspended')}
                  {if $Detail.host_data.status == 'Paid'}
                  <button type="button" class="btn btn-success btn-sm waves-effect waves-light rsb" id="renew"
                    onclick="renew($(this), '{$Think.get.id}')">{$Lang.renew}</button>
                  {/if}
                  {if $Detail.host_data.status == 'Unpaid'}
                  <a href="viewbilling?id={$Detail.host_data.invoice_id}">
                    <button type="button" class="btn btn-success btn-sm waves-effect waves-light rsb"
                      id="renewpay">{$Lang.renew}</button>
                  </a>
                  {/if}
                  {/if}

                  {if $Detail.host_data.domainstatus == 'Active' && $Detail.host_data.cancel_control}
                  {if $Cancel.host_cancel}
                  <!-- <button class="btn btn-primary btn-sm rsb ml-2" id="cancelStopBtn"
                      onclick="cancelStop('{$Cancel.host_cancel.type}', '{$Think.get.id}')">{if $Cancel.host_cancel.type
                      ==
                      'Immediate'}{$Lang.stop_now}{else}{$Lang.stop_when_due}{/if}</button> -->
                  <button class="btn btn-primary btn-sm rsb ml-2" id="cancelStopBtn" data-container="body"
                    data-toggle="popover" data-placement="top" data-trigger="hover"
                    data-content="将于{{$Detail.host_data.deletedate|date='Y-m-d'}}自动删除"
                    onclick="cancelStop('{$Cancel.host_cancel.type}', '{$Think.get.id}')">{$Lang.cancel_out}</button>
                  {else}
                  <button class="btn btn-danger btn-sm rsb ml-2" data-toggle="modal"
                    data-target=".cancelrequire">{$Lang.apply_out}</button>
                  {/if}
                  {/if}
                </section>

                <section class="text-gray">
                  <p>{$Lang.subscription_date}：{$Detail.host_data.regdate|date="Y-m-d H:i"}</p>
                  <p>{$Lang.payment_cycle}：{$Detail.host_data.billingcycle_desc}</p>

                  {if $Detail.host_data.billingcycle == 'free' || $Detail.host_data.billingcycle == 'onetime'}
                  <p>{$Lang.due_date}：-</p>
                  {else}
                  <p>{$Lang.due_date}：{$Detail.host_data.nextduedate|date="Y-m-d H:i"}</p>
                  {/if}
                </section>
              </div>
            </div>
          </div>
          <!-- 订购价格end -->
          <!-- 配置项 -->
          <div class="row">
            {foreach $Detail.config_options as $item }
            {if $item.option_type == '5'||$item.option_type == '6'||$item.option_type == '8'}
            {else}
            <div class="col-md-12 mb-2 configuration configuration_list">
              <div data-toggle="popover" data-placement="top" data-trigger="hover"
                data-content="{$item.name}：{$item.sub_name}" class="bg-light card-body bg-gray mg-0 row">
                <p class="text-gray col-md-6 plr-0 text-nowrap">
                  {$item.name}
                </p>
                <p class="mb-0 col-md-6 plr-0 text-nowrap text-right pl-2">
                  {if $item.option_type===12}
                  <img src="/upload/common/country/{$item.code}.png" width="20px">
                  {/if}
                  {$item.sub_name}
                </p>
              </div>
            </div>
            {/if}
            {/foreach}

            {foreach $Detail.custom_field_data as $item}
            {if $item.showdetail == 1}
            <div class="col-md-12 mb-2 configuration configuration_list">
              <div data-toggle="popover" data-placement="top" data-trigger="hover"
                data-content="{$item.fieldname}：{$item.value}" class="bg-light card-body bg-gray mg-0 row">
                <p class="text-gray col-md-6 plr-0 text-nowrap">{$item.fieldname}</p>
                <p class="mb-0 col-md-6 plr-0 text-nowrap text-right pl-2">
                  {$item.value}
                </p>
              </div>
            </div>
            {/if}
            {/foreach}
            <div onclick="isShowConfiguration()" class="configuration-btn-down isClick">查看更多信息</div>
            <div class="col-12 mb-2">
              <div data-toggle="popover" data-placement="top" data-trigger="hover"
                data-content="{$Lang.remarks_infors}：{$Detail.host_data.remark?$Detail.host_data.remark:'-'}"
                class="bg-light card-body  bg-gray mg-0 row">
                <p class="text-gray col-md-3 plr-0 text-nowrap">{$Lang.remarks_infors}</p>
                <p class="mb-0 col-md-9 plr-0 text-nowrap">{$Detail.host_data.remark?$Detail.host_data.remark:'-'}
                  <span class="bx bx-edit-alt pointer ml-2" data-toggle="modal" data-target="#modifyRemarkModal"></span>
                </p>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-9">
      <div class="card">
        <div class="card-body ">
          <ul class="nav nav-tabs nav-tabs-custom" role="tablist">
            {if $Detail.host_data.domainstatus == 'Active' && $Detail.host_data.dcimid && $Detail.dcim.auth.traffic ==
            'on'}
            <li class="nav-item" id="chartLi">
              <a class="nav-link active" data-toggle="tab" href="#home1" role="tab">
                <!-- <span class="d-block d-sm-none"><i class="fas fa-home"></i></span> -->
                <span>{$Lang.charts}</span>
              </a>
            </li>
            {/if}
            {if $Detail.host_data.domainstatus == 'Active' && ($Detail.host_data.allow_upgrade_config ||
            $Detail.host_data.allow_upgrade_product)}
            <li class="nav-item">
              <a class="nav-link {if !($Detail.dcim && $Detail.dcim.auth.traffic == 'on')}active{/if}" data-toggle="tab"
                href="#profile1" role="tab">
                <!-- <span class="d-block d-sm-none"><i class="far fa-user"></i></span> -->
                <span>{$Lang.upgrade_downgrade}</span>
              </a>
            </li>
            {/if}
            {if $Detail.download_data}
            <li class="nav-item">
              <a class="nav-link {if !($Detail.host_data.domainstatus == 'Active' && $Detail.dcim && $Detail.dcim.auth.traffic == 'on') && !($Detail.host_data.domainstatus == 'Active' && ($Detail.host_data.allow_upgrade_config ||
              $Detail.host_data.allow_upgrade_product))}active{/if}" data-toggle="tab" href="#messages1" role="tab">
                <!-- <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span> -->
                <span>{$Lang.file_download}</span>
              </a>
            </li>
            {/if}
            {if $Detail.host_data.show_traffic_usage}
            <li class="nav-item" id="usedLi">
              <a class="nav-link {if !($Detail.host_data.domainstatus == 'Active' && $Detail.dcim && $Detail.dcim.auth.traffic == 'on') && !($Detail.host_data.domainstatus == 'Active' && ($Detail.host_data.allow_upgrade_config ||
              $Detail.host_data.allow_upgrade_product)) && !$Detail.download_data}active{/if}" data-toggle="tab"
                href="#dosage" role="tab">
                <!-- <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span> -->
                <span>{$Lang.consumption}</span>
              </a>
            </li>
            {/if}
            <li class="nav-item">
              <a class="nav-link {if !($Detail.host_data.domainstatus == 'Active' && $Detail.dcim && $Detail.dcim.auth.traffic == 'on') && !($Detail.host_data.domainstatus == 'Active' && ($Detail.host_data.allow_upgrade_config ||
              $Detail.host_data.allow_upgrade_product)) && !$Detail.download_data && !$Detail.host_data.show_traffic_usage}active{/if}"
                data-toggle="tab" href="#settings1" role="tab">
                <!-- <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span> -->
                <span>{$Lang.journal}</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#finance" role="tab">
                <!-- <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span> -->
                <span>{$Lang.finance}</span>
              </a>
            </li>
          </ul>

          <!-- Tab panes -->
          <div class="tab-content p-3 text-muted">
            {if $Detail.host_data.domainstatus == 'Active' && $Detail.dcim && $Detail.dcim.auth.traffic == 'on'}
            <div class="tab-pane active" id="home1" role="tabpanel">
            </div>
            {/if}

            {if $Detail.host_data.domainstatus == 'Active' && ($Detail.host_data.allow_upgrade_config ||
            $Detail.host_data.allow_upgrade_product)}
            <div class="tab-pane {if !($Detail.dcim && $Detail.dcim.auth.traffic == 'on')}active{/if}" id="profile1"
              role="tabpanel">
              <div class="container-fluid">
                {if $Detail.host_data.allow_upgrade_product}
                <div class="row mb-3">
                  <div class="col-12">
                    <div class="bg-light  rounded card-body">
                      <div class="row">
                        <div class="col-sm-3">

                          <h5>{$Lang.upgrade_downgrade}</h5>
                        </div>
                        <div class="col-sm-6">

                          <span>{$Lang.upgrade_downgrade_two}</span>
                        </div>
                        <div class="col-sm-3">
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
                        <div class="col-sm-3">
                          <h5>{$Lang.upgrade_downgrade_options}</h5>
                        </div>
                        <div class="col-sm-6">
                          <span>{$Lang.upgrade_downgrade_description}</span>
                        </div>
                        <div class="col-sm-3">
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
            {if $Detail.download_data}
            <div class="tab-pane {if !($Detail.host_data.domainstatus == 'Active' && $Detail.dcim && $Detail.dcim.auth.traffic == 'on') && !($Detail.host_data.domainstatus == 'Active' && ($Detail.host_data.allow_upgrade_config ||
            $Detail.host_data.allow_upgrade_product))}active{/if}" id="messages1" role="tabpanel">
              {include file="servicedetail/servicedetail-download"}
            </div>
            {/if}
            <div
              class="tab-pane {if !($Detail.host_data.domainstatus == 'Active' && $Detail.dcim && $Detail.dcim.auth.traffic == 'on') && !($Detail.host_data.domainstatus == 'Active' && ($Detail.host_data.allow_upgrade_config ||
            $Detail.host_data.allow_upgrade_product)) && !$Detail.download_data && !$Detail.host_data.show_traffic_usage}active{/if}"
              id="settings1" role="tabpanel">

            </div>

            {if $Detail.host_data.show_traffic_usage}
            <div class="tab-pane {if !($Detail.host_data.domainstatus == 'Active' && $Detail.dcim && $Detail.dcim.auth.traffic == 'on') && !($Detail.host_data.domainstatus == 'Active' && ($Detail.host_data.allow_upgrade_config ||
            $Detail.host_data.allow_upgrade_product)) && !$Detail.download_data}active{/if}" id="dosage"
              role="tabpanel">
              <div class="row d-flex align-items-center">
                <div class="col-md-3">
                  <input class="form-control" type="date" id="startingTime">
                </div>
                <span>{$Lang.reach}</span>
                <div class="col-md-3">
                  <input class="form-control" type="date" id="endTime">
                </div>
              </div>
              <div class="w-100 h-100">
                <div style="height: 500px" class="chart_content_box w-100" id="usedChartBox"></div>
              </div>
            </div>
            {/if}
            <div class="tab-pane" id="finance" role="tabpanel">
              <!-- 财务 -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 破解密码弹窗 -->
<div class="modal fade" id="dcimModuleResetPass" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-0">{$Lang.crack_password}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="crackPsdForm">
        <div class="modal-body">
          <div class="form-group row mb-0">
            <label for="horizontal-firstname-input"
              class="col-md-3 col-form-label d-flex justify-content-end">{$Lang.password}</label>
            <div class="col-md-6">
              <input type="text" class="form-control getCrackPsd" name="password">
            </div>
            <div class="col-md-1 fs-18 d-flex align-items-center">
              <i class="fas fa-dice create_random_pass pointer" onclick="create_random_pass()"></i>
            </div>
          </div>
          <label id="password-error-tip" class="control-label error-tip" for="password"></label>

          <div class="form-group row mb-4">
            <label for="horizontal-firstname-input"
              class="col-md-3 col-form-label d-flex justify-content-end">{$Lang.crack_other}</label>
            <div class="col-md-6">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="dcimModuleResetPassOther" value="1"
                  onchange="dcimModuleResetPassOther($(this))">
                <label class="custom-control-label" for="dcimModuleResetPassOther">{$Lang.password_will_cracked}</label>
              </div>
            </div>
          </div>
          <div class="form-group row mb-4" style="display:none;" id="dcimModuleResetPassOtherUser">
            <label for="horizontal-firstname-input"
              class="col-md-3 col-form-label d-flex justify-content-end">{$Lang.custom_user}</label>
            <div class="col-md-6">
              <input type="text" class="form-control" name="user">
            </div>
          </div>
        </div>
        <input type="hidden" name="id" value="{$Think.get.id}">
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">{$Lang.cancel}</button>
        <button type="button" class="btn btn-primary submit"
          onclick="dcimModuleResetPass($(this), '{$Think.get.id}')">{$Lang.determine}</button>
      </div>
    </div>
  </div>
</div>

<!-- 救援系统弹窗 -->
<div class="modal fade" id="dcimModuleRescue" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-0">{$Lang.rescue_system}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form>
        <div class="modal-body">
          <div class="form-group row mb-4">
            <label for="horizontal-firstname-input"
              class="col-md-3 col-form-label d-flex justify-content-end">{$Lang.system}</label>
            <div class="col-md-8">
              <select class="form-control" name="system">
                <option value="1">Linux</option>
                <option value="2">Windows</option>
              </select>
            </div>
          </div>
        </div>
        <input type="hidden" name="id" value="{$Think.get.id}">
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">{$Lang.cancel}</button>
        <button type="button" class="btn btn-primary submit"
          onclick="dcimModuleRescue($(this), '{$Think.get.id}')">{$Lang.determine}</button>
      </div>
    </div>
  </div>
</div>

<!-- 重装系统弹窗 -->
<div class="modal fade" id="dcimModuleReinstall" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-0">{$Lang.reinstall_system}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="rebuildPsdForm">
        <div class="modal-body">
          <div class="row">
            <div class="col-md-2  d-flex align-items-center justify-content-end">
              <label class="float-right mb-0">{$Lang.system}</label>
            </div>
            <div class="col-md-5">
              <div class="form-group mb-0">
                <select class="form-control configoption_os_group selectpicker" data-style="btn-default" name="os_group"
                  onchange="dcimModuleReinstallOsGroup($(this))">
                  {foreach $Detail.cloud_os_group as $item}
                  {if strtolower($item.name)=="windows"}
                  {assign name="os_svg" value="1" /}
                  {elseif strtolower($item.name)=="centos"/}
                  {assign name="os_svg" value="2" /}
                  {elseif strtolower($item.name)=="ubuntu"/}
                  {assign name="os_svg" value="3" /}
                  {elseif strtolower($item.name)=="debian"/}
                  {assign name="os_svg" value="4" /}
                  {elseif strtolower($item.name)=="esxi"/}
                  {assign name="os_svg" value="5" /}
                  {elseif strtolower($item.name)=="xenserver"/}
                  {assign name="os_svg" value="6" /}
                  {elseif strtolower($item.name)=="freebsd"/}
                  {assign name="os_svg" value="7" /}
                  {elseif strtolower($item.name)=="fedora"/}
                  {assign name="os_svg" value="8" /}
                  {else/}
                  {assign name="os_svg" value="9" /}
                  {/if}
                  <option
                    data-content="<img class='mr-1' src='/upload/common/system/{$os_svg}.svg' height='20'/>{$item.name}"
                    value="{$item.id}">{$item.name}</option>
                  {/foreach}
                </select>
              </div>
            </div>
            <div class="col-md-5">
              <div class="form-group">
                <select class="form-control" name="os" data-os='{:json_encode($Detail.cloud_os)}'
                  onchange="dcimModuleReinstallOs($(this), '{$Detail.host_data.os}')">
                  {foreach $Detail.cloud_os as $item}
                  <option value="{$item.id}" data-group="{$item.group}">{$item.name}</option>
                  {/foreach}
                </select>
              </div>
            </div>
          </div>
          <div class="form-group row mb-0">
            <label for="horizontal-firstname-input"
              class="col-md-2 col-form-label d-flex justify-content-end">{$Lang.password}</label>
            <div class="col-md-6">
              <input type="text" class="form-control getRebuildPsd" name="password">
            </div>
            <div class="col-md-1 fs-18 d-flex align-items-center">
              <i class="fas fa-dice create_random_pass pointer" onclick="create_random_pass()"></i>
            </div>
          </div>
          <label id="password-error-tip-rebuild" class="control-label error-tip ml-8" for="password"></label>
          <div class="row mt-3">
            <label for="horizontal-firstname-input"
              class="col-md-2 col-form-label d-flex justify-content-end">{$Lang.port}</label>
            <div class="col-md-5">
              <input type="text" class="form-control" name="port" value="22">
            </div>
            <div class="col-md-1 fs-18 d-flex align-items-center">
              <i class="fas fa-dice module_reinstall_random_port"
                onclick="$('#dcimModuleReinstall input[name=\'port\']').val(parseInt(Math.random() * 65535))"></i>
            </div>
          </div>
          <div class="row" id="dcimModuleReinstallPart">
            <label for="horizontal-firstname-input"
              class="col-md-2 col-form-label d-flex justify-content-end">{$Lang.partition_type}</label>
            <div class="col-md-3">
              <div class="custom-control custom-radio">
                <input type="radio" class="custom-control-input" id="dcimModuleReinstallPart0" name="part_type"
                  onchange="showPartTypeConfirm('{$Detail.host_data.os}')" value="0" checked="checked">
                <label class="custom-control-label" for="dcimModuleReinstallPart0">{$Lang.full_format}</label>
              </div>
            </div>
            <div class="col-md-3">
              <div class="custom-control custom-radio">
                <input type="radio" class="custom-control-input" id="dcimModuleReinstallPart1" name="part_type"
                  onchange="showPartTypeConfirm('{$Detail.host_data.os}')" value="1">
                <label class="custom-control-label"
                  for="dcimModuleReinstallPart1">{$Lang.first_partition_formatting}</label>
              </div>
            </div>
            <div class="col-md-3">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="dcimModuleReinstallHigh"
                  onchange="showDcimDisk()">
                <label class="custom-control-label" for="dcimModuleReinstallHigh">{$Lang.senior}</label>
              </div>
            </div>
          </div>
          <div class="row" id="dcimModuleReinstallDisk" style="display:none;">
            <label for="horizontal-firstname-input"
              class="col-md-2 col-form-label d-flex justify-content-end">{$Lang.disk}</label>
            <div class="col-md-6">
              <select class="form-control" name="disk">
                <option value="0">disk0</option>
              </select>
            </div>
          </div>
          <!--
          <div class="row" id="dcimModuleReinstallPartInfo">
            <label for="horizontal-firstname-input"
              class="col-md-2 col-form-label d-flex justify-content-end">分区</label>
            <div class="col-md-3">
              <div class="custom-control custom-radio">
                <input type="radio" class="custom-control-input" name="action" id="dcimModuleReinstallPartInfo0" onchange="reinstallPartInfoChange()"
                  value="0" checked="checked">
                <label class="custom-control-label" for="dcimModuleReinstallPartInfo0">默认</label>
              </div>
            </div>
            <div class="col-md-3">
              <div class="custom-control custom-radio">
                <input type="radio" class="custom-control-input" name="action" id="dcimModuleReinstallPartInfo1" onchange="reinstallPartInfoChange()"
                  value="1">
                <label class="custom-control-label" for="dcimModuleReinstallPartInfo1">附加配置</label>
              </div>
            </div>
          </div>
          <div class="row" style="display:none;" id="dcimModuleReinstallPartSetting">
            <label for="horizontal-firstname-input"
              class="col-md-2 col-form-label d-flex justify-content-end"></label>
            <div class="col-md-6">
              <select class="form-control" name="mcon">
                <option value="0">无可用附加分区配置</option>
              </select>
            </div>
          </div>
          -->
          <div class="row">
            <div class="col-md-2 offset-md-2 d-flex align-items-center justify-content-end">
              <div class="custom-control custom-checkbox mb-4">
                <input type="checkbox" class="custom-control-input" id="dcimModuleReinstallConfirm" value="1"
                  onchange="dcimReinstallConfirm($(this))">
                <label class="custom-control-label" for="dcimModuleReinstallConfirm">{$Lang.finished_backup}</label>
              </div>
            </div>
          </div>
          <div class="row" id="dcimModuleReinstallPartMsg" style="display:none;">
            <div class="col-md-2"></div>
            <div class="col-md-9">
              <div class="part_error"></div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-9">
              <div id="dcimModuleReinstallMsg"></div>
            </div>
          </div>
        </div>
        <input type="hidden" name="id" value="{$Think.get.id}">
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">{$Lang.cancel}</button>
        <button type="button" class="btn btn-primary submit disabled" style="cursor:not-allowed;"
          onclick="dcimModuleReinstall($(this), '{$Think.get.id}')">{$Lang.determine}</button>
      </div>
    </div>
  </div>
</div>
<!-- 电源状态 -->
<script>
  var showPowerStatus = '{$Detail.module_power_status}';
  var powerStatus = {}

  $(function () {
    if (showPowerStatus == '1') {
      dcimGetPowerStatus('{$Think.get.id}')
    }

    $('#powerBox').on('click', function () {
      dcimGetPowerStatus('{$Think.get.id}')
    });
  })



  var timeOut = null
  var timeInterval = null
</script>

<script>
  // var showPWd = true
  $(function () {
    $(".nav-tabs-custom").find('.nav-item').find("a").removeClass('active')
    $(".nav-tabs-custom").find('.nav-item').eq(0).find("a").addClass('active')
    // 暂停状态悬浮原因
    $('.container-fluid').on('mouseover', '.status-suspended', function () {
      $('.xf-bg').show();
    })
    $('.container-fluid').on('mouseout', '.status-suspended', function () {
      $('.xf-bg').hide();
    })
    // 查看密码
    // $('#copyPwdContent').hide()
    // $('#hidePwdBox').hide()

    // 复制IP
    var clipboard = new ClipboardJS('.btn-copy-ip', {
      text: function (trigger) {
        return $('#copyIPContent').text()
      }
    });
    clipboard.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
    // 复制密码
    var clipboard = new ClipboardJS('.btnCopyPwd', {
      text: function (trigger) {
        return $('#copyPwdContent').text()
      }
    });
    clipboard.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
    // 一个ip时，不弹框，复制ip
    var clipboard = new ClipboardJS('.copyOneIp', {
      text: function (trigger) {
        return $('#copyOneIp').text()
      }
    });
    clipboard.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
  })
  // function togglePwd() {
  //   showPWd = !showPWd

  //   if (showPWd) {
  //     $('#copyPwdContent').show()
  //     $('#hidePwdBox').hide()
  //   }
  //   if (!showPWd) {
  //     $('#copyPwdContent').hide()
  //     $('#hidePwdBox').show()
  //   }
  // }

  function togglePanelPasswd() {
    if ($("#hidePanelPasswd").is(':hidden')) {
      $("#hidePanelPasswd").show();
      $("#panelPasswd").hide();
    } else {
      $("#hidePanelPasswd").hide();
      $("#panelPasswd").show();
    }
  }
  //点击更多信息
  function isShowConfiguration(first = true) {
     let time = 0
    if (first) {
      time = 500
    } 
    for (let i = 0; i < 99; i++) {
      if (i > 3) {
        $('.configuration').eq(i).toggle(time)
      }
    }
    $('.configuration-btn-down').toggleClass('isClick')
    $('.configuration-btn-down').html('查看更多信息')
    $('.configuration-btn-down.isClick').html('收起更多信息')
    if($('.configuration_list').length < 4) {
      $('.configuration-btn-down').hide()
    }
  }
  isShowConfiguration(false)
  // 复制面板管理密码
  var clipboard_panelPasswd = new ClipboardJS('.btnCopyPanelPasswd', {
    text: function (trigger) {
      return $('#panelPasswd').text()
    }
  });
  clipboard_panelPasswd.on('success', function (e) {
    toastr.success('{$Lang.copy_succeeded}');
  })
</script>

<script>
  // 图表tabs
  $(document).ready(function () {
    getComponentData()
  });

  let switch_id = []
  let chartsData = []
  let timeArray = []
  let name = []
  let typeArray = []
  let myChart = null

  $('#chartLi').on('click', function () {
    setTimeout(function () {
      myChart.resize()
    }, 0);
  });
  async function getChartDataFn(index) {
    selectTimeTypeFunc(index)
    const queryObj = {
      id: '{$Think.get.id}',
      switch_id: switch_id[index],
      port_name: name[index],
      start_time: moment(timeArray[index].startTime).valueOf()
    }
    $.ajax({
      type: "post",
      url: '' + '/dcim/traffic',
      data: queryObj,
      success: function (data) {

        var obj = data.data.traffic || []
        var inArray = []
        var outArray = []
        var xName = []
        var inVal = []
        var outVal = []
        for (const item of obj) {
          if (item.type === 'in') {
            inArray.push(item)
            xName.push(moment(item.time).format('MM-DD HH:mm:ss'))
            inVal.push(item.value)
          } else if (item.type === 'out') {
            outArray.push(item)
            outVal.push(item.value)
          }
        }
        chartFunc(index, xName, inVal, outVal, data.data.unit)
        if (data.status === 200) {
          var obj = data.data.traffic
          var inArray = []
          var outArray = []
          var xName = []
          var inVal = []
          var outVal = []
          for (const item of obj) {
            if (item.type === 'in') {
              inArray.push(item)
              xName.push(moment(item.time).format('MM-DD HH:mm:ss'))
              inVal.push(item.value)
            } else if (item.type === 'out') {
              outArray.push(item)
              outVal.push(item.value)
            }
          }
          chartFunc(index, xName, inVal, outVal, data.data.unit)
        }
      }
    });
  }

  async function getComponentData() {
    const obj = {
      id: "{$Think.get.id}"
    }
    $.ajax({
      type: "GET",
      url: '' + '/dcim/detail',
      data: obj,
      success: function (data) {
        if (data.status !== 200) {
          return
        }
        chartsData = data.data.switch ? data.data.switch : []
        let str = ``
        for (let i = 0; i < chartsData.length; i++) {
          const item = chartsData[i];
          timeArray.push({
            startTime: '',
            endTime: ''
          })
          typeArray.push({
            type: '7'
          })
          switch_id.push(chartsData[i].switch_id)
          name.push(chartsData[i].name)
          str += `<div
                    class="w-100 h-100">
                    <select class="form-control" id="chartSelect${i}" class="second_type" name="type" onchange="getChartDataFn(${i})">
                      <option value="24">24{$Lang.hour}</option>
                      <option value="3">3{$Lang.day}</option>
                      <option value="7" selected>7{$Lang.day}</option>
                      <option value="30">30{$Lang.day}</option>
                      <option value="999">{$Lang.whole}</option>
                    </select>
                    <div style="height: 500px" class="w-100 h-100 d-flex justify-content-center" id="balanceCharts${i}"></div>
                    </div>`
        }
        $('#home1').append(str);
        for (let j = 0; j < chartsData.length; j++) {
          getChartDataFn(j)
        }
      }
    });
  }

  function selectTimeTypeFunc(index) {
    typeArray[index].type = $(`#chartSelect${index}`).val();

    if (typeArray[index].type === '7') { // 7天
      timeArray[index].startTime = moment(Date.now() - 7 * 24 * 3600 * 1000).format('YYYY-MM-DD')
    } else if (typeArray[index].type === '3') { // 3天
      timeArray[index].startTime = moment(Date.now() - 3 * 24 * 3600 * 1000).format('YYYY-MM-DD')
    } else if (typeArray[index].type === '30') { // 30天
      timeArray[index].startTime = moment(Date.now() - 30 * 24 * 3600 * 1000).format('YYYY-MM-DD')
    } else if (typeArray[index].type === '24') { // 24h
      timeArray[index].startTime = moment(Date.now() - 24 * 3600 * 1000).format('YYYY-MM-DD')
    } else if (typeArray[index].type === '999') { // q全部
      timeArray[index].startTime = ''
    }
  }

  function chartFunc(index, xNameArray, inValArray, outValArray, unitY) {


    var inflow = '{$Lang.inflow_flow}'
    var outflow = '{$Lang.outflow_flow}'
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('balanceCharts' + index))
    var option = {
      tooltip: {
        show: true,
        backgroundColor: '#fff',
        borderColor: '#eee',
        showContent: true,
        extraCssText: 'box-shadow: 0 1px 9px rgba(0, 0, 0, 0.1);',
        textStyle: {
          color: '#1e1e2d',
          textBorderWidth: 1
        },
        trigger: 'axis',
        axisPointer: {
          color: '#D9DAEA'
        }
      },
      grid: {
        left: '5%',
        right: '5%',
        bottom: '10%',
        top: '8%',
        containLabel: true
      },
      color: ['#007bfc', '#3fbf70'],
      dataZoom: [ // 缩放
        {
          type: 'inside',
          throttle: 50
        }
      ],
      xAxis: {
        splitLine: {
          show: false
        },
        axisLine: {
          lineStyle: {
            color: '#1e1e2d'
          }
        },
        axisTick: {
          show: false
        },
        type: 'category',
        boundaryGap: false,
        data: xNameArray
      },
      yAxis: {
        axisLabel: {
          // formatter: '{value}' + unitY
          formatter: function (value) {
            return value + unitY
          }
        },
        axisLine: {
          show: false
        },
        minorTick: {
          show: false
        },
        axisTick: {
          show: false
        },
        splitLine: {
          lineStyle: {
            color: '#f5f4f8'
          }
        },
        type: 'value'
      },
      series: [{
          name: inflow,
          type: 'line',
          smooth: true,
          data: inValArray
        },
        {
          name: outflow,
          type: 'line',
          smooth: true,
          data: outValArray
        }
      ]
    }
    myChart.setOption(option, true) // true重绘
    window.addEventListener('resize', function () {
      myChart.resize()
    })
  }
</script>

<script>
  // 用量tabs
  let usedChart = null
  let usedStartTime
  let usedEndTime

  $(document).ready(function () {
    if ('{$Detail.host_data.show_traffic_usage}') {
      chartOption()
    }
    if ($('#startingTime,#endTime').length > 0) getData()
    window.addEventListener('resize', function () {
      if (usedChart) usedChart.resize()
    })
  })
  $('#usedLi').on('click', function () {
    if (usedChart) {
      setTimeout(function () {
        usedChart.resize()
      }, 0);
    }
  });

  $('#startingTime,#endTime').on('change', function () {
    usedStartTime = $('#startingTime').val()
    usedEndTime = $('#endTime').val()
    getData()
  });
  // 图表配置
  function chartOption() {
    usedChart = echarts.init(document.getElementById('usedChartBox'))
    usedChart.setOption({
      backgroundColor: '#fff',
      title: {
        subtext: '',
        left: 'center',
        textAlign: 'left',
        subtextStyle: {
          lineHeight: 400
        }
      },
      tooltip: {
        backgroundColor: '#fff',
        padding: [10, 20, 10, 8],
        textStyle: {
          color: '#000',
          fontSize: 12
        },
        trigger: 'axis',
        axisPointer: {
          type: 'line',
          lineStyle: {
            color: '#7dcb8f'
          }
        },
        formatter: function (params, ticket, callback) {
          // 
          const res = `
                    <div>
                      <div>` + '{$Lang.traffic_usage}' + `：${params[0].value}GB </div>
                      <div>${params[0].axisValue}</div>
                    </div>
                    `
          return res
        },
        extraCssText: 'box-shadow: 0px 4px 13px 1px rgba(1, 24, 167, 0.1);'
      },
      grid: {
        left: '80',
        top: 20,
        x: 70,
        x2: 50,
        y2: 80
      },
      xAxis: {
        offset: 15,
        type: 'category',
        data: [],
        boundaryGap: false,
        axisTick: {
          show: false
        },
        // 改变x轴颜色
        axisLine: {
          lineStyle: {
            type: 'dashed',
            color: '#ddd',
            width: 1
          }
        },
        axisLabel: {
          show: true,
          textStyle: {
            color: '#999'
          }
        }
      },
      yAxis: {
        type: 'value',
        // 轴网格
        splitLine: {
          show: true,
          lineStyle: {
            color: '#ddd',
            type: 'dashed'
          }
        },
        axisTick: {
          show: false // 轴刻度不显示
        },
        axisLine: {
          show: false
        },
        axisLabel: {
          show: true,
          textStyle: {
            color: '#999'
          },
          formatter: '{value}GB'
        }
      },
      series: [{
        name: '用量',
        type: 'line',
        smooth: true,
        showSymbol: true,
        symbol: 'circle',
        symbolSize: 3,
        // data: ['1200', '1400', '1008', '1411', '1026', '1288', '1300', '800', '1100', '1000', '1118', '123456'],
        data: [],
        areaStyle: {
          normal: {
            color: '#d4d1da',
            opacity: 0.2
          }
        },
        itemStyle: {
          normal: {
            color: '#0061ff' // 主要线条的颜色
          }
        },
        lineStyle: {
          normal: {
            width: 4,
            shadowColor: 'rgba(0,0,0,0.4)',
            shadowBlur: 10,
            shadowOffsetY: 10
          }
        }
      }]
    })
  }

  // 获取数据
  async function getData() {
    usedChart.showLoading({
      text: '{$Lang.data_loading}' + '...',
      color: '#999',
      textStyle: {
        fontSize: 30,
        color: '#444'
      },
      effectOption: {
        backgroundColor: 'rgba(0, 0, 0, 0)'
      }
    })



    const obj = {
      id: '{$Think.get.id}',
      start: usedStartTime,
      end: usedEndTime
    }
    $.ajax({
      type: "get",
      url: '' + '/dcim/traffic_usage',
      data: obj,
      success: function (data) {

        usedChart.hideLoading()
        if (data.status !== 200) return false
        const xData = []
        const seriesData = [];
        (data.data || []).forEach(item => {
          xData.push(item.time)
          seriesData.push(item.value)
        })
        usedChart.setOption({
          title: {
            subtext: xData.length ? '' : '{$Lang.no_data_available}'
          },
          xAxis: {
            data: xData
          },
          series: [{
            data: seriesData
          }]
        })
        // 如果初始查询没有时间, 则设置默认时间为返回数据的第一个和最后一个时间
        if (!usedStartTime || !usedEndTime) {
          if (data.data.length) {
            usedStartTime = new Date().getFullYear() + '-' + data.data[0].time
            usedEndTime = new Date().getFullYear() + '-' + data.data[data.data.length - 1].time
            $('#startingTime').val(new Date().getFullYear() + '-' + data.data[0].time);
            $('#endTime').val(new Date().getFullYear() + '-' + data.data[data.data.length - 1].time);
          }
        }
      }
    });
  }

  // 分辨率改变, 重绘图表
  function resize() {
    usedChart.resize()
  }

  // 时间选择改变
  function dateChange() {
    const startTimeStamp = new Date(usedStartTime).getTime()
    const endTimeStamp = new Date(usedEndTime).getTime()
    if (usedStartTime && usedEndTime && startTimeStamp < endTimeStamp) {
      getData()
    }
  }
</script>

<script>
  // 获取基础数据
  const obj = {
    host_id: '{$Think.get.id}'
  }
  $.ajax({
    type: "get",
    url: '' + '/host/dedicatedserver',
    data: obj,
    success: function (data) {
      const totalFlow = data.data.host_data.bwlimit // 总流量
      const usedFlow = data.data.host_data.bwusage // 已用流量
      const remainingFlow = (totalFlow - usedFlow).toFixed(1)
      let percentUsed = 100 - parseInt((usedFlow / totalFlow) * 100) || 0
      $('#totalProgress')
        .css('width', percentUsed + '%')
        .attr('aria-valuenow', percentUsed)
        .text(`${percentUsed}%`);

      $('#usedFlowSpan').text(`${usedFlow > 1024 ? ((usedFlow / 1024).toFixed(2) + 'TB') : (usedFlow + 'GB')}`);
      $('#remainingFlow').text(
        `${remainingFlow > 1024 ? ((remainingFlow / 1024).toFixed(2) + 'TB') : (remainingFlow + 'GB')}`);

      // 产品状态
      $('#statusBox').append(`<span class="sprite2 ${data.data.host_data.domainstatus}"></span>`)
    }
  });
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
  // 财务的append
  const financeObj = {
    id: '{$Think.get.id}',
    action: 'billing_page'
  }
  $.ajax({
    type: "get",
    url: '' + '/servicedetail',
    data: financeObj,
    success: function (data) {
      $(data).appendTo('#finance');
    }
  });
</script>

{include file="includes/modal"}
<script>
  var getResintallStatusTimer = null;
  $(function () {
    getResintallStatus('{$Think.get.id}');
  })
</script>

<script>
  var clipboard = null
  var clipboardpoppwd = null
  var ips = {:json_encode($Detail.host_data.assignedips)};
  // console.log('ips: ', ips);
  $(document).on('click', '#copyIPContent', function () {
    $('#popModal').modal('show')
    $('#popTitle').text('IP地址')
    var iplist = ''
    if (clipboard) {
      clipboard.destroy()
    }
    for(let item in ips) {
      iplist += `
        <div>
          <span class="copyIPContent${item}">${ips[item]}</span>
          <i class="bx bx-copy pointer text-primary ml-1 btn-copy btnCopyIP${item}" data-clipboard-action="copy" data-clipboard-target=".copyIPContent${item}"></i>
        </div>
      `

      // 复制IP
      clipboard = new ClipboardJS('.btnCopyIP'+item, {
        text: function (trigger) {
          return $('.copyIPContent'+item).text()
        },
        container: document.getElementById('popModal')
      });
      clipboard.on('success', function (e) {
        toastr.success('{$Lang.copy_succeeded}');
      })
    }

    $('#popContent').html(iplist)
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
      {if $Detail.host_data.domainstatus=="Active"}
	  <div>
      <button type="button" class="btn btn-primary btn-sm waves-effect waves-light dcim_service_module_button" onclick="dcim_service_module_button($(this), '{$Think.get.id}')"
                  data-func="crack_pass" data-type="default">{$Lang.crack_password}</button>
      </div>
	  {/if}
    `)
  });


  $('#popModal').on('shown.bs.modal', function () {
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

  // 破解密码
  $(document).on('blur', '.getCrackPsd', function () {
    veriCrackPsd()
  })

  function veriCrackPsd() {
    let result = checkingPwd($(".getCrackPsd").val(), passwordRules.num, passwordRules.upper, passwordRules.lower,
      passwordRules.special)
    if (result.flag) {
      $('#password-error-tip').css('display', 'none');
      $('.getCrackPsd').removeClass("is-invalid");
    } else {
      $("#password-error-tip").html(result.msg);
      $(".getCrackPsd").addClass("is-invalid");
      $('#password-error-tip').css('display', 'block');
    }
  }
  //重装系统
  $(document).on('blur', '.getRebuildPsd', function () {
    veriRebuildPsd()
  })

  function veriRebuildPsd() {
    let result = checkingPwd($(".getRebuildPsd").val(), passwordRules.num, passwordRules.upper, passwordRules.lower,
      passwordRules.special)
    if (result.flag) {
      $('#password-error-tip-rebuild').css('display', 'none');
      $('.getRebuildPsd').removeClass("is-invalid");
    } else {
      $("#password-error-tip-rebuild").html(result.msg);
      $(".getRebuildPsd").addClass("is-invalid");
      $('#password-error-tip-rebuild').css('display', 'block');
    }
  }

  $(function () {
    $("#crackPsdForm").on('click', ".create_random_pass", function (e) {
      veriCrackPsd()
    })
    $("#rebuildPsdForm").on('click', ".create_random_pass", function (e) {
      veriRebuildPsd()
    })
    getOsConf()
  })

  function getOsConf() {
    /*
    $.ajax({
      type: "POST",
      url: setting_web_url + '/provision/custom/{$Think.get.id}',
      data: {
        func: 'getMirrorOsConfig',
      },
      success: function (res) {
        if(typeof res.data != 'undefined'){
          $('#dcimModuleReinstallPartSetting').data('data', res.data)
        }
      },
      error: function () {
        
      }
    })
    */
  }
</script>