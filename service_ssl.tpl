{include file="includes/paymodal"}
{include file="includes/tablestyle"}
{include file="includes/pop"}

<script>
	$(function () {
		// 状态筛选
		var parmas = []
		var urlParams = '{:implode(',', $Think.get.domain_status)}';
		var statusSelected = urlParams.split(',')
		var isSslPage = '{$isSslPage}';
		if(!statusSelected[0]){
			statusSelected=['Pending','Active','Suspended']
			if(isSslPage == 1)
			{
				statusSelected = ['Pending','Active','Verifiy_Active','Overdue_Active','Issue_Active','Cancelled','Deleted'];
			}
		}

		$('#statusSel').selectpicker('val', statusSelected)
		$('#statusSel').on('change', function () {

			statusSelected = $('#statusSel').val()
			statusSelected.forEach(item => {
				parmas += '&domain_status[]=' + item
			})

			location.href = 'service?groupid={$Think.get.groupid}' + parmas
		});
		// 关键字搜索
		$('#searchInp').val('{$Think.get.keywords}')

		$('#searchInp').on('keydown', function (e) {
			if (e.keyCode == 13) {
				location.href = 'service?groupid={$Think.get.groupid}&keywords=' + $('#searchInp').val() +
						'&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}'
			}
		})
		$('#searchIcon').on('click', function () {
			location.href = 'service?groupid={$Think.get.groupid}&keywords=' + $('#searchInp').val() +
					'&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}'
		});
		// 设置样式

		// 排序
		$('.bg-light th:not(.checkbox)').on('click', function () {
			var sort = '{$Think.get.sort}'
			location.href = 'service?groupid={$Think.get.groupid}&keywords={$Think.get.keywords}&sort=' + (sort ==
					'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') +
					'&page={$Think.get.page}&limit={$Think.get.limit}'
		})
		changeStyle()
		function changeStyle() {
			$('.text-black-50.d-inline-flex.flex-column.justify-content-center.ml-1.offset-3').children().css('color','rgba(0, 0, 0, 0.1)')
			var sort = '{$Think.get.sort}'
			var orderby = '{$Think.get.orderby}'
			let index
			if(orderby === 'domainstatus') {
				if (sort === 'desc') {
					index = 1
				} else if(sort === 'asc') {
					index = 0
				}
			} else if(orderby === 'nextduedate') {
				if (sort === 'desc') {
					index = 3
				} else if(sort === 'asc') {
					index = 2
				}
			}
			$('.text-black-50.d-inline-flex.flex-column.justify-content-center.ml-1.offset-3').children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
		}
	})
