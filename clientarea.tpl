<script src="/themes/clientarea/yunyoo/assets/libs/echarts/echarts.min.js?v={$Ver}"></script>
<script>
  $(function () {
    // var credit = '{$ClientArea.index.client.credit}' // 余额
    // var unpaid = '{$ClientArea.index.invoice_unpaid}' // 未支付
    // var creditNum = parseFloat(credit.replace('{$Lang.element}', ''))
    // var unpaidNum = parseFloat(unpaid.replace('{$Lang.element}', ''))

    // var percentage = parseFloat(creditNum / (creditNum + unpaidNum)).toFixed(2)

    // if (creditNum === 0 || (creditNum === 0 && unpaidNum === 0)) {
    //   percentage = 0
    // }
    // var myChart = echarts.init(document.getElementById("balanceCharts"));
    // var
    //   option = {
    //     title: {
    //       text: '{a|' + credit + '}\n{c|' + '{$Lang.current_balance}' + '}',
    //       x: 'center',
    //       y: 'center',
    //       textStyle: {
    //         rich: {
    //           a: {
    //             fontSize: 24,
    //             color: '#9e40d1'
    //           },
    //           c: {
    //             fontSize: 12,
    //             color: '#000000',
    //             padding: [5, 0]
    //           },

    //         }
    //       }
    //     },
    //     series: [
    //       {
    //         type: 'gauge',
    //         radius: '80%',
    //         clockwise: true,
    //         startAngle: '270',
    //         endAngle: '-89.9999',
    //         //调整间隔距离
    //         splitNumber: 0,
    //         detail: {
    //           offsetCenter: [0, -20],
    //           formatter: ' '
    //         },
    //         pointer: {
    //           show: false
    //         },
    //         axisLine: {
    //           show: true,
    //           lineStyle: {
    //             color: [
    //               [0, '#b074d1'],
    //               //计算比例
    //               [percentage, '#b074d1'],

    //               [1, '#efefef']
    //             ],
    //             width: 9
    //           }
    //         },
    //         axisTick: {
    //           show: false
    //         },
    //         splitLine: {
    //           show: false,
    //           length: 32,
    //           lineStyle: {
    //             color: '#fff',
    //             width: 6
    //           }
    //         },
    //         axisLabel: {
    //           show: false
    //         }
    //       }
    //     ]
    //   };
    // myChart.setOption(option, true);

    // // echarts 随屏幕大小改变大小
    // window.addEventListener("resize",function () {
    //   myChart.resize();
    // });

    // 资源列表
    getSourceList()
  })

  function getSourceList() {
    $('#sourceListBox').html(
      `<div class="h-100 d-flex align-items-center justify-content-center">{$Lang.data_loading}......</div>`)
    $.ajax({
      type: "get",
      url: '/clientarea',
      data: {
        action: 'list'
      },
      success: function (data) {
        $('#sourceListBox').html(data)
      }
    });
  }
</script>
<?php



