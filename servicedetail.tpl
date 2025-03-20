<style>
    .error-tip{
        color: #f46a6a;
        margin: 0;
        padding: 0;
        line-height: 36px;
        margin-left:13rem;
        display: none;
    }
    .ml-8{
        margin-left:8.3rem
    }
    .contract_mc{
        width: 100%;
        height: 100%;
        position: fixed;
        right: 0px;
        top: 0px;
        background: #000;
        z-index: 999999;
        opacity: 0.4;
    }
    .pt-9{
        padding-top:9px;
    }
    .must-reinstall-check:before{
        content: '*';
        color: red;
    }
    .d-flex-cl{
        flex-direction: column;
    }
    .d-flex-cl .reinstallAgreeCheckbox{
        color: #ff0000;
    }
</style>
<script src="/themes/clientarea/yunyoo/assets/libs/moment/moment.js?v={$Ver}"></script>
<script src="/themes/clientarea/yunyoo/assets/libs/clipboard/clipboard.min.js?v={$Ver}"></script>
<!-- select -->
<link rel="stylesheet" href="/themes/clientarea/yunyoo/assets/libs/bootstrap-select/css/bootstrap-select.min.css?v={$Ver}">
<script src="/themes/clientarea/yunyoo/assets/libs/bootstrap-select/js/bootstrap-select.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/yunyoo/assets/js/public.js?v={$Ver}"></script>
<!-- <link rel="stylesheet" href="{$Request.domain}{$Request.rootUrl}/vendor/dcimcloud/css/layui.css"> 隐藏layui把用到layui样式的地方改成bootstrap的样式 -->
<link rel="stylesheet" href="{$Request.domain}{$Request.rootUrl}/vendor/dcimcloud/css/selectFilter.css">
<script src="{$Request.domain}{$Request.rootUrl}/vendor/dcimcloud/js/sweetAlert2.min.js"></script>
<script src="{$Request.domain}{$Request.rootUrl}/vendor/dcimcloud/js/selectFilter.js"></script>
<script src="/themes/clientarea/yunyoo/assets/libs/echarts/echarts.min.js?v={$Ver}"></script>
{if $Detail.host_data.type == "hostingaccount"}
    {include file="servicedetail/hosting"}
{elseif $Detail.host_data.type == "server" /}
    {include file="servicedetail/dedicated"}
{elseif $Detail.host_data.type == "cloud" /}
    {include file="servicedetail/cloud"}
{elseif $Detail.host_data.type == "dcimcloud" /}
    {include file="servicedetail/zjmfcloud"}
{elseif $Detail.host_data.type == "dcim" /}
    {include file="servicedetail/zjmfdcim"}
{elseif $Detail.host_data.type == "software" /}
    {include file="servicedetail/software"}
{elseif $Detail.host_data.type == "cdn" /}
    {include file="servicedetail/cdn"}
{elseif $Detail.host_data.type == "other" /}
    {include file="servicedetail/general"}
{elseif $Detail.host_data.type == "ssl" /}
    {include file="servicedetail/ssl"}
{else /}
{/if}
{if $ErrorMsg}{include file="error/alert" value="$ErrorMsg"}{/if}
{include file="includes/modal"}
{include file="servicedetail/upgrade"}
{include file="servicedetail/upgrade-configoptions"}
<!-- 合同蒙层 -->
{if $ForceContract}
<div class="contract_mc"></div>
<div class="modal" style="display: block;z-index:999999;width: 100%">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">合同签订提示</h5>
			</div>
			<div class="modal-body">
                <span>该产品需要签订, 请 {if $ForceContract.base || $ForceContract.has_contract}<a href="/contract">前往签订</a>{else}<a href="/contracthost?keywords={$Detail.host_data.id}">前往签订</a>{/if}
                    {if $ForceContract.force}，逾期{$ForceContract.suspended}天未签订会{if $ForceContract.suspended_type=='suspended'}暂停产品服务{else}无法访问产品内页{/if}</span>
                {/if}
			</div>
			<div class="modal-footer">
                {if $ForceContract.base || $ForceContract.has_contract}
                    <button type="button" class="btn btn-primary" onclick="javascript: location.href='/contract'">确定</button>
                {else}
                    <button type="button" class="btn btn-primary" onclick="javascript: location.href='/contracthost?keywords={$Detail.host_data.id}'">确定</button>
                {/if}
                {if $ForceContract.regdated == 0 || $ForceContract.force == 0}
				<button type="button" class="btn btn-outline-light qd_cancel">取消</button>
                {/if}
			</div>
		</div>
	</div>