</script>
<div class="card">
	<div class="card-body">
		<div class="table-container">
			<div class="table-header">
				<div class="table-filter">
					<div class="row">
						<div class="col">
							<select class="selectpicker" id="statusSel" data-style="btn-default" title="{$Lang.please_select_status}" multiple>
								{foreach $Service.domainstatus as $key => $list}
									<option value="{$key}" selected>{$list.name}</option>
								{/foreach}
							</select>
							{if (isset($nav_info.orderFuc) && $nav_info.orderFuc)}
								<a href="{$nav_info.orderFucUrl}" class="btn btn-sm btn-primary w-xs">订购产品</a>
							{/if}
						</div>
					</div>
				</div>
				<!-- wyh 20210331 增加产品转移hook模板template_after_service_domainstatus_selected-->
				{php}$hooks=hook('template_after_service_domainstatus_selected');{/php}
				{if $hooks}
					{foreach $hooks as $item}
						{$item}
					{/foreach}
				{/if}
				<!-- 结束 -->
				<div class="table-search">
					<div class="row justify-content-end">
						<div class="col-sm-6">
							<div class="search-box">
								<div class="position-relative">
									<input type="text" class="form-control" id="searchInp" placeholder="{$Lang.search_by_keyword}">
									<i class="bx bx-search-alt search-icon" id="searchIcon"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table tablelist">
					<colgroup>
						<col width="50px">
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col width="8%">
					</colgroup>
					<thead class="bg-light">
					<tr>
						<th class="checkbox">
							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" name="headCheckbox" class="custom-control-input" id="customCheck">
								<label class="custom-control-label" for="customCheck"></label>
							</div>
						</th>
						<th class="pointer" prop="domainstatus">
							<span>{$Lang.state}</span>
							<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
						</th>
						<th>证书名称</th>

						<th>证书类型</th>
						<th>域名</th>
						<th class="pointer" prop="nextduedate">
							<span>{$Lang.due_date}</span>
							<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
						</th>

						<th>{$Lang.remarks}</th>
						<th>{$Lang.operating}</th>
					</tr>
					</thead>
					<tbody id="serviceTbody">
					{if $Service.list}
						{foreach $Service.list as $list}
							<tr>
								<td>
									<div class="custom-control custom-checkbox mb-3">
										<input type="checkbox" class="custom-control-input row-checkbox" id="customCheck{$list.id}"
											   data-status="{$list.domainstatus}">
										<label class="custom-control-label" for="customCheck{$list.id}"></label>
									</div>
								</td>
								<td style="position:relative">

									<div class="dots" id="service{$list.id}" style="display:none" data-toggle="tooltip" data-placement="top"
										 title="{$Lang.please_wait_a_moment}..." onclick="getSingleStatus('{$list.id}')">

									</div>

									<span class="badge badge-pill font-size-12
									status-{$list.domainstatus|strtolower}"">{$Service['domainstatus'][$list['domainstatus']]['name']}</span>
								</td>
								<td>
									<a href=" servicedetail?id={$list.id}" class="text-dark">
										<strong>{$list.productname}</strong>
									</a><br />
									<small class="text-muted">{$list.domain}</small>
								</td>

								<td>
									<span class="badge badge-pill font-size-12" style="padding:0">{$list.certssl_cert_type ?? '-'}</span>
								</td>
								<td>
                                    {if ($list.domainNames_arr)}
                                        <span data-toggle="popover" data-trigger="hover" title="" data-html="true" data-content="

                                                    {foreach $list.domainNames_arr as $kd => $vd}
                                                    <div>{$vd}</div>
                                                    {/foreach}
                                                                                        " data-original-title="">
                                                <span class="badge badge-pill font-size-12" style="padding:0">
                                                    {$list.used_domainNames ?? '-'}
                                                    ({:count($list.domainNames_arr)})
                                                </span>
                                        </span>
                                    {/if}

                                    {if (!$list.domainNames_arr)}
                                        <span class="badge badge-pill font-size-12" style="padding:0">
                                                {$list.used_domainNames ?? '-'}
                                            </span>
                                    {/if}

								</td>
								<td>
									<span class="badge badge-pill font-size-12" style="padding:0">{$list.cycle_desc ?? '-'}</span>
								</td>

								<td>{if $list.notes}{$list.notes}{else}-{/if}
									<i class="bx bx-edit-alt pointer text-primary"
									   onclick="editNotesHandleClick('{$list.id}', '{$list.notes}')"></i>
									<!--  data-toggle="modal" data-target="#modifyNotesModal" -->
								</td>
								<td>
									<a href="servicedetail?id={$list.id}" class="btn btn-sm btn-primary w-xs">查看</a>
									{if $list.domainstatus == 'Pending'}
										<!-- 去付款 -->
										<a href="#" class="btn btn-sm btn-primary w-xs" onclick="payamount({$list.invoice_id})">去付款</a>
									{/if}
									{if $list.domainstatus == 'Active'}
										<!-- 签发-->
										<a href="#" class="btn btn-sm btn-primary w-xs issueCertBtn" data-hostid="{$list.id}">签发</a>
									{/if}
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
			<!-- 表单底部调用开始 -->
			<div class="table-footer">
				<div class="table-tools">

				</div>
				<div class="table-pagination">
					<div class="table-pageinfo mr-2">
						<span>{$Lang.common} {$Total} {$Lang.strips}</span>
						<span class="mx-2">
							{$Lang.each_page}
							<select name="" id="limitSel">
								<option value="10" {if $Limit==10}selected{/if}>10</option>
								<option value="15" {if $Limit==15}selected{/if}>15</option>
								<option value="20" {if $Limit==20}selected{/if}>20</option>
								<option value="50" {if $Limit==50}selected{/if}>50</option>
								<option value="100" {if $Limit==100}selected{/if}>100</option>
							</select>
							{$Lang.strips}
						</span>
					</div>
					<ul class="pagination pagination-sm">
						{$Pages}
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 签发 -->
  <div class="modal fade" id="sslIssue" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="IssueTitle"> 申请签发</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="sslIssueContent">
          <div class="sslIssueDiv">
            <form id="issus_form">
              <div class="row">
                <div class="col-sm-6">
                    <div class="form-group d-j-a-center">
                      <label for="IssueDomain" class="col-sm-3 red_label control-label label-text-right">签发域名</label>
                      <div class="col-sm-9">
                        <input type="text" value="" class="form-control" id="IssueDomain" name="used_domainNames" placeholder="请输入签发域名">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center" id="issueDomainTow" style="">
                      <label for="IssueDomainTow" class="col-sm-3 control-label label-text-right"></label>
                      <div class="col-sm-9">
                        <textarea class="form-control" rows="5" name="domainNames" id='domainVerification' placeholder="不同域名或公网 IP 地址之间请使用换行符隔开，我们支持以下格式：