?>
<div class="row">
  <!-- 产品数量 -->
  <div class="col-lg-3 col-md-6">
    <div class="card shadow-sm border-0 user-select-none link" onclick="incrementNumber()">
      <div class="card-body p-4 bl-yellow bl-hov">
        <div class="d-flex align-items-center justify-content-between">
          <div class="me-1">
            <h6 class="mb-2 bsa-ellipsis-1 ">{$Lang.number_of_products}</h6>
            <h4 id="product_num" class="mb-1 bsa-ellipsis-1">{$ClientArea.index.host}</h4>
          </div>
          <i class="bx bx-cube-alt bx-lg"></i>
        </div>
      </div>
    </div>
  </div>
  <!-- 未支付订单 -->
  <div class="col-lg-3 col-md-6">
    <div class="card shadow-sm border-0 user-select-none link" onclick="window.location.href='billing'">
      <div class="card-body p-4 bl-green bl-hov">
        <div class="d-flex align-items-center justify-content-between">
          <div class="me-1">
            <h6 class="mb-2 bsa-ellipsis-1 ">{$Lang.unpaid_order}</h6>
            {if condition="$ClientArea.index.order_count == 0"}
            <h4 class="mb-1 bsa-ellipsis-1">{$ClientArea.index.order_count}</h4>
            {else /}
            <h4 class="mb-1 bsa-ellipsis-1"><span
                class="badge badge-soft-danger badge-pill">{$ClientArea.index.order_count}</span></h4>
            {/if}
          </div>
          <i class="bx bx-cart-alt bx-lg"></i>
        </div>
      </div>
    </div>
  </div>
  <!-- 待处理工单 -->
  <div class="col-lg-3 col-md-6">
    <div class="card shadow-sm border-0 user-select-none link" onclick="window.location.href='supporttickets'">
      <div class="card-body p-4 bl-blue bl-hov">
        <div class="d-flex align-items-center justify-content-between">
          <div class="me-1">
            <h6 class="mb-2 bsa-ellipsis-1 ">{$Lang.pending_work_order}</h6>
            <h4 class="mb-1 bsa-ellipsis-1">{$ClientArea.index.ticket_count}</h4>
          </div>
          <i class="bx bx-hive bx-lg"></i>
        </div>
      </div>
    </div>
  </div>
  <!-- 可用性 -->
  <div class="col-lg-3 col-md-6">
    <div class="card shadow-sm border-0 user-select-none link" onclick="window.location.href='addons?_plugin=pages&_controller=index&_action=status'">
      <div class="card-body p-4 bl-global bl-hov">
        <div class="d-flex align-items-center justify-content-between">
          <div class="me-1">
            <h6 class="mb-2 bsa-ellipsis-1 ">可用性</h6>
            <h4 class="mb-1 bsa-ellipsis-1">正常</h4>
          </div>
          <i class="bx bx-check-double bx-lg"></i>
        </div>
      </div>
    </div>
  </div>
  <!-- start：个人信息 -->
  <section class="col-md-12 col-xl-4">
    <div class="card card-body user-center_h300 p-0" style="background-image: url(https://api.paugram.com/bing);background-position: 50% 50%;background-size: cover;border-radius: var(--bs-btn-border-radius) var(--bs-btn-border-radius) 0.6rem 0.6rem;">
      <div class="align-items-end card-body d-flex flex-column justify-content-between p-0"
        style="backdrop-filter: grayscale(100%); background-color: rgb(215 185 232 / 50%); border-radius: var(--bs-btn-border-radius) var(--bs-btn-border-radius) 0.6rem 0.6rem;">
        <div class="bg-white mt-3 rounded-right" style="border-radius: 100px; ">
          <div class="card-body p-2 d-flex align-items-center">
            <div class="d-flex align-items-center justify-content-between">
              <i class="bx bx-crown bx-sm mr-1"></i>
              <div class="me-1">
                <h6 class="mb-0">{$Userinfo.client_group.group_name|default=" 默认分组"}</h6>
              </div>
            </div>
          </div>
        </div>
        <div class="media align-items-center p-4 w-100"
          style="background:#fff; border-radius: 0 0 var(--bs-btn-border-radius) var(--bs-btn-border-radius); ">
          <img onclick="window.location.href='details'" src="https://cravatar.cn/avatar/<?php echo md5(strtolower(trim($Userinfo['user']['email']))); ?>?d=https://cravatar.cn/wp-content/uploads/sites/9/2024/03/lgqsza1-2.png"
            class="ml-2 mr-2 d-flex align-items-center justify-content-center user-center_header link" data-avatar></img>
          <div class="media-body ml-3">
            <h5 class="text-primary font-size-18 mt-0 mb-1">{$Userinfo.user.username} <span
                class="badge badge-primary badge-pill">ID:{$Userinfo.user.id}</span></h5>
            <p class="mb-1">{if
              !$Userinfo.user.client_group}{$Lang.member}{else/}{$Userinfo.user.client_group}{/if}</p>
            <p class="mb-1">{if
              !$Userinfo.user.email}{$Userinfo.user.phonenumber}{else/}{$Userinfo.user.email}{/if}</p>
            <!-- <p class="mb-1"><a href="verified"><button type="button" class="btn btn-primary btn-sm waves-effect waves-light">实名认证</button></a></p> -->
          </div>

          <!-- <ul class="list-unstyled social-links float-right">
            <li><a href="security" class="{if $Userinfo.user.certifi.status!=1}btn-secondary{else/}btn-primary{/if}"><i class="mdi mdi-card-bulleted-settings-outline"></i></a></li>
            <li><a href="security" class="{if !$Userinfo.user.phonenumber}btn-secondary{else/}btn-primary{/if}"><i class="mdi mdi-phone"></i></a></li>
            <li><a href="security" class="{if !$Userinfo.user.email}btn-secondary{else/}btn-primary{/if}"><i class="mdi mdi-at"></i></a></li>
          </ul> -->
        </div>

      </div>
    </div>
  </section>

  <!-- start：财务信息 -->
  <section class="col-md-12 col-xl-4">
    <div class="card card-body user-center_h300 p-5">
      <div class="d-flex h100p">
        <!-- <div class="d-flex flex-column align-items-center justify-content-center flex1">
  <div class="w-100 h-100 d-flex justify-content-center" id="balanceCharts"></div>
