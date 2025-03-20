<style>
    #protocolModal p{
        font-size: 14px;
        line-height: 25px;
    }
    .blod {
        font-size: 18px;
        font-weight: bold;
    }
    .protocolModalDialog{
        max-width:55% !important;
    }
</style>
<!-- 提示框 -->
<div class="modal fade" id="customModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="customTitle">{$Lang.prompt}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="customBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
                <button type="button" class="btn btn-primary" id="customSureBtn">{$Lang.determine}</button>
            </div>
        </div>
    </div>
</div>


<!-- 未开启 -->
{if $api_open==0}
    <style>
        .api-apply {
            width: 80%;
            height: 600px;
            border: 1px solid #ccc;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .api-apply img {
            width: 200px;
            height: 200px;
        }

        .api-apply-center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .api-apply h4 {
            padding-top: 10px;
        }

        .api-apply .agree {
            padding-top: 10px;
        }
        .need-bind-phone-certify{
            margin-top:10px
        }
        .need-bind-phone-certify a{
            text-decoration-line: underline !important;
            margin-left: 5px;
        }
    </style>
    <div class="card">
        <div class="card-body api-apply-center">
            <div class="api-apply">
                <div class="no-check-pro alert alert-danger alert-dismissible" style="width:500px;display: none;" role="alert">
                    <i class="glyphicon glyphicon-remove-sign"></i>
                    <button type="button" class="close no-check-pro-close" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    {$Lang.api_pro_no_checked}
                </div>
                <img src="/themes/clientarea/yunyoo/assets/images/api0.png">
                {if $api_open_total==0}
                <h4>{$Lang.api_no_open_title_total}</h4>
                {elseif $need_bind_phone==1 || $need_certify==1}
                {if $need_bind_phone==1}
                    <p class="need-bind-phone-certify">使用API功能需要绑定手机<a href="security" >去绑定手机</a></p>
                {/if}
                {if $need_certify==1}
                    <p class="need-bind-phone-certify">使用API功能需要实名认证<a href="verified" >去实名认证</a></p>
                {/if}
                {else}
                <h4>{$Lang.api_no_open_title}</h4>
                <p>{$Lang.api_no_open_sub_title}</p>
                <button type="button" class="apiOn btn btn-primary">{$Lang.api_open_now}</button>
                <p class="agree"><input class="agreeOn" type="checkbox"> <span>{$Lang.api_read_pro} <a href="{$server_clause_url}" target="_blank" class="apiProtocolDisable">《{$Lang.api_protocol}》</a></span>
                    {/if}
            </div>
        </div>
    </div>
    <script>
        $(function () {
            var Lang =  {:json_encode($Lang)};
            $('.no-check-pro').hide()
            $('.no-check-pro-close').on('click', function () {
                $('.no-check-pro').hide()
            })
            $('.apiOn').on('click', function () {
                if (!$('.agreeOn')[0].checked) {
                    $('.no-check-pro').show()
                    var timer = setTimeout(() => {
                        $('.no-check-pro').hide()
                    }, 2000);
                } else {
                    $('.no-check-pro').hide()
                    var text = Lang.api_open_confirm;
                    content = '<div class="d-flex align-items-center"><i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i> ' + text + '</div>';
                    area = ['420px'];
                    $('#customModal').modal('show')
                    $('#customBody').html(content)
                    $(document).on('click', '#customSureBtn', function () {
                        $.ajax({
                            url: "/zjmf_finance_api/open"
                            ,data: {"api_open":1}
                            ,type: 'post'
                            ,dataType: 'json'
                            ,success: function(e){
                                if(e.status != 200)
                                {
                                    toastr.error(e.msg);
                                    return false;
                                }
                                else{
                                    toastr.success(e.msg);
                                    location.reload();
                                }
                            }
                        })
                    });
                }
            })
        })

    </script>
    <!-- 已开启或已锁定-->
{else}
    <style>
        p {
            margin-bottom: 0px;
        }

        .api-manage-top {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .api-manage-top-item {
            border: 1px solid #eee;
            margin-right: 10px;
            flex: 1;
            height: 102px;
            min-width: 357px;
            margin-bottom: 10px;
            overflow: hidden;
            padding: 10px;
        }

        .flex-between {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .api-manage-top-item .img {
            width: 56px;
            height: 56px;
            border-radius: 50%;
        }

        .flex {
            display: flex;
            align-items: center;
        }

        .flex-col {
            display: flex;
            flex-direction: column;
            padding-left: 20px;
        }

        .mt-10 {
            margin-top: 10px;
        }

        .api-manage-top-item-value {
            font-size: 30px;
            color: #333;
        }

        .api-manage-top-item-title {
            font-size: 14px;
            color: #8d8d8d;
        }

        .ml-10 {
            margin-left: 10px;
        }

        .api-charts-top {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            flex-wrap: wrap;
        }

        .date-select-item {
            padding: 3px 5px;
            margin-right: 5px;
            cursor: pointer;
        }

        .date-select-item-active {
            color: #fff;
            background: #108eff;
        }

        .api-manage-sub-title {
            font-size: 14px;
            font-weight: 700;
            color: #333;
        }

        .mb-10 {
            margin-bottom: 10px;
        }

        th {
            font-size: 13px;
        }

        td {
            font-size: 12px;
        }

        .api-manage-modal {
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.2);
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: hidden;
            display: none;
            justify-content: center;
            align-items: center;
        }

        .api-manage-modal-title {
            width: 340px;
            height: 120px;
            background: #fff;
            padding: 30px 40px;
            border-radius: 5px;
            display: flex;
        }
    </style>
    <div class="card">
        <div class="card-body">
            <!-- 头部框框 -->
            <div class="api-manage-top">
                <div class="api-manage-top-item">
                    <p class="flex-between">
                        <span class="api-manage-top-item-title">{$Lang.api_key}：{$API.client.api_password}</span>
                        <span>
              <button id="resetApi" type="button" class="btn btn-primary btn-sm waves-effect waves-light" onclick="resetApiPwd()">{$Lang.api_reset}</button>
              <button id="closeApi" type="button" class="btn btn-danger btn-sm waves-effect waves-light" onclick="closeApi()">{$Lang.api_close}</button>
            </span>
                    </p>
                    <p class="mt-10 api-manage-top-item-title">{$Lang.api_open_date}：{if $API.client.api_create_time}{$API.client.api_create_time|date="Y-m-d H:i:s"}{else}-{/if}</p>
                </div>
                <div class="api-manage-top-item flex">
                    <img class="img" src="/themes/clientarea/yunyoo/assets/images/api1.png">
                    <p class="flex-col">
                        <span class="api-manage-top-item-title">{$Lang.api_product_num}</span>
                        <span class="api-manage-top-item-value">{$API.client.active_count}/{$API.client.host_count}</span>
                    </p>
                </div>
                <div class="api-manage-top-item flex">
                    <img class="img" src="/themes/clientarea/yunyoo/assets/images/api2.png">
                    <p class="flex-col">
                        <span class="api-manage-top-item-title">{$Lang.api_agents_num}</span>
                        <span class="api-manage-top-item-value">{$API.client.agent_count}</span>
                    </p>
                </div>
                <div class="api-manage-top-item flex">
                    <img class="img" src="/themes/clientarea/yunyoo/assets/images/api3.png">
                    <div class="flex-col">
                        <span class="api-manage-top-item-title">{$Lang.api_link_num_today}</span>
                        <p>
                            <span class="api-manage-top-item-value">{$API.client.api_count}</span>
                            <span class="api-manage-top-item-title ml-10">{$Lang.api_comparison}
                                {if $API.client.up}
                                    <i class="bx bx-caret-up" style="color:#34c38f;font-size: 18px;"></i>{$API.client.ratio}
                                    {else}
                                    <i class="bx bx-caret-down" style="color:#34c38f;font-size: 18px;"></i>{$API.client.ratio}
                                {/if}
                            </span>
                        </p>
                    </div>
                </div>
            </div>
            <!-- API请求次数 -->
            <div class="api-charts">
                <div class="api-charts-top">
                    <p class="api-manage-sub-title">{$Lang.api_link_time}</p>
                    <p>
                        <span data-date="week" class="date-select-item date-select-item-active">{$Lang.api_week}</span>
                        <!--<span data-date="month" class="date-select-item">本月</span>
                        <span data-date="year" class="date-select-item">全年</span>
                        <input class="api-charts-date-start" type="datetime-local" onchange="getDataFn()">
                        <span>到</span>
                        <input class="api-charts-date-end" type="datetime-local" onchange="getDataFn()">-->
                    </p>
                </div>
                <div id="api-charts-main" style="width: 100%;height:400px;"></div>
            </div>
            <!-- 豁免产品列表 -->
            <div>
                <div>
                    <p class="api-manage-sub-title mb-10">{$Lang.api_exempted_products}</p>
                </div>
                <div>
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
                                <th>
                                    <span>{$Lang.product_name}</span>
                                </th>
                                <th class="pointer" prop="num">
                                    <span>{$Lang.api_trial_quantity}</span>
                                    <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                      <i class="bx bx-caret-up"></i>
                      <i class="bx bx-caret-down"></i>
                    </span>
                                </th>
                                <th class="pointer" prop="max_num">
                                    <span>{$Lang.api_buy_maxnum}</span>
                                    <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                      <i class="bx bx-caret-up"></i>
                      <i class="bx bx-caret-down"></i>
                    </span>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach $API.free_products as $free_product}
                                <tr>
                                    <td>{$free_product.name}</td>
                                    <td>{$free_product.ontrial}</td>
                                    <td>{$free_product.qty}</td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>
                    <!-- 表单底部调用开始 -->
                    <!-- {include file="includes/tablefooter" url="apilog"} -->
                </div>
            </div>
        </div>
    </div>
    <!-- 锁定提示 模态框 -->
    <div class="api-manage-modal">
        <div class="api-manage-modal-title">
            <p>
                <i class="bx bxs-error-circle" style="font-size: 30px;color:#f0ad4e;"></i>
            </p>
            <p class="ml-10">
                {$Lang.api_lock_title}，<a href="/submitticket">{$Lang.api_contact_admin}</a>
            </p>
        </div>
    </div>
    <script src="/themes/clientarea/yunyoo/assets/libs/echarts/echarts.min.js?v={$Ver}"></script>
    <script>
        // 若已开启API功能 隐藏锁定提示
        {if $api_open==2}
        $('.api-manage-modal').css('display','flex')
        {/if}
        // 窗口大小改变,重载
        // window.onresize = function () {
        //    location.reload()
        // }
        function resetApiPwd() {
            var text = '是否确定重置API';
            content = '<div class="d-flex align-items-center"><i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i> ' + text + '</div>';
            area = ['420px'];
            $('#customModal').modal('show')
            $('#customBody').html(content)
            $(document).on('click', '#customSureBtn', function () {
                $.ajax({
                    url: "/zjmf_finance_api/reset"
                    ,data: ''
                    ,type: 'post'
                    ,dataType: 'json'
                    ,success: function(e){
                        if(e.status != 200)
                        {
                            toastr.error(e.msg);
                            return false;
                        }
                        else{
                            toastr.success(e.msg);
                            location.reload();
                        }
                    }
                })
            });

        }
        function closeApi() {
            var text = '是否确定关闭API';
            content = '<div class="d-flex align-items-center"><i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i> ' + text + '</div>';
            area = ['420px'];
            $('#customModal').modal('show')
            $('#customBody').html(content)
            $(document).on('click', '#customSureBtn', function () {
                $.ajax({
                    url: "/zjmf_finance_api/open"
                    ,data: {"api_open":0}
                    ,type: 'post'
                    ,dataType: 'json'
                    ,success: function(e){
                        if(e.status != 200)
                        {
                            toastr.error(e.msg);
                            return false;
                        }
                        else{
                            toastr.success(e.msg);
                            location.reload();
                        }
                    }
                })
            });

        }

        // 获取echarts渲染数据
        var formApi =  {:json_encode($API.form_api)};
        console.log('formApi', formApi)
        // 获取近七日时间
        function getDay(day){
            var today = new Date();
            var targetday_milliseconds=today.getTime() + 1000*60*60*24*day;
            today.setTime(targetday_milliseconds);
            var tYear = today.getFullYear();
            var tMonth = today.getMonth();
            var tDate = today.getDate();
            tMonth = doHandleMonth(tMonth + 1);
            tDate = doHandleMonth(tDate);
            return tYear+"-"+tMonth+"-"+tDate;
        }
        function doHandleMonth(month){
            var m = month;
            if(month.toString().length == 1){
                m = "0" + month;
            }
            return m;
        }
        $(function () {
            // 默认今日echarts
            let xData = [], yData = [];
            xData = [getDay(-6), getDay(-5), getDay(-4),getDay(-3),getDay(-2),getDay(-1),getDay(0)]
            yData = formApi
            drawEcharts(xData, yData)

            $('.date-select-item').each(function () {
                $(this).on('click', function () {
                    // 全部取消样式
                    $('.date-select-item').each(function () {
                        $(this).removeClass('date-select-item-active');
                    })
                    // 给目标上样式
                    $(this).addClass('date-select-item-active');

                    //ajax 请求-本周/本月/全年
                    console.log($(this)[0].dataset.date);
                    switch ($(this)[0].dataset.date) {
                        case 'week':
                            xData = [getDay(-6), getDay(-5), getDay(-4),getDay(-3),getDay(-2),getDay(-1),getDay(0)]
                            yData = formApi
                            drawEcharts(xData, yData)
                            break;
                        // 月/年
                        // case 'month':
                        //     xData = ['2021-05-01', '2021-05-02', '2021-05-03', '2021-05-04', '2021-05-05', '2021-05-06', '2021-05-07', '2021-05-08', '2021-05-09', '2021-05-10', '2021-05-11', '2021-05-12', '2021-05-13', '2021-05-14', '2021-05-15', '2021-05-16', '2021-05-17', '2021-05-18', '2021-05-19', '2021-05-20', '2021-05-21', '2021-05-22', '2021-05-23', '2021-05-24', '2021-05-25', '2021-05-26', '2021-05-27', '2021-05-28', '2021-05-29', '2021-05-30']
                        //     yData = [35, 38, 25, 40, 45, 40, 50, 60, 70, 55, 66, 77, 45, 60, 55, 35, 38, 25, 40, 45, 40, 50, 60, 70, 55, 66, 77, 45, 60, 55]
                        //     drawEcharts(xData, yData)
                        //     break;
                        // case 'year':
                        //     xData = ['2021-01', '2021-02', '2021-03', '2021-04', '2021-05', '2021-06', '2021-07', '2021-08', '2021-09', '2021-10', '2021-11', '2021-12']
                        //     yData = [35, 38, 25, 40, 45, 40, 50, 60, 70, 55, 66, 77, 45, 60]
                        //     drawEcharts(xData, yData)
                        //     break;
                        default:
                            break;
                    }

                })
            })
        })

        // 日期选择筛选
        function getDataFn() {
            var startTime = $('.api-charts-date-start').val();
            var endTime = $('.api-charts-date-end').val();
            console.log('startTime', startTime);
            console.log('endTime', endTime);
        }

        // 传入xData,yData 画图
        function drawEcharts(xData, yData) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('api-charts-main'));

            // 指定图表的配置项和数据
            var option = {
                tooltip: {
                    show: true,
                    trigger: 'axis',
                    axisPointer: {
                        color: '#409eff'
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: xData
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    name: 'API请求次数',
                    data: yData,
                    type: 'line',
                    smooth: true,
                    itemStyle: {
                        normal: {
                            color: '#6064ff', //改变折线点的颜色
                            lineStyle: {
                                color: '#6064ff' //改变折线颜色
                            }
                        }
                    },
                    areaStyle: {
                        color: '#99CEFA', //区域颜色
                    }
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    </script>
{/if}
