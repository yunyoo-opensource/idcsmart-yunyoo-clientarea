{if $Think.get.action == 'add' || $Think.get.action == 'edit'}

{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg" url="invoicecompany"}
{/if}

<script type="text/javascript">
	$(function () {
		setIssueType()
		$('input[name="issue_type"]').on('change', function () {
			setIssueType()
		})

		// 提交加载中
		$('.submitBtn').on('click', function () {
			$('.submitBtn').prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
		});

		setLoginIDRequire()
		$("input[name='issue_type']").on('change', function () {
			console.log($("input[name='issue_type']:checked").val())
			setLoginIDRequire()
		});
	});
	function setLoginIDRequire() {
		let issuingType = $("input[name='issue_type']:checked").val()
		console.log('issuingType: ', issuingType);
		if (issuingType == 'person') {
			$("input[name='tax_id']").removeAttr('required');
		} else if (issuingType == 'company') {
			$("input[name='tax_id']").attr('required', 'required');
		}
	}
	// 不同开具类型 展示不同字段
	function setIssueType() {
		var activeRadio = $("input[name='issue_type']:checked").val()
		if (activeRadio === 'person') {
			$('#companyType').hide()
		} else if (activeRadio === 'company') {
			$('#companyType').show()
		}
	}
	
</script>

<div class="card">
	<div class="card-body">
		<form method="post" class="needs-validation" novalidate>
			<div class="row">
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="formrow-email-input">{$Lang.issue_type}</label>
								<div class="custom-control custom-radio">
									<span class="mr-5">
										<input type="radio" id="personRadio" name="issue_type" value="person" class="custom-control-input"
											{if $Invoicecompany.voucher_info.issue_type=='person' }checked{/if}> <label
											class="custom-control-label" for="personRadio">{$Lang.personal}</label>
									</span>
									<span>
										<input type="radio" id="companyRadio" name="issue_type" value="company" class="custom-control-input"
											{if $Invoicecompany.voucher_info.issue_type=='company' || $Think.get.action !='edit'
											}checked{/if}> <label class="custom-control-label" for="companyRadio">{$Lang.company}</label>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>{$Lang.invoice_title}</label>
								<input type="text" class="form-control" name="title" {if
									$Invoicecompany.voucher_info.title}value="{$Invoicecompany.voucher_info.title}" {/if} required>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8" id="companyType">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="formrow-email-input">{$Lang.invoice_type}</label>
								<div class="custom-control custom-radio">
									<span class="mr-5">
										<input type="radio" id="addedTaxCommon" name="voucher_type" value="common"
											class="custom-control-input" {if $Invoicecompany.voucher_info.voucher_type=='common' ||
											$Think.get.action=='add' }checked{/if}> <label class="custom-control-label"
											for="addedTaxCommon">{$Lang.vat_invoice}</label>
									</span>
									<span>
										<input type="radio" id="addedTaxDedicated" name="voucher_type" value="dedicated"
											class="custom-control-input" {if $Invoicecompany.voucher_info.voucher_type=='dedicated'
											}checked{/if}> <label class="custom-control-label" for="addedTaxDedicated">{$Lang.special_vat_invoice}</label>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>{$Lang.tax_registration_number}</label>
								<input type="text" class="form-control" name="tax_id" id="loginID" {if
									$Invoicecompany.voucher_info.title}value="{$Invoicecompany.voucher_info.tax_id}" {/if} required>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>{$Lang.name_deposit_bank}</label>
								<input type="text" class="form-control" name="bank" {if
									$Invoicecompany.voucher_info.title}value="{$Invoicecompany.voucher_info.bank}" {/if}> </div> </div>
									<div class="col-md-6">
								<div class="form-group">
									<label>{$Lang.account_number_deposit}</label>
									<input type="text" class="form-control" name="account" {if
										$Invoicecompany.voucher_info.title}value="{$Invoicecompany.voucher_info.account}" {/if}
										oninput="value=value.replace(/[^\d]/g,'')">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>{$Lang.company_address}</label>
									<input type="text" class="form-control" name="address" {if
										$Invoicecompany.voucher_info.title}value="{$Invoicecompany.voucher_info.address}" {/if}> </div>
										</div> <div class="col-md-6">
									<div class="form-group">
										<label>{$Lang.contact_number}</label>
										<input type="text" class="form-control" name="phone" {if
											$Invoicecompany.voucher_info.title}value="{$Invoicecompany.voucher_info.phone}" {/if}
											oninput="value=value.replace(/[^\d]/g,'');if(value.length>11)value=value.slice(0,11)">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<button type="submit" class="btn btn-primary w-md w-100 submitBtn">{$Think.get.action !='edit' ?
											$Lang.establish :
											$Lang.modify}</button>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<a href="invoicecompany" class="btn btn-outline-light w-md w-100">{$Lang.return}</a>
									</div>
								</div>
							</div>
						</div>
					</div>
		</form>
	</div>
</div>

{else}

{include file="includes/tablestyle"}

<script>
	$(function () {
		// 排序
		var status = '{$Think.get.status}'
		$('.bg-light th').on('click', function () {
			var sort = '{$Think.get.sort}'
			location.href = 'invoicecompany?sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr(
				'prop') + '&page={$Think.get.page}&limit={$Think.get.limit}'
		})
		//排序样式
		changeStyle()
			function changeStyle() {
			$('.bg-light th.pointer').children().children().css('color','rgba(0, 0, 0, 0.1)')
			var sort = '{$Think.get.sort}'
			let orderby = '{$Think.get.orderby}'
			let index,
			n
			if(orderby === 'id') {
			n = 0
			} else if(orderby === 'tax_id') {
			n = 1
			} 
			if (sort === 'desc') {
			index = 1 + 2 * n
			} else if(sort === 'asc'){
			index = 0 + 2 * n
			}
			$('.bg-light th.pointer').children().children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
			}
	})