</div>
{/if}
<!-- 服务器内页 修改备注 弹窗 -->
<div class="modal fade" id="modifyRemarkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{$Lang.modify_remarks}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text-right">{$Lang.remarks}</label>
						<div class="col-sm-9">
							<div class="input-group">
								<input id="remarkInp" type="text" value="{$Detail.host_data.remark}" class="form-control api_password"
									placeholder="{$Lang.please_input}" />
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" onclick="modifyRemarkSubmit({$Think.get.id})">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>
<!-- 重置密码弹窗 --> 
<div class="modal fade" id="moduleResetPass" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title mt-0">{$Lang.reset_password}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="resetPassword">
                <div class="modal-body">
                    <div class="form-group row mb-4">
                        <label for="horizontal-firstname-input" class="col-md-3 col-form-label d-flex justify-content-end">{$Lang.password}</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control getPassword" name="password">
                            <span class="c-red">密码需要同时包含：大写字母、小写字母、数字、特殊符号</span>
                        </div>
                        <div class="col-md-1 fs-18 d-flex align-items-center">
                            <i class="fas fa-dice create_random_pass pointer" onclick="create_random_pass()"></i>
                        </div>
                        <label id="password-error-tip" class="control-label error-tip" for="password"></label>
                    </div>
                    <div class="c-red col-8 offset-md-3 tips" role="alert">
                        <b>{$Lang.reset_pwd_tip_one}</b><br>
                        {$Lang.reset_pwd_tip_two}<br>
                        {$Lang.reset_pwd_tip_three}           
                    </div>
                    <div class="form-group row mb-4">
                        <label for="horizontal-firstname-input" class="col-md-3 col-form-label d-flex justify-content-end">强制关机</label>
                        <div class="col-md-6 pt-9">
                            <label>
                                <input type="checkbox" class="mr-1 getForce" id="force" name="force">同意强制关机
                            </label>
                        </div>
                        <label id="force-error-tip" class="control-label error-tip" for="force">请同意强制关机</label>
                    </div>
                </div>
                <input type="hidden" name="func" value="crack_pass">
                <input type="hidden" name="id" value="{$Think.get.id}">
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{$Lang.cancel}</button>
                <button type="button" class="btn btn-primary submit" onclick="moduleResetPass($(this))">{$Lang.determine}</button>
            </div>
        </div>
    </div>
</div>

<!-- 重装系统弹窗 -->
<div class="modal fade" id="moduleReinstall" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title mt-0">{$Lang.reinstall_system}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-2 d-flex align-items-center justify-content-end mb-3">
                            <label class="float-right mb-0">{$Lang.system}</label>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group mb-0">

                                <select class="form-control configoption_os_group selectpicker" data-style="btn-default" name="os_group" onchange="moduleReinstallOsGroupChange($(this))">
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
                                    <option  data-content="<img class='mr-1' src='/upload/common/system/{$os_svg}.svg' height='20'/>{$item.name}" value="{$item.id}">{$item.name}</option>
                                  {/foreach}
                                </select>
                            </div>
                        </div>
						
                        <div class="col-md-5">
                            <div class="form-group">
                                <select class="form-control" name="os" data-os='{:json_encode($Detail.cloud_os)}'>
                                    {foreach $Detail.cloud_os as $item}
                                       
                                        
                                          <option value="{$item.id}" data-group="{$item.group}" {if $item.group != $Detail.cloud_os_group[0]['id']}style="display:none;"{/if} >{$item.name}</option>
                                        
                                    {/foreach}
                                    
                                </select>
                                
                            </div>
                        </div>
                    </div>
                    {if $Detail.reinstall_random_port}
                        <div class="form-group row">
                            <label for="horizontal-firstname-input" class="col-md-2 col-form-label d-flex justify-content-end">{$Lang.port}</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" name="port" value="22">
                            </div>
                            <div class="col-md-1 fs-18 d-flex align-items-center">
                                <i class="fas fa-dice module_reinstall_random_port" onclick="module_reinstall_random_port()"></i>
                            </div>
                        </div>
                    {/if}
                    {if $Detail.reinstall_format_data_disk}
                    <div class="row">
                        <label class="col-md-2 col-form-label d-flex align-items-center justify-content-end" for="moduleReinstallFormatDataDisk">{$Lang.format_data_disk}</label>
                        <div class="custom-control custom-switch custom-switch-md mb-4 ml-2" dir="ltr">
                            <input type="checkbox" class="custom-control-input" id="moduleReinstallFormatDataDisk" name="format_data_disk" value="1">
                            <label class="custom-control-label" for="moduleReinstallFormatDataDisk"></label>
                        </div>
                    </div>
                    {/if}
                    <div class="row">
                        <div class="col-md-8 offset-md-2 d-flex d-flex-cl justify-content-end">
                            <div class="tips c-red">
                            <b>警告：</b>当前操作会清空实例的所有数据且不可逆，请确保已经备份好所有数据。
                            </div>
                            <div class="reinstallAgreeCheckbox" id="reinstallAgreeCheckbox"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 offset-md-2 d-flex d-flex-cl justify-content-end">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="moduleReinstallConfirm" value="1" onchange="reinstallConfirm($(this))">
                                <label class="custom-control-label" for="moduleReinstallConfirm">{$Lang.finished_backup}</label>
                            </div>
                            <div class="reinstallAgreeCheckbox" id="reinstallAgreeCheckbox"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-9">
                            <div id="moduleReinstallMsg"></div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="func" value="reinstall">
                <input type="hidden" name="id" value="{$Think.get.id}">
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{$Lang.cancel}</button>
                <button type="button" class="btn btn-primary submit"  onclick="moduleReinstall($(this))">{$Lang.determine}</button>
            </div>
        </div>
    </div>
</div>

<!-- 升降级商品 -->
<div id="upgradeProductDiv"></div>
<div id="upgradeConfigDiv"></div>
<div id="orderFlowDiv"></div>
<div id="renewDiv"></div>

<script>
    // 重置密码密码校验规则
    var passwordRules =  {:json_encode($Detail.host_data.password_rule.rule)};
    var setting_web_url = '';
    //console.log('passwordRules',passwordRules)
    $(document).on('blur', '.getPassword', function(){
		veriPassword()
    })
    function veriPassword(){
      
        let result = checkingPwd1($(".getPassword").val(), passwordRules.num, passwordRules.upper, passwordRules.lower, passwordRules.special)
      
		if(result.flag) {
			$('#password-error-tip').css('display','none');
			$('.getPassword').removeClass("is-invalid");
		}else{
			$("#password-error-tip").html(result.msg);
			$(".getPassword").addClass("is-invalid");
			$('#password-error-tip').css('display','block');
		}
    }
    $(function(){
        $("#resetPassword").on('click',".create_random_pass",function(e){
            veriPassword()
        })
        $('.qd_cancel').on('click',function(){
            $('.contract_mc,.modal').hide()
        })
    })

    $(".getForce").change(function () {
        if($(this).is(':checked')){
            $('#force-error-tip').css('display', 'none');
        }else{
            $("#force-error-tip").html('请勾选同意强制关机');
            $('#force-error-tip').css('display', 'block');
        }
    });
</script>
<script src="/themes/clientarea/yunyoo/assets/js/servicedetail.js?v={$Ver}"></script>