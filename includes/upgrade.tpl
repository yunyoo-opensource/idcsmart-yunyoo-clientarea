
<style>
.focus-button:disabled{
    background: #DFDFDF;
    border: 0;
    width: 56px;
    color: #fff;
    cursor: no-drop;
}
.tips-text{
    position: absolute;
    font-size: 12px;
    transform: scale(0.5);
    top: -4px;
    left: 0px;
    color: #999999;
    display: none;
}
.clear-icon {
    position: absolute;
    width: 13px;
    height: 13px;
    left: 88px;
    top: 11px;
    cursor: pointer;
    display: none;
}
.error-text {
    position: absolute;
    bottom: 0px;
    font-size: 12px;
    color: #ff0000;
    display: none;
}
.tips-div{
    width: 70%;
    height: auto;
    background: #FDF6EC;
    border: 1px solid #FFD89F;
    opacity: 1;
    border-radius: 2px;
    color: #E6A23C;
    font-size: 12px;
    padding-left: 2px;
    position: relative;
    display: flex;
    align-items: center;
    padding: 6px 0px;
    margin-top: 10px;
}
.tips-div img {
    width: 13.5px;
    height: 13.5px;
    margin-left: 16px;
    margin-right: 5px;
}
.tips-div font {
    position: absolute;
    right: 13px;
    top: 4px;
    font-size: 12px;
    cursor: pointer;
}
.yhm-flex{
    display: flex;
    place-items: flex-end;
    padding-bottom: 10px;
}

.reset-label{
    max-width: 200px;
    word-break: break-all;
}
.flex-between{
    display: flex;
    justify-content: space-between;
    flex-flow: wrap;
    min-height: 75px;
    align-items: center;
    border-bottom: 1px solid #eff2f7;
    padding: 10px 0px;
}
.w-100{
    width: 100% !important;
}
</style>

