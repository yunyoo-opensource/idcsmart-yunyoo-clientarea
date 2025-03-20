<!-- 发票查看 -->
<!-- select -->
<link rel="stylesheet"
	href="/themes/clientarea/yunyoo/assets/libs/bootstrap-select/css/bootstrap-select.min.css?v={$Ver}">
<script src="/themes/clientarea/yunyoo/assets/libs/bootstrap-select/js/bootstrap-select.min.js?v={$Ver}"></script>
{include file="includes/paymodal"}

{if $Think.get.action == 'check'}
<div class="card">
	<div class="card-body">
		<div class="container-fluid">
			<div class="row mb-3">
				<div class="col-12">
					<label class="text-black-50">{$Lang.issue_type}：</label>
					<span class="text-black">{$Invoicedetail.voucher.issue_type_zh}</span>
				</div>
				<div class="col-xs-12 col-lg-6">
					<label class="text-black-50">{$Lang.header_information}：</label>
					<span class="text-black">{$Invoicedetail.voucher.title}</span>
				</div>
				<div class="col-xs-12 col-lg-6">
					<label class="text-black-50">{$Lang.express_information}：</label>
					<span class="text-black">{$Invoicedetail.voucher.name}</span>
				</div>
				<div class="col-12">
					<label class="text-black-50">{$Lang.mailing_address}：</label>
					<span
						class="text-black">{$Invoicedetail.voucher.province}{$Invoicedetail.voucher.city}{$Invoicedetail.voucher.region}{$Invoicedetail.voucher.detail}</span>
				</div>
			</div>
		</div>
		<table class="table mb-0">
			<thead>
				<tr>
					<th>{$Lang.product_name}</th>
					<th>{$Lang.amount_money}</th>
					<th>{$Lang.tax_rate}</th>
					<th>{$Lang.tax_amount}</th>
				</tr>
			</thead>
			<tbody>
				{if $Invoicedetail.invoices}
				{foreach $Invoicedetail.invoices as $list}
				<tr>
					<td>
						{foreach $list.items as $sublist}
						<pre>{$sublist.description}</pre>
						{/foreach}
					</td>
					<td>{$Currency.prefix}{$list.subtotal}</td>
					<td>{$list.taxed}</td>
					<td>{$Currency.prefix}{$list.taxed_amount}</td>
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
		<div>{$Lang.deduction_invoice}：{$Currency.prefix}{$Invoicedetail.voucher_amount} +
			{$Lang.invoice_mailing_express_fee}{$Currency.prefix}{$Invoicedetail.voucher.price}</div>
	</div>
</div>

{elseif $Think.get.action == 'invoiceapply'}

<!-- 开具发票 -->
{if $Think.get.type == 'issue'}

