<style>
	.border-hover:hover {
		box-shadow: 0px 0px 0px 1px #007bfc;
	}
</style>

<div id="yy-tic-tip" class="alert alert-warning d-none" role="alert">
  <strong>提醒：</strong>当前已存在激活的工单 <a href="/supporttickets" one-link-mark="yes">查看工单列表</a>
</div>
<script>
$(document).ready(function() {
    $.ajax({
        url: '/ticket/list',
        type: 'GET',
        xhrFields: {
            withCredentials: true
        },
        success: function(response) {
            if (response.status === 200) {
                let tickets = response.data.list;
                let hasRelevantStatus = tickets.some(ticket => 
                    ticket.status.id === 1 || 
                    ticket.status.id === 3 || 
                    ticket.status.id === 5
                );
                
                if (hasRelevantStatus) {
                    $('#yy-tic-tip').removeClass('d-none');
                }
            } else {
                console.log('Failed to fetch tickets:', response.msg);
            }
        },
        error: function(error) {
            console.log('Error:', error);
        }
    });
});
</script>
<div class="card">
	<div class="card-body">
		<div class="ticket-top">
			<p>{$Lang.ticket_top_one}</p>

			<p>{$Lang.ticket_top_two}</p>

			<p>{$Lang.ticket_top_three}</p>

			<p>{$Lang.ticket_top_four}</p>

			<p>{$Lang.ticket_top_five}</p>

			<p>{$Lang.ticket_top_six}</p>

			<p>{$Lang.ticket_top_seven}</p>

			<p>{$Lang.ticket_top_eight}
		</div>
	</div>
</div>
<div class="card">
	<div class="card-body">
		<div class="row">
			{if $SubmitTicket.department}
			{foreach $SubmitTicket.department as $department}
			<div class="col-sm-4">
				<a href="submitticket?step=2&dptid={$department.id}">
					<div class="card border border-hover">
						<div class="card-header bg-transparent ">
							<h5 class="my-0 ">{$department.name}</h5>
						</div>
						<div class="card-body">
							<p class="card-text text-muted">{$department.description} </p>
						</div>
					</div>
				</a>
			</div>
			{/foreach}
			{else}
			{include file="error/alert" value="{$Lang.temporary_department}"}
			{/if}
		</div>
	</div>
</div>