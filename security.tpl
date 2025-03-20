{include file="includes/modal"}
<script src="/themes/clientarea/yunyoo/assets/js/public.js?v={$Ver}"></script>

<style>
	.novalid {
		min-width: 80px;
		height: 26px;
		line-height: 20px;
		background-color: rgba(253, 254, 254, 0.32);
		box-shadow: 0px 6px 14px 2px rgba(6, 31, 179, 0.26);
		border-radius: 4px;
		color: #fff;
	}
	.security-info {
		padding: 20px;
		border-radius: 10px;
		border: solid 2px #ffffff21;
		background: #ffffff21;
	}
</style>
<div class="card mb-4 bg-primary security-header">
	<div class="card-body">
		<div class="row align-items-center text-white">




			<div class="col-sm-3">
				<div class="security-info">
					<div class="security-username">
						{$Userinfo.user.username}
						{if $Setting.certifi_open==1}
						{if $Userinfo.user.certifi.status == '1'}
						<span class="badge badge-success">{$Lang.real_name_authentication}</span>
						{else}
						<span class="badge badge-light novalid">{$Lang.no_real_name_authentication}</span>
						{/if}
						{/if}
					</div>
					<div class="security-strength">
						<div class="security-label">
							{$Lang.account_security_strength}:
							<span class="security-text">
								{$percentage[0]}
							</span>
						</div>
						<div class="security-text">
							<div class="progress">
								<div class="progress-bar bg-danger" role="progressbar" style="width: {$percentage[1]}%"
									aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="security-meta">
					<ul class="list-inline mb-2">
						<li class="list-inline-item">
							<label class="mb-0">{$Lang.mailbox}：</label>
							{if $Userinfo.user.email}
							{$Userinfo.user.email}
							{else}
							{$Lang.unbound}
							{/if}
						</li>

						<li class="list-inline-item">
							<label class="mb-0">{$Lang.opening_time}：</label>
							{$Userinfo.user.create_time|date="Y-m-d H:i:s"}
						</li>
						<ul class="list-inline mb-0">
							<li class="list-inline-item">
								<label class="mb-0">{$Lang.mobile_phone}：</label>
								{if $Userinfo.user.phonenumber}
								{$Userinfo.user.phonenumber}
								{else}
								{$Lang.unbound}
								{/if}
							</li>
						</ul>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-8">
		<div class="card mb-3">
			<div class="card-body p-0 pt-3 pb-3">
				<div class="security-items">

					<div class="security-item p-4">
						<div class="security-item-icon bg-primary">
							<i class="fas fa-fingerprint"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									{$Lang.login_password}
									{if $Userinfo.user.is_password}
									<small style="white-space: nowrap;">
										<i class="fas fa-check-circle"></i>
										{$Lang.set}
									</small>
									{/if}
								</h4>
								<div class="security-item-desc">
									{$Lang.regularly_details}
								</div>
							</div>
							{if $Userinfo.user.is_password}
							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#modifyPasswordModal" onclick="showPassword()">{$Lang.modify}</a>
							{else}
							<a data-target="#modifyPasswordModal" onclick="showPassword()" data-toggle="modal"
								class="btn btn-outline-primary w-md waves-effect waves-light">{$Lang.set_password}</a>
							{/if}
						</div>
					</div>
					<!-- Security-item END -->
					{if $Userinfo.shd_allow_sms_send}
					<div class="security-item p-4">
						<div class="security-item-icon bg-info">
							<i class="fas fa-mobile"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									{$Lang.mobile_phone_binding}
									{if $Userinfo.user.phonenumber}
									<small style="white-space: nowrap;">
										<span
											class="phonehide">{$Userinfo.user.phonenumber|substr=0,3}****{$Userinfo.user.phonenumber|substr=7,11}</span>
										<i class="fas fa-check-circle"></i>
										{$Lang.set}
									</small>
									{/if}
								</h4>
								<div class="security-item-desc">
									{$Lang.regularly_details}
								</div>
							</div>
							{if $Userinfo.user.phonenumber&&$BindPhoneChange==0}
							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#bindPhoneChangeModal1" id="bindPhoneChangeBtn1">{$Lang.modify}</a>
							{elseif $Userinfo.user.phonenumber&&$BindPhoneChange==1}

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#bindPhoneChangeModal2" id="bindPhoneChangeBtn2">{$Lang.modify}</a>
							{else}

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#bindPhoneModal">{$Lang.bind_now}</a>
							{/if}
						</div>
					</div>
					{/if}
					<!-- Security-item END -->

					{if $Userinfo.shd_allow_email_send}
					<div class="security-item p-4">
						<div class="security-item-icon bg-primary">
							<i class="fas fa-envelope"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									{$Lang.mailbox_binding}
									{if $Userinfo.user.email}
									<small style="white-space: nowrap;">
										<span class="phonehide">{$Userinfo.user.email}</span>
										<i class="fas fa-check-circle"></i>
										{$Lang.set}
									</small>
									{/if}
								</h4>
								<div class="security-item-desc">
									{$Lang.reset_password_notice}
								</div>
							</div>
							{if $Userinfo.user.email&&$BindEmailChange==0}

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#changeEmailHandleModal1">{$Lang.modify}</a>
							{elseif $Userinfo.user.email&&$BindEmailChange==1 /}

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#changeEmailHandleModal2">{$Lang.modify}</a>
							{else}

							<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#bindEmailHandleModal">{$Lang.mailbox_binding}</a>
							{/if}
						</div>
					</div>
					{/if}
					<!-- Security-item END -->

					{if $Setting.certifi_open==1}
					<div class="security-item p-4">
						<div class="security-item-icon bg-info">
							<i class="fas fa-portrait"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									{$Lang.real_name_authentications}
									{if $Userinfo.user.certifi.status==1}
									<small style="white-space: nowrap;">
										<i class="fas fa-check-circle"></i>
										{$Lang.set}
									</small>
									{/if}
								</h4>
								<div class="security-item-desc">
									{$Lang.personal_security}
								</div>
							</div>
							{if $Userinfo.user.certifi.status == 1}
							{if $Userinfo.user.certifi.type == 'certifi_person'}
							<a href="verified?action=enterprises&step=info"
								class="btn btn-outline-primary w-md waves-effect waves-light">去企业认证</a>
							{else}
							<a href="verified" class="btn btn-outline-primary w-md waves-effect waves-light">{$Lang.certified}</a>
							{/if}
							{else}
							<a href="verified" class="btn btn-primary w-md waves-effect waves-light">{$Lang.not_certified}</a>

							{/if}
						</div>
					</div>
					<!-- Security-item END -->
					{/if}

					{if $Userinfo.allow_second_verify}
					<div class="security-item p-4">
						<div class="security-item-icon bg-info">
							<i class="fas fa-circle-check"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									{$Lang.secondary_verification}
									{if $Userinfo.user.second_verify}
									<small style="white-space: nowrap;">
										<i class="fas fa-check-circle"></i>
										{$Lang.set}
									</small>
									{/if}
								</h4>
								<div class="security-item-desc">
									{$Lang.secondary_verification_details}
								</div>
							</div>
							{if $Userinfo.user.second_verify}

							<a class="btn btn-primary w-md waves-effect waves-light"
								onclick="closeSecondHandleClick()">{$Lang.close}</a>
							{else}

							<a class="btn btn-primary w-md waves-effect waves-light" data-toggle="modal"
								data-target="#toggleSecondVerifyModalOpen">{$Lang.opens_two}</a>
							{/if}
						</div>
					</div>
					<!-- Security-item END -->
					{/if}

					{if $Userinfo.allow_resource_api}
					<!-- <div class="security-item p-4">
						<div class="security-item-icon bg-primary">
							<i class="far fa-link"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									API
								</h4>
								<div class="security-item-desc">
									{$Lang.administration_details}
								</div>
							</div>

							<a class="btn btn-primary w-md waves-effect waves-light" onclick="showApiPwdHandleClick()">{$Lang.view_secret_key}</a>
						</div>
					</div> -->
					<!-- Security-item END -->
					{/if}

					{if $Bot==1}
					<div class="security-item p-4">
						<div class="security-item-icon bg-primary">
							<i class="far fa-link"></i>
						</div>
						<div class="security-item-info">
							<div class="security-item-text">
								<h4 class="security-item-title">
									{$Lang.interflow_license}
								</h4>
								<div class="security-item-desc">
									{$Lang.interflow_license_details}
								</div>
							</div>

							<a class="btn btn-primary w-md waves-effect waves-light"
								onclick="showInterflowlicenseHandleClick()">{$Lang.license}</a>
						</div>
					</div>
					<!-- Security-item END -->
					{/if}
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-4">

		{if $Userinfo.shd_allow_sms_send}
		<div class="card mb-3">
			<div class="card-body">

				<div class="security-item">
					<div class="security-item-info">
						<div class="security-item-text">
							<h4 class="security-item-title">
								{$Lang.sms_reminder}
							</h4>
							<div class="security-item-desc">
								{$Lang.sms_settings}
							</div>
						</div>
						{if !$Userinfo.user.phonenumber}
						<button data-v-2d646d70="" disabled="disabled" type="button"
							class="btn btn-outline-primary w-md waves-effect waves-light">{$Lang.need_bind_mobile_phone}</button>
						{elseif $Userinfo.user.is_login_sms_reminder==1}

						<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
							data-target="#loginSmsReminderModal">{$Lang.cancel}</a>
						{else}

						<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
							data-target="#loginSmsReminderModalOpen">{$Lang.opens_two}</a>
						{/if}
					</div>
				</div>
				<!-- Security-item END -->

			</div>
		</div>
		{/if}

		{if $Userinfo.shd_allow_email_send}
		<div class="card mb-3">
			<div class="card-body">
				<div class="security-item">
					<div class="security-item-info">
						<div class="security-item-text">
							<h4 class="security-item-title">
								{$Lang.email_reminder}
							</h4>
							<div class="security-item-desc">
								{$Lang.mailbox_settings}
							</div>
						</div>
						{if !$Userinfo.user.email}
						<button data-v-2d646d70="" disabled="disabled" type="button"
							class="btn btn-outline-primary w-md waves-effect waves-light">{$Lang.need_bind_mailbox}</button>
						{elseif $Userinfo.user.email_remind==1}

						<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
							data-target="#loginEmailReminderModal">{$Lang.cancel}</a>
						{else}

						<a class="btn btn-outline-primary w-md waves-effect waves-light" data-toggle="modal"
							data-target="#loginEmailReminderModalOpen">{$Lang.set_up_now}</a>
						{/if}
					</div>
				</div>
				<!-- Security-item END -->

			</div>
		</div>
		{/if}

		{if $Security.oauthBind}
		<div class="card">
			<div class="card-body">
				<h4 class="card-title mb-4">{$Lang.third_party_login}</h4>
				{foreach $Security.oauthBind as $oauth}
				<div class="security-item">
					<div class="security-item-icon">
						{$oauth.img}
					</div>
					<div class="security-item-info">
						<div class="security-item-text">
							<h4 class="security-item-title">
								{$oauth.name}

							</h4>
							<div class="security-item-desc">
								{if $oauth.oauth=="bind"}
								{$Lang.nickname}：{$oauth.username}
								{elseif $oauth.oauth == 'unbind'}
								{$Lang.unbound}
								{/if}
							</div>
						</div>
						{if $oauth.oauth == 'unbind'}
						<a href="{$oauth.url}" class="btn btn-primary w-md waves-effect waves-light">{$Lang.binding}</a>
						{elseif $oauth.oauth == 'bind'}
						<a href="javascript: getModal('oauthBind/untie/{$oauth.dirName}', '{$Lang.prompt}', '{$Lang.make_sure_unbind}{$oauth.name}?', {status: 1});"
							class="btn btn-outline-primary w-md waves-effect waves-light">{$Lang.solution}</a>
						{/if}
					</div>
				</div>
				<!-- Security-item END -->

				{/foreach}

			</div>
		</div>
		{else}
		<div class="security-item-image"></div>
		{/if}
	</div>
