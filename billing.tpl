{include file="includes/tablestyle"}

{include file="includes/deleteConfirm"}
<div class="card">
	<div class="card-body">
    <form action="combinebilling">
		<div class="table-container"> 
			<div class="table-header">
				<div class="table-filter">

				</div>
				<div class="table-search d-flex justify-content-end">
					<select class="form-control" id="statusSel" title="请选择状态" style="width: 150px">
						<option value="">{$Lang.whole}</option>
						<option value="Unpaid">{$Lang.unpaid}</option>
						<option value="Paid">{$Lang.paid}</option>
						<option value="Cancelled">{$Lang.cancelled}</option>
						<option value="Refunded">{$Lang.refunded}</option>
					</select>
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
						<col>
						<col>
						<col>
					</colgroup>
					<thead class="bg-light">
						<tr>
							<th class="checkbox">
                <div class="custom-control custom-checkbox mb-3">
                   
                    <input type="checkbox" name="headCheckbox" onchange="headCheckboxAll(this)" class="custom-control-input" id="customCheck" >
                    <label class="custom-control-label" for="customCheck"></label>
                </div>
							</th>
							<th class="pointer" prop="id">
								<span>{$Lang.bill_no}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th>
								<span>{$Lang.type}</span>
							</th>
							<th class="pointer" prop="subtotal">
								<span>{$Lang.amount_money}</span>
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
							<th class="pointer" prop="payment_zh">
								<span>{$Lang.payment_zh}</span>
							</th>
							<th class="pointer" prop="due_time">
								<span>{$Lang.overdue_time}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="status">
								<span>{$Lang.state}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th width="180px">{$Lang.operating}</th>
						</tr>
					</thead>
					<tbody>
						{if $Billing}
						{foreach $Billing as $index => $bill}
						<tr>
							<td>
								<div class="custom-control custom-checkbox mb-3">
                  					<!-- xue 直接在复选框里写name value  改错了莫怪 -->
									<input type="checkbox" class="custom-control-input row-checkbox" onclick="rowCheckbox(this)" id="customCheck{$bill.id}"
                  data-name="ids[{$index}]" name="ids[{$index}]" data-value="{$bill.id}" value="{$bill.id}">
									<label class="custom-control-label" for="customCheck{$bill.id}"></label>
								</div>
							</td>
							<td><a href="viewbilling?id={$bill.id}"><span class="badge badge-light"># {$bill.id}</span></a></td>
							<td>{$bill.type_zh}</td>
							<td>{$bill.subtotal}</td>
							<td>{if $bill.paid_time}{$bill.paid_time|date="Y-m-d H:i"}{else}-{/if}</td>
							<td>{if $bill.payment_zh}{$bill.payment_zh}{else}-{/if}</td>
							<td>{if $bill.due_time}{$bill.due_time|date="Y-m-d H:i"}{else}-{/if}</td>
							<td>
								<span class="status badge status-{$bill.status|strtolower}">{$bill.status_zh.name}</span>
							</td>
							<td>
								<a href="viewbilling?id={$bill.id}" class="text-success mr-2"><i class="fas fa-eye"></i> {$Lang.see}</a>
								{if $bill.status == 'Unpaid'}
								<a href="javascript: payamount({$bill.id});" class="text-primary mr-2"><i class="fas fa-check-circle"></i> {$Lang.payment}</a>
								<a href="javascript: deleteConfirm('invoices', '{$Lang.delete_bill}', '{$Lang.want_delete_the_bill}', {id: {$bill.id}, token: '{$Token}'});"
									class="text-danger"><i class="fas fa-times-circle"></i> {$Lang.delete}</a>
								{/if}
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
			<div class="table-footer">
        <div class="table-tools " >
          <button class="btn btn-primary mr-1 " disabled id="readBtn" type="submit">{$Lang.consolidated_payment}</button>
          <span id="pay-combine">{$Lang.you_have}{$Count}{$Lang.paid_total}{$Total_money}{$Lang.element}<span>
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
    </form>
	</div>
</div>

{include file="includes/paymodal"}


<script>
	var _url = '';
	var status = '{$Think.get.status}'
	// 排序
	$('.bg-light .pointer').on('click', function () {
		var sort = '{$Think.get.sort}'
		location.href = 'billing?status={$Think.get.status}&sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') + '&page={$Think.get.page}&limit={$Think.get.limit}'
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
	} else if(orderby === 'subtotal') {
				n = 1
	} else if(orderby === 'paid_time'){
				n = 2
	} else if(orderby === 'due_time') {
				n = 3
	} else if(orderby === 'status') {
				n = 4
	}
	if (sort === 'desc') {
			index = 1 + 2 * n
	} else if(sort === 'asc'){
			index = 0 + 2 * n
	}
		$('.bg-light th.pointer').children().children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
	}
	// 状态筛选
	$('#statusSel').on('change', function () {
		location.href = "billing?status=" + $('#statusSel').val() + "&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}"
	});
// 每页数量选择改变
	$('#limitSel').on('change', function () {
		location.href = '/billing?keywords={$Think.get.keywords}&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page=1&limit=' + $('#limitSel').val()

	})
</script>
<script src="/themes/clientarea/yunyoo/assets/js/billing.js?v={$Ver}"></script>