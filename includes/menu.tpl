<!-- ========== Left Sidebar Start ========== -->
{if $Userinfo}
<div class="vertical-menu">
	<div data-simplebar class="h-100">
		<!--- Sidemenu -->
		<div id="sidebar-menu" class="menu-js">
			<!-- Left Menu Start -->
			<ul class="metismenu list-unstyled" id="side-menu">
			
				<!-- 临时菜单 -->
				<!-- <li>
					<a href="/credit" class="waves-effect">
						<i class="bx bx-home-circle"></i>
						<span>信用额度</span>
					</a>
				</li> -->
				<!-- 临时菜单 -->
				{foreach $Nav as $nv}
				<li>
					<a href="{if $nv.child}javascript: ;{else}{$nv.url}{/if}" class="{if $nv.child}has-arrow{/if} waves-effect">
						{if $nv.fa_icon}<i class="{$nv.fa_icon}"></i>{/if}
						{if (isset($nv.tag))}
							{$nv.tag}
						{/if}
						<span>{$nv.name}</span>
					</a>
					{if $nv.child}
					<ul class="sub-menu mm-collapse" aria-expanded="false">
						{foreach $nv.child as $subnav}
						<li>
							<a href="{if $subnav.child}javascript: ;{else}{$subnav.url}{/if}"
								class="{if $subnav.child}has-arrow{/if} waves-effect">
								{if $subnav.fa_icon}<i class="{$subnav.fa_icon}"></i>{/if}
								{if (isset($subnav.tag))}
									{$subnav.tag}
								{/if}
								<span>{$subnav.name}</span>
							</a>
							{if $subnav.child}
							<ul class="sub-menu" aria-expanded="false">
								{foreach $subnav.child as $submenu}
								<li>
									<a href="{if $submenu.child}javascript: ;{else}{$submenu.url}{/if}"
										class="{if $submenu.child}has-arrow{/if} waves-effect">
										{if $submenu.fa_icon}<i class="{$submenu.fa_icon}"></i>{/if}
										{if (isset($submenu.tag))}
											{$submenu.tag}
										{/if}
										<span>{$submenu.name}</span>
									</a>
								</li>
								<!-- Nav Level 3 -->
								{/foreach}
							</ul>
							{/if}
						</li>
						<!-- Nav Level 2 -->
						{/foreach}
					</ul>
					{/if}
				</li>
				<!-- Nav Level 1 -->
				{/foreach}
			</ul>
		</div>
		<!-- Sidebar -->
	</div>
</div>
{else/}
<div class="vertical-menu menu-js">
	<div data-simplebar class="h-100">
		<!--- Sidemenu -->
		<div id="sidebar-menu" class="menu-js">
			<!-- Left Menu Start -->
			<ul class="metismenu list-unstyled" id="side-menu">
				<li>
					<a href="/clientarea" class="waves-effect">
						<i class="bx bx-home-circle"></i>
						<span>首页</span>
					</a>
				</li>
				<li>
					<a href="/login" class="waves-effect">
						<i class="bx bx-user"></i>
						<span>登录</span>
					</a>
				</li>
				<li>
					<a href="/register" class="waves-effect">
						<i class="bx bx-user"></i> 
						<span>注册</span>
					</a>
				</li>
				<li>
					<a href="/cart" class="waves-effect">
						<i class="bx bx-cart-alt"></i>
						<span>订购产品</span>
					</a>
				</li>
				<li>				
					<a href="/news" class="waves-effect">
						<i class="bx bx-detail"></i>
						<span>新闻中心</span>
					</a>
				</li>
				<li>				
					<a href="/knowledgebase" class="waves-effect">
						<i class="bx bx-detail"></i>
						<span>帮助中心</span>
					</a>
				</li>
				<li>				
					<a href="/downloads" class="waves-effect">
						<i class="bx bx-download"></i>
						<span>资源下载</span>
					</a>
				</li>
			</ul>
		</div>
		<!-- Sidebar -->
	</div>
</div>
{/if}