</div>


<!-- start: 修改密码模态框 -->
<div class="modal fade" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{if
					$Userinfo.user.is_password}{$Lang.change_password}{else}{$Lang.set_password}{/if}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modifyPwdForm" class="needs-validation" novalidate>
					{if $Userinfo.user.is_password}
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.original_password}</label>
						<div class="col-sm-8">
							<div class="input-group">
		
								<input type="password" name="old_password" class="form-control old_password" id="oldPwd"
									onblur="oldPwdBlur()" placeholder="{$Lang.security_please_enter_password}" required />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary  old_password_btn">
										<i class="fas fa-eye"></i>
									</button>
								</div>
							</div>
							<input type="hidden" name="flag" vaule="1" />
						</div>
					</div>
					{else/}
					<input type="hidden" name="flag" vaule="2" />
					{/if}
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{if
							$Userinfo.user.is_password}{$Lang.new_password}{else}{$Lang.password}{/if}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="password" name="password" class="form-control password" id="pwd" onblur="pwdBlur()"
									placeholder="{if $Userinfo.user.is_password}{$Lang.security_please_new_password}{else}{$Lang.security_please_password}{/if}"
									required />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary  password_btn">
										<i class="fas fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{if
							$Userinfo.user.is_password}{$Lang.repeat_new_password}{else}{$Lang.repeat_then_password}{/if}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="password" name="re_password" class="form-control re_password" id="rePwd"
									onblur="rePwdBlur()"
									placeholder="{if $Userinfo.user.is_password}{$Lang.repeat_new_password}{else}{$Lang.repeat_password}{/if}"
									required />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary  re_password_btn">
										<i class="fas fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					{if $Verify.allow_resetpwd_captcha==1&&$Userinfo.user.is_password}
					{include file="includes/verify" type="allow_resetpwd_captcha"}
					{elseif $Verify.allow_setpwd_captcha==1&&!$Userinfo.user.is_password}
					{include file="includes/verify" type="allow_setpwd_captcha"}
					{/if}
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="modifyPwdSubmit"
					onclick="modifyPwdCheckForm()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<script>
	var _url = '';
	var phoneType = '{$BindPhoneChange}'
	var is_password = '{$Userinfo.user.is_password}';
	var emailType = '{$BindEmailChange}'
	var WebUrl = '/';
	//修改密码input事件
	function oldPwdBlur() {
		var oldPwd = document.getElementById('oldPwd')
		if (oldPwd && oldPwd.value == '') {
			oldPwd.classList.remove("is-valid"); //清除合法状态
			oldPwd.classList.add("is-invalid"); //添加非法状态
			return
		} else if (oldPwd) {
			oldPwd.classList.remove("is-invalid");
			oldPwd.classList.add("is-valid");
		}
	}

	function validateCode() {
		var valCode = document.getElementById('loginSmsReminderCode')
		if (valCode.value == '') {
			valCode.classList.remove("is-valid"); //清除合法状态
			valCode.classList.add("is-invalid"); //添加非法状态
			return
		} else if (valCode) {
			valCode.classList.remove("is-invalid");
			valCode.classList.add("is-valid");
		}
	}

	function emailReminderCode() {
		var emailReminderCode = document.getElementById('loginEmailReminderCode')
		if (emailReminderCode.value == '') {
			emailReminderCode.classList.remove("is-valid"); //清除合法状态
			emailReminderCode.classList.add("is-invalid"); //添加非法状态
			return
		} else if (emailReminderCode) {
			emailReminderCode.classList.remove("is-invalid");
			emailReminderCode.classList.add("is-valid");
		}
	}

	function pwdBlur() {
		var pwd = document.getElementById('pwd')
		if (pwd.value == '') {
			pwd.classList.remove("is-valid"); //清除合法状态
			pwd.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			pwd.classList.remove("is-invalid");
			pwd.classList.add("is-valid");
		}
	}

	function rePwdBlur() {
		var rePwd = document.getElementById('rePwd')
		if (rePwd.value == '') {
			rePwd.classList.remove("is-valid"); //清除合法状态
			rePwd.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			rePwd.classList.remove("is-invalid");
			rePwd.classList.add("is-valid");
		}
	}
	//修改手机绑定模态框 input事件
	function bindPhoneChangeCode1Blur() {
		var code1 = document.getElementById('bindPhoneChangeCode1')
		if (code1.value == '') {
			code1.classList.remove("is-valid"); //清除合法状态
			code1.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			code1.classList.remove("is-invalid");
			code1.classList.add("is-valid");
		}
	}
	//修改手机绑定模态框 input事件
	function changeEmailHandleCodeBlur() {
		var code1 = document.getElementById('changeEmailHandleCode1')
		if (code1.value == '') {
			code1.classList.remove("is-valid"); //清除合法状态
			code1.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			code1.classList.remove("is-invalid");
			code1.classList.add("is-valid");
		}
	}
