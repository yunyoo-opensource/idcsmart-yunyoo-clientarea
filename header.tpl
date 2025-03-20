
<!DOCTYPE html>
<html lang="zh-CN">

<head>
	<meta charset="utf-8" />
	<title>{$Title} | {$Setting.company_name}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="{$Setting.web_seo_desc}" name="description" />
	<meta content="{$Setting.web_seo_keywords}" name="keywords" />
	<meta content="{$Setting.company_name}" name="author" />
	

	{include file="includes/head"}
  <script>
	var setting_web_url = ''
  var language={:json_encode($_LANG)};
  </script>
	{php}$hooks=hook('client_area_head_output');{/php}
	{if $hooks}
		{foreach $hooks as $item}
			{$item}
		{/foreach}
	{/if}
<style>
    .logo-lg img{
      width:150px;
      height:auto;
    }
</style>
</head>
<body data-sidebar="dark">
	{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
	<header id="page-topbar">
		<div class="navbar-header">
			<div class="d-flex">
				<!-- LOGO -->
				<div class="navbar-brand-box">
					<a href="{$Setting.web_jump_url}" class="logo logo-dark">
						{if $Setting.logo_url_home_mini !=''}
						<span class="logo-sm">
							<img src="{$Setting.logo_url_home_mini}" alt="" height="32">
						</span>
						{/if}
						<span class="logo-lg">
							<img src="{$Setting.web_logo_home}" alt="" height="17">
						</span>
					</a>

					<a href="{$Setting.web_jump_url}" class="logo logo-light">
						{if $Setting.logo_url_home_mini !=''}
						<span class="logo-sm" style="overflow: hidden;">
							<img src="{$Setting.logo_url_home_mini}" alt="" height="32">
						</span>
						{/if}
						<span class="logo-lg">
							<img src="{$Setting.web_logo_home}" alt="">
						</span>
					</a>
				</div>

				<button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect" id="vertical-menu-btn">
					<i class="fa fa-fw fa-bars"></i>
				</button>


			</div>

			<div class="d-flex">


				<div class="dropdown d-inline-block d-lg-none ml-2 phonehide">
					<button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="mdi mdi-magnify"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0"
						aria-labelledby="page-header-search-dropdown">

						<form class="p-3">
							<div class="form-group m-0">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit">
											<i class="mdi mdi-magnify"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				
				<!-- 多语言 -->
				{if $Setting.allow_user_language}
				<div class="dropdown d-inline-block">
					<button type="button" class="btn header-item waves-effect" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<img id="header-lang-img" src="/upload/common/country/{$LanguageCheck.display_flag}-y.png" alt="Header Language" height="20">
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<!-- wyh 20210329 插件使用 -->
						{php}
							$parse = parse_url(request()->url());
							$path = $parse['path'];
							$query = preg_replace('/&language=[a-zA-Z0-9_-]+/', '', $parse['query']);
						{/php}
						<!-- item-->
						{foreach $Language as $key=>$list}
							<a href="?{if $query}{$query}&{/if}language={$key}" class="dropdown-item notify-item language" data-lang="zh-cn">
								<img src="/upload/common/country/{$list.display_flag}-y.png" alt="user-image" class="mr-1" height="16">
								<span class="align-middle">{$list.display_name}</span>
							</a>
						{/foreach}
					</div>
				</div>
				{/if}
        
				<!-- 购物车 -->
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<button type="button" class="btn header-item noti-icon waves-effect">
						<a href="cart?action=viewcart"><i class="bx bx-cart-alt" style="margin-top: 8px;"></i></a>
							<!-- {if count($CartShopData) != '0'}
							<span class="badge badge-danger badge-pill">{:count($CartShopData)}</span>
							{/if} -->
					</button>
				</div> 

				<!-- 消息 -->
				<div class="dropdown d-none d-lg-inline-block ml-1">
					<a href="message">
						<button type="button" class="btn header-item noti-icon waves-effect">
							<i class="bx bx-bell {if $Setting.unread_num}bx-tada{/if}" style="margin-top: 8px;"></i>
							{if $Setting.unread_num != '0'}
							<span class="badge badge-danger badge-pill">{$Setting.unread_num}</span>
							{/if}
						</button>
					</a>
				</div>

				<!-- 个人中心 -->
				{if $Userinfo}
				<div class="dropdown d-inline-block">
					<button type="button" class="btn header-item waves-effect d-inline-flex align-items-center"
						id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="https://cravatar.cn/avatar/<?php echo md5(strtolower(trim($Userinfo['user']['email']))); ?>?d=https://cravatar.cn/wp-content/uploads/sites/9/2024/03/lgqsza1-2.png" class="user-center_header d-inline-flex align-items-center justify-content-center"
							style="display: inline-block;width: 30px;height: 30px;font-size: 16px;" data-avatar></img>
						<span class="d-none d-xl-inline-block ml-1" key="t-henry">{$Userinfo.user.username}</span>
						<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<!-- item-->
						<a class="dropdown-item" href="details">
							<i class="bx bxs-user-detail font-size-16 align-middle mr-1"></i>
							<span key="t-profile">{$Lang.personal_information}</span>
						</a>
						<a class="dropdown-item" href="security">
							<i class="bx bx-cog font-size-16 align-middle mr-1"></i>
							<span key="t-profile">{$Lang.security_center}</span>
						</a>
						<a class="dropdown-item" href="message">
							<i class="bx bxl-messenger font-size-16 align-middle mr-1"></i>
							<span key="t-profile">{$Lang.message_center}</span>
						</a>
						{if $Setting.certifi_open==1}
						<a class="dropdown-item" href="verified"> 
							<i class="bx bxs-id-card font-size-16 align-middle mr-1"></i>
							<span key="t-profile">{$Lang.real_name_authentications}</span>
						</a>
						{/if}
						<a class="dropdown-item text-danger" href="logout"><i
								class="bx bx-power-off font-size-16 align-middle mr-1 text-danger"></i> <span
								key="t-logout">{$Lang.log_out}</span></a>
					</div>
				</div>
				{else}
				<div class="pointer d-flex align-items-center">
					<a href="/login" class="text-dark">{$Lang.please_login}</a>
				</div>
				{/if}

			</div>
		</div>
	</header>

	{include file="includes/menu"}

	<div class="main-content">
		<div class="page-content">
			{if $TplName != 'clientarea'}
			{include file="includes/pageheader"}
			{/if}
			<div class="container-fluid">
				{/if}