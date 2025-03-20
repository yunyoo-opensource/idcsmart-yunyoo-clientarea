
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
    color: #e3ecf1;
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

  .sj {
    display: block;
    width: 10px;
    height: 10px;
    background: #fff;
    position: absolute;
    bottom: -3px;
    transform: rotate(45deg);
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
  .custom-control-input:disabled+.custom-control-label {
    cursor: not-allowed;
  }

</style>
<!--  -->
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

              </section>
            </div>

          </div>

        </div>

        <div class="pl-4 mr-3 box_left_wrap osbox">
          <span class="text-white-50 fs-12">{$Lang.operating_system}</span>
          {if in_array('reinstall', array_column($Detail.module_button.control, 'func')) &&
          $Detail.host_data.domainstatus=="Active"}
          <span class="ml-0">
            <button type="button" class="service_module_button left_wrap_btn fs-12 restall-btn" data-func="reinstall"
              data-type="default"
              onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')">{$Lang.reinstall_system}</button>
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

          {if $Detail.module_button.control && $Detail.host_data.domainstatus=="Active"}

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

          {/if}

          {if $Detail.module_button.console}

          <div class="btn-group ml-2 mr-2 mt-2">
            {if count($Detail.module_button.console) == 1}
            {foreach $Detail.module_button.console as $item}
            <a class="btn btn-primary service_module_button d-flex align-items-center custom-button"
              href="javascript:void(0);"
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

          <!-- <div class="btn-group ml-2 mr-2 mt-2">

            {if $Detail.host_data.domainstatus == 'Active' && $Detail.host_data.cancel_control}

            <span>

              {if $Cancel.host_cancel}

              <button class="btn btn-danger mb-1 h-100" id="cancelStopBtn"
                onclick="cancelStop('{$Cancel.host_cancel.type}', '{$Think.get.id}')">{if $Cancel.host_cancel.type
                ==
                'Immediate'}{$Lang.stop_now}{else}{$Lang.stop_when_due}{/if}</button>

              {else}

              <button class="btn btn-primary mb-1 h-100 custom-button " data-toggle="modal"
                data-target=".cancelrequire">{$Lang.out_service}</button>
              {/if}

            </span>

            {/if}



          </div> -->

          <!--  20210331 增加产品转移hook输出按钮template_after_servicedetail_suspended.1-->
          {php}$hooks=hook('template_after_servicedetail_suspended',['hostid'=>$Detail['host_data']['id']]);{/php}
          {if $hooks}
          {foreach $hooks as $item}
          <div class="btn-group ml-2 mr-2 mt-2">
            <!-- <button class="btn btn-primary mb-1 h-100 custom-button"  data-toggle="modal"
                data-target=".pullserver">{$item}</button> -->
            {$item}
          </div>
          {/foreach}
          {/if}
          <!-- 结束 -->

        </div>

      </div>

    </div>

  </div>
  <div class="row bottom-box">

    <div class="col-md-3">

      <div class="card">

        <div class="card-body">

          <!-- <div class="mb-3 text-center" data-toggle="popover" data-trigger="hover" data-html="true"
            data-placement="bottom"
            data-content="{$Lang.user_name}：{$Detail.host_data.username}<br>{$Lang.password}：{$Detail.host_data.password}<br>{$Lang.port}：{if $Detail.host_data.port == '0'}{$Lang.defaults}{else/}{$Detail.host_data.port}{/if}"
            style="width: 100px;height: 30px;line-height: 30px;background-color: #ffffff;box-shadow: 0px 4px 20px 2px rgba(6, 75, 179, 0.08);border-radius: 4px;cursor: pointer;">
          <div class="mb-3 text-center" id="logininfo" style="width: 100px;height: 30px;line-height: 30px;background-color: #ffffff;box-shadow: 0px 4px 20px 2px rgba(6, 75, 179, 0.08);border-radius: 4px;cursor: pointer;">
            {$Lang.login_information}
          </div> -->

          <div class="row">
            <!-- 登录信息start -->
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
                  <!-- <i class="fas fa-eye pointer ml-2 text-black" onclick="togglePwd()"></i> -->
                  <!-- <i class="bx bx-copy pointer ml-1 btn-copy text-black" id="btnCopyPwd" data-clipboard-action="copy"
                    data-clipboard-target="#copyPwdContent"></i> -->

                  {if in_array('crack_pass', array_column($Detail.module_button.control, 'func')) &&
                  $Detail.host_data.domainstatus=="Active"}

                  <button type="button" class="service_module_button ml-0 left_wrap_btn fs-12 fr" data-func="crack_pass"
                    data-type="default" style="white-space: nowrap;"
                    onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')">{$Lang.reset_password}</button>

                  {/if}
                </p>
                <p class="mb-0">{$Lang.port}：{if $Detail.host_data.port ==
                  '0'}{$Lang.defaults}{else/}{$Detail.host_data.port}{/if}</p>

              </div>
            </div>
            {/if}
            <!-- 登录信息end -->
            <!-- 面板管理信息start -->
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
                <p class="mb-0">{$Lang.panel_manage_password}：
                  <!-- <span id="hidePanelPasswd">***********</span> -->
                  <span data-toggle="popover" data-placement="top" data-trigger="hover" data-content="复制"
                    id="panelPasswd" class="btnCopyPanelPasswd dc pointer">{$temp_custom_field_data['panel_passwd'] ??
                    ($temp_custom_field_data['面板管理密码'] ?:'--')}</span>
                  <!-- <i class="fas fa-eye pointer ml-2 text-black" onclick="togglePanelPasswd()"></i> -->
                  <!-- <i class="bx bx-copy pointer ml-1 btn-copy text-black" id="btnCopyPanelPasswd" data-clipboard-action="copy" data-clipboard-target="#panelPasswd"></i> -->
                </p>
                {/if}
              </div>
            </div>
            {/if}
            <!-- 面板管理信息end -->
          </div>
          <!-- 流量 -->
          {if ($Detail.host_data.domainstatus == 'Active' || ($Detail.host_data.domainstatus == 'Suspended' && $Detail.host_data.suspendreason_type == 'flow')) && $Detail.host_data.bwlimit > 0}
            <!-- <div class="d-flex justify-content-end mb-2">
              <button type="button" class="btn btn-success btn-sm waves-effect waves-light" id="orderFlowBtn"
                onclick="orderFlow($(this), '{$Think.get.id}')">{$Lang.order_flow}</button>
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
            <button type="button" class="btn btn-success btn-sm waves-effect waves-light rsb ml-2" id="orderFlowBtn"
              onclick="orderFlow($(this), '{$Think.get.id}')">{$Lang.order_flow}</button>
          </div>
          {/if}
          <!-- 流量end -->
          <div class="row">
            <!-- 订购价格start -->

            <!-- <div class="col-12 my-2">
                <div class="d-flex justify-content-between align-items-center">
                  <span>{$Lang.first_order_price}</span>
                  {if $Detail.host_data.billingcycle != 'free' && $Detail.host_data.billingcycle != 'onetime' &&
                  ($Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Suspended')}
                  {if $Detail.host_data.status == 'Paid'}
                  <button type="button" class="btn btn-primary btn-sm waves-effect waves-light" id="renew"
                    onclick="renew($(this), '{$Think.get.id}')">{$Lang.immediate_renewal}</button>
                  {/if}
                  {if $Detail.host_data.status == 'Unpaid'}
                  <a href="viewbilling?id={$Detail.host_data.invoice_id}">
                    <button type="button" class="btn btn-primary btn-sm waves-effect waves-light"
                      id="renewpay">{$Lang.immediate_renewal}</button>
                  </a>
                  {/if}
                  {/if}
                </div>
              </div> -->
            <div class="col-12 mb-2">
              <div class="bg-light card-body bg-gray pre-money-box">
                <p class="text-gray">
                  {$Lang.first_order_price}
                  <span class="fr">{if $Detail.host_data.format_nextduedate.msg == '不到期'}  {else}
                    {$Detail.host_data.format_nextduedate.msg} {/if}</span>
                </p>

                <section class="d-flex align-items-center">
                  <h3 class="mb-0 mr-2 dc">
                    {$Detail.host_data.firstpaymentamount_desc?$Detail.host_data.firstpaymentamount_desc:'-'}</h3>
                  <!-- <span class="badge
                        {$Detail.host_data.format_nextduedate.class}">{if $Detail.host_data.format_nextduedate.msg == '不到期'} - {else} {$Detail.host_data.format_nextduedate.msg} {/if}</span> -->
                </section>
                {if $Renew.host.billingcycle != 'onetime' && $Renew.host.status == 'Paid' && $Renew.host.billingcycle !=
                'free'}
                <section class="d-flex align-items-center flex-wrap">
                  <span>{$Lang.automatic_balance_renewal}</span>
                  <div class="custom-control custom-switch custom-switch-md mb-4 ml-2" dir="ltr">
                    <input type="checkbox" class="custom-control-input" id="automaticRenewal" 
                      onchange="automaticRenewal('{$Think.get.id}')" {if $Detail.host_data.initiative_renew !=0}checked
                      {/if} {if $Detail.host_data.billingcycle ==ontrial}disabled
                      {/if} > <label class="custom-control-label" for="automaticRenewal"></label>
                  </div>
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
                {/if}
                <section class="text-gray">
                  <p>{$Lang.subscription_date}：{$Detail.host_data.regdate|date="Y-m-d H:i"}</p>
                  <p>{$Lang.payment_cycle}：{$Detail.host_data.billingcycle_desc}</p>
                  {if $Detail.host_data.billingcycle == 'free' || $Detail.host_data.billingcycle == 'onetime'}
                  <p>{$Lang.due_date}：{if $Detail.host_data.format_nextduedate.msg == '不到期'} - {else}
                    {$Detail.host_data.format_nextduedate.msg} {/if}</p>
                  {else}
                  <p>{$Lang.due_date}：{$Detail.host_data.nextduedate|date="Y-m-d H:i"}</p>
                  {/if}
                </section>
              </div>
            </div>
            <!-- 订购价格end -->
          </div>
          <!-- 远程地址 建站解析 -->
          <div id="cloud_nat">
            {if $Detail.dcimcloud && ($Detail.dcimcloud.nat_acl || $Detail.dcimcloud.nat_web)}
            <div class="bg-primary rounded-sm d-flex flex-column justify-content-center text-white py-2 px-1 mb-2">
              {if $Detail.dcimcloud.nat_acl}
              <div class="d-flex justify-content-between align-items-center">
                <span>
                  <label>{$Lang.remote_address}：</label>
                  <span id="nat_aclBox">{$Detail.dcimcloud.nat_acl}</span>
                </span>
                <span>
                  <i class="bx bx-copy pointer text-white btn-copy" id="btnCopyaclBox" data-clipboard-action="copy"
                    data-clipboard-target="#nat_aclBox"></i>
                </span>
              </div>
              {/if}
              {if $Detail.dcimcloud.nat_web}
              <div class="d-flex justify-content-between align-items-center">
                <span>
                  <label>{$Lang.ip_address}建站解析：</label>
                  <span id="nat_webBox">{$Detail.dcimcloud.nat_web}</span>
                </span>
                <span>
                  <i class="bx bx-copy pointer text-white btn-copy" id="btnCopywebBox" data-clipboard-action="copy"
                    data-clipboard-target="#nat_webBox"></i>
                </span>
              </div>
              {/if}
            </div>
            {/if}
          </div>
          <!-- 配置项 -->
          <div class="row">

            {foreach $Detail.config_options as $item}

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
            <div onclick="isShowConfiguration()" class="configuration-btn-down isClick">{$Lang.view_more_information}</div>
            <div class="col-12 mb-2">

              <div data-toggle="popover" data-placement="top" data-trigger="hover"
                data-content="{$Lang.remarks_infors}：{$Detail.host_data.remark?$Detail.host_data.remark:'-'}"
                class="bg-light card-body bg-gray mg-0 row">

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

        <div class="card-body">

          <ul class="nav nav-tabs nav-tabs-custom" role="tablist">

            {if $Detail.module_chart}

            <li class="nav-item" id="chartLi">

              <a class="nav-link active" data-toggle="tab" href="#home1" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="fas fa-home"></i></span> -->

                <span>{$Lang.charts}</span>

              </a>

            </li>

            {/if}

            {if $Detail.host_data.allow_upgrade_config || $Detail.host_data.allow_upgrade_product}

            <li class="nav-item">

              <a class="nav-link {if !$Detail.module_chart}active{/if}" data-toggle="tab" href="#profile1" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="far fa-user"></i></span> -->

                <span>{$Lang.upgrade_downgrade}</span>

              </a>

            </li>

            {/if}

            {if $Detail.download_data}

            <li class="nav-item">

              <a class="nav-link {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product}active{/if}"
                data-toggle="tab" href="#messages1" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span> -->

                <span>{$Lang.file_download}</span>

              </a>

            </li>

            {/if}

            {if $Detail.host_data.show_traffic_usage}
            <li class="nav-item" id="usedLi">

              <a class="nav-link {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product && !$Detail.download_data}active{/if}"
                data-toggle="tab" href="#dosage" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span> -->

                <span>{$Lang.consumption}</span>

              </a>

            </li>
            {/if}

            {foreach $Detail.module_client_area as $item}

            <li class="nav-item">

              <a class="nav-link" data-toggle="tab" href="#module_client_area_{$item.key}" role="tab">

                <!-- <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span> -->

                <span>{$item.name}</span>

              </a>

            </li>

            {/foreach}

            <li class="nav-item">

              <a class="nav-link {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product && !$Detail.download_data && !$Detail.host_data.show_traffic_usage}active{/if}"
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

          <div class="tab-content p-3 text-muted" style="min-height: 550px;">

            {if $Detail.module_chart}

            <div class="tab-pane active" id="home1" role="tabpanel">

              {include file="includes/chart"}

            </div>

            {/if}

            {if $Detail.host_data.allow_upgrade_config || $Detail.host_data.allow_upgrade_product}
            <div class="tab-pane {if !$Detail.module_chart}active{/if}" id="profile1" role="tabpanel">

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

            <div
              class="tab-pane {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product}active{/if}"
              id="messages1" role="tabpanel">

              {include file="servicedetail/servicedetail-download"}

            </div>

            {/if}

            <div
              class="tab-pane {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product && !$Detail.download_data && !$Detail.host_data.show_traffic_usage}active{/if}"
              id="settings1" role="tabpanel">

              <!-- 日志 -->

            </div>

            {foreach $Detail.module_client_area as $item}

            <div class="tab-pane" role="tabpanel" id="module_client_area_{$item.key}">
              <div style="width:100%;min-height: 550px;">
                <script>
                    $.ajax({
                       url : '/provision/custom/content?id={$Think.get.id}&key={$item.key}'
                      ,type : 'get'
                      ,success : function(res)
                      {
                          $('#module_client_area_{$item.key} > div').html(res);
                      }
                    })
                </script>
              </div>

              <!-- <iframe src="/provision/custom/content?id={$Think.get.id}&key={$item.key}"
                onload="this.height=$($('.main-content .card-body')[1]).height()-72" frameborder="0"
                width="100%"></iframe> -->
              <!-- <iframe src="/provision/custom/content?id={$Think.get.id}&key={$item.key}"
                frameborder="0" width="100%" style="min-height: 550px;"></iframe> -->

            </div>

            {/foreach}

            {if $Detail.host_data.show_traffic_usage}
            <div
              class="tab-pane {if !$Detail.module_chart && !$Detail.host_data.allow_upgrade_config && !$Detail.host_data.allow_upgrade_product && !$Detail.download_data}active{/if}"
              id="dosage" role="tabpanel">

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

<!-- 魔方云救援系统弹窗 --> 
<div class="modal fade" id="moduleDcimCloudRescue" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title mt-0">救援系统</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="dcimcloudRescue">
                <div class="modal-body">

                    <div class="form-group row mb-4">
                        <label for="horizontal-firstname-input" class="col-md-3 col-form-label d-flex justify-content-end"><span style="color: red;"> * </span>救援系统类型</label>
                        <div class="col-md-6">
                            <select class="form-control" name="system">
                                <option value="1">Windows</option>
                                <option value="2">Linux</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <label for="horizontal-firstname-input" class="col-md-3 col-form-label d-flex justify-content-end"><span style="color: red;"> * </span>临时密码</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="temp_pass">
                        </div>
                        <div class="col-md-1 fs-18 d-flex align-items-center">
                            <i class="fas fa-dice create_random_pass pointer" onclick="create_random_pass()"></i>
                        </div>
                        <label id="password-error-tip" class="control-label error-tip" for="temp_pass"></label>
                    </div>
                    <div class="alert alert-danger" role="alert">
                        请妥善保存当前密码，该密码不会二次使用
                    </div>
                    
                    <div id="moduleDcimCloudRescueForceDiv" style="display: none;">
                      <div class="alert alert-danger" role="alert">
                      当前操作需要实例在关机状态下进行<br>
                      为了避免数据丢失，实例将关机中断您的业务，请仔细确认。<br>
                      强制关机可能会导致数据丢失或文件系统损坏，您也可以主动关机后再进行操作。
                      </div>
                      
                      <div class="form-group row mb-4">
                          <label for="horizontal-firstname-input" class="col-md-3 col-form-label d-flex justify-content-end">强制关机</label>
                          <div class="col-md-6 pt-9">
                              <label>
                                  <input type="checkbox" class="mr-1" name="force">同意强制关机
                              </label>
                          </div>
                          <label class="control-label error-tip force-error-tip" for="force">请同意强制关机</label>
                      </div>
                    </div>
                </div>
                <input type="hidden" name="func" value="rescue_system">
                <input type="hidden" name="id" value="{$Think.get.id}">
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{$Lang.cancel}</button>
                <button type="button" class="btn btn-primary submit" onclick="moduleDcimCloudRescue($(this))">{$Lang.determine}</button>
            </div>
        </div>
    </div>
</div>

<!-- 电源状态 -->
<script>
  var showPowerStatus = '{$Detail.module_power_status}';
  var powerStatus = {
    status: '',
    des: ''
  }

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

    if (showPowerStatus == '1') {
      getPowerStatus('{$Think.get.id}')
    }

    $('#powerBox').on('click', function () {
      getPowerStatus('{$Think.get.id}')
    });
  })

  // 获取电源状态
  function getPowerStatus() {

    $('#powerStatusIcon').removeClass()
    $('#powerStatusIcon').addClass('bx bx-loader')

    $.ajax({
      type: "POST",
      url: '' + '/provision/default',
      data: {
        id: '{$Think.get.id}',
        func: 'status'
      },
      success: function (data) {
        $('#powerStatusIcon').attr('data-content', data.data ? data.data.des : data.msg)
        $('#powerStatusIcon').removeClass()
        if (data.status != 200) {
          powerStatus.status = 'unknown'
          powerStatus.des = data.msg
          $('#powerStatusIcon').addClass('sprite unknown')
        } else {
          powerStatus.status = data.data ? data.data.status : 'unknown'
          powerStatus.des = data.data ? data.data.des : '{$Lang.unknown}'
           
          $('#moduleDcimCloudRescueForceDiv').hide();
          $('#moduleDcimCloudRescueForceDiv').removeClass('force_show');
          if (powerStatus.status === 'process') {
            $('#powerStatusIcon').addClass('bx bx-loader')
            $('#moduleDcimCloudRescueForceDiv').show();
            $('#moduleDcimCloudRescueForceDiv').addClass('force_show');
          } else if (powerStatus.status === 'on') {
            $('#powerStatusIcon').addClass('sprite start')
            $('#moduleDcimCloudRescueForceDiv').show();
            $('#moduleDcimCloudRescueForceDiv').addClass('force_show');
          } else if (powerStatus.status === 'off') {
            $('#powerStatusIcon').addClass('sprite closed')
          } else if (powerStatus.status === 'waiting') {
            $('#powerStatusIcon').addClass('sprite waitOn')
          } else if (powerStatus.status === 'suspend') {
            $('#powerStatusIcon').addClass('sprite pause')
          } else if (powerStatus.status === 'wait_reboot' || powerStatus.status === 'wait') {
            $('#powerStatusIcon').addClass('sprite waiting')
          } else if (powerStatus.status === 'cold_migrate') {
            $('#powerStatusIcon').addClass('iconfont icon-shujuqianyi')
          } else if (powerStatus.status === 'hot_migrate') {
            $('#powerStatusIcon').addClass('iconfont icon-shujuqianyi')
          } else {
            $('#powerStatusIcon').addClass('sprite unknown')
          }

          if (data.data.status !== 'process') { // 状态改变, 清除定时器
            clearInterval(timeInterval)
          }
        }

      }
    });
  }

  var timeOut = null
  var timeInterval = null
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
</script>
<script>
  // var showPWd = true
  $(function () {
    // 复制IP
    var clipboard1 = new ClipboardJS('#btnCopyIP', {
      text: function (trigger) {
        return $('#copyIPContent').text()
        // return $("#copyIPOne").text()
      }
    });
    clipboard1.on('success', function (e) {
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

    // 查看密码
    // $('#copyPwdContent').hide()
    // $('#hidePwdBox').hide()

    // 复制密码
    var clipboard2 = new ClipboardJS('.btnCopyPwd', {
      text: function (trigger) {
        return $('#copyPwdContent').text()
      }
    });
    clipboard2.on('success', function (e) {
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

  // 远程地址 建站解析
  // 复制授权码
  var clipboardnat_aclBox = new ClipboardJS('#btnCopyaclBox', {
    text: function (trigger) {
      return $('#nat_aclBox').text()
    }
  });
  clipboardnat_aclBox.on('success', function (e) {
    toastr.success('{$Lang.copy_succeeded}');
  })

  // 复制授权码
  var clipboardnat_webBox = new ClipboardJS('#btnCopywebBox', {
    text: function (trigger) {
      return $('#nat_webBox').text()
    }
  });
  clipboardnat_webBox.on('success', function (e) {
    toastr.success('{$Lang.copy_succeeded}');
  })

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
  // 用量tabs

  let usedChart = null

  let usedStartTime

  let usedEndTime



  $(document).ready(function () {
    //chartOption()

    if ($('#startingTime,#endTime').length > 0) getData()

    window.addEventListener('resize', function () {

      if (usedChart) usedChart.resize()

    })



    $('#usedLi').on('click', function () {

      if (usedChart) {
        setTimeout(function () {

          usedChart.resize()

        }, 0);
      }

    });


    $('#startingTime,#endTime').change(function () {

      usedStartTime = $('#startingTime').val()

      usedEndTime = $('#endTime').val()

      getData()

    });

    // 获取数据

    async function getData() {
      usedChart = echarts.init(document.getElementById('usedChartBox'))

      usedChart.showLoading({

        text: '数据正在加载...',

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

        url: '/host/trafficusage',

        data: obj,

        success: function (data) {

          usedChart.hideLoading()

          if (data.status !== 200) return false

          const xAxisData = []

          const seriesData = [];
          const seriesData2 = [];

          (data.data || []).forEach(item => {

            xAxisData.push(item.time)
            seriesData.push(item.in)
            seriesData2.push(item.out)

          })

          usedChart = echarts.init(document.getElementById('usedChartBox'))

          usedChart.setOption({
            backgroundColor: '#fff',
            title: {
              subtext: '',
              left: 'center',
              textAlign: 'left',
              subtextStyle: {
                lineHeight: 250
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
                //console.log('bar:', params)
                const res = `
          <div>
              <div>接收流量(GB)：${params[0].value} </div>                
              <div>发送流量(GB)：${params[1].value}</div>
              <div>${params[0].axisValue}</div>
          </div>`
                return res
              },
              extraCssText: 'box-shadow: 0px 4px 13px 1px rgba(1, 24, 167, 0.1);'
            },
            grid: {
              left: '80',
              top: 30,
              x: 70,
              x2: 50,
              y2: 80
            },
            dataZoom: [ // 缩放
              {
                type: 'inside',
                throttle: 50
              }
            ],
            xAxis: {
              offset: 15,
              axisLabel: {
                show: true,
                textStyle: {
                  color: '#999'
                }
              },
              type: 'category',
              // 改变x轴颜色
              axisLine: {
                lineStyle: {
                  type: 'dashed',
                  color: '#ddd',
                  width: 1
                }
              },
              // data: ['2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00'].map(function (str) {
              //   return str.replace(' ', '\n')
              // })
              data: xAxisData
            },
            yAxis: {
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
                //  formatter: '{value}' + 'GB'
              },
              // 轴网格
              splitLine: {
                show: true,
                lineStyle: {
                  color: '#ddd',
                  type: 'dashed'
                }
              }

            },
            series: [{
                name: '21',
                type: 'bar',
                stack: '接收流量',
                barGap: '-100%',
                //data: [136, 132, 101, 134, 90, 230, 210, 100, 300],
                data: seriesData,
                itemStyle: {
                  barBorderRadius: [5, 5, 0, 0],
                  color: '#737dff'
                }
              },
              {
                name: '2',
                type: 'bar',
                stack: '使用流量',
                // data: [964, 182, 191, 234, 290, 330, 310, 100, 500],
                data: seriesData2,
                itemStyle: {
                  barBorderRadius: [5, 5, 0, 0],
                  color: '#ccc',
                  opacity: 0.3
                }
              }
            ]
          })

          // 如果初始查询没有时间, 则设置默认时间为返回数据的第一个和最后一个时间

          if (!usedStartTime || !usedEndTime) {

            if (data.data.length) {

              usedStartTime = new Date().getFullYear() + '-' + data.data[0].time

              usedEndTime = new Date().getFullYear() + '-' + data.data[data.data.length - 1].time

              $('#startingTime').val(data.data[0].time);

              $('#endTime').val(data.data[data.data.length - 1].time);

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
  })
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

      const usedFlow = data.data.host_data.bwusage.toFixed(1) // 已用流量

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

      if(typeof data.data.host_data.os !== 'undefined' && data.data.host_data.os.indexOf('win') == -1 && data.data.host_data.os.indexOf('Win') == -1){
        $('#moduleDcimCloudRescue select[name="system"]').find('option').eq(1).attr('selected', 'selected');
      }
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


<script>
  var clipboard = null
  var clipboardpoppwd = null
  var ips = {:json_encode($Detail.host_data.assignedips)
  };
  $(document).on('click', '#copyIPContent', function () {
    // if (ips.length<1) {
    //     return
    // }
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
      <div>
        {if in_array('crack_pass', array_column($Detail.module_button.control, 'func')) && $Detail.host_data.domainstatus=="Active"}
        <button type="button" class="service_module_button ml-2 mt-2 left_wrap_btn fs-12" data-func="crack_pass"
          data-type="default"
          onclick="service_module_button($(this), '{$Think.get.id}', '{$Detail.host_data.type}')">{$Lang.reset_password}</button>
        {/if}
      </div>
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

  //net
  var url = setting_web_url + '/servicedetail?action=nat&id={$Think.get.id}';
  $.ajax({
    url: url,
    type: 'GET',
    success: function (res) {
      $('#cloud_nat').html(res)
    }
  })

  // 获取remoteinfo
  var url = setting_web_url + '/provision/custom/{$Think.get.id}';
  $.ajax({
    url: url,
    type: 'POST',
    data: {
        func: 'remoteInfo',
    },
    success: function (res) {
        if(res.status==200){
            if(res.data.rescue == 0){
                $('.service_module_button').eq(7).hide();
            }else{
                $('.service_module_button').eq(6).hide();
            }
        }else{
            $('.service_module_button').eq(7).hide();
        }
    }
  })


</script>