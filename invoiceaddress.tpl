<!-- 创建编辑 -->

{if $Think.get.action == 'add' || $Think.get.action == 'edit'}
{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg" url="invoiceaddress"}
{/if}



<link rel="stylesheet" href="/themes/clientarea/yunyoo/assets/libs/ZdCascader/ZdCascader.css?v={$Ver}">
<script type="text/javascript" src="/themes/clientarea/yunyoo/assets/libs/ZdCascader/ZdCascader.js?v={$Ver}"></script>
<script type="text/javascript">
		var areaArr = [];
	$(function () {
		areaArr = {:json_encode($Areas)};
		zdCascaderInit()

		
		if ('{$Think.get.action}' == 'edit') {
			$('#provinceInp').val('{$Invoiceaddress.province}')
			$('#cityInp').val('{$Invoiceaddress.city}')
			$('#regionInp').val('{$Invoiceaddress.region}')
		}

		// 是否默认地址
		{if $Think.get.action == 'add'}
		$('#customCheck1').prop('checked', false) 
		{/if}
		$('#customCheck1').on('change', function () {
			$('#customCheck1').val($('#customCheck1').is(':checked') ? 1 : 0)
		})

		if ($('input[name="username"]').val() != '' && $('#provinceInp').val() != '' && $('#cityInp').val() != '' && $('#regionInp').val() != ''
			&& $('input[name="detail"]').val() != '' && $('input[name="phone"]').val() != '') {
			// 提交加载中
			$('.submitBtn').on('click', function () {
				if ($(this).find('.bx-loader').length<1) {
					$('.submitBtn').prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
				}
			});
		}


	});
	// 递归处理省市区数据
	function dataFilter(arr) {
		
		(arr || []).forEach(item => {
			item.label = item.name
			item.value = item.area_id
			item.children = item.son
			if (item.son && item.son.length) {
				dataFilter(item.son)
			} else {
				delete item.son
				delete item.children
			}
		})
		return arr
	}

	// 级联初始化
	function zdCascaderInit() {
		// 
		$('#zdCascader').zdCascader({
			data: dataFilter(areaArr),
			onChange: function (a, b, c) {
				$('#provinceInp').val(c[2].label)
				$('#cityInp').val(c[1].label)
				$('#regionInp').val(c[0].label)
			}
		})
	}

	function editAddress() {
		$('#addressSelectBox').html(`
			<input type="text" id="zdCascader" class="w-100" required />
			<input type="hidden" id="provinceInp" name="province" />
			<input type="hidden" id="cityInp" name="city" />
			<input type="hidden" id="regionInp" name="region" />
		`)
		zdCascaderInit()
	}
</script>

<div class="card">
	<div class="card-body">
		<form method="post" class="needs-validation" novalidate id="formMain">
			<div class="col-8">
				<div class="form-group row mb-4">
					<label class="col-sm-2 col-form-label">{$Lang.recipient_name}</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="username" {if
							$Invoiceaddress}value="{$Invoiceaddress.username}" {/if} required>
					</div>
				</div>
				<div class="form-group row mb-4">
					<label class="col-sm-2 col-form-label">{$Lang.choose_location}</label>					
					<div class="col-sm-10 d-flex align-items-center" id="addressSelectBox">
						<input type="hidden" id="provinceInp" name="province" />
						<input type="hidden" id="cityInp" name="city" />
						<input type="hidden" id="regionInp" name="region" />
						{if $Think.get.action != 'edit'}
							<input type="text" id="zdCascader" class="w-100" required />
						{else}
							<span>{$Invoiceaddress.province}{$Invoiceaddress.city}{$Invoiceaddress.region}</span>
							<span class="bx bx-edit-alt pointer ml-2 text-primary" onclick="editAddress()"></span>
						{/if}
					</div>
				</div>
				<div class="form-group row mb-4">
					<label class="col-sm-2 col-form-label">{$Lang.detailed_address}</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="detail" {if $Invoiceaddress}value="{$Invoiceaddress.detail}"
							{/if} required>
					</div>
				</div>
				<div class="form-group row mb-4">
					<label class="col-sm-2 col-form-label">{$Lang.contact_number}</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="phone" {if $Invoiceaddress}value="{$Invoiceaddress.phone}"
							{/if} required oninput="value=value.replace(/[^\d]/g,'');if(value.length>11)value=value.slice(0,11)">
					</div>
				</div>
				<div class="form-group row mb-4">
					<label class="col-sm-2 col-form-label">{$Lang.postal_code}</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="post" {if $Invoiceaddress}value="{$Invoiceaddress.post}" {/if}>
					</div>
				</div>
				<div class="form-group row justify-content-between px-3">
					<input type="hidden" name="default" id="hiddenInput" />
				</div>
				<div class="form-group row justify-content-between px-3">
					<div class="custom-control custom-checkbox mb-3">
						<input type="checkbox" class="custom-control-input" id="customCheck1" name="default" 
						{if $Invoiceaddress.default}
							checked="checked"
						{/if}
						value="{$Invoiceaddress.default ? $Invoiceaddress.default :'0'}"> 
						<label class="custom-control-label" for="customCheck1">{$Lang.default_address}</label>
					</div>
					<div>
						<button type="submit" class="btn btn-primary btn-sm w-md submitBtn" >{$Lang.confirm}</button>
					</div>
				</div>
				
			</div>
		</form>
	</div>
</div>
<script>
	$(document).ready(function () {
		$('#hiddenInput').val($('#customCheck1').val());
		$('#customCheck1').on('change', function () {
			$('#hiddenInput').val($('#customCheck1').val());
		});
	});
	function submitForm() {
		const formData = $('#formMain').serializeArray()
		const includesDefault = formData.reduce((acc,cur)=>{
			acc.push(cur.name)
			return acc
		},[]).includes('default')
		if (!includesDefault) {
			formData.push({name:'default',value:'0'})
		}
		
		// $('#formMain').submit();
	}
</script>

<!-- 列表 -->
{else}

{include file="includes/tablestyle"}
<script>
	$(function () {
		// 排序
		var status = '{$Think.get.status}'
		$('.bg-light th').on('click', function () {
			var sort = '{$Think.get.sort}'
			location.href = 'invoiceaddress?sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr(
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
					<a href="invoiceaddress?action=add" class="btn btn-primary btn-sm">{$Lang.add_shipping_address}</a>
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
						<col width="20%">
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
							<th>{$Lang.recipient_name}</th>
							<th>
								<span>{$Lang.telephone_number}</span>
							</th>
							<th>{$Lang.address}</th>
							<th>{$Lang.postcode}</th>
							<th>{$Lang.operating}</th>
						</tr>
					</thead>
					
					<tbody>
						{if $Invoiceaddress}
						{foreach $Invoiceaddress as $list}
						<tr>
							<td>
								{$list.id}
								{if $list.default=='1'}
								<span class="text-warning">
									<i class="fas fa-star"></i>
								</span>
								{/if}
							</td>
							<td>{$list.username}</td>
							<td>{$list.phone}</td>
							<td>{$list.province}{$list.city}{$list.region}{$list.detail}</td>
							<td>{$list.post}</td>
							<td>
								<a href="#" class="text-{$list.default == '1'?'warning not-allowed':'muted'}"
									onclick="defaultShippingAddress({$list.id},'{$list.default}')"><i
										class="fas fa-star"></i> {$Lang.as_default}</a>
								<a href="invoiceaddress?action=edit&id={$list.id}" class="text-primary mr-2"><i
										class="bx bx-edit-alt"></i> {$Lang.edit}</a>
								<a href="#" class="text-danger" onclick="deleteShippingAddress({$list.id})"><i
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
			{include file="includes/tablefooter"  url="invoiceaddress"}
		</div>
	</div>
</div>
<script>
	function deleteShippingAddress(id) {
		$.ajax({
			type: "DELETE",
			url: '' + '/voucher/voucherpost',
			data: {
				id
			},
			success: function (data) {
				if (data.status !== 200) {
					toastr.error(data.msg)
					return
				}
				toastr.success(data.msg)
				location.reload();
			}
		});
	}

	function defaultShippingAddress(id,isDefault) {
		if (isDefault == '1') return
		const obj={
			id,
			default:1
		}
		$.ajax({
			type: "post",
			url: '' + '/voucher/voucherdefaultpost',
			data: obj,
			success: function (data) {
				if (data.status !== 200) {
					toastr.error(data.msg)
					return
				}
				toastr.success(data.msg)
				location.reload();
			}
		});
	}
</script>

{/if}