
{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg" url=""}
{/if}

{include file="includes/modal"}
<link href="/themes/clientarea/yunyoo/assets/libs/bootstrap-rating/bootstrap-rating.css?v={$Ver}"
	rel="stylesheet" />
	<script>
		
	function adminScore(rid, type) {
		const star = $(`#starRating${rid}`).val();
		const obj = {
			rid,
			type,
			star,
			tid: '{$Think.get.tid}'
		}
		$.ajax({
			type: "post",
			url: '/ticket/evaluate',
			data: obj,
			success: function (data) {
				if (data.status !== 200) {
					toastr.error(data.msg)
					return
				}
				toastr.success(data.msg)
				$(`#starRating${rid}`).attr("disabled", true);
			}
		});
	}
	</script>
<div class="row">
	<div class="col-12">
		<div class="card mb-3">


			<h4 class="card-title mb-0 p-3">
				<span class="mr-2 px-3 py-2 badge badge-dark"
					style="background-color: {$ViewTicket.ticket.status.color};">{$ViewTicket.ticket.status.title}</span>
				#{$ViewTicket.ticket.tid} - {$ViewTicket.ticket.title}

				{if $ViewTicket.ticket.status.id != "4"}
				<div class="ticket-actions float-sm-right mt-3 mt-sm-0">
					<a href="javascript: getModal('ticket/close', '{$Lang.close_work_order}', '{$Lang.close_the_job}', {tid: {$ViewTicket.ticket.tid}, token: '{$Token}'}, function(){location.href = '/supporttickets'});"
						class="btn btn-danger btn-sm">
						<i class="fas fa-times fa-fw"></i>
						{$Lang.close_work_order}
					</a>
				</div>
				{/if}
			</h4>
			<p class="px-3 mb-0">{$Lang.creation_time}：{$ViewTicket.ticket.create_time|date="Y-m-d H:i"}</p>
			<div class="d-flex p-3">
				<span class="mr-3">{$lang.work_order_department}：{$ViewTicket.ticket.department.name}</span>
				<span>{$Lang.product}：{$ViewTicket.ticket.host}</span>
			</div>

		</div>

		<div class="card-body p-0" style="background-color: #f4f5f8;">
			{foreach $ViewTicket.list as $reply}
			<div class="ticket-reply card mb-3 {if $reply.admin}admin{/if}">
				<div class="post-by">
					<div class="post-user">
						<span class="mr-2 badge badge-{if $reply.admin}primary{else}success{/if}">{$reply.user_type}</span>
						{$reply.realname}
					</div>
					<div class="post-date">
						{$reply.format_time}
					</div>
				</div>
				<div class="message p-3">
					<div>{$reply.content}</div>
					{if $reply.attachment}
					<div>{$Lang.enclosure}：</div>
					{foreach $reply.attachment as $attachments}
					<div>
						<a href="http://{$attachments}" target="_blank">{:substr($attachments,strpos($attachments,"^")+1)}</a>
					</div>
					{/foreach}
					{/if}

					{if $reply.admin}
					<div class="justify-content-end align-items-center"
						style="display:{$ViewTicket.feedback_request == '0'?none:flex}">
						<input type="hidden" class="rating" id="starRating{$reply.id}" data-filled="mdi mdi-star text-warning"
							data-empty="mdi mdi-star-outline text-muted" onchange="adminScore('{$reply.id}','{$reply.type}')" {if
							$reply.star !='0' } disabled {/if} value="{$reply.star}" />
					</div>
					{/if}
				</div>
			</div>
			{/foreach}
		</div>

		<div class="card" id="ticketReplyContainer">
			<form class="needs-validation" method="post" enctype="multipart/form-data">
				<input type="hidden" name="tid" value="{$ViewTicket.ticket.tid}" />
				<input type="hidden" name="c" value="{$ViewTicket.ticket.c}" />
				<div class="card-body">
					<h4 class="card-title">{$Lang.reply}</h4>
					<div class="form-group">
						{include file="includes/summernote" height="200"}
						<textarea class="form-control" id="content" name="content" rows="10"
							placeholder="{$Lang.please_enter_question}"></textarea>
					</div>
					<div class="form-group">
						<label class="form-control-label" for="formrow-firstname-input">{$Lang.enclosure}</label>
						<!-- {include file="supporttickets/supporttickets-customfields"} -->
						<div class="row" id="filelist">
						 	<div class="col-12 mb-2 filebox d-flex justify-content-between">
						 		<input type="file" class="form-control-file w-75" name="attachments[]">
						 		<a class="btn btn-danger deletefileBtn">{$Lang.delete}</a>
						 	</div>
						</div>
						<a class="btn btn-success mt-2" id="addFileBtn" onclick="addFileBtn()">{$Lang.add_more}</a>
					</div>
					<div class="row">
						<div class="col-lg-3 col-xs-6">
							<button type="submit" class="btn btn-primary btn-block submitBtn">{$Lang.reply_work_order}</button>
						</div>
						<div class="col-lg-3 col-xs-6">
							<a href="supporttickets" class="btn btn-block btn-default">{$Lang.cancel}</a>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>

</div>
<script src="/themes/clientarea/yunyoo/assets/libs/bootstrap-rating/bootstrap-rating.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/yunyoo/assets/js/rating-init.js?v={$Ver}"></script>
<script>
  // Example starter JavaScript for disabling form submissions if there are invalid fields
  (function() {
    'use strict';
    window.addEventListener('load', function() {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName('needs-validation');
      // Loop over them and prevent submission
      console.log(forms);
      var validation = Array.prototype.filter.call(forms, function(form) {
        
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }else{
            // 提交按钮加载中
                // $("form").submit();
                $('.submitBtn').empty()
                $('.submitBtn').prepend(`<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>{$Lang.reply_work_order}`);
			  	$('.submitBtn').attr('disabled', true);
          }
      
          form.classList.add('was-validated');
        }, false);
      });
    },false);
  })();
  
  </script>
<script>

	function addFileBtn()
	{
		// 添加更多附件
		var fileHtml = `
			<div class="col-12 mb-2 filebox d-flex justify-content-between">
				<input type="file" class="form-control-file w-75" name="attachments[]">
						<a class="btn btn-danger deletefileBtn">{$Lang.delete}</a>
			</div>
	`
		$('#filelist').append(fileHtml)

	};

	// 删除附件
	$('#filelist').on('click', '.deletefileBtn', function () {
		$(this).parent('.filebox').remove()
	});
</script>