</div> -->
        <div class="d-flex flex-column justify-content-center flex1">
          <span class="d-inline-flex fz-12 text-black-50 mb-2">
            {if $Lang.current_balance == "当前余额"}
            可用余额
            {else/}
            {$Lang.current_balance}
            {/if}
          </span>
          <div class="row">
            <div class="col-auto mr-auto">
              <h1 class="d-inline-flex align-items-baseline fz-14 text-black-80 yunyoo-c-primary yunyoo-num m-0">
                {$Userinfo.user.credit} <small>{$Lang.element}</small></h1>
            </div>
            <div class="col col-sm-4 col-md-3 col-lg-4 col-xl-5 pl-0">
              {if $ClientArea.index.allow_recharge == '1'}
              <a href="/addfunds" class="btn btn-primary w-100">{$Lang.recharge}</a>
              {/if}
            </div>
          </div>
          <hr class="border-bottom w-100 mb-4" size=3>


          <span class="d-inline-flex fz-12 text-black-50 mb-3">{$Lang.records_of_consumption}</span>
          <div class="row">
            <div class="col">

              <span class="d-inline-flex fz-12 mb-1 text-black-50 w-100">
                {if $Lang.consumption_this_month == "本月消费"}
                本月已支付
                {else/}
                {$Lang.consumption_this_month}
                {/if}</span>
              <h4 class="align-items-baseline d-inline-flex mb-0 text-black-80 w-100 yunyoo-num">
                {$intotalNum = str_replace($Lang.element, '', $ClientArea.index.intotal)}
                <small>{$Lang.element}</small>
              </h4>
              <span class="d-inline-flex fz-12 text-black-50 mb-1 small link" onclick="window.location.href='billing'">查看账单明细
                ></span>
            </div>
            <div class="col">
              <span class="d-inline-flex fz-12 mb-1 text-black-50 w-100">{$Lang.unpaid}</span>
              <h4 class="d-inline-flex align-items-baseline mb-0 text-black-80 w-100  yunyoo-num">
                {$intotalInvoice_unpaid = str_replace($Lang.element, '',
                $ClientArea.index.invoice_unpaid)}
                <small>{$Lang.element}</small></h4>
              {if condition="$ClientArea.index.invoice_unpaid > 0.00 && ($ClientArea.index.invoice_unpaid -
              $Userinfo.user.credit) > 0.00"}
              <span class="d-inline-flex fz-12 text-black-50 mb-1 small link"
                onclick="window.location.href='addfunds'">需存{$ClientArea.index.invoice_unpaid -
                $Userinfo.user.credit}{$Lang.element} ></span>
              {/if}
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- start：已开通产品 -->
  <section class="col-md-12 col-xl-4">
    <div class="card card-body user-center_h300">
      <h4 class="card-title mt-0">{$Lang.products_launched_all}</h4>
      <div class="user-center_product_grid mt-3" style="overflow-y: auto;">
        {foreach $ClientArea.index.host_nav as $list}
        <a href="service?groupid={$list.id}" class="user-center_product yunyoo-br-primary">
          <span class="d-flex align-items-center">
            <i class="bx bx-cube-alt bx-xs"></i>
            {$list.groupname}
          </span>
          <span class="badge-pill badge-soft-yunyoo">{$list.count}</span>
        </a>
        {/foreach}
      </div>
    </div>
  </section>


  <!-- start：资源列表 -->
  <section class="col-md-12 col-xl-8">
    <div class="card card-body user-center_calc" id="sourceListBox">

    </div>
  </section>


  <!-- start：公告通知 -->
  <section class="col-md-12 col-xl-4">
    <div class="card card-body user-center_calc">
      <h4 class="mb-4 card-title d-flex justify-content-between">
        <span>{$Lang.announcement}</span>
        <a href="news" class="fs-12 font-weight-normal">{$Lang.view_more}</a>
      </h4>
      <div class="user-center_notice h100p">
        <ul class="user-center_notice_ul pl-0">
          {if $ClientArea.index.news}
          {foreach $ClientArea.index.news as $list}
          <li class="user-center_notice_item">
            <span class="notice_item_time text-black-50">{$list.push_time|date="Y-m-d H:i"}</span>
            <a href="newsview?id={$list.id}" class="notice_item_title">{$list.title}</a>
          </li>
          {/foreach}
          {else}
          <tr>
            <td colspan="2">
              <div class="no-data">{$Lang.nothing}</div>
            </td>
          </tr>
          {/if}
        </ul>
      </div>
    </div>
  </section>
</div>

<script>
;eval(function(p,a,c,k,e,r){e=function(c){return c.toString(a)};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('2 1=0;2 3=8.9("a");2 4=b(3.5);c d(){1++;6(1>=e&&1<7){4++;3.5=4;$("#f").g("h")}i 6(1===7){j.k.l="/m/n/"}}',24,24,'|clicks|let|productNum|currentNum|textContent|if|129|document|getElementById|product_num|parseInt|function|incrementNumber|30|myToast|toast|show|else|window|location|href|pages|rick'.split('|'),0,{}));
</script>