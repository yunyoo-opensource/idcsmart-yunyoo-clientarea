
<div class="modal fade secondVerify" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title mt-0" id="myLargeModalLabel">二次验证</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                  <input type="hidden" value="{$Token}" />
				  <input type="hidden" name="action" value="{$Token}" />

                  <div class="form-group row mb-4">
                    <label class="col-sm-3 col-form-label text-right">验证方式</label>
                    <div class="col-sm-8">
                      <select class="form-control" class="second_type" name="type">
						{foreach $AllowType as $type}
                            <option value="{$type.name}">{$type.name_zh}：{$type.account}</option>
                        {/foreach}
                      </select>
                    </div>
                  </div>

                  <div class="form-group row mb-4">
					<label class="col-sm-3 col-form-label text-right">验证码</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" name="code" class="form-control " id="code" placeholder="请输入验证码" />
							<div class="input-group-append">
								<button
									onclick="getSecondVerifyCode()"
									class="btn btn-secondary bind-phone-button" type="button">获取验证码</button>
							</div>
						</div>
					</div>
				  </div>

                </form>

                <div class="modal-footer">
                <button type="button" class="btn btn-primary waves-effect waves-light">提交</button>
                    <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">取消</button>
                    
                </div>
                
            </div>
        </div>
    </div>
</div>

<script>
  
  function showSecondVerifyModal(action, fn){
	$('.secondVerify').modal('show')
	$('.secondVerify input[name='action']').val(action)
	$('.secondVerify .btn-primary').onclick = secondVerify(fn)
  }
  
  var WebUrl = '/';
  
  function getSecondVerifyCode(){
	  $.ajax({
        url: WebUrl + 'second_verify_send',
        type: 'POST',
        data: $('.secondVerify form').serialize(),
        success: function (data) {
          if (data.status == '200') {
            toastr.success(data.msg);
          } else {
            toastr.error(data.msg);
          }
        }
      });
  }
  
  function secondVerify(fn){
	var code = $('#code').val()
	if (typeof fn == 'function') {
		fn(code);
	}
	$('.secondVerify').modal('hide');
  }
</script>
