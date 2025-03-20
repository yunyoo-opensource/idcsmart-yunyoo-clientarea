<!-- getModal 自定义body弹窗 -->
<div class="modal fade" id="customModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="customTitle">{$Lang.prompt}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="customBody">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="customSureBtn">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
  $(function () {

  });
  function deleteConfirm(action, title, text, data) {
    if (!title) {
      title = '{$Lang.prompt}';
    }
    if (text) {
      content = '<div class="d-flex align-items-center"><i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i> ' + text + '</div>';
      area = ['420px'];
    } else {
      content = $('.' + action).html();
      area = ['500px'];
    }
    $('#customModal').modal('show')
		$('#customBody').html(content)
		$(document).on('click', '#customSureBtn', function () {
			var WebUrl = '/';
			if (data && !$('#customBody').find('form').eq(0).serialize()) {
				data = data;
			} else {
				data = $('#customBody').find('form').eq(0).serialize();
			}
			$.ajax({
				url: WebUrl + action + '/' + data.id,
				type: 'DELETE',
				data: data,
				dataType: 'json',
				beforeSend: function () {
				},
				success: function (data) {
					if (data.status == '200') {
						toastr.success(data.msg);
						
						location.reload()
					} else {
						toastr.error(data.msg);
					}
				}
			});
		});
    
  }
</script>