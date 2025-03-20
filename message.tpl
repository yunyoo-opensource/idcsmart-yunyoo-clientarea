{include file="includes/tablestyle"}

<div class="card">
	<div class="card-body">
		<div class="table-container">
			<div class="table-header">

				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a href="message?type=0" class="nav-link {if $Think.get.type=='0' or !$Think.get.type }active{/if}">
							{$Lang.full_detail}
						</a>
					</li>
					{foreach $Setting.unread_nav as $navList}
					<li class="nav-item">
						<a href="message?type={$navList.id}" class="nav-link {if $Think.get.type==$navList.id }active{/if}"
							data-id="{$navList.id}">
							{$Lang[$navList.name]}
							{if $navList.unread_num != '0'}
							({$navList.unread_num})
							{/if}
						</a>
					</li>
					{/foreach}

				</ul>
			</div>
			<div class="table-responsive">
				{include file="message/messagetabledata"}
			</div>
			<!-- 表单底部调用开始 -->
			{include file="includes/tablefooter" url="message"}
			<div class="row mt-2">
				<div class="col-12">
					<button type="button" class="btn btn-danger waves-effect waves-light not-allowed" onclick="delMsg()"
						id="delBtn" disabled style="margin-top: 4px;">{$Lang.delete}</button>
					<button type="button" class="btn btn-primary waves-effect waves-light not-allowed" onclick="readMsg()"
						id="readBtn" disabled style="margin-top: 4px;">{$Lang.mark_read}</button>
					<button id="allReadBtn" type="button" class="btn btn-primary waves-effect waves-light" onclick="allRead()" disabled
						style="margin-top: 4px;">{$Lang.all_read}</button>
					<button id="allDelBtn" type="button" class="btn btn-danger waves-effect waves-light" onclick="allDel()" disabled
						style="margin-top: 4px;">{$Lang.delete_all}</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	// 表格多选
	$(function () {
		$("#customCheckHead").on('change',function(){
			if($(this).is(':checked') && $('.row-checkbox').length){
				$('#delBtn,#readBtn,#allReadBtn,#allDelBtn').removeAttr('disabled').removeClass('not-allowed');
			} else{
				$('#delBtn,#readBtn,#allReadBtn,#allDelBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}
		})
		$('input[name="headCheckbox"]').on('change', function () {
			$('.row-checkbox').prop("checked", $(this).is(':checked'))
		});
		$('.row-checkbox').on('change', function () {
			$('input[name="headCheckbox"]').prop('checked', $('.row-checkbox').length === $('.row-checkbox:checked')
				.length)
			// 下面这个判断处理底部按钮的disabled
			if ($('.row-checkbox:checked').length) {
				$('#delBtn,#readBtn,#allReadBtn,#allDelBtn').removeAttr('disabled').removeClass('not-allowed');
			} else {
				$('#delBtn,#readBtn,#allReadBtn,#allDelBtn').attr('disabled', 'disabled').addClass('not-allowed');
			}
		});
	});
</script>
<script>
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

	// 多选删除消息
	function delMsg() {
		const ids = getCheckbox()
		$.ajax({
			type: "get",
			url: '' + '/delete_messgage',
			data: {
				ids
			},
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)
					location.reload()
				} else {
					toastr.error(data.msg)
				}
			}
		});
	}

	// 多选阅读消息
	function readMsg() {
		const ids = getCheckbox()
		$.ajax({
			type: "get",
			url: '' + '/read_messgage',
			data: {
				ids
			},
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)
					location.reload()
				} else {
					toastr.error(data.msg)
				}
			}
		});
	}

	// 全部已读
	function allRead() {
		$.ajax({
			type: "get",
			url: '' + '/read_messgage',
			data: {
				type: 0
			},
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)
					location.reload()
				} else {
					toastr.error(data.msg)
				}
			}
		});
	}

	// 全部删除
	function allDel() {
		$.ajax({
			type: "get",
			url: '' + '/delete_messgage',
			data: {
				type: 0
			},
			success: function (data) {
				if (data.status == 200) {
					toastr.success(data.msg)
					location.reload()
				} else {
					toastr.error(data.msg)
				}
			}
		});
	}
</script>