idcsmart.com
*.idcsmart.com"></textarea>
					  	<div style="position: absolute;bottom: 5px;right: 30px;">
                          <span id="currentNum">0</span>/<span id="domainNum">0</span>
                        </div>
                      </div>
                    </div>

                    
                    <div class="form-group d-j-a-center">
                      <label for="issueCsr" class="col-sm-3 red_label control-label label-text-right">CSR</label>
                      <div class="col-sm-9">
                        <div class="issueCsrDiv" style="display: flex;align-items: center;">
                          <div>
                            <input type="radio" name="is_csr" id="issueCsrRadios1" value="0" checked> <span>自动生成</span>
                          </div>
                          <div>
                            <input type="radio" name="is_csr" id="issueCsrRadios2"  value="1"> <span>自行上传</span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group d-j-a-center" id="RadioTextarea" style="display: none">
                      <label for="issueCsr" class="col-sm-3 control-label"></label>
                      <div class="col-sm-9">
                        <textarea class="form-control" rows="3" name="csr_text" id="algorithmTips"></textarea>
                      </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group d-j-a-center">
                      <div class="col-sm-8">
                        <!-- 域名验证 -->
                      </div>
                      <div class="col-sm-4">

                      </div>
                    </div>
                </div>
              </div>
              <div style="font-weight: bold;margin-bottom: 5px;padding-left:28px;" id="issueseniorDivTitle">其他信息</div>
              <div class="row" id="issueseniorDiv">
                <div class="col-sm-12">
                  <div style="margin-bottom: 10px;padding-left: 28px;">联系人信息</div>
                  <div class="row verificationDiv">
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueLastname" class="col-sm-3 control-label label-text-right">姓</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$certifi_log.lastname ?? ''}" class="form-control" name="lastname" id="issueLastname" placeholder="请输入姓">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueName" class="col-sm-3 control-label label-text-right">名</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$certifi_log.firstname ?? ''}" class="form-control" name="firstname" id="issueName" placeholder="请输入名">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issuePosition" class="col-sm-3 control-label label-text-right">职位</label>
                      <div class="col-sm-9">
                        <input type="text" value="" class="form-control" name="position" id="issuePosition" placeholder="请输入职位">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueEmail" class="col-sm-3 control-label label-text-right">邮箱</label>
                      <div class="col-sm-9">
                        <input type="text" value="" class="form-control" name="email" id="issueEmail" placeholder="请输入邮箱">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issuePhone" class="col-sm-3 control-label label-text-right">电话</label>
                      <div class="col-sm-9">
                        <input type="text" value="" class="form-control" name="telephone" id="issuePhone" placeholder="请输入电话">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-12 company-box">
                  <div style="margin-bottom: 10px;padding-left: 28px;">企业信息</div>
                  <div class="row verificationDiv_t">
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCorporatename" class="col-sm-3 redStar control-label label-text-right">公司名称</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$certifi_log.orgName ?? ''}" class="form-control" name="orgName" id="issueCorporatename" placeholder="请输入公司名称">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCorporatephone" class="col-sm-3 redStar control-label label-text-right">公司电话</label>
                      <div class="col-sm-9">
                        <input type="text" value="" class="form-control" id="issueCorporatephone" name="company_phone" placeholder="请输入公司名称">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCreditCode" class="col-sm-3 redStar control-label label-text-right">信用代码</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$certifi_log.creditCode ?? ''}" class="form-control" name="creditCode" id="issueCreditCode" placeholder="请输入信用代码">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCountry" class="col-sm-3 redStar control-label label-text-right">国家</label>
                      <div class="col-sm-9">
                        <select class="form-control" id="issueCountry" name="country">
                          {foreach $iso_arr as $key => $val}
                              <option value="{$val.iso}" {if($val.iso == 'CN')} selected {/if}
                              >{$val.name_zh}({$val.iso})</option>
                          {/foreach}
                        </select>
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueProvince" class="col-sm-3 redStar control-label label-text-right">省份</label>
                      <div class="col-sm-9">
                          <input type="text" value="" class="form-control" name="province" id="issueCreditCode" placeholder="请输入省份">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCity" class="col-sm-3 redStar control-label label-text-right">城市</label>
                      <div class="col-sm-9">
                          <input type="text" value="" class="form-control" name="locality" id="issueCreditCode" placeholder="请输入城市">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCompanyaddress" class="col-sm-3 redStar control-label label-text-right">公司地址</label>
                      <div class="col-sm-9">
                        <input type="text" value="" class="form-control" id="issueCompanyaddress" name="address" placeholder="请输入公司地址">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issuePostalCode" class="col-sm-3 redStar control-label label-text-right">邮政编码</label>
                      <div class="col-sm-9">
                          <input type="text" value="" class="form-control" id="issuePostalCode" placeholder="请输入邮政编码" name="postalCode">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCountryRegistration" class="col-sm-3 redStar control-label label-text-right">注册国家</label>
                      <div class="col-sm-9">
                          <select class="form-control" id="issueCountry" name="joiCountry">
                              {foreach $iso_arr as $key => $val}
                                  <option value="{$val.iso}" {if($val.iso == 'CN')} selected {/if}
                                  >{$val.name_zh}({$val.iso})</option>
                              {/foreach}
                          </select>
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueRegisteredProvince" class="col-sm-3 redStar control-label label-text-right">注册省份</label>
                      <div class="col-sm-9">
                          <input type="text" value="" class="form-control" name="joiProvince" id="issueCreditCode" placeholder="请输入注册省份">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueRegisteredCity" class="col-sm-3 redStar control-label label-text-right">注册城市</label>
                      <div class="col-sm-9">
                          <input type="text" value="" class="form-control" name="joiLocality" id="issueCreditCode" placeholder="请输入注册城市">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueRegisteredAddress" class="col-sm-3 redStar control-label label-text-right">注册地址</label>
                      <div class="col-sm-9">
                        <input type="text" value="" class="form-control" id="issueRegisteredAddress" placeholder="请输入注册地址" name="registryAddr">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueDateRegistration" class="col-sm-3 redStar control-label label-text-right">注册日期</label>
                      <div class="col-sm-9">
                        <input type="date" value="" class="form-control" id="issueDateRegistration" placeholder="请输入注册日期" name="dateOfIncorporation">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
                <input type="hidden" name="id" value="">
                <input type="hidden" name="func" value="issue">
             </form>
          </div>
        </div>
        <div class="modal-footer">
          <button id="issueApply" type="button" class="btn btn-primary" style="width:80px;">提交</button>
          <button id="issueApplyCancel" type="button" class="btn btn-outline-light" style="width:80px;"  data-dismiss="modal">取消</button>
        </div>
      </div>
    </div>
  </div>