</script>
<!-- end: 修改密码模态框 -->

<!-- start: 手机绑定模态框 -->
<div class="modal fade" id="bindPhoneModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{$Lang.mobile_phone_binding}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.phone_number}</label>
						<div class="col-sm-8">
							<input type="text" name="phone" class="form-control" id="phoneNum" placeholder="{$Lang.input_mobile}" />
						</div>
					</div>
					{if $Verify.allow_phone_bind_captcha==1}
					{include file="includes/verify" type="allow_phone_bind_captcha" id="captchaPhone1"}
					{/if}
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" class="form-control " id="code"
									placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button
										onclick="getCheckCode('bind_phone','phone','bind-phone-button','post', undefined, 'bindPhoneModal','captcha_allow_phone_bind_captchacaptchaPhone1')"
										class="btn btn-primary bind-phone-button" type="button">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="bindPhoneSubmit"
					onclick="bindPhoneCheckForm()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<!-- start: 修改手机绑定 -->
<div class="modal fade" id="bindPhoneChangeModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{$Lang.verify_original_phone}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="type" value="{if $BindPhoneChange==0}1{else}2{/if}" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.phone_number}</label>
						<div class="col-sm-8">
							{if $Userinfo.user.phonenumber}
							<input type="text" name="tel" readonly id="oldTel"
								value="{$Userinfo.user.phonenumber|substr=0,3}****{$Userinfo.user.phonenumber|substr=7,11}"
								class="form-control" placeholder="{$Lang.input_mobile}" />
							{/if}
						</div>
					</div>
					{if $Verify.allow_phone_bind_captcha==1}
					{include file="includes/verify" type="allow_phone_bind_captcha" id="captchaPhone2"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="bindPhoneChangeCode1" class="form-control "
									onblur="bindPhoneChangeCode1Blur()" placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button
										onclick="getCheckCode('bind_phone_code','tel','bind-phone-button1','get',1, 'bindPhoneChangeModal1','captcha_allow_phone_bind_captchacaptchaPhone2')"
										class="btn btn-primary bind-phone-button1" type="button">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="bindPhoneChangeSubmit1"
					onclick="phoneChangeBtn()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="bindPhoneChangeModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{$Lang.bind_mobile_phone}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="type" value="{if $BindPhoneChange==0}1{else}2{/if}" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.phone_number}</label>
						<div class="col-sm-8">
							<input type="text" name="tel" id="newTel" class="form-control" placeholder="{$Lang.input_mobile}" />
						</div>
					</div>
					{if $Verify.allow_phone_bind_captcha==1}
					{include file="includes/verify" type="allow_phone_bind_captcha" id="captchaPhone3"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="bindPhoneChangeCode2" class="form-control "
									placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button id="bindPhoneChangeCodeBtn2"
										onclick="getCheckCode('bind_phone_code','tel','bind-phone-button2','get',2, 'bindPhoneChangeModal2','captcha_allow_phone_bind_captchacaptchaPhone3')"
										class="btn btn-primary bind-phone-button2" type="button">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="bindPhoneChangeSubmit2"
					onclick="phoneChangeBtn2()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<!-- start 短信提醒 关闭 -->
<div class="modal fade" id="loginSmsReminderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">{$Lang.turn_off_sms_alert}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="phone_code" value="+86" />
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.phone_number}</label>
						<div class="col-sm-8">
							<input type="text" name="name" readonly
								value="{$Userinfo.user.phonenumber|substr=0,3}****{$Userinfo.user.phonenumber|substr=7,11}"
								class="form-control" placeholder="{$Lang.input_mobile}" />
						</div>
					</div>
					{if $Verify.allow_cancel_sms_captcha==1}
					{include file="includes/verify" type="allow_cancel_sms_captcha" id="captchaSms1"}
					{/if}
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" class="form-control " id="loginSmsReminderCode"
									placeholder="{$Lang.please_enter_code}" onblur="validateCode()" />
								<div class="input-group-append">
									<button
										onclick="getCheckCode('remind_send','phone','bind-phone-button','get', undefined, 'loginSmsReminderModal',id='captcha_allow_cancel_sms_captchacaptchaSms1')"
										class="btn btn-primary bind-phone-button" type="button">{$Lang.get_code}</button>
								</div>

							</div>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="loginSmsReminderSubmit"
					onclick="loginSmsReminderCheckForm()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<!-- start: 短信提醒 开启 -->
