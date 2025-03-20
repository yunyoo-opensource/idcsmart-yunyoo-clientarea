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
									<input type="text" class="form-control" placeholder="Search...">
									<i class="bx bx-search-alt search-icon"></i>
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
					<thead class="thead-light">
						<tr>
							<th><input type="checkbox" /></th>
							<th>{$Lang.bill_no}</th>
							<th>{$Lang.amount_money}</th>
							<th>{$Lang.type}</th>
							<th>{$Lang.payment_time}</th>
							<th>{$Lang.operating}</th>
						</tr>
					</thead>
					<tbody>
						{if $Invoiceapply}
						{foreach $Invoiceapply as $list}
						<tr>
							<td><input type="checkbox" /></td>
							<td><span class="badge badge-light"># {$list.id}</span></td>
							<td>{$list.subtotal}</td>
							<td>{$list.type_zh}</td>
							<td>{if $list.paid_time}{$list.paid_time|date="Y-m-d H:i"}{else}-{/if}</td>
							<td>
								<a href="#" class="text-primary mr-2">{$Lang.invoice}</a>
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
			{include file="includes/tablefooter"}
		</div>
	</div>
</div>