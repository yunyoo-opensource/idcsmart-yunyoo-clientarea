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
							<input type="text" class="form-control" id="useraffilistSearchInp"
								placeholder="{$Lang.search_by_keyword}">
							<i class="bx bx-search-alt search-icon" id="useraffilistSearchIcon"></i>
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
			</colgroup>
			<thead class="bg-light">
				<tr>
					<th>{$Lang.user_name}
					</th>
					<th>{$Lang.mailbox}
					</th>
					<th>{$Lang.mobile_phone}
					</th>
					<th class="pointer" prop="create_time">{$Lang.registration_time}
						<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
							<i class="bx bx-caret-up"></i>
							<i class="bx bx-caret-down"></i>
						</span>
					</th>
					<th class="pointer" prop="lastlogin">{$Lang.login_last}
						<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
							<i class="bx bx-caret-up"></i>
							<i class="bx bx-caret-down"></i>
						</span>
					</th>
				</tr>
			</thead>
			<tbody>
				{foreach $UserAffilist as $value}
				<tr>
					<td>{$value.username}</td>
					<td>{$value.email}</td>
					<td>{$value.phonenumber}</td>
					<td>{$value.create_time|date="Y-m-d H:i"}</td>
					<td>{if $value.lastlogin}{$value.lastlogin|date="Y-m-d H:i"}{else}-{/if}</td>
				</tr>
				{/foreach}
			</tbody>
		</table>
	</div>
	<!-- 表单底部调用开始 -->
	<!-- {include file="includes/tablefooter" url="affiliates" action="useraffilist"} -->
	<div class="table-footer">
		<div class="table-tools">

		</div>
		<div class="table-pagination">
			<div class="table-pageinfo mr-2">
				<span>{$Lang.common} {$Total} {$Lang.strips}</span>
				<span class="mx-2">
					{$Lang.each_page}
					<select name="" id="useraffilistlimitSel">
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
			$('#useraffilistSearchInp').on('keydown', function (e) {
				if (e.keyCode == 13) {
					getuseraffilistData('keywords')
				}
			})
			$('#useraffilistSearchIcon').on('click', function () {
				getuseraffilistData('keywords')
			});

			// 排序
			$('.bg-light th').on('click', function () {
				if (['type', 'opt'].includes($(this).attr('prop'))) return false
				getuseraffilistData('sort', $(this).attr('prop'))
			})
		
			// 每页数量选择改变
			$('#useraffilistlimitSel').on('change', function () {
				getuseraffilistData('limit')
			})

			// 分页
			$('.page-link').on('click', function (e) {
				e.preventDefault()
				$.get('' + $(this).attr('href'), function (data) {
					$('#useraffilist').html(data)
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
			n = 7
			} else if (row === 'lastlogin') {
			n = 8
			}
			if (sort === 'desc') {
			index = 1 + 2 * n
			} else if (sort === 'asc') {
			index = 0 + 2 * n
			}
			$('.bg-light th.pointer').children().children().eq(index).css('color', 'rgba(0, 0, 0, 0.8)')
			}
		function getuseraffilistData(searchType, orderby) {
			// 搜索条件
			var searchObj = {
				action: 'useraffilist'
			}
			if (searchType == 'keywords') {
				searchObj.keywords = $('#useraffilistSearchInp').val()
			}
			if (searchType == 'sort') {
				searchObj.sort = (localStorage.getItem('sort') == 'asc') ? 'desc' : 'asc'
				localStorage.setItem('sort', searchObj.sort)
				searchObj.orderby = orderby
			}
			if (searchType == 'limit') {
				searchObj.limit = $('#useraffilistlimitSel').val()
				searchObj.page = 1
			}
			$.ajax({
				type: "get",
				url: '' + '/affiliates',
				data: searchObj,
				success: function (data) {
					$('#useraffilist').html(data)
					changeStyle(searchObj.orderby, localStorage.getItem('sort'))
				}
			});
		}
	</script>