</script>
<div class="card">
	<div class="card-body">
		<div class="table-container">

			<div class="table-header">
				<div class="table-tools">
					<a href="invoicecompany?action=add" class="btn btn-primary btn-sm waves-effect waves-light">{$Lang.add_invoice_information}</a>
				</div>
				<div class="table-tools">
				</div>
			</div>

			<div class="table-responsive">
				<table class="table tablelist">
					<colgroup>
						<col>
						<col width="15%">
						<col>
						<col>
						<col>
						<col width="15%">
					</colgroup>
					<thead class="bg-light">
						<tr>
							<th class="pointer" prop="id">
								<span>ID</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th>
								<span>{$Lang.header_information}</span>
							</th>
							<th>
								<span>{$Lang.issue_type}</span>
							</th>
							<th>
								<span>{$Lang.invoice_type}</span>
							</th>
							<th class="pointer" prop="tax_id">
								<span>{$Lang.tax_registration_number}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th>{$Lang.operating}</th>
						</tr>
					</thead>
					<tbody>
						{if $Invoicecompany}
						{foreach $Invoicecompany as $list}
						<tr>
							<td>{$list.id}</td>
							<td>{$list.title}</td>
							<td>{$list.issue_type_zh}</td>
							<td>{$list.voucher_type_zh}</td>
							<td>{$list.tax_id}</td>
							<td>
								<a href="invoicecompany?action=edit&id={$list.id}" class="text-primary mr-2"><i
										class="bx bx-edit-alt"></i> {$Lang.modify}</a>
								<a href="javascript:void(0)" class="text-danger" onclick="delTitle('{$list.id}')"><i
										class="fas fa-times-circle"></i> {$Lang.delete}</a>
							</td>
						</tr>
						{/foreach}
						{else}
						<tr>
							<td colspan="8">
								<div class="no-data">{$Lang.nothing}</div>
							</td>
						</tr>
						{/if}
					</tbody>
				</table>
			</div>
			<!-- 表单底部调用开始 -->
			{include file="includes/tablefooter"  url="invoicecompany"}
		</div>
	</div>
</div>
<script>
	function delTitle(id) {
		console.log(id)
		$.ajax({
			type: "DELETE",
			url: '/voucher/voucherinfo',
			data: {
				id
			},
			success: function (data) {
				if (data.status !== 200) {
					toastr.error(data.msg)
					return
				}
				toastr.success(data.msg)
				location.reload()
			}
		});
	}
</script>
{/if}