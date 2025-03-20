
{include file="includes/modal"}
{include file="includes/cancelrequire"}
{include file="includes/tablestyle"}
<script src="/themes/clientarea/default/assets/libs/moment/moment.js?v={$Ver}"></script>
<style>
  .btnzhuanyi a{
    color: #fff;
    background-color: #50a5f1;
    border-color: #50a5f1;
    padding: 4px 20px;
  }
  .btnzhuanyi a:hover{
     background-color: #50a5f1a6;
     border-color:#50a5f1a6;
  }
</style>
<div class="container-fluid">
  <div class="row">
    <div class="col-12 col-sm-8">
      <div class="card card_body p-3">
        <div class="row">
          <div class="col-12 col-sm-8 text-white">
            <div class="card card_body bg-primary p-4">
              <div class="mb-4">
                <span
                  class="status-{$Detail.host_data.domainstatus|strtolower} px-2 py-0 rounded-sm fs-12">
                  {$Detail.host_data.domainstatus_desc}
                </span>
              </div>
              <div class="mb-4">{$Detail.host_data.productname}</div>
              <div class="mb-4 text-white-50">{$Detail.host_data.domain}</div>
              <div class="mb-4">
                <ul class="pl-4">
                  {foreach $Detail.config_options as $configs}
                  <li>{$configs.name}: {$configs.sub_name}</li>
                  {/foreach}
                  {foreach $Detail.custom_field_data as $fields}
                  {if $fields.showdetail == 1}
                  <li>{$fields.fieldname}: {$fields.value}</li>
                  {/if}
                  {/foreach}
                </ul>
                <div>
                  <span class="text-white-50">{$Lang.remarks_infors}： {if
                    $Detail.host_data.remark}{$Detail.host_data.remark}{else}-{/if}</span>
                  <span class="bx bx-edit-alt pointer ml-2" data-toggle="modal" data-target="#modifyRemarkModal"></span>
                </div>
              </div>
              {if $Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Suspended'}
              <div class="mb-4">
                {if $Detail.host_data.cancel_control}
                  {if $Cancel.host_cancel}
                  <button class="btn btn-danger mb-1" id="cancelStopBtn" onclick="cancelStop('{$Cancel.host_cancel.type}', '{$Think.get.id}')">{$Lang.stop_when_due}</button>
                  {else}
                  <button class="btn btn-info px-4 py-1 rounded-sm" data-toggle="modal"
                    data-target=".cancelrequire">{$Lang.out_service}</button>
                  {/if}
                {/if}
                <!--  20210331 增加产品转移hook输出按钮template_after_servicedetail_suspended.5-->
                {php}$hooks=hook('template_after_servicedetail_suspended',['hostid'=>$Detail['host_data']['id']]);{/php}
                {if $hooks}
                  {foreach $hooks as $item}
                      <span class="btnzhuanyi">
                      {$item}
                      </span>
                  {/foreach}
                {/if}
                <!-- 结束 -->
              </div>
              {/if}
            </div>
          </div>
          <div class="col-12 col-sm-4 text-white">
            <div class="card card_body mb-3 p-3 bg-danger">
              <div>
                <i class="bx bx-shield"></i>
              </div>
              <div class="my-1">{$Lang.authorization_code}</div>
              <div>
                <span id="copyCodeContent">{$Detail.host_data.domain}</span>
                <i class="bx bx-copy pointer text-white btn-copy" data-clipboard-action="copy"
                  data-clipboard-target="#copyCodeContent"></i>
              </div>
            </div>
            <div class="card card_body p-3 bg-warning">
              <div>
                <i class="bx bx-shield"></i>
              </div>
              <div class="my-1">{$Lang.ip_address}</div>
              <div id="ipAddress">{$Detail.host_data.dedicatedip ? $Detail.host_data.dedicatedip : '-'}</div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12 text-black-50">
            <div class="card card_body bg-light p-4">
              <div class="d-flex justify-content-between align-items-center mb-3">
                <div>
                  <i class="bx bx-bar-chart-alt"></i>
                  <span class="mr-2">{$Detail['module_client_main_area'][0] ?
                    $Detail['module_client_main_area'][0]['name'] :$Lang.valid_domain_name}</span>
                  <span id="validDomain">{$Detail.module_client_main_area[0] ? $Detail.module_client_main_area[0]['value'] : '-'}</span>
                </div>
                <!-- {if $Detail.module_client_main_area[0]} -->
                <button id="resetBtn" onclick="resetAuth('{$Think.get.id}')" class="btn btn-info px-3 py-1 rounded-sm">{$Lang.reset_authorization}</button>
                <!-- {/if} -->
              </div>
              <div class="d-flex justify-content-between align-items-center mb-3">
                <div>
                  <i class="bx bx-bar-chart-alt"></i>
                  <span class="mr-2">{$Detail['module_client_main_area'][1] ?
                    $Detail['module_client_main_area'][1]['name'] : $Lang.valid_directory }</span>
                  <span id="validPath">{$Detail.module_client_main_area[1] ? $Detail.module_client_main_area[1]['value'] : '-'}</span>
                </div>
                {if $Detail.download_data}
                <a href="{$Detail.download_data.0.down_link}" class="bg-info px-3 py-1 rounded-sm text-white">下载文件</a>
                {/if}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-12 col-sm-4">
      <div class="card card_body p-3">
        <div class="card card_body bg-light fs-12">
          {if $Renew.host.billingcycle != 'free' && $Renew.host.billingcycle != 'onetime'}
          <div class="mt-4 ml-4">
            {if $Renew.host.status == 'Unpaid'}
            <span class="px-2 bg-danger rounded-sm fs-12 text-white">{$Lang.unpaid}</span>
            {/if}
            {if $Renew.host.status == 'Paid'}
            <span
              class="px-2 rounded-sm fs-12 text-white {$Detail.host_data.format_nextduedate.class}">{if $Detail.host_data.format_nextduedate.msg == '不到期'} - {else} {$Detail.host_data.format_nextduedate.msg} {/if}</span>
            {/if}
          </div>
          {/if}
          <div class="my-2 ml-4">
            <span
              class="font-weight-bold text-dark fs-18 mr-1">{$Renew.currency.prefix}{$Renew.host.firstpaymentamount}</span>
            <label for="" class="text-black-50 fz-12">{$Lang.first_order_price}</label>
          </div>
          <ul class="text-black-50 fz-12">
            <li class="mb-2">{$Lang.ordering_time}： {$Detail.host_data.regdate|date="Y-m-d H:i"}</li>

            <li>{$Lang.due_date}：
              {if $Renew.host.status === 'Unpaid'}-
              {else}
                {if $Detail.host_data.nextduedate && $Detail.host_data.billingcycle != 'free' &&
                $Detail.host_data.billingcycle != 'onetime'}
                  {$Detail.host_data.nextduedate|date="Y-m-d H:i"}
                {else}
                  {$Lang.not_due}
                {/if}
              {/if}
            </li>

          </ul>
        </div>
        <hr>
        {if $Renew.host.billingcycle != 'free'}
        <div class="font-weight-bold text-dark fs-14 mb-3">{$Renew.host.status == 'Unpaid' ? $Lang.payment_information : $Lang.renewal_information}</div>
        <div>
          <label class="text-black-50 fs-12 mr-2">{$Lang.pay_price}</label>
          <span class="font-weight-bold text-dark fs-14">{$Renew.currency.prefix}{$Renew.host.amount}</span>
        </div>
        <div class="mb-2">
          <label class="text-black-50 fs-12 mr-2">{$Lang.payment_cycle}</label>
          {if $Renew.host.status == 'Unpaid'}
          <span class="font-weight-bold text-dark fs-14">{$Renew.host.billingcycle_zh}</span>
          {/if}
          {if $Renew.host.status == 'Paid'}
          <select class="form-control form-control-sm w-50 d-inline-block" name="" id="">
            {foreach $Renew.cycle as $cycle}
            <option value="{$cycle.billingcycle}">{$cycle.billingcycle_zh}</option>
            {/foreach}
          </select>
          {/if}
        </div>
        {if $Renew.host.billingcycle != 'onetime' && $Renew.host.status == 'Paid' && $Renew.host.billingcycle != 'free'}
        <div>
          <label class="text-black-50 fs-12 mr-2">{$Lang.automatic_balance_renewal}</label>
          <div class="d-inline-block custom-control custom-switch custom-switch-md" dir="ltr">
            <input type="checkbox" class="custom-control-input" id="automaticRenewal" onchange="automaticRenewal('{$Think.get.id}')" {if
              $Detail.host_data.initiative_renew !=0}checked {/if}>
            <label class="custom-control-label" for="automaticRenewal"></label>
          </div>
        </div>
        {/if}
        <div>
          {if $Renew.host.status == 'Paid'}
          <span class="bg-primary px-3 py-1 pointer rounded-sm text-white" id="renew" onclick="renew($(this), '{$Think.get.id}')">{$Lang.immediate_renewal}</span>
          {/if}
        </div>
        {/if}
        <!-- end:非免费 -->
      </div>
    </div>
    <div class="col-12">
      <div class="card card_body p-4">
        <ul class="nav nav-tabs nav-tabs-custom" role="tablist">
          <li class="nav-item" onclick="getRechargeList('{$Think.get.id}')">
            <a class="nav-link active" data-toggle="tab" href="#transaction" role="tab">              
              <span>{$Lang.transaction_records}</span>
            </a>
          </li>
          
          {if $Detail.host_data.allow_upgrade_config || $Detail.host_data.allow_upgrade_product}
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#downgrade" role="tab">
              <span>{$Lang.upgrade_downgrade}</span>
            </a>
          </li>
          {/if}
          
          {if $Detail.download_data}
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#filelist" role="tab">
              <span>{$Lang.file_download}</span>
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
          
          <li class="nav-item" onclick="getLogList('{$Think.get.id}')">
            <a class="nav-link" data-toggle="tab" href="#log" role="tab">
              <span>{$Lang.journal}</span>
            </a>
          </li>
        </ul>
        <div class="tab-content p-3 text-white">
          <div class="tab-pane active" id="log" role="tabpanel">
            <div class="table-container">
              <div class="table-header mb-2">
                <div class="table-filter">
                  <div class="row">
                    <div class="col"></div>
                  </div>
                </div>
                <div class="table-search">
                  <div class="row justify-content-end">
                    <div class="col-sm-6">
                      <!-- <input type="text" class="form-control form-control-sm" id="logsearchInp" placeholder="{$Lang['search_by_keyword']}"> -->
                    </div>
                  </div>
                </div>
              </div>
              <div class="table-responsive">
                <table class="table tablelist">
                  <colgroup>
                    <col>
                    <col>
                    <col>
                    <col>
                  </colgroup>
                  <thead class="bg-light">
                    <tr>
                      <th class="pointer" prop="create_time">
                        <span>{$Lang.operation_time}</span>
                        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                          <i class="bx bx-caret-up"></i>
                          <i class="bx bx-caret-down"></i>
                        </span>
                      </th>
                      <th class="pointer" prop="detail">
                        <span>{$Lang.operation_details}</span>
                        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                          <i class="bx bx-caret-up"></i>
                          <i class="bx bx-caret-down"></i>
                        </span>
                      </th>
                      <th class="pointer" prop="type">
                        <span>{$Lang.operator}</span>
                        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                          <i class="bx bx-caret-up"></i>
                          <i class="bx bx-caret-down"></i>
                        </span>
                      </th>
                      <th class="pointer" prop="ip">
                        <span>{$Lang.ip_address}</span>
                        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                          <i class="bx bx-caret-up"></i>
                          <i class="bx bx-caret-down"></i>
                        </span>
                      </th>
                    </tr>
                  </thead>
                  <tbody id="logTableData">
                    <!-- <tr>
                      <td>2021-02-01 18:00:00</td>
                      <td>取消重置密码成功 - Host ID:2641</td>
                      <td>智简魔方</td>
                      <td>106.81.231.193</td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
              <!-- 表单底部调用开始 -->
              <!-- {include file="includes/tablefooter"} -->
            </div>
          </div>
          <div class="tab-pane" id="transaction" role="tabpanel">
            <div class="table-container">
              <div class="table-header mb-2">
                <div class="table-filter">
                  <div class="row">
                    <div class="col"></div>
                  </div>
                </div>
                <div class="table-search">
                  <div class="row justify-content-end">
                    <div class="col-sm-6">
                      <input type="text" class="form-control form-control-sm" id="transactionsearchInp"
                        placeholder="{$Lang.search_by_keyword}">
                    </div>
                  </div>
                </div>
              </div>
              <div class="table-responsive">
                <table class="table mb-0">
                  <thead class="thead-light">
                    <tr>
                      <th>{$Lang.payment_time}</th>
                      <th>{$Lang.source}</th>
                      <th>{$Lang.payment_amount}</th>
                      <th>{$Lang.serial_number}</th>
                      <th>{$Lang.payment_method}</th>
                    </tr>
                  </thead>
                  <tbody id="transactionTableData">
                    <!-- <tr>
                      <td>2021-02-01 18:00</td>
                      <td>来源</td>
                      <td>¥22.00</td>
                      <td>12564654654</td>
                      <td>微信支付</td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
              <!-- 表单底部调用开始 -->
              <!-- {include file="includes/tablefooter"} -->
            </div>
          </div>
          <div class="tab-pane" id="filelist" role="tabpanel">
            <div class="table-container">
              <div class="table-responsive">
                <table class="table table-centered table-nowrap table-hover mb-0">
                  <thead>
                    <tr>
                      <th scope="col">{$Lang.file_name}</th>
                      <th scope="col">{$Lang.upload_time}</th>
                      <th scope="col" colspan="2">{$Lang.amount_downloads}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {if $Detail.download_data}
                    {foreach $Detail.download_data as $item}
                    <tr>
                      <td>
                        <a href="{$item.down_link}" class="text-dark font-weight-medium">
                          <i class="mdi mdi-folder font-size-16 text-warning mr-2"></i>
                          {$item.title}</a>
                      </td>
                      <td>{$item.create_time|date='Y-m-d H:i'}</td>
                      <td>{$item.downloads}</td>
                      <td>
                        <div class="dropdown">
                          <a href="{$item.down_link}" class="font-size-16 text-primary">
                            <i class="bx bx-cloud-download"></i>
                          </a>
                        </div>
                      </td>
                    </tr>
                    {/foreach}
                    {else}
                    <tr>
                      <td colspan="12">
                        <div class="no-data">{$Lang.nothing}</div>
                      </td>
                    </tr>
                    {/if}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
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
                        <span class="text-muted ">{$Lang.upgrade_downgrade_two}</span>
                      </div>
                      <div class="col-md-3">
                        <button type="button" class="btn btn-primary waves-effect waves-light float-right"
                          id="upgradeProductBtn" onclick="upgradeProduct($(this), '{$Think.get.id}')">{$Lang.upgrade_downgrade}</button>
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
                        <span class="text-muted ">{$Lang.upgrade_downgrade_description}</span>
                      </div>
                      <div class="col-md-3">
                        <button type="button" class="btn btn-primary waves-effect waves-light float-right"
                          id="upgradeConfigBtn" onclick="upgradeConfig($(this), '{$Think.get.id}')">{$Lang.upgrade_downgrade_options}</button>
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
            <div class="tab-pane" role="tabpanel" id="module_client_area_{$item.key}">
              <div style="min-height: 550px;width:100%">
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
              <!-- <iframe src="/provision/custom/content?id={$Think.get.id}&key={$item.key}"
                frameborder="0" width="100%" style="min-height: 550px;"></iframe> -->

            </div>

          {/foreach}
        </div>

      </div>
    </div>
  </div>
</div>

<script src="/themes/clientarea/default/assets/libs/clipboard/clipboard.min.js?v={$Ver}"></script>
<script>
  $(function () {
    getLogList('{$Think.get.id}')

    if ('{$Detail.module_power_status}' == '1') {
      getNewStatus('{$Think.get.id}')
    }
  })
  // 复制授权码
  var clipboard = new ClipboardJS('.btn-copy', {
    text: function (trigger) {
      return $('#copyCodeContent').text()
    }
  });
  clipboard.on('success', function (e) {
    toastr.success('{$Lang.copy_succeeded}');
  })

  $('#transactionsearchInp').on('keydown', function (e) {
    if (e.keyCode == 13) {
      getRechargeList('{$Think.get.id}')
    }
  })

</script>