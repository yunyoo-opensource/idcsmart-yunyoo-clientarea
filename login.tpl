{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg"}
{/if}

<script src="/themes/clientarea/yunyoo/assets/js/public.js" type="text/javascript"></script>

<style>
		.semi-transparent-white-bg {
			background-color: rgb(255, 255, 255, 0.95);
		}

		body {
			/*background: url(https://h2.nexus/source/img/uptime.gif);*/
			/*background-repeat: no-repeat;*/
			/*background-size: cover;*/
			/*background-position: center;*/
		}

		section {
			/*backdrop-filter: blur(12px);*/
			/*--webkit-backdrop-filter: blur(12px);*/
			background-color: rgb(176 116 209 / 10%);
		}
</style>
<script type="text/javascript">
    var mk = '{$Setting.msfntk}';
</script>
	<section>
		<div class="container d-flex flex-column">
			<div class="row align-items-center justify-content-center min-vh-100">
				<div class="col-md-7 col-lg-6 col-xl-5 py-6 py-md-0">
					<div class="card shadow zindex-100 mb-0 overflow-hidden rounded-lg semi-transparent-white-bg">
						<div class="p-1 bg-info"></div>
						<div class="card-body px-md-5 py-5">
							<div class="mb-3 container">
								<div class="row align-items-end">
									<div class="p-0 col-auto mr-auto">
										<h1 class="text-primary">登录账号</h1>
									</div>
									<div class="p-0 col-auto">
										<!--<h4 class="text-primary"><i class="fa-angles-right fa-solid pr-1" aria-hidden="true"></i>注册账号</h4>-->
									</div>
								</div>
							</div>
							<span class="clearfix"></span>
							<form id="loginForm" class="mb-0" method="post" action="/login?action=email">
								<div class="form-group">
									<label class="form-control-label">邮箱</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg"
													width="1em" height="1em" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2" stroke-linecap="round"
													stroke-linejoin="round" class="feather feather-at-sign">
													<circle cx="12" cy="12" r="4"></circle>
													<path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path>
												</svg></span>
										</div>
										<input type="email" name="email" class="form-control" id="emailInp"
											placeholder="请输入邮箱地址">
									</div>
								</div>
								<div class="form-group">
									<label class="form-control-label">密码</label>

									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg"
													width="1em" height="1em" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2" stroke-linecap="round"
													stroke-linejoin="round" class="feather feather-key">
													<path
														d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4">
													</path>
												</svg></span>
										</div>
										<input type="password" name="password" class="form-control" id="emailPwdInp"
											value placeholder="请输入登录密码">
									</div>
								</div>
								{if $Login.allow_login_email_captcha==1 && $Login.is_captcha==1}
								{include file="includes/verify"  type="allow_login_email_captcha" positon="top"}
								{/if}		
								<div class="row pt-2 m-0">

									<div class="p-0 col-auto mr-auto">
										<a href="/register" class="font-weight-bold">注册账号</a>
									</div>
									<div class="p-0 col-auto">
										<a href="/pwreset" class="font-weight-bold">忘记密码</a>
									</div>

								</div>
								<div class="mt-4">
									<button id="loginBtn" type="submit" class="btn btn-block btn-primary"
										onclick="login()">登录</button>
								</div>
							</form>


						</div>
						<div class="mb-1 d-flex justify-content-center"><a href="/" one-link-mark="yes">云悠
								YUNYOO</a></div>
						<div class="p-1 bg-info"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		function login() {
			var button = document.getElementById('loginBtn');
			var icon = document.createElement('i');
			icon.className = 'fas fa-circle-notch bx-spin mr-1';

			button.disabled = true;
			button.innerHTML = '登录中...';
			button.prepend(icon);
			var form = document.getElementById('loginForm');
			form.submit();
			setTimeout(function () {
				button.disabled = false;
				button.innerHTML = '登录';
				icon.remove();
			}, 10000);
		}
	</script>
<script type="text/javascript">
{if $Get.action=="phone_code"} 
phoneCheck("","allow_login_phone_captcha")
{else/} 
phoneCheck("","allow_login_code_captcha")
{/if}

</script>