{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg" url="invoicelists"}
{/if}

<script type="text/javascript">
	$('.selectpicker').selectpicker();
	$(function () {
		setIssueType()
		$('input[name="type"]').on('change', function () {
			setIssueType()
		})
	});
	// 不同开具类型 展示不同字段
	function setIssueType() {
		var activeRadio = $("input[name='type']:checked").val()
		if (activeRadio == 'person') {
			$('#personTitle').show()
			$('#companyTitle').hide()
		} else if (activeRadio == 'company') {
			$('#personTitle').hide()
			$('#companyTitle').show()
		}
	}
</script>
<div class="card">
	<div class="card-body">
		<form method="post" class="needs-validation" novalidate>
			<div class="form-group row mb-4">
				<label for="horizontal-firstname-input" class="col-sm-1 col-form-label">{$Lang.issue_type}</label>
				<div class="col-sm-11">
					<div class="custom-control custom-radio">
						<span class="mr-5">
							<input class="custom-control-input" type="radio" id="personRadio" name="type" value="person">
							<label class="custom-control-label" for="personRadio">{$Lang.personal}</label>
						</span>
						<span>
							<input class="custom-control-input" type="radio" id="companyRadio" name="type" value="company" checked>
							<label class="custom-control-label" for="companyRadio">{$Lang.company}</label>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group row mb-4">
				<label for="horizontal-email-input" class="col-sm-1 col-form-label">{$Lang.header_information}</label>
				<div class="col-sm-5">
					<select id="personTitle" class="form-control select2 select2-hidden-accessible" data-select2-id="1"
						tabindex="-1" aria-hidden="true">
						{foreach $Issuevoucher.title.person as $list}
						<option value="CA" data-persontitleid="{$list.id}">{$list.title}</option>
						{/foreach}
					</select>
					<select id="companyTitle" class="form-control select2 select2-hidden-accessible" data-select2-id="1"
						tabindex="-1" aria-hidden="true">
						{foreach $Issuevoucher.title.company as $list}
						<option value="CA" data-companytitleid="{$list.id}">{$list.title}</option>
						{/foreach}
					</select>
				</div>
				<label for="horizontal-email-input" class="col-sm-1 col-form-label">{$Lang.express_information}</label>
				<div class="col-sm-5">
					<select class="form-control select2 select2-hidden-accessible" id="courierOptions" data-select2-id="1"
						tabindex="-1" aria-hidden="true">
						{foreach $Issuevoucher.express as $list}
						<option value="{$list.price}" data-courierid="{$list.id}">{$list.name}({$Lang.postage}{$list.price})
						</option>
						{/foreach}
					</select>
				</div>
			</div>
			<div class="form-group row mb-4">
				<label for="horizontal-password-input" class="col-sm-1 col-form-label">{$Lang.mailing_address}</label>
				<div class="col-sm-11">
					<select class="form-control select2 select2-hidden-accessible selectpicker" id="mailingAddress"
						data-select2-id="1" tabindex="-1" aria-hidden="true">
						{foreach $Issuevoucher.post as $list}
						<option value="CA" selected="{if $list.default == '1'}true{else}false{/if}" data-addressid="{$list.id}"
							data-content="{if $list.default == '1'}<i class='fas fa-star text-warning mr-2'></i>{else}<i class='fas fa-star text-warning mr-2' style='opacity: 0;'></i>{/if}{$list.province}{$list.city}{$list.region}">
							{$list.province}{$list.city}{$list.region}
						</option>
						{/foreach}
					</select>
				</div>
			</div>

			<div class="form-group row justify-content-end">
				<div class="col-sm-12" style="overflow: auto;">
					<table class="table mb-0">
						<thead>
							<tr>
								<th>{$Lang.product_name}</th>
								<th>{$Lang.amount_money}</th>
								<th>{$Lang.tax_rate}</th>
								<th>{$Lang.tax_amount}</th>
							</tr>
						</thead>
						<tbody>
							{if $Issuevoucher.invoices}
							{foreach $Issuevoucher.invoices as $list}
							<tr>
								<td>
									{foreach $list.items as $sublist}
									<pre>{$sublist.description}</pre>
									{/foreach}
								</td>
								<td>{$Currency.prefix}{$list.subtotal}</td>
								<td>{$list.taxed}</td>
								<td>{$Currency.prefix}{$list.taxed_amount}</td>
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
			</div>
			<div class="form-group row justify-content-between px-4">
				<div>{$Lang.deduction_invoice}：{$Currency.prefix}{$Issuevoucher.voucher_amount} +
					{$Lang.invoice_mailing_express_fee}<span id="courierFees"></span>
				</div>

			</div>
			<div>
				<!-- 跳账单页进行支付 -->
				<button type="button" class="btn btn-primary w-md" onclick="confirmPayment()">{$Lang.confirm_payment}</button>
				<button type="button" class="btn border w-md" onclick="goBack()">{$Lang.return}</button>
			</div>
		</form>
	</div>
</div>
<script>
	// 返回
	function goBack() {
		location.replace('/invoicelist?action=invoiceapply')
	}
	// 动态修改快递非哟领
	$(document).ready(function () {
		$('#courierFees').text($("#courierOptions option:selected").val());

		$('#courierOptions').on('change', function () {
			$('#courierFees').text($("#courierOptions option:selected").val());
		});
	});
//防抖

function debounce(fn, wait) {
let timer;
return function () {
clearTimeout(timer);
timer = setTimeout(() => {
fn.apply(this, arguments) // 把参数传进去
}, wait);
}
}
	// 确认支付
	const confirmPayment = debounce (function () {

	// 表单验证
	var activeRadio = $("input[name='type']:checked").val()
	var personTitle = document.getElementById('personTitle')
	var companyTitle = document.getElementById('companyTitle')
	var courierOptions = document.getElementById('courierOptions')
	var mailingAddress = document.getElementById('mailingAddress')
	if (activeRadio === 'person') {
	if (personTitle.value == '') {
	personTitle.classList.remove("is-valid"); //清除合法状态
	personTitle.classList.add("is-invalid"); //添加非法状态
	return
	} else {
	personTitle.classList.remove("is-invalid");
	personTitle.classList.add("is-valid");
	}
	} else if (activeRadio === 'company') {
	if (companyTitle.value == '') {
	companyTitle.classList.remove("is-valid"); //清除合法状态
	companyTitle.classList.add("is-invalid"); //添加非法状态
	return
	} else {
	companyTitle.classList.remove("is-invalid");
	companyTitle.classList.add("is-valid");
	}
	}
	if (courierOptions.value == '') {
	courierOptions.classList.remove("is-valid"); //清除合法状态
	courierOptions.classList.add("is-invalid"); //添加非法状态
	return
	} else {
	courierOptions.classList.remove("is-invalid");
	courierOptions.classList.add("is-valid");
	}
	if (mailingAddress.value == '') {
	mailingAddress.classList.remove("is-valid"); //清除合法状态
	mailingAddress.classList.add("is-invalid"); //添加非法状态
	return
	} else {
	mailingAddress.classList.remove("is-invalid");
	mailingAddress.classList.add("is-valid");
	}

	const queryObj = {
	express_id: $("#courierOptions option:selected").attr("data-courierid"),
	invoice_ids: {:json_encode($Think.get.invoice_ids)
	},
	post_id: $("#mailingAddress option:selected").attr("data-addressid"),
	type: $("input[name='type']:checked").val(),
	type_id: '',
	}
	if (queryObj.type == 'company') {
	queryObj.type_id = $('#companyTitle option:selected').attr('data-companytitleid')
	} else if (queryObj.type == 'person') {
	queryObj.type_id = $('#personTitle option:selected').attr('data-persontitleid')
	}

	$.ajax({
	type: "post",
	url: '' + '/voucher/issuevoucher',
	data: JSON.stringify(queryObj),
	dataType: 'JSON',
	headers: {
	'Content-Type': 'application/json;charset=UTF-8',
	},
	success: function (data) {

	if (data.status === 1001) {
	toastr.success(data.msg);
	location.replace('/invoicelist?action=invoiceapply')
	} else {

	location.replace(`/viewbilling?id=${data.data.invoice_id}`)
	}
	}
	});
	},1000)
</script>

<!-- 发票申请列表 -->
{else}
<script>
	$(function () {
		// 关键字搜索
		$('#searchInp').val('{$Think.get.keywords}')

		$('#searchInp').on('keydown', function (e) {
			if (e.keyCode == 13) {
				location.href = 'invoicelist?action=invoiceapply&keywords=' + $('#searchInp').val() +
					'&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}'
			}
		})
		$('#searchIcon').on('click', function () {
			location.href = 'invoicelist?action=invoiceapply&keywords=' + $('#searchInp').val() +
				'&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}'
		});

		// 排序
		$('.bg-light th:not(.checkbox)').on('click', function () {
			var sort = '{$Think.get.sort}'
			location.href = 'invoicelist?action=invoiceapply&keywords={$Think.get.keywords}&sort=' + (sort == 'desc' ?
					'asc' : 'desc') + '&orderby=' + $(this).attr('prop') +
				'&page={$Think.get.page}&limit={$Think.get.limit}'
		})

		// 多选开具发票
		var headCheckbox = $('input[name="invoiceCheckHead"]')
		var rowCheckbox = $('input[name="invoiceCheckRow"]');
		// [...rowCheckbox].forEach(item => {
		// 	
		// 	$(item).removeAttr('checked')
		// })
		var invoice_ids = []
		headCheckbox.on('change', function () {
			if (headCheckbox.is(':checked')) {
				rowCheckbox.attr('checked', true)
			} else {
				rowCheckbox.attr('checked', false)
			}

			[...rowCheckbox].forEach(item => {
				invoice_ids.push(item.value)
			})
			// 

		});

		rowCheckbox.on('change', function () {
			if ($(this).is(':checked')) {
				invoice_ids.push($(this)[0].value)
			}
		});

		$('#issueBtn').on('click', function () {
			invoice_ids = []
			$('.row-checkbox:checked').each(function () {
				invoice_ids.push($(this).val())
			})
			if (invoice_ids.length > 0) {
				var params = ''
				invoice_ids.forEach(item => {
					params += '&invoice_ids[]=' + item
				})
				location.href = 'invoicelist?action=invoiceapply&type=issue' + params
			}
		});


	})
</script>
{include file="includes/tablestyle"}
<div class="card">
	<div class="card-body">
		<div class="table-container">
			<div class="table-header">
				<div class="table-filter">
					<div class="row">
						<div class="col">
						</div>
					</div>
				</div>
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
						<col>
						<col width="15%">
						<col>
						<col>
						<col>
						<col width="10%">
					</colgroup>
					<thead class="bg-light">
						<tr>
							<th class="checkbox"><input type="checkbox" name="invoiceCheckHead" /></th>
							<th class="pointer" prop="id">
								<span>{$Lang.bill_no}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="subtotal">
								<span>{$Lang.amount_money}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="type">
								<span>{$Lang.type}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="paid_time">
								<span>{$Lang.payment_time}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th>{$Lang.operating}</th>
						</tr>
					</thead>
					<tbody>
						{if $Invoiceapply}
						{foreach $Invoiceapply as $list}
						<tr>
							<td><input class="row-checkbox" type="checkbox" name="invoiceCheckRow" value="{$list.id}" /></td>
							<td><span class="badge badge-light"># {$list.id}</span></td>
							<td>{$Currency.prefix}{$list.subtotal}</td>
							<td>{$list.type_zh}</td>
							<td>{if $list.paid_time}{$list.paid_time|date="Y-m-d H:i"}{else}-{/if}</td>
							<td>
								<a href="invoicelist?action=invoiceapply&type=issue&invoice_ids={$list.id}"
									class="text-primary mr-2">{$Lang.invoice}</a>
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
				<button class="btn btn-primary btn-sm" id="issueBtn">{$Lang.invoice}</button>
			</div>
			<!-- 表单底部调用开始 -->
			{include file="includes/tablefooter" url="invoicelist"}
		</div>
	</div>
</div>

{/if}

<!-- 发票列表 -->
{else}

{include file="includes/tablestyle"}
<script>
	$(function () {
		// 排序
		var status = '{$Think.get.status}'
		$('.bg-light th').on('click', function () {
			var sort = '{$Think.get.sort}'
			location.href = 'invoicelist?sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr(
				'prop') + '&page={$Think.get.page}&limit={$Think.get.limit}'
		})
		//排序样式
		changeStyle()

		function changeStyle() {
			$('.bg-light th.pointer').children().children().css('color', 'rgba(0, 0, 0, 0.1)')
			var sort = '{$Think.get.sort}'
			let orderby = '{$Think.get.orderby}'
			let index,
				n
			if (orderby === 'create_time') {
				n = 0
			} else if (orderby === 'amount') {
				n = 1
			} else if (orderby === 'status') {
				n = 2
			}
			if (sort === 'desc') {
				index = 1 + 2 * n
			} else if (sort === 'asc') {
				index = 0 + 2 * n
			}
			$('.bg-light th.pointer').children().children().eq(index).css('color', 'rgba(0, 0, 0, 0.8)')
		}
	})

	function payamount(invoiceid) {
		var url = '' + '/pay?action=billing';
		$.ajax({
			type: "POST",
			data: {
				invoiceid: invoiceid
			},
			url: url,
			success: function (data) {
	
				$("#pay .modal-body").html(data);
				$('.pay').modal('show');
			}
		})
	}