<style>
	.dots {
		cursor: pointer;
		width: 15px;
		height: 15px;
		border-radius: 50%;
		border: 1px solid #fff;
		position: absolute;
		top: 6px;
		left: 6px;
	}

	.on_color {
		background-color: #3fbf70;
	}

	.ing_color {
		background-color: #f5f5f5;
	}

	.off_color {
		background-color: #e31519;
	}

	.unknown_color {
		background-color: #c0c0c0;
	}

	.error_color {
		background-color: #959799;
	}

	.not_support_color {
		background-color: #2d2d2d;
	}

	#showDomain{
      color:#426dff;display: flex;align-items: center;
    }
    #showDomain span:first-child {
      display: inline-block;font-size: 24px;width: 26px;height: 26px;border: 1px solid #426dff;line-height: 22px;text-align: center;border-radius: 50%;
    }
    #showDomain span:last-child{
      margin-left: 5px;
    }
    #hideDomain{
      display: none;
      color:#999999;align-items: center;
    }
    #hideDomain span:first-child{
      display: inline-block;font-size: 24px;width: 26px;height: 26px;border: 1px solid #999999;line-height: 22px;text-align: center;border-radius: 50%;
    }
    #hideDomain span:last-child{
      margin-left: 5px;
    }
	@media screen and (max-width: 768px) {
      .sslStatus {
        height: 100% !important;
      }
      .sslStatusOne{
          padding: 0px;
      }
      .sslStatusOnedivTwo{
        padding-right:0px !important;
      }
      .ssl_operations{
          text-align: left !important;
      }
      .ssl_domain{
          margin: 15px 0px;
      }
      .ssl_detailDiv>div{
        padding-left: 0px !important;
    }
      .d-j-a-center-operation{
        display: block !important;
      }
      .td_width{
        max-width: auto !important;
        min-width: auto !important;
      }
      .label-text-right{
        text-align: left !important;
      }
      .sslIssueDiv{
        height: auto !important;
      }
    }
    .ssl_orderDetail{
        display: flex;
    }
    .ssl_orderDetail>label{
        color: #999999;
        max-width: 100px;
        min-width: 100px;
        text-align: right;
    }
    .ssl_detailDiv>div{
        padding-left: 20px;
    }
    
    .stepDiv{
        margin:30px 15px;
        
    }
    .step{
        padding: 5px 25px 30px;
        border-left: 1px solid #EFEFFF;
        position: relative;
    }
    .step>.yuan{
        width: 30px;
        height: 30px;
        border-radius: 50%;
        text-align: center;
        line-height: 28px;
        left: -15px;
        border:1px solid;
        top: 0px;
        position: absolute;
    }
    .stepContent_text{
        margin:10px 0px;
    }
    .stepNoborder{
        border-color: #fff;
    }
    .ssl-dialog-tip>div{
        color: #006EFF;
        height: 32px;
        display: flex;
        align-items: center;
        background: #F3F8FF;
        opacity: 1;
    }
    .ssl-more-operations li a{
      color: #212529;
      padding: .35rem 0.5rem;
    }
    .d-j-a-center {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-flow: wrap;
    }
    .verification-method{
      display: flex;
      width: 60%;
    }
    .verification-method>div{
      width:50%;height: 34px;border:1px solid #D1D6DD;
      text-align: center;
      line-height: 32px;
      font-size: 12px;
    }
    .verification-method>div:first-child{
      border-radius: 3px 0px 0px 3px;
    }
    .verification-method>div:last-child{
      border-radius: 0px 3px 3px 0px;
      border-left: 0px;
    }
    .poitner {
      cursor: pointer;
    }
    .v-active{
      background: #6064FF;
      color: #fff;
    }
    .d-j-a-center-operation{
      display: flex;
    }
    #v-operation-text{
      margin-bottom: 20px;
      background: #eff2f7;
      padding: 5px 0px;
      font-weight: bold;
    }
    #v-operation-text-two{
      margin-bottom: 20px;
      background: #eff2f7;
      padding: 5px 0px;
      font-weight: bold;
    }
    .td_width{
      max-width: 200px;
      min-width: 200px;
      text-align: center;
    }
    #file-table{
      display: none;
    }
    .issueCsrDiv{
      display: flex;
      align-items: center;
    }
    .issueCsrDiv >div{
      display: flex;
      align-items: center;
    }
    .issueCsrDiv >div>span{
      margin-left: 10px;
    }
    .issueCsrDiv >div>input{
      width: 16px;
      height: 16px;
    }
    .issueCsrDiv div:last-child{
      margin-left: 20px;
    }
    .issueContactsDiv{
      display: flex;
      align-items: center;
    }
    .issueContactsDiv>input{
      width: 16px;
      height: 16px;
    }
    .verificationDiv .d-j-a-center>label:before{
      content: '*';
      color: red;
    }
    .redStar:before{
      content: '*';
      color: red;
    }
	.red_label:before{
      content: '*';
      color: red;
    }
    .label-text-right{
      text-align: right;
    }
    .sslIssueDiv{
      overflow-y: auto;
      height: 450px;
      overflow-x: hidden;
    }
	/* ssl证书待验证 */
	.status-verifiy_active{
		color: #fff;
		background-color: #fca426 !important;
		border-color: #fca426 !important;
		padding: 5px 10px !important;
	}
	/* ssl证书即将过期 */
	.status-overdue_active{
		color: #fff;
		background-color: #6064FF !important;
		border-color: #6064FF !important;
		padding: 5px 10px !important;
	}
	/* ssl证书已签发 */
	.status-issue_active{
		color: #fff;
		background-color: #3FBF70 !important;
		border-color: #3FBF70 !important;
		padding: 5px 10px !important;
	}
	/* ssl证书未付款 */
    .status-pending{
      color: #fff;
      background-color: #EE6161 !important;
      border-color: #EE6161 !important;
      padding: 5px 10px !important;
    }
	/* ssl证书未使用 */
    .status-active{
      color: #fff;
      background-color: #67A4FF !important;
      border-color: #67A4FF !important;
      padding: 5px 10px !important;
    }