<div class="modal fade" id="loginSmsReminderModalOpen" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.prompt}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center">
					<i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i>
					{$Lang.on_reminder}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="loginSmsReminderSubmitOpen"
					onclick="smsSubmitOpenBtn()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>

<!-- end -->


<!-- start: 邮箱绑定 -->
<div class="modal fade" id="bindEmailHandleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.mailbox_binding}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.mailbox}</label>
						<div class="col-sm-8">
							<input type="text" name="email" class="form-control" placeholder="{$Lang.please_input_email}"
								id="bindEmailHandleEmail" />
						</div>
					</div>
					{if $Verify.allow_email_bind_captcha==1}
					{include file="includes/verify" type="allow_email_bind_captcha" id="captchaEmail1"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" class="form-control" placeholder="{$Lang.please_enter_code}"
									id="bindEmailHandleCode" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button"
										onclick="getCheckCode('bind_email','email','bind-email-button','post', undefined, 'bindEmailHandleModal','captcha_allow_email_bind_captchacaptchaEmail1')"
										type="button" id="button-addon2">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="bindEmailHandleSubmit"
					onclick="bindEmailHandleCheckForm()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<!-- start: 邮箱修改 -->
<div class="modal fade" id="changeEmailHandleModal1" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.verify_original_email}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="type" value="{if $BindEmailChange==0}1{else}2{/if}" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.mailbox}</label>
						<div class="col-sm-8">
							<input type="text" name="email" id="changeEmailHandleEmail1" readonly value="{$Userinfo.user.email}"
								class="form-control" placeholder="{$Lang.please_input_email}" />
						</div>
					</div>
					{if $Verify.allow_email_bind_captcha==1}
					{include file="includes/verify" type="allow_email_bind_captcha" id="captchaEmail2"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="changeEmailHandleCode1" onblur="changeEmailHandleCodeBlur()"
									class="form-control" placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button1"
										onclick="getCheckCode('change_email','email','bind-email-button1','post',1, 'changeEmailHandleModal1','captcha_allow_email_bind_captchacaptchaEmail2')"
										type="button" id="button-addon2">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="changeEmailHandleSubmit1"
					onclick="changeEmailBtn()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="changeEmailHandleModal2" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.bind_new_mailbox}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" name="type" value="{if $BindEmailChange==0}1{else}2{/if}" id="captcha3" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.mailbox}</label>
						<div class="col-sm-8">
							<input type="text" name="email" id="changeEmailHandleEmail2" class="form-control"
								placeholder="{$Lang.please_input_email}" />
						</div>
					</div>
					{if $Verify.allow_email_bind_captcha==1}
					{include file="includes/verify" type="allow_email_bind_captcha" id="captchaEmail3"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="changeEmailHandleCode2" class="form-control"
									placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button2"
										onclick="getCheckCode('change_email','email','bind-email-button2','post',2, 'changeEmailHandleModal2','captcha_allow_email_bind_captchacaptchaEmail3')"
										type="button" id="button-addon2">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="changeEmailHandleSubmit2"
					onclick="changeEmailBtn2()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<!-- start: 邮箱提醒 关闭 -->
<div class="modal fade" id="loginEmailReminderModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.off_reminder}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.mailbox}</label>
						<div class="col-sm-8">
							<input type="text" name="email" readonly value="{$Userinfo.user.email}" class="form-control"
								placeholder="{$Lang.please_input_email}" />
						</div>
					</div>
					{if $Verify.allow_cancel_email_captcha==1}
					{include file="includes/verify" type="allow_cancel_email_captcha"}
					{/if}
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="loginEmailReminderCode" class="form-control"
									placeholder="{$Lang.please_enter_code}" onblur="emailReminderCode()" />
								<div class="input-group-append">
									<button class="btn btn-primary bind-email-button"
										onclick="getCheckCode('remind_email_send','email','bind-email-button','get', undefined, 'loginEmailReminderModal','captcha_allow_cancel_email_captcha')"
										type="button" id="button-addon2">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="loginEmailReminderSubmit"
					onclick="loginEmailReminderCheckForm()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<!-- start: 邮箱提醒 开启 -->
<div class="modal fade" id="loginEmailReminderModalOpen" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.prompt}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center">
					<i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i>
					{$Lang.open_mailbox_reminder}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="loginEmailReminderSubmitOpen"
					onclick="loginEmailReminderSubmitOpen()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>