<!-- {if $ErrorMsg}
<script>
$(function () {
  toastr.error('{$ErrorMsg}');
});
</script>
{else/} -->
    {if $Action == "upgrade_page"}

                    <form>
                      <input type="hidden" style="display: none;" value="{$Token}" />
                      <input type="hidden" style="display: none;" name="hid" value="{$Think.get.id}" />

                      <div class="offset-md-2 col-md-8">
                        {foreach $UpgradeProduct.host as $key=>$item}
                        <div class="flex-between row">
                            <div class="col-lg-6 custom-control custom-radio upgradeRadio" data-key="{$key}">
                                <input type="radio" id="upgradeRadio{$key}" name="pid" class="custom-control-input" {if $key==0}checked{/if} value="{$item.pid}">
                                <label class="custom-control-label reset-label" for="upgradeRadio{$key}">{$item.host}</label>
                            </div>
                            <div class="col-lg-6">
                                <select class="form-control upgradeSelect{$key} w-100" class="second_type" name="billingcycle" {if $key>0}disabled{/if}>
                                    {foreach $item.cycle as $sub_item}
                                    <option value="{$sub_item.billingcycle}">初装费{$UpgradeProduct.currency.prefix}{$sub_item.setup_fee},{$UpgradeProduct.currency.prefix}{$sub_item.price}{$UpgradeProduct.currency.suffix}/{$sub_item.billingcycle_zh}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        {/foreach}
                        <!-- <table class="table table-nowrap table-centered mb-0">
                            <tbody>
                                {foreach $UpgradeProduct.host as $key=>$item}
                                <tr>
                                    <td style="width: 60px;">
                                        <div class="custom-control custom-radio mb-3 upgradeRadio" data-key="{$key}">
                                            <input type="radio" id="upgradeRadio{$key}" name="pid" class="custom-control-input" {if $key==0}checked{/if} value="{$item.pid}">
                                            <label class="custom-control-label" for="upgradeRadio{$key}"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14 m-0">
                                            <label class="reset-label" for="upgradeRadio{$key}">{$item.host}</label>
                                        </h5>
                                    </td>
                                    <td>
                                        <select class="form-control upgradeSelect{$key}" class="second_type" name="billingcycle" {if $key>0}disabled{/if}>
                                          {foreach $item.cycle as $sub_item}
                                          <option value="{$sub_item.billingcycle}">初装费{$UpgradeProduct.currency.prefix}{$sub_item.setup_fee},{$UpgradeProduct.currency.prefix}{$sub_item.price}{$UpgradeProduct.currency.suffix}/{$sub_item.billingcycle_zh}</option>
                                          {/foreach}
                                        </select>
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table> -->
                      </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary waves-effect waves-light submit">下一步</button>
                        <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">返回</button>
                    </div>


    <script>
		$(".upgradeRadio").click(function(){
			$('#modalUpgradeStepOne select').attr("disabled","disabled");
			$(".upgradeSelect"+$(this).data("key")).removeAttr("disabled");
		})
  
       $('#modalUpgradeStepOne .submit').on('click', function(){
            if(!$(this).data('submit')){
                $(this).data('submit', 1)
                let _this = $(this)
				$(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
                $.ajax({
                    url: "/servicedetail?id={$Think.get.id}&action=upgrade",
                    type: 'POST',
                    data: $('#modalUpgradeStepOne form').serialize(),
                    success: function(res){
                        if(res.indexOf('modalUpgradeStepTwo') > -1){
                            $('#modalUpgradeStepOne').modal('hide');
                            $('.modal-backdrop.fade.show').remove()

                            if($('#modalUpgradeStepTwoDiv').length == 0){
                                $('#upgradeProductDiv').after('<div id="modalUpgradeStepTwoDiv"></div>');
                            }
                            //$("#upgradeProductDiv").html(res);
                            $("#modalUpgradeStepTwoDiv").html(res);
                            $('#modalUpgradeStepTwo').modal("show");
                        }else if(res.indexOf('<script>') === 0){
                            $("#upgradeProductDiv").append(res);
                        }
                        _this.removeData('submit');
						_this.html("下一步");
                    },
                    error: function(){
                        _this.removeData('submit');
						_this.html("下一步");
                    }
                })
            }
        })
     
        
    </script>

    {else /}

    <div class="modal fade" id="modalUpgradeStepTwo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title mt-0" id="myLargeModalLabel">升降级</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <input type="hidden" style="display: none;" value="{$Token}" />

                        <div class="table-responsive">
                            <table class="table table-centered mb-0 table-nowrap">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">原产品</th>
                                        <th scope="col"></th>
                                        <th scope="col">升级产品</th>
                                        <th scope="col">金额</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                      <h5 class="font-size-14 text-truncate" style="position: relative;">{$Upgrade.old_host.host}</h5>
                                    </td>
                                    <td>
                                    <img style="width:16px;" src="/themes/clientarea/default/assets/images/left-icon.png" />
                                    </td>
                                    <td>
                                        <h5 class="font-size-14 text-truncate">{$Upgrade.des}</h5>
                                    </td>
                                    <td>{$Upgrade.currency.prefix}{$Upgrade.amount}{$Upgrade.currency.suffix}/{$Upgrade.billingcycle_zh}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 文本框效果 -->
                        <script>
                        $('.get-input-focus').focus(function(){
                            $('.use_promo_code').removeAttr('disabled').removeClass('focus-button');
                            $('.tips-text,.clear-icon').show();
                            $('.tips-text').css({'color':'#999'})
                            $(this).css({'border':'1px solid #6064FF','color':'#6064FF'});
                            $('.error-text').hide();
                            $('.change-height').css({'height':'37px'})
                        })
                        $('.get-input-focus').blur(function(){
                            if($('.get-input-focus').val().trim() == '') {
                                $('.use_promo_code').addClass('focus-button').attr('disabled','disabled');
                                $('.tips-text,.clear-icon').hide();
                                $(this).css({'border':'1px solid #ced4da','color':'#6064FF'})
                            }
                        })
                        $(".modal-body").on('click','.tips-div font',function(){
                            $('.tips-div').hide()
                        })
                        $(".modal-body").on('click','.clear-icon',function(){
                            $('.get-input-focus').val('').focus();
                        })
                        </script>
                        <div class="yhm-flex row">
                            <div class="col-lg-6">
                                <div class="d-flex mb-3 change-height" style="position:relative; margin-bottom: 0px !important">
                                <span class="tips-text">优惠码</span>
                                <img class="clear-icon" src="/themes/clientarea/default/assets/images/clear-icon.png" />
                                <span class="error-text"></span>
                                    {if !$Upgrade.promo_code}
                                    <input type="text" name="pormo_code" class="form-control get-input-focus" value="{$Upgrade.promo_code}" placeholder="优惠码" style="width:108px"/>
                                    <button class="btn btn-primary ml-2 use_promo_code focus-button" disabled
                                        type="button" style="width: auto;  height:38px">{$Lang.verification}</button>
                                    {else /}
                                    <span class="tips-text" style="display: block;">优惠码</span>
                                    <span class="form-control" style="width:108px">{$Upgrade.promo_code}</span>
                                    <button class="btn btn-primary ml-2 remove_promo_code" type="button" style="width: 56px; height:38px">{$Lang.modify}</button>
                                    {/if}
                                </div>
                            
                                {if $Upgrade.has_renew == true}
                                    <div class="tips-div"><img src="/themes/clientarea/default/assets/images/warning-icon.png">发现尚未支付的续费账单，续费账单将会被删除<font>x</font></div>
                                {/if}
                            </div>
                            <div class="col-lg-6">
                            <!-- 优惠码 -->
                            {if $Upgrade.promo_msg}
                                <div class="text-right font-size-18" style="font-size: 12px !important; color:#999 !important; margin-bottom:10px !important">
                                    {if $Upgrade.promo_msg.type == 'percent'}
                                        {$Lang.discount_code}({$Upgrade.promo_msg.value / 10}{$Lang.fracture})：<span class="text-primary" style="font-size: 12px !important; color:#333 !important">-{$Upgrade.currency.prefix}{$Upgrade.discount}{$Upgrade.currency.suffix}</span>
                                    {elseif $Upgrade.promo_msg.type == 'fixed'}
                                        {$Lang.discount_code}({$Lang.reduction}{$Upgrade.currency.prefix}{$Upgrade.promo_msg.value}{$Upgrade.currency.suffix}): <span class="text-primary" style="font-size: 12px !important; color:#333 !important">-{$Upgrade.currency.prefix}{$Upgrade.discount}{$Upgrade.currency.suffix}</span>
                                    {elseif $Upgrade.promo_msg.type == 'override'}
                                        {$Lang.discount_code}({$Lang.replacement_price}): <span class="text-primary" style="font-size: 12px !important; color:#333 !important">-{$Upgrade.currency.prefix}{$Upgrade.discount}{$Upgrade.currency.suffix}</span>
                                    {elseif $Upgrade.promo_msg.type == 'free'}
                                        {$Lang.discount_code}（{$Lang.free_installation}）: <span class="text-primary" style="font-size: 12px !important; color:#333 !important">-{$Upgrade.currency.prefix}{$Upgrade.discount}{$Upgrade.currency.suffix}</span>
                                    {/if}
                                </div>
                            {/if}
                            <!-- 用户有折扣时 -->
                            {if $Upgrade.type}
                                <div class="text-right font-size-18" style="font-size: 12px !important; color:#999 !important; margin-bottom:10px !important">
                                    {if $Upgrade.type.type == '1'}
                                        {$Lang.customer_discount_price}({$Upgrade.type.bates}{$Lang.fracture})：<span class="text-primary" style="font-size: 12px !important; color:#333 !important">-{$Upgrade.currency.prefix}{$Upgrade.saleproducts}{$Upgrade.currency.suffix}</span>
                                    {elseif $Upgrade.type.type == '2'}
                                        {$Lang.customer_discount_province}{$Upgrade.currency.prefix}{$Upgrade.type.bates}{$Upgrade.currency.suffix}): <span class="text-primary" style="font-size: 12px !important; color:#333 !important">-{$Upgrade.currency.prefix}{$Upgrade.saleproducts}{$Upgrade.currency.suffix}</span>
                                    {/if}
                                </div>
                            {/if}
                            <div class="text-right font-size-18" style="font-size: 12px !important; color:#999 !important; margin-bottom:10px !important">
                                总计：<span class="text-primary" style="color:#6064FF !important;font-size:12px !important">{$Upgrade.currency.prefix}<font style="font-weight: bold !important; font-size:18px !important">{$Upgrade.amount_total}</font>{$Upgrade.currency.suffix}/{$Upgrade.billingcycle_zh}</span>
                            </div>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary waves-effect waves-light submit">下一步</button>
                        <button type="button" class="btn btn-secondary waves-effect goback">返回</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
            function getUrlParam(name) {

            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象

            var r = window.location.search.substr(1).match(reg); //匹配目标参数

            if (r != null) return unescape(r[2]);

            return null; //返回参数值

        }
        var product_type = '{$Detail.host_data.type}'
        $('#modalUpgradeStepTwo .submit').on('click', function(){
            let postRequest = function(){
                $.ajax({
                    url: "/upgrade/checkout_upgrade_product",
                    data: {
                        hid: '{$Think.get.id}'
                    },
                    type: "POST",
                    success: function(res){
                        if(res.status == 200){
                            window.location.href = "/viewbilling?id="+ res.data.invoiceid;
                        }else if(res.status == 1001){
                            toastr.success(res.msg)
                            location.reload();
                        }else{
                            toastr.error(res.msg)
                        }
                    },
                    error: function(){

                    }
                })
            };
            if(product_type == 'cloud' || product_type == 'dcimcloud'){
                $('#modalUpgradeStepTwo').modal('hide');
                $('.modal-backdrop.fade.show').remove()
                let content = "<div>"
                            + "<p>升降级需要服务器在关机状态下进行：</p>"
                            + "<p> 为了避免数据丢失，实例将关机中断您的业务，请仔细确认。 </p>"
                            + "<p> 强制关机可能会导致数据丢失或文件系统损坏，您也可以主动关机后再进行操作。</p>"
                            + "</div>";
                getModalConfirm(content, function(){
                    postRequest();
                });
            }else{
                postRequest();
            }
        })

        $('#modalUpgradeStepTwo .use_promo_code').on('click', function(){
            let _this = $(this)
            if(!$(this).data('submit')){
                $.ajax({
                    url: "/servicedetail?id={$Think.get.id}&action=upgrade_use_promo_code",
                    type: 'POST',
                    data: $('#modalUpgradeStepTwo form').serialize(),
                    success: function(res){
                        if(res.indexOf('modalUpgradeStepTwo') > -1){
                            $('#modalUpgradeStepTwo').modal('hide');
                            $('.modal-backdrop.fade.show').remove()
                            $("#modalUpgradeStepTwoDiv").html(res);
                            $('#modalUpgradeStepTwo').modal("show");
                        }else if(res.indexOf('<script>') === 0){
                            $("#upgradeProductDiv").append(res);
                        }
                    }
                });
                $.ajax({
                    url: "/upgrade/add_promo_code_product",
                    type: 'POST',
                    data: {
                        hid:getUrlParam('id'),
                        pormo_code: $('.get-input-focus').val(),
                        upgrade_type: 'product'
                    },
                    success: function(res){
                        if(res.status != 200) {
                            $('.get-input-focus').css({'border':'1px solid #FF0000','color':'#999999'}).blur();
                            $('.use_promo_code').addClass('focus-button').attr('disabled','disabled');
                            $('.tips-text').css({'color':'#FF0000'})
                            $('.change-height').css({'height':'60px'})
                            $('.error-text').html(res.msg).show();
                        }
                    }
                })
            }
        })

        $('#modalUpgradeStepTwo .remove_promo_code').on('click', function(){
            let _this = $(this)
            if(!$(this).data('submit')){
                $.ajax({
                    url: "/servicedetail?id={$Think.get.id}&action=upgrade_remove_promo_code",
                    type: 'POST',
                    data: $('#modalUpgradeStepTwo form').serialize(),
                    success: function(res){
                        if(res.indexOf('modalUpgradeStepTwo') > -1){
                            $('#modalUpgradeStepTwo').modal('hide');
                            $('.modal-backdrop.fade.show').remove()
                            $("#modalUpgradeStepTwoDiv").html(res);
                            $('#modalUpgradeStepTwo').modal("show");
                        }else if(res.indexOf('<script>') === 0){
                            $("#upgradeProductDiv").append(res);
                        }
                    }
                })
            }
        })

        $('#modalUpgradeStepTwo .goback').on('click', function(){
            $('#modalUpgradeStepTwo').modal('hide');
            $('.modal-backdrop.fade.show').remove()
            $('#modalUpgradeStepTwoDiv').html('');

            $('#modalUpgradeStepOne').modal('show');
        })
    </script>
    {/if}
{/if}

