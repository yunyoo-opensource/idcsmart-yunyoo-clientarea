<!-- 二次验证 -->
<div class="modal fade" id="secondVerifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">二次验证</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" value="closed" name="action" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">验证方式</label>
						<div class="col-sm-8">
							<select class="form-control" class="second_type" name="type" id="secondVerifyType">
								{foreach $AllowType as $type}
									<option value="{$type.name}">{$type.name_zh}：{$type.account}</option>
								{/foreach}
							</select>
						</div>
					</div>
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">验证码</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="secondVerifyCode" class="form-control" placeholder="请输入验证码" />
								<div class="input-group-append" id="getCodeBox">
									<button class="btn btn-secondary" id="secondCode" onclick="getSecurityCode()" type="button">获取验证码</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary mr-2" id="secondVerifySubmit" onclick="secondVerifySubmitBtn(this)">确定</button>
			</div>
		</div>
	</div>
</div>


<!-- getModalConfirm 确认弹窗 -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">提示</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="confirmBody">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="confirmSureBtn">确定</button>
			</div>
		</div>
	</div>
</div>
<!-- getModal 自定义body弹窗 -->
<div class="modal fade" id="customModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="customTitle">提示</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="customBody">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="customSureBtn">确定</button>
			</div>
		</div>
	</div>
</div>

<script>
	var Userinfo_allow_second_verify = '{$Userinfo.allow_second_verify}'
		,Userinfo_user_second_verify = '{$Userinfo.user.second_verify}'
		,Userinfo_second_verify_action_home = {:json_encode($Userinfo.second_verify_action_home)}
		,Login_allow_second_verify = '{$Login.allow_second_verify}'
		,Login_second_verify_action_home = {:json_encode($Login.second_verify_action_home)};
</script>
<script src="/themes/clientarea/default/assets/js/modal.js?v={$Ver}"></script>


