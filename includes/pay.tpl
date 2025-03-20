
{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

<div>
    <form>
        <input type="hidden" value="{$Token}" />
        <div class="pay-body">

            <h4 class="pay-title">
                {if $Action=='recharge'}
                    充值账单
                {elseif $Pay.PayStatus !=='Paid'}
                    总价{$ViewBilling.currency.prefix}{$Pay.total}，还需支付：
                    <!-- {if $Pay.use_credit_limit}
                        ，还需支付：
                    {else}
                        {if $Pay.deduction}
                            ，还需支付：
                        {/if}
                    {/if} -->
                {/if}
            </h4>
              {if $Pay.pay_html.type=='url'}
                <h2 style="margin-top:10px">
                    {$ViewBilling.currency.prefix}{$Pay.total}{$ViewBilling.currency.suffix}
                </h2>
             {/if}
            <!-- <div class="pay-amount">{$Pay.total_desc}</div> -->
            {if $Pay.use_credit_limit}
                <!-- <div class="btn-group">
                    <button type="button" class="btn btn-primary active">信用额支付</button>
                    {if $Pay.action == 'viewbilling'}
                        <a href="/viewbilling?id={$Pay.invoiceid}&use_credit_limit=0" class="btn btn-default active" role="button">现金支付</a>
                    {else}
                        <a href="javascript: payamount({$Pay.invoiceid},0);" class="btn btn-default active" role="button">现金支付</a>
                    {/if}
                </div> -->
                <div class="pay-area">
                    <div id="pay-type">

                        {if $Pay.pay_html.type=='url'}
                        <a href="" target="_blank" id="canvas"></a>
                        {elseif $Pay.pay_html.type=='insert'&&$Pay.PayStatus!='Paid'}
                            <object data="{$Pay.pay_html.data}" style="width: 200px; height: 210px;"></object>
                        {elseif $Pay.pay_html.type=='jump'}
                            <div class="pay-text"><p>请在新页面进行支付<br/>如跳转失败，请点击<a href="{$Pay.pay_html.data}">去支付</a></p></div>
                            <div class="pay-tools" style="margin-top:10px">
                                <select class="form-control select-pay" >
                                    {foreach $Pay.gateway_list as $item}
                                        <option value="{$item.name}" {if $item.name==$Pay.payment}selected{/if}>{$item.title}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {elseif $Pay.pay_html.type=='html'}
                            
                            <!--{$Pay.pay_html.data}-->
                            <div class="add-html" id="pay-type">
                            
                            </div>
                            <div class="pay-tools" style="margin-top:10px">
                                <!--{if $Action!='recharge'}
                                    <select class="form-control select-pay" >
                                        {foreach $Pay.gateway_list as $item}
                                            <option value="{$item.name}" {if $item.name==$Pay.payment}selected{/if}>{$item.title}</option>
                                        {/foreach}
                                    </select>
                                {/if}-->
                                <select class="form-control select-pay" >
                                    {foreach $Pay.gateway_list as $item}
                                        <option value="{$item.name}" {if $item.name==$Pay.payment}selected{/if}>{$item.title}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {/if}

                    </div>
                    
                    {if $Pay.PayStatus!='Paid'}
                    <div class="par_balance">
                        <img src="/themes/clientarea/default/assets/images/xinyong-bg.png" alt="">
                        <span class="balance_money" style="color:#1676FE"> {$ViewBilling.currency.prefix}{$Pay.total}{$ViewBilling.currency.suffix}</span>
                    </div>
                    {/if}
                    <!-- 支付成功遮罩层 -->
                    <div class="pay_area_mask" >
                        <img src="/themes/clientarea/default/assets/images/paySuccess.svg" alt="" width="100px">
                        <h4>支付成功</h4>
                    </div>
                </div>
            {else}
                <div class="pay-area">
                    <div id="pay-type">

                        {if $Pay.pay_html.type=='url'}
                        <a href="" target="_blank" id="canvas"></a>
                        <div class="pay-tools" style="margin-top:10px">
                            <select class="form-control select-pay" >
                                {foreach $Pay.gateway_list as $item}
                                    <option value="{$item.name}" {if $item.name==$Pay.payment}selected{/if}>{$item.title}</option>
                                {/foreach}
                            </select>
                        </div>
                        {elseif $Pay.pay_html.type=='insert'&&$Pay.PayStatus!='Paid'}
                            <object data="{$Pay.pay_html.data}" style="width: 200px; height: 210px;"></object>
							<div class="pay-tools" style="margin-top:10px">                               
                                <select class="form-control select-pay" >
                                    {foreach $Pay.gateway_list as $item}
                                        <option value="{$item.name}" {if $item.name==$Pay.payment}selected{/if}>{$item.title}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {elseif $Pay.pay_html.type=='jump'}
                            <div class="pay-text"><p>请在新页面进行支付<br/>如跳转失败，请点击<a href="{$Pay.pay_html.data}">去支付</a></p></div>
                            <div class="pay-tools" style="margin-top:10px">
                                <!--{if $Action!='recharge'}
                                    <select class="form-control select-pay" >
                                        {foreach $Pay.gateway_list as $item}
                                            <option value="{$item.name}" {if $item.name==$Pay.payment}selected{/if}>{$item.title}</option>
                                        {/foreach}
                                    </select>
                                {/if}-->
                                <select class="form-control select-pay" >
                                    {foreach $Pay.gateway_list as $item}
                                        <option value="{$item.name}" {if $item.name==$Pay.payment}selected{/if}>{$item.title}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {elseif $Pay.pay_html.type=='html'}
                            <!--{$Pay.pay_html.data}-->
                            <div class="add-html" id="pay-type">
                            
                            </div>
                            <div class="pay-tools" style="margin-top:10px">
                                <!--{if $Action!='recharge'}
                                    <select class="form-control select-pay" >
                                        {foreach $Pay.gateway_list as $item}
                                            <option value="{$item.name}" {if $item.name==$Pay.payment}selected{/if}>{$item.title}</option>
                                        {/foreach}
                                    </select>
                                {/if}-->
                                <select class="form-control select-pay" >
                                    {foreach $Pay.gateway_list as $item}
                                        <option value="{$item.name}" {if $item.name==$Pay.payment}selected{/if}>{$item.title}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {/if}

                    </div>
                    {if $Pay.PayStatus!='Paid'}
                        {if $Pay.use_credit==1&&$Pay.credit_enough==1}
                            <div class="par_balance">
                                <img src="/themes/clientarea/default/assets/images/xianjin-bg.png" alt="">
                                <span class="balance_money"> {$ViewBilling.currency.prefix}{$Pay.total}{$ViewBilling.currency.suffix}</span>
                            </div>
                        {/if}
                    {/if}

                    <!-- 支付成功遮罩层 -->
                    <div class="pay_area_mask" >
                        <img src="/themes/clientarea/default/assets/images/paySuccess.svg" alt="" width="100px">
                        <h4>支付成功</h4>
                    </div>
                </div>
                {if $Pay.use_credit_limit == 1}

                {/if}
            {/if}
        </div>
    </form>

    {if $Pay.use_credit_limit}
        <div class="modal-footer mt-2 d-flex justify-content-between ">
            <div class="d-flex align-items-center footer-pay-balance ">
                <span class="mr-2" style="margin-top: -2px">
                    <img width="20" src="/themes/clientarea/default/assets/images/CreditCard.png" alt="">
                </span>
                <span class="font-weight-bold mr-2">
                   可用信用额 {$ViewBilling.currency.prefix}{$Pay.credit_limit_balance}
                </span>
                <!-- <div class="custom-control custom-checkbox">
                    <input type="checkbox" name="use_credit_limit" class="custom-control-input use_credit_limit" id="customCheck1" {if $Pay.use_credit_limit==1}checked{/if} disabled>
                    <label class="custom-control-label" for="customCheck1">使用信用额支付</label>
                </div> -->
            </div>
            <div>
                {if $Pay.use_credit_limit==1 || $Pay.pay==true }
                    <button type="button" class="btn btn-primary  waves-effect pay-now" onclick="payNow()">信用额支付</button>
                {/if}

            </div>
        </div>

    {else}
        <div class="modal-footer mt-2 d-flex justify-content-between ">
            <div class="d-flex align-items-center footer-pay-balance ">

                {if $Action!='recharge'}
                    {if $Pay.credit>0}
                        <span class="mr-2">
                    <img width="20" src="/themes/clientarea/default/assets/images/gold.svg" alt="">
                </span>
                        <span class="font-weight-bold mr-2">
                    当前余额{$ViewBilling.currency.prefix}{$Pay.credit}
                </span>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" name="use_credit" class="custom-control-input use_credit" id="customCheckPay" {if $Pay.use_credit==1}checked{/if}>
                            <label class="custom-control-label" for="customCheckPay">使用余额支付</label>
                        </div>
                    {/if}
                {/if}

            </div>
            <div>

                {if ($Pay.use_credit==1&&$Pay.credit_enough==1) || $Pay.pay==true }
                    <button type="button" class="btn btn-primary  waves-effect pay-now" onclick="payNow()">立即支付</button>
                {/if}

            </div>
        </div>
    {/if}

</div>
<script type="text/javascript" src="/themes/clientarea/default/assets/libs/qrcode/qrcode.min.js?v={$Ver}"></script>
<script type="text/javascript" src="/themes/clientarea/default/assets/libs/qrcode/jquery.qrcode.min.js?v={$Ver}"></script>

<script>
    var timer = null
    $(function(){
        let payStatus = '{$ViewBilling.detail.status}';
        let orderNum = '{$ViewBilling.detail.id}';
        let invoiceid = '{$Pay.invoiceid}';
        if(invoiceid == "" || invoiceid == null || invoiceid == undefined){
            invoiceid = '{$Post.invoiceid}';
        }
        $("#myLargeModalLabel").html("账单 - "+invoiceid);
        // 动态添加支付方式下拉
        if($(".modal-header .paySelect").length == 0 && payStatus!='Paid'){
            let pmAction = '{$Action}';
            let is_open_credit_limit = '{$paymt.is_open_credit_limit}';
            let credit_limit_balance = '{$paymt.credit_limit_balance}';
            let is_open_shd_credit_limit = '{$paymt.is_open_shd_credit_limit}';
            let subtotal = '{$paymt.subtotal}';
            let invoiceid = '{$Pay.invoiceid}';
            let xyeHtml = '';
            let selectChecked = '{$Pay.use_credit_limit}'
            if(selectChecked==1){
                selectChecked = "selected"
            }else{
                selectChecked = ""
            }
            if(is_open_credit_limit!=''&&parseFloat(credit_limit_balance)>=parseFloat(subtotal) && is_open_shd_credit_limit > 0){
                xyeHtml = `<option value="1" ${selectChecked} >信用额支付</option>`
            }
            if(pmAction !='recharge'){
                $(".modal-header #myLargeModalLabel").after(`<select class="form-control paySelect" onchange="payTypeChange(${invoiceid})">
                    <option value="0">现金支付</option>
                    ${xyeHtml}  
                    </select>`)
            }
        }
        var pay_html = '{$Pay.pay_html}'
        var patStatus = '{$Pay.PayStatus}'
        if(patStatus=='Paid'){
            $('.pay_area_mask').css({'display':'flex','flex-flow':'column'});
            $('.pay-amount').text('支付成功')
            $('.select-pay').remove()
            $('.pay-now').remove()
            $('.footer-pay-balance').remove()

        }else if('{$Pay.credit_enough}'==1&&'{$Pay.use_credit}'==1||!pay_html){
            let id = setTimeout(() => {  }, 0);
            while(id > 0){
                window.clearTimeout(id)
                id --;
            }
        }

        else {
            init()
        }
        function init(){
            var pay = '{:json_encode($Pay.pay_html)}';
            let splitHtml = pay.split('"html","data":"');
            let addHtml = "";
            if(pay.indexOf('"html","data":"') == -1){
                pay = JSON.parse(pay)
            } else {
                addHtml = splitHtml[1].split('"}')[0];
            }
            if(pay&&pay.type=='url'){
                $('#pay-type #canvas').html('');

                $('#pay-type #canvas').qrcode({ render: "canvas", width: 200, height: 200, text: pay.data });
                $('#pay-type #canvas').attr("href",pay.data);

            }else if(pay&&pay.type=='jump'){
                window.open(pay.data)
            }else if(pay&&addHtml!=''){
                $('#pay-type .add-html').html(addHtml);
            }


           var timer = setInterval(function(){
                    $.post('/check_order', {id:'{$Pay.invoiceid}'},
                        function(data){
                            console.log('data: ', data);
                            if(data.status==1000){
                                //$('.pay_area_mask').css({'display':'flex','flex-flow':'column'});
                                // $('.pay-amount').text('支付成功')
                                // $('.select-pay').prop('disabled',true)
                                // $('.footer-pay-balance').remove()
                                clearInterval(timer)
                                if (data.data){
                                    location.href = data.data
                                } else if ('{$ReturnUrl}') {
                                    location.href = '{$ReturnUrl}'
                                } else if ('{$ViewBilling.detail.url}') { // 账单有回跳地址 优先处理
                                    location.href = '{$ViewBilling.detail.url}'
                                } else if ('{$ViewBilling.invoice_items.0.hid}' == '0') {
                                    location.href = 'service?groupid={$ViewBilling.invoice_items.0.groupid}'
                                } else {
                                    location.href = 'servicedetail?id={$ViewBilling.invoice_items.0.hid}'
                                }

                                // $('.pay').modal('hide');
                            }

                        }
                    )
                }
                ,2000)
        }

        $('#pay').on('hidden.bs.modal', function (event) {
			var url=window.location.href;
            if(url.indexOf("viewbilling")!==-1){
                url=setting_web_url +"/viewbilling?id="+invoiceid;
            }
            clearInterval(timer)
            console.log(203);
            location.href =url;
        })

        $('#pay .select-pay').on('change',function(){
            var type = location.pathname.indexOf('billing')
            var credit = location.pathname.indexOf('credit')
            var verified = location.pathname.indexOf('verified')

            if(type!=-1 || credit!=-1 || verified!=-1){
                getData()
                return
            }
            var amount = $('input[name=amount]').val();
            var payment = $('.select-pay').val();
            var url = '' + '/pay?action=recharge';
            $.ajax({
                type: "POST",
                data: { amount: amount, payment: payment, use_credit_limit:0 },
                url: url,
                success: function (data) {
                    clearInterval(timer)

                    $("#pay .modal-body").html(data);
                    $('.pay').modal('show');

                }
            })
        });


        $('#pay-content .select-pay').on('change',function(){
            getData()
        })

        $('.use_credit').on('change',function(){
            getData()
        })


        //获取信息
        function getData(){
            var url = '' + '/pay?action=billing';
            var use_credit = $('input[name=use_credit]').prop("checked")
            var payment = $('.select-pay').val();
            $("#pay-content,#pay .modal-body").html($('#loading-icon').html());
            $.ajax({
                type: "POST",
                data: { invoiceid: '{$Pay.invoiceid}', use_credit:use_credit?1:0,payment: payment, use_credit_limit:0},
                url: url,
                success: function (data) {

                    clearInterval(timer)
                    $("#pay-content,#pay .modal-body").html(data);
                    $('.pay').modal('show');
                }
            })
        }

    })

    function payNow(){
        var url = '' + '/pay?action=billing&pay=true';
        // var use_credit = $('input[name=use_credit]').prop("checked")
        // var use_credit_limit = $('input[name=use_credit_limit]').prop("checked")
        var selectType = $('.paySelect option:selected').val();
        var payment = $('.select-pay').val();
        $.ajax({
            type: "POST",
            data: { invoiceid: '{$Pay.invoiceid}', use_credit:selectType == 0 ?1:0,payment: payment,use_credit_limit:selectType == 1 ?1:0},
            url: url,
            success: function (data) {
                clearInterval(timer)
                $("#pay-content,#pay .modal-body").html(data);
                $('.pay').modal('show');

                if ('{$Pay.credit_enough}' == 1 || '{$Pay.use_credit_limit}') { // 余额足够 或者 使用信用额
                    if ('{$ReturnUrl}') {
                       
                        location.href = '{$ReturnUrl}'
                    } else if ('{$ViewBilling.detail.url}') { // 账单有回跳地址 优先处理
                        location.href = '{$ViewBilling.detail.url}'
                    } else if ('{$ViewBilling.invoice_items.0.hid}' == '0') {
                        location.href = 'service?groupid={$ViewBilling.invoice_items.0.groupid}'
                    } else {
                        location.href = 'servicedetail?id={$ViewBilling.invoice_items.0.hid}'
                    }
                }
            }
        })
    }

</script>

<style>
    #pay-type{
        width: 200px;
        min-height: 200px;
    }

    .pay_main .pay_area{
        margin-top: 21px;
        margin-bottom: 20px;
        position: relative;
    }

    .par_balance {
        user-select: none;
        position: absolute;
        top: 0;
        width: 200px;
        height: 200px;
    }

    .par_balance .balance_money{
        position: absolute;
        bottom: 80px;
        left: 50%;
        transform: translateX(-51%);
        color: #fff;
        font-size: 22px;
        width: 100%;
        text-align: center;
    }

    .pay_area_mask {

        display: none;
        align-items: center;
        justify-content: center;
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        /*background-color: rgba(0, 0, 0, 0.5);*/

    }
    .iconfont {
        font-size: 73px;
        color: #20b759;
    }
    .pay-text{
        height: 100%;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center
    }
    .pay-text p{
        text-align: center
    }
</style>