</script>
<div class="card">
	<div class="card-body">
		<a href="invoicelist?action=invoiceapply">
			<button type="button"
				class="btn btn-success btn-sm waves-effect waves-light mb-2">{$Lang.invoice_application}</button>
		</a>
		<div class="table-container">

			<div class="table-responsive">
				<table class="table tablelist">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col width="15%">
					</colgroup>
					<thead class="bg-light">
						<tr>
							<th class="pointer" prop="create_time">
								<span>{$Lang.application_time}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th>
								<span>{$Lang.invoice_title}</span>
							</th>
							<th class="pointer" prop="amount">
								<span>{$Lang.total_invoice_amount}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="status">
								<span>{$Lang.invoice_status}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th>{$Lang.mailing_address}</th>
							<th>
								<span>{$Lang.express}</span>
							</th>
							<th>{$Lang.operating}</th>
						</tr>
					</thead>
					<tbody>
						{if $Invoicelist}
						{foreach $Invoicelist as $list}
						<tr>
							<td>{if $list.create_time}{$list.create_time|date="Y-m-d H:i"}{else}-{/if}</td>
							<td>{$list.title}</td>
							<td>
								{if $list.invoices_subtotal}
								{$Currency.prefix}{$list.invoices_subtotal}{$Currency.suffix}
								{else}-
								{/if}
							</td>
							<td>{$list.status_zh}</td>
							<td>{$list.province}{$list.city}{$list.region}{$list.detail}</td>
							<td>{$list.name}</td>
							<td>
								<a href="invoicelist?action=check&id={$list.id}" class="text-success mr-2"><i class="fas fa-eye"></i>
									{$Lang.see}</a>
								{if $list.status == 'Unpaid'}
								<a href="javascript: payamount({$list.invoice_id});" class="text-primary mr-2"><i
										class="fas fa-check-circle"></i> {$Lang.payment}</a>
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
			{include file="includes/tablefooter" url="invoicelist"}
		</div>
	</div>
</div>


{/if}