<!-- start: 二次验证 开启 -->
<div class="modal fade" id="toggleSecondVerifyModalOpen" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.prompt}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center">
					<i class="fas fa-exclamation-circle fs-20 text-warning mr-2"></i>
					{$Lang.determine_verification}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary mr-2" id="toggleSecondVerifySubmitOpen"
					onclick="toggleSecondVerifySubmitOpen()">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: api -->
<div class="modal fade" id="getapiModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.modify_key}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text-right">{$Lang.api_key}</label>
						<div class="col-sm-9">
							<div class="input-group">
								<input id="copy-apiss" type="password" name="api" value="{$Userinfo.user.api_password}"
									data-clipboard-text="{$Userinfo.user.api_password}" class="form-control api_passwordss"
									placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary btn-password">
										<i class="fas fa-eye"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row mb-0">
						<label class="col-sm-2"></label>
						<div class="col-sm-8">
							<button type="button" class="btn btn-default btn-sm btn-copies w-xs mr-1"
								data-clipboard-target="#copy-apiss" id="btn-copies" onclick="cpBtn()">
								{$Lang.copy}
							</button>
							<button type="button" onClick="getApiPwd()" class="btn btn-default btn-sm btn-random w-xs">
								{$Lang.reset}
							</button>
						</div>
					</div>
				</form>
				<script src="/themes/clientarea/yunyoo/assets/libs/clipboard/clipboard.min.js"></script>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="getapiModalSubmit"
					onclick="getapiModalCheckForm()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>

<!-- start: interflow -->
<div class="modal fade" id="interflowModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.seting_license}</h5>

				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="accountbind-form">
					
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text-right" name="i_type">
						</label>
						<div class="col-sm-9">
							<div class="input-group">
								<input id="copy-apiss" name="qq" class="form-control"/>
							</div>
						</div>
					</div>

				</form>
				<script src="/themes/clientarea/yunyoo/assets/libs/clipboard/clipboard.min.js"></script>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary mr-2" id="getapiModalSubmit"
					onclick="getapiModalCheckForm()">{$Lang.determine}</button>
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
			</div>
		</div>
	</div>
</div>

<script src="/themes/clientarea/yunyoo/assets/js/security.js?v={$Ver}"></script>