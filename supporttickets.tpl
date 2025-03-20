{include file="includes/tablestyle"}

<div class="card">
	<div class="card-body">
		<div class="table-container">
			<div class="table-header">
				<!-- <div class="table-filter">
					<div class="row">
						<div class="col">							
							<select class="selectpicker" data-style="btn-default" title="请选择状态" multiple>
								<option>待回复</option>
								<option>已回复</option>
								<option>已关闭</option>
								<option>已取消</option>
							</select>
						</div>
					</div>
				</div>
				<div class="table-search">
					<div class="row justify-content-end">
						<div class="col-sm-6">
							<div class="input-group">
								<div class="input-group-prepend">
								    <span class="input-group-text">
								    	<i class="far fa-search"></i>
								    </span>
								</div>
								<input type="text" class="form-control" placeholder="{$Lang['search_by_keyword']}" />
							</div>
						</div>
					</div>
				</div> -->
        <div >
          <a href="submitticket">
            <button type="button" class="btn btn-success btn-rounded waves-effect waves-light mb-2 mr-2"><i class="mdi mdi-plus mr-1"></i> {$Lang.submit_work_order}</button>
          </a>
        </div>
			</div>
			<div class="table-responsive">
				<table class="table tablelist">
					<colgroup>
						<col>
						<col width="35%">
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead class="bg-light">
						<tr>
							<th>{$Lang.work_order_department}</th>
							<th>{$Lang.title}</th>
							<th>{$Lang.creation_time}</th>
							<th>{$Lang.update_time}</th>
							<th>{$Lang.state}</th>
							<th>{$Lang.operating}</th>
						</tr>
					</thead>
					<tbody>
						{if $SupportTickets}
						{foreach $SupportTickets as $ticket}
						<tr>
							<td><span class="badge badge-secondary">{$ticket.department_name}</span></td>
							<td><a href="viewticket?tid={$ticket.tid}&c={$ticket.c}"
									class="text-primary">#{$ticket.tid}-{$ticket.title}</a></td>
							<td>{$ticket.create_time|date="Y-m-d H:i"}</td>
							<td>{$ticket.last_reply_time|date="Y-m-d H:i"}</td>
							<td>
								<span class="status badge" style="background-color: {$ticket.status.color};">
									{$ticket.status.title}</span>
							</td>
							<td>
								<a href="viewticket?tid={$ticket.tid}&c={$ticket.c}" class="text-primary">
									<i class="fas fa-eye"></i> {$Lang.see}
								</a>
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
			<div class="table-footer">
				<div class="table-pageinfo">
					{$Lang.common} {$Total} {$Lang.strips}
				</div>
				<div class="table-pagination">
					<ul class="pagination pagination-sm">
						{$Pages}
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>