function checkVerified(type) {
	$.ajax({
		url: 'certifi_ping?type=' + type,
		type: 'get',
		success: function (result) {
			if (result.status == '200') {
				// layer.closeAll();
				location.href = 'verified'
				stopInterval()
			}
		}
	});
}
var intervalBox;
var index_num = 0;

function startInterval(type) {
	clearInterval(intervalBox);
	intervalBox = setInterval(function (){
		checkVerified(type);
		index_num++;
		if(index_num >= 30)
		{
			location.href = 'verified';
		}
	}, 3000);
}

function stopInterval() {
	clearInterval(intervalBox);
}

function getModal(action, title, text, data, callback) {
	if (!title) {
		title = '提示';
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
		if (data && !$('#customBody').find('form').eq(0).serialize()) {
			data = data;
		} else {
			data = $('#customBody').find('form').eq(0).serialize();
		}

/*  let _this = $(this)
  let text = $(this).text()
  $(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
		$.ajax({
			url: setting_web_url  + action,
			type: 'POST',
			data: data,
			dataType: 'json',
			beforeSend: function () {
			},
			success: function (data) {
	  _this.html(text);
				if (data.status == '200') {
					toastr.success(data.msg);
					//layer.closeAll();
					setTimeout(function () {
						if (action == 'modify_password') {
							location.href = setting_web_url  + 'login';
						} else if (callback) {
							callback()
						}
						else {
							location.reload();
						}
					}, 2000);
				} else {
					toastr.error(data.msg);
				}
			},
	error: function(){
	  _this.html(text);
	}
		});*/
	});

}

function getModalConfirm(text, callback) {
	$('#confirmModal').modal('show')
	$('#confirmBody').html(text)
	$(document).on('click', '#confirmSureBtn', function () {
		$('#confirmSureBtn').attr('disabled', true)
		setTimeout(function(){
			$('#confirmSureBtn').attr('disabled', false)
		}, 3000);
		callback();
  $(document).off("click")
	});
}

