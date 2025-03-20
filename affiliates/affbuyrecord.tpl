{include file="includes/tablestyle"}

<div class="table-container">
	<div class="table-header">
		<div class="table-filter">
			<div class="row">
				<div class="col-sm-6">
				</div>
			</div>
		</div>
		<div class="table-search">
			<div class="row justify-content-end">
				<div class="col-sm-6">
					<div class="search-box">
						<div class="position-relative">
							<input type="text" class="form-control" id="affbuyrecordSearchInp"
								placeholder="{$Lang['search_by_keyword']}">
							<i class="bx bx-search-alt search-icon" id="affbuyrecordSearchIcon"></i>
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
				<col>
				<col>
				<col>
				<col>
				<col>
				<col>
			</colgroup>
			<thead class="bg-light">
				<tr>
					<th class="pointer" prop="create_time">{$Lang.ordering_time}
						<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
							<i class="bx bx-caret-up"></i>
							<i class="bx bx-caret-down"></i>
						</span>
					</th>
					<th class="pointer" prop="subtotal">{$Lang.order_amount}
						<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
							<i class="bx bx-caret-up"></i>
							<i class="bx bx-caret-down"></i>
						</span>
					</th>
					<th>{$Lang.type}
					</th>
					<th prop="aff_type">{$Lang.mode}</th>
					<th>{$Lang.confirmation_time}</th>
					<th>{$Lang.state}</th>
					<th class="pointer" prop="aff_commission">{$Lang.commission}
						<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
							<i class="bx bx-caret-up"></i>
							<i class="bx bx-caret-down"></i>
						</span>
					</th>
					<!-- <th class="pointer" prop="aff_commmission_bates">{$Lang.commission_rate}
						<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
							<i class="bx bx-caret-up"></i>
							<i class="bx bx-caret-down"></i>
						</span>
					</th> -->
				</tr>
			</thead>
			<tbody>
				{foreach $AffBuyRecord as $value}
				<tr>
					<td>{$value.create_time|date="Y-m-d H:i"}</td>
					<td>{$value.prefix}{$value.subtotal}{$value.suffix}</td>
					<td>{$value.type}</td>
					<td>{$value.aff_type}</td>
					<td>
						{if $value.is_aff}
							{$value.aff_sure_time|date="Y-m-d H:i"}
						{else}
							{$value.paid_time|date="Y-m-d H:i"}
						{/if}
					</td>
					<td>
						{if $value.is_aff}
						<span style="color: #34c38f;">
							{$Lang.confirmed}
						</span>
						{else}
							{$Lang.no_confirmed}
						{/if}
					</td>
					<td>{$value.prefix}{$value.commission}{$value.suffix}</td>
					<!-- <td>{$value.commission_bates}{if $value.commission_bates_type == 2}%{/if}</td> -->
				</tr>
				{/foreach}
			</tbody>
		</table>
	</div>
	<!-- 表单底部调用开始 -->
	<!-- {include file="includes/tablefooter" url="affiliates" action="affbuyrecord"} -->
	<div class="table-footer">
		<div class="table-tools">

		</div>
		<div class="table-pagination">
			<div class="table-pageinfo mr-2">
				<span>{$Lang.common} {$Total} {$Lang.strips}</span>
				<span class="mx-2">
					{$Lang.each_page}
					<select name="" id="affbuyrecordlimitSel">
						<option value="10" {if $Limit==10}selected{/if}>10 </option> <option value="15" {if
							$Limit==15}selected{/if}>15 </option> <option value="20" {if $Limit==20}selected{/if}>20 </option> <option
							value="50" {if $Limit==50}selected{/if}>50 </option> <option value="100" {if $Limit==100}selected{/if}>100
							</option> </select> {$Lang.strips} </span> </div> <ul class="pagination pagination-sm">
							{$Pages}
							</ul>
			</div>
		</div>

	</div>

	<script>
		$(function () {
			// 关键字搜索
			// $('#searchInp').val('{$Think.get.keywords}')

			$('#affbuyrecordSearchInp').on('keydown', function (e) {
				if (e.keyCode == 13) {
					getaffbuyrecordData('keywords')
				}
			})
			$('#affbuyrecordSearchIcon').on('click', function () {
				getaffbuyrecordData('keywords')
			});

			// 排序
			$('.bg-light th').on('click', function () {
				if ($(this).attr('prop') == 'aff_type') return false
				getaffbuyrecordData('sort', $(this).attr('prop'))
			})



			// 每页数量选择改变
			$('#affbuyrecordlimitSel').on('change', function () {
				getaffbuyrecordData('limit')
			})

			// 分页
			$('.page-link').on('click', function (e) {
				e.preventDefault()
				$.get('' + $(this).attr('href'), function (data) {
					$('#affbuyrecord').html(data)
				})
			})
		})
		//排序样式
		$('.bg-light th.pointer').children().children().css('color', 'rgba(0, 0, 0, 0.1)')
		function changeStyle(row, sort) {
			$('.bg-light th.pointer').children().children().css('color', 'rgba(0, 0, 0, 0.1)')
			let index,
				n
			if (row === 'create_time') {
				n = 0
			} else if (row === 'subtotal') {
				n = 1
			} else if (row === 'aff_commission') {
				n = 2
			} else if (row === 'aff_commmission_bates') {
				n = 3
			}
			if (sort === 'desc') {
				index = 1 + 2 * n
			} else if (sort === 'asc') {
				index = 0 + 2 * n
			}
			$('.bg-light th.pointer').children().children().eq(index).css('color', 'rgba(0, 0, 0, 0.8)')
		}

		function getaffbuyrecordData(searchType, orderby) {
			// 搜索条件
			var searchObj = {
				action: 'affbuyrecord'
			}
			if (searchType == 'keywords') {
				searchObj.keywords = $('#affbuyrecordSearchInp').val()
			}
			if (searchType == 'sort') {
				searchObj.sort = (localStorage.getItem('sort') == 'asc') ? 'desc' : 'asc'
				localStorage.setItem('sort', searchObj.sort)
				searchObj.orderby = orderby
			}
			if (searchType == 'limit') {
				searchObj.limit = $('#affbuyrecordlimitSel').val()

				searchObj.page = 1
			}
			$.ajax({
				type: "get",
				url: '' + '/affiliates',
				data: searchObj,
				success: function (data) {
					$('#affbuyrecord').html(data)
					changeStyle(searchObj.orderby, localStorage.getItem('sort'))
				}
			});
		}
	</script>