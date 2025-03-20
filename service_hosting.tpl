
{include file="includes/tablestyle"}
{include file="includes/pop"}


<script>
	$(function () {
		// 状态筛选
		var parmas = []
		var urlParams = '{:implode(',', $Think.get.domain_status)}';
		var statusSelected = urlParams.split(',')
		if(!statusSelected[0]){
			statusSelected=['Pending','Active','Suspended']
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
									<option value="{$key}">{$Lang['domainstatus_select_'.strtolower($key)]}</option>
								{/foreach}
							</select>
							{if (isset($nav_info.orderFuc) && $nav_info.orderFuc)}
								<a href="{$nav_info.orderFucUrl}" class="btn btn-sm btn-primary w-xs">{$Lang.ordering_products}</a>
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
						<th>{$Lang.product}</th>
						<!--<th class="pointer" prop="dedicatedip">
                            <span>IP</span>
                            <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                                <i class="bx bx-caret-up"></i>
                                <i class="bx bx-caret-down"></i>
                            </span>
                        </th>-->
						<th>IP</th>
						<th class="pointer" prop="nextduedate">
							<span>{$Lang.due_date}</span>
							<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
						</th>
						<!--<th class="pointer" prop="amount">
								<span>{$Lang.cost}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>-->
						<th>{$Lang.cost}</th>
						<th>{$Lang.system}</th>
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
									status-{$list.domainstatus|strtolower}">{$Lang['domainstatus_select_'.strtolower($list.domainstatus)]}</span>
								</td>
								<td>
									<a href=" servicedetail?id={$list.id}" class="text-dark">
										<strong>{$list.productname}</strong>
									</a><br />
									<small class="text-muted">{$list.domain}</small>
								</td>
								<!-- <td>{if $list.dedicatedip}{$list.dedicatedip}{else}-{/if}</td> -->

								<td>
									{if $list.dedicatedip}
										{if ($list.assignedips && count($list.assignedips) > 1)}
											<span data-toggle="popover" data-trigger="hover" title="" data-html="true" data-content="
											<button type='button' class='btn btn-primary'>{$Lang.copy}</button>
											{foreach $list.assignedips as $item}
											<div>{$item}</div>
											{/foreach}
										">
											<span class="iptd" id="ips{$list.id}">{$list.dedicatedip} ({$list.assignedips|count}) </span>
										</span>
										{else}
											<span>{$list.dedicatedip}</span>
										{/if}
									{else}
										-
									{/if}

								</td>
								<td>
									{if $list.cycle_desc != '一次性' && $list.cycle_desc != '免费'}
										<span>{$list.nextduedate|date="Y-m-d"}</span>
										{if $list.host_cancel != ''}
											<span class="bx bxs-error-circle text-danger" data-toggle="popover" data-trigger="hover"
												  title="{$Lang.disable_and_remove_the_product}" data-html="true"
												  data-content="{$Lang.cancellation_time}：{$list.host_cancel.type}<br>{$Lang.cancelreason}：{$list.host_cancel.reason}"></span>
										{/if}
									{else}-
									{/if}
								</td>
								<td>
									<div>
										{if $list.billingcycle != 'free' && $list.billingcycle != 'ontrial'}
											{$list.price_desc}/{$Lang[$list.billingcycle]}
										{else}
											{$Lang[$list.billingcycle]}
										{/if}
									</div>
									<div class="text-black-50">
										{if $list.initiative_renew && $list.billingcycle != 'free' && $list.billingcycle != 'onetime'}{$Lang.automatic_renewal_of_balance}{/if}
									</div>
								</td>
								<!-- 系统 -->
								<td>
									{if $list.os_url}
										{if $list.svg}
											<img width="14" height="14" src="/upload/common/system/{$list.svg}.svg" alt="">
										{else}
											<img width="14" height="14" src="/upload/common/system/{$list.os_url|getOsSvg}.svg"
												 alt="">
										{/if}
										{$list.os_url}
									{else}
										-
									{/if}
								</td>
								<td>{if $list.notes}{$list.notes}{else}-{/if}
									<i class="bx bx-edit-alt pointer text-primary"
									   onclick="editNotesHandleClick('{$list.id}', '{$list.notes}')"></i>
									<!--  data-toggle="modal" data-target="#modifyNotesModal" -->
								</td>
								<td>
									<a href="servicedetail?id={$list.id}" class="btn btn-sm btn-primary w-xs">{$Lang.operating}</a>
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
					<button disabled class="btn btn-outline-primary btn-sm w-xs" id="readBtn">{$Lang.renew}</button>
					<div class="btn-group">
						<button class="btn btn-secondary btn-sm dropdown-toggle not-allowed" id="bulkOperation" type="button"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" disabled>
							{$Lang.products_launched} <i class="mdi mdi-chevron-down"></i>
						</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#" onclick="handleOperating('on')">{$Lang.batch_operation}</a>
							<a class="dropdown-item" href="#" onclick="handleOperating('off')">{$Lang.shut_down}</a>
							<a class="dropdown-item" href="#" onclick="handleOperating('reboot')">{$Lang.restart}</a>
							<a class="dropdown-item" href="#" onclick="handleOperating('hard_off')">{$Lang.hard_shutdown}</a>
							<a class="dropdown-item" href="#" onclick="handleOperating('hard_reboot')">{$Lang.hard_restart}</a>
						</div>
					</div>
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