</style>

<!-- 修改备注弹窗 -->
<div class="modal fade" id="modifyNotesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	 aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">修改备注</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modifyNotesForm" class="needs-validation" novalidate>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">备注</label>
						<div class="col-sm-8">
							<input type="textarea" class="form-control" id="notesInp" placeholder="请输入备注" required />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary mr-2" id="modifyNotesSubmit">确定</button>
			</div>
		</div>
	</div>
</div>

<script>
	$("#domainVerification").on('blur', function () {
      let verificationText=''
      var arrtwo=[]
      var arr=$(this).val().split("\n").map(item =>{
        if(item.replace(/\s+/g,"") != '') arrtwo.push(item)
      })
      var ary=arrtwo
      var nary=ary.sort();
      for(var i=0;i<ary.length;i++){
        if (nary[i]==nary[i+1]){
          // alert("数组重复内容："+nary[i]);
          verificationText+=` ${nary[i]},`
        }
      }
	  $('#currentNum').text(arrtwo.length)
	  if($('#domainNum').text() == arrtwo.length){
        $(this).removeClass('borderRed')
      }else{
        $(this).addClass('borderRed')
      }
      if(verificationText!='') toastr.error(verificationText.slice(0,verificationText.length-1)+'域名重复');
    })
	let isCompanyInfo = 0


	$('.sslIncompleteStep button').attr('disabled', true);
	$('.sslCompletedStep button').attr('disabled', true)
	// 签发提交
	$('#issueApply').click(function(){
		let _that= $(this)
		let text= $(this).text()
		$(this).html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"  style="color:#fff;"></i>' + text)
		$.ajax({
			url: '/provision/sslCertFunc'
			,data: $('#issus_form').serialize()
			,type:'post'
			,dataType: 'json'
			,success: function(e){
				_that.html(text)
				if(e.status != 200)
				{ 
					toastr.error(e.msg);
					return false;
				}
				toastr.success(e.msg);
				setTimeout(function () {
					location.reload();
				}, 2000)
			}
		})

	})
	$('.issueCertBtn').click(function () {
		let _that= $(this)
		let text= $(this).text()
		$(this).html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"  style="color:#fff;"></i>' + text)
        var hostid = $(this).data('hostid');
          issueBeforeCheckInfo(function (e) {
			  _that.html(text)
              if(e.status != 200)
              {
                  toastr.error(e.msg);
                  return false;
              }
              // 企业信息是否必填
              var is_companyInfo = e.data.is_companyInfo
              isCompanyInfo = e.data.is_companyInfo
              for(let item of $('.verificationDiv_t')[0].children){
                 if(is_companyInfo == 0){
                   item.children[0].classList.remove("redStar");
                 }else{
                   item.children[0].classList.add("redStar");
                 }
              }

              if(is_companyInfo == 0)
              {
                  $('.company-box').hide();
              }
              // csr提示信息
              var algorithm_tips = e.data.algorithm_tips
              if(algorithm_tips!=''){
                  $('#algorithmTips')[0].placeholder=algorithm_tips
              }else{
                  $('#algorithmTips')[0].placeholder=''
              }
              $('input[name="id"]').val(hostid);
              if(e.data.flex_num == 1)
              {
                  $('#issueDomainTow').hide()
              }
              if(e.data.flex_num > 1)
              {
                  $('#issueDomainTow').show()
              }
              $('#domainNum').text(e.data.flex_num - 1)
			  var arrtwo=[]
              var arr=$("#domainVerification").val().split("\n").map(item =>{
                if(item.replace(/\s+/g,"") != '') arrtwo.push(item)
              })
              $('#currentNum').text(arrtwo.length)
              $('#sslIssue').modal('show');
          }, hostid)
      });
	function issueBeforeCheckInfo(fun, hostid)
      {
          $.ajax({
              url: '/provision/sslCertFunc'
              ,data: {id:hostid, func:'issueBeforeCheckInfo'}
              ,type: 'post'
              ,dataType: 'json'
              ,success: function (e) {
                  fun(e)
              }
          })
      }
	   //csr 操作
  $("#issueCsrRadios2").on('change', function () {
      $('#RadioTextarea').show()

  })
  $("#issueCsrRadios1").on('change', function () {
      $('#RadioTextarea').hide()
  })

  //输入姓 验证
  $("#issueLastname").on('blur', function () {
    var dom = $("#issueLastname")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入 名验证
  $("#issueName").on('blur', function () {
    var dom = $("#issueName")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入职位验证
  $("#issuePosition").on('blur', function () {
    var dom = $("#issuePosition")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入邮箱验证
  $("#issueEmail").on('blur', function () {
    var dom = $("#issueEmail")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入电话验证
  $("#issuePhone").on('blur', function () {
    var dom = $("#issuePhone")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入公司名称验证
  $("#issueCorporatename").on('blur', function () {
    var dom = $("#issueCorporatename")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入公司电话验证
  $("#issueCorporatephone").on('blur', function () {
    var dom = $("#issueCorporatephone")[0]
    if(isCompanyInfo == 1){    
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入信用代码验证
  $("#issueCreditCode").on('blur', function () {
    var dom = $("#issueCreditCode")[0]
    if(isCompanyInfo == 1){    
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入国家验证
  $("#issueCountry").on('blur', function () {
    var dom = $("#issueCountry")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入省份验证
  $("#issueProvince").on('blur', function () {
    var dom = $("#issueProvince")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入城市验证
  $("#issueCity").on('blur', function () {
    var dom = $("#issueCity")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入公司地址验证
  $("#issueCompanyaddress").on('blur', function () {
    var dom = $("#issueCompanyaddress")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入邮政编码验证
  $("#issuePostalCode").on('blur', function () {
    var dom = $("#issuePostalCode")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册国家
  $("#issueCountryRegistration").on('blur', function () {
    var dom = $("#issueCountryRegistration")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册省份
  $("#issueRegisteredProvince").on('blur', function () {
    var dom = $("#issueRegisteredProvince")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册城市
  $("#issueRegisteredCity").on('blur', function () {
    var dom = $("#issueRegisteredCity")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册地址
  $("#issueRegisteredAddress").on('blur', function () {
    var dom = $("#issueRegisteredAddress")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册日期
  $("#issueDateRegistration").on('blur', function () {
    var dom = $("#issueDateRegistration")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  
  $('#showDomain').on('click', function (){
    console.log(123)
    $(this).css("display","none")
    $('#hideDomain').css("display","flex")
    $('#issueDomainTow').show()
  })
  $('#hideDomain').on('click', function (){
    console.log(123)
    $(this).css("display","none")
    $('#showDomain').css("display","flex")
    $('#issueDomainTow').hide()
  })
</script>
<script src="/themes/clientarea/yunyoo/assets/js/billing.js?v={$Ver}"></script>
<script>
	var serviceList = {:json_encode($Service.list)}; // 当前页列表数据
	$(function () {
		if($('.row-checkbox:checked').length){
			$('#readBtn').removeAttr('disabled').removeClass('not-allowed');
		}else {
			$('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
		}
		var url = 'service?groupid={$Think.get.groupid}'
		// 每页数量选择改变
		$('#limitSel').on('change', function () {
			location.href = url + '&keywords={$Think.get.keywords}&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page=1&limit=' + $('#limitSel').val()

		})



		// 表格多选
		$('input[name="headCheckbox"]').on('change', function () {
			$('.row-checkbox').prop("checked", $(this).is(':checked'))
			if ($('.row-checkbox:checked').length) {
				$('#readBtn').removeAttr('disabled').removeClass('not-allowed');
			} else {
				$('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}
			// 以产品状态来判断批量操作按钮是否启用
			let xfStatus = true;
			let plStatus = true;
			const allCheck = [...$('.row-checkbox:checked')]
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"&&thisStatus!="已暂停"){
					xfStatus = false;
				}
			})
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"){
					plStatus = false;
				}
			})
			if(xfStatus&&allCheck.length>0) {
				$("#readBtn").removeAttr("disabled")
			} else {
				$("#readBtn").attr("disabled","disabled")
			}
			if(plStatus&&allCheck.length>0) {
				$("#bulkOperation").removeAttr("disabled")
			} else {
				$("#bulkOperation").attr("disabled","disabled")
			}
		});
		$('.row-checkbox').on('change', function () {
			$('input[name="headCheckbox"]').prop('checked', $('.row-checkbox').length === $('.row-checkbox:checked')
					.length)
			// 下面这个判断处理底部按钮的disabled
			if ($('.row-checkbox:checked').length) {
				$('#readBtn').removeAttr('disabled').removeClass('not-allowed');
			} else {
				$('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}

			let statusArr = getCheckStatus() // 获取所有勾选的状态
			if (statusArr.every(i => i == 'Pending')) {
				$('#bulkOperation').addClass('not-allowed').attr('disabled', 'disabled');
			} else {
				$('#bulkOperation').removeClass('not-allowed').removeAttr('disabled');
			}
			// 以产品状态来判断批量操作按钮是否启用
			let xfStatus = true;
			let plStatus = true;
			const allCheck = [...$('.row-checkbox:checked')]
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"&&thisStatus!="已暂停"){
					xfStatus = false;
				}
			})
			allCheck.forEach(res=>{
				let thisStatus = $(res).parents('td').next().find('.badge-pill').html();
				if(thisStatus!="已激活"){
					plStatus = false;
				}
			})
			if(xfStatus&&allCheck.length>0) {
				$("#readBtn").removeAttr("disabled")
			} else {
				$("#readBtn").attr("disabled","disabled")
			}
			if(plStatus&&allCheck.length>0) {
				$("#bulkOperation").removeAttr("disabled")
			} else {
				$("#bulkOperation").attr("disabled","disabled")
			}
		});

		$('#readBtn').on('click', function () {
			var idArr = getCheckbox()
			var str = idArr.reduce(function (total, item) {
				return total + '&host_ids[]=' + item
			}, '')
			location.href = '/mulitrenew?' + str
		})

		// 获取所有勾选项的id
		const getCheckbox = function () {
			// 勾选的id
			const ids = []
			// 所有表格内的checkbox
			const allCheck = [...$('.row-checkbox:checked')]
			for (const key in allCheck) {
				if (Object.hasOwnProperty.call(allCheck, key)) {
					const item = allCheck[key];
					ids.push(item.id.substring(11))
				}
			}
			return ids
		}
		// 获取所有勾选项的Status
		const getCheckStatus = function () {
			// 勾选的id
			const statusArr = []
			// 所有表格内的checkbox
			const allCheck = [...$('.row-checkbox:checked')]
			for (const key in allCheck) {
				if (Object.hasOwnProperty.call(allCheck, key)) {
					const item = allCheck[key];
					statusArr.push($(item).attr('data-status'))
				}
			}
			return statusArr
		}

		// 给当前页数据加属性
		for (let i = 0; i < serviceList.length; i++) {
			const item = serviceList[i]
			item.loading = false
			item.status = {
				data: {
					des: '',
					status: ''
				},
				status: 0
			}
		}

		getStatus(serviceList) // 请求列表电源状态
	})
	// 获取所有勾选项的id
	var getCheckbox = function () {
		// 勾选的id
		const ids = []
		// 所有表格内的checkbox
		const allCheck = [...$('.row-checkbox:checked')]
		for (const key in allCheck) {
			if (Object.hasOwnProperty.call(allCheck, key)) {
				const item = allCheck[key];
				ids.push(item.id.substring(11))
			}
		}
		return ids
	};

	let loopStatusTimer = null; // 循环定时器
	let batchObj = { // 发请求用的对象
		id: [],
		func: '',
		code: ''
	};
	let tableMul = getCheckbox()
	function handleOperating(command) { // 批量操作
		clearInterval(loopStatusTimer)
		batchObj.id.length = 0
		batchObj.func = command
		tableMul = getCheckbox()
		// vue那边的逻辑，直接赋值也行，因为那边的item是row，这边的item直接就是id，所以可以直接push
		for (let i = 0; i < tableMul.length; i++) {
			const item = tableMul[i]
			batchObj.id.push(item)
		}

		$.ajax({
			type: "post",
			url: '' + '/provision/default',
			data: batchObj,
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)

					loopGetStatus(serviceList)
				}
			}
		});

		// if (this.tableData.length === 1) {
		// 	this.tableData[0].status.data.status = 'process'
		// }

	};

	function getStatus(items) { // 获取列表电源状态
		const obj = {
			id: [],
			func: 'status ',
			code: ''
		}
		items = items.filter(i => {
			if(i.status.data) return i.status.data.status!=='on';
			//return i.status?.data?.status !== 'on'
		})
		if (Array.isArray(items)) {
			for (let i = 0; i < items.length; i++) {
				const element = items[i]
				obj.id.push(element.id)
			}
		}
		if (!obj.id.length) {
			clearInterval(loopStatusTimer)
			loopStatusTimer = null
			return
		}

		$.ajax({
			type: "post",
			url: '' + '/provision/default',
			data: obj,
			success: function (data) {
				// 以下注释部分功能为：
				// 如果全是不能查状态的，或者，能查状态的全开机了，就不再发查询请求，
				// 但是现有问题是：在全开机的情况下，发起批量操作后，第一次查询依旧全是开机状态，则会导致停止查询，需要看后端能不能返回的及时一点
				// 也可以不改，就是查够5分钟或者切换页面就停

				// let allStatus = Object.values(data.data) || []
				// let sucArr = [] // 可以正常返回状态的服务器
				// let errArr = []	// 不支持查询状态的服务器
				// // 把列表服务器分成能查状态的和不能查状态的
				// for (let i = 0; i < allStatus.length; i++) {
				// 	const item = allStatus[i];
				// 	if (item.status === 200) {
				// 		sucArr.push(item)
				// 	} else {
				// 		errArr.push(item)
				// 	}
				// }

				// let allOpen = function () { // 返回是否所有能查状态的服务器全是开机状态
				// 	const statusArr = []
				// 	sucArr.forEach(i=>{
				// 		statusArr.push(i.data.status)
				// 	})
				// 	return statusArr.every(i => i === 'on')
				// }
				// if (!sucArr.length) { // 全都是不能查状态的，结束定时器不查了
				// 	console.log('全都不可以查询状态')
				// 	clearInterval(loopStatusTimer)
				// 	loopStatusTimer = null
				// } else if (allOpen()) {
				// 	console.log('能查状态的全是开机了')
				// 	clearInterval(loopStatusTimer)
				// 	loopStatusTimer = null
				// }
				for (const k in data.data) {
					const element = data.data[k]
					if (element.status === 200) {
						$(`#service${k}`)
								.show()
								.attr('data-original-title', element.data.des);
						setColor(element, k)

					}
				}
			}
		});

	};

	function getSingleStatus(id) { // 单个查状态
		const loadingIcon = `<i class="bx bx-loader bx-spin font-size-14 text-dark" style="position: relative; top: -1px;"></i>`
		$(`#service${id}`).removeClass().addClass('dots ing_color').html(loadingIcon);

		const obj = {
			id: [id],
			func: 'status ',
			code: ''
		}
		$.ajax({
			type: "post",
			url: '' + '/provision/default',
			data: obj,
			success: function (data) {

				const result = data.data[id]
				if (result.status === 200) {
					$(`#service${id}`)
							.show()
							.attr('data-original-title', result.data.des);
					$(`#service${id}`).removeClass().addClass('dots');
					setColor(result, id)
				}
			}
		});
	};

	function setColor(item, id) {
		//console.log('id: ', id);
		//console.log('item: ', item.data.status);
		if (item.data.status === 'on') {
			$(`#service${id}`).removeClass().addClass('dots on_color').html('');
		} else if (item.data.status === 'off') {
			$(`#service${id}`).removeClass().addClass('dots off_color').html('');
		} else if (item.data.status === 'unknown') {
			$(`#service${id}`).removeClass().addClass('dots unknown_color').html('');
		} else if (item.data.status === 'process') {
			const loadingIcon = `<i class="bx bx-loader bx-spin font-size-14 text-dark" style="position: relative; top: -1px;"></i>`
			$(`#service${id}`).removeClass().addClass('dots ing_color').html(loadingIcon);
		}
	};

	function loopGetStatus(items) { // 循环5分钟
		if (loopStatusTimer !== null) { // 如果不是初始值，则恢复成初始值
			clearInterval(loopStatusTimer)
		}
		let endTime = 0
		getStatus(items) // 先调用一次
		loopStatusTimer = setInterval(async () => {
			if (endTime >= 300) { // 超过300秒
				clearInterval(loopStatusTimer)
				loopStatusTimer = null
				return
			}
			getStatus(serviceList)
			endTime += 15
		}, 15 * 1000)
	};



	// 修改备注
	var rowId = 0
	function editNotesHandleClick(id, notes) {
		rowId = id
		$('#modifyNotesModal').modal('show')
		$('#notesInp').val(notes)
	}
	$('#modifyNotesSubmit').on('click', function () {
		$.ajax({
			type: "POST",
			url: '' + '/host/remark',
			data: {
				id: rowId,
				remark: $('#notesInp').val()
			},
			success: function (data) {
				toastr.success(data.msg)
				$('#modifyNotesModal').modal('hide')
				location.reload()
			}
		});
	});


</script>

<script src="/themes/clientarea/yunyoo/assets/libs/clipboard/clipboard.min.js?v={$Ver}"></script>
<script>
	// var clipboard = null
	// var ips = {:json_encode($Service.list)};
	// // console.log('ips: ', ips);
	// $(document).on('mouseover', '.iptd', function () {
	//   $('#popModal').modal('show')
	//   $('#popTitle').text('IP地址')
	//   if (clipboard) {
	//     clipboard.destroy()
	// 	}

	//   ips.forEach(function(item, index)  {
	// 		if (item.dedicatedip && item.assignedips && $(this).attr('id') == ('ips'+item.id)) {
	// 			var ipbox = `
	// 				<div class="text-right text-primary mb-2 pointer" id="copyip${item.id}" data-clipboard-action="copy" data-clipboard-target="#ippopbox${item.id}">复制</div>
	// 				<div id="ippopbox${item.id}"></div>
	// 			`

	// 			$('#popContent').html(ipbox)
	// 			var iplist = ''
	// 			item.assignedips.forEach(ipitem => {
	// 				iplist += `
	// 					<div>${ipitem}</div>
	// 				`
	// 			})
	// 			$('#ippopbox'+item.id).html(iplist)

	// 			// 复制
	// 			clipboard = new ClipboardJS('#copyip'+item.id, {
	//         text: function (trigger) {
	//           return $('#ippopbox'+item.id).text()
	//         },
	//         container: document.getElementById('popModal')
	//       });
	//       clipboard.on('success', function (e) {
	//         toastr.success('{$Lang.copy_succeeded}');
	//       })
	// 		}

	//   })


	// });

</script>