{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
</div>
</div>
</div>

<footer class="footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				&copy; {$Setting.company_name}.
			</div>
			<div class="col-sm-6">
				<div class="text-sm-right d-none d-sm-block">
					
				</div>
			</div>
		</div>
	</div>
</footer>
{/if}
<script src="/themes/clientarea/yunyoo/assets/js/app.js?v={$Ver}"></script>
{php}$hooks=hook('client_area_footer_output');{/php}
{if $hooks}
	{foreach $hooks as $item}
		{$item}
	{/foreach}
{/if}
</body>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-D7H2XJN4FJ"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag(&#039;js&#039;, new Date());

  gtag(&#039;config&#039;, &#039;G-D7H2XJN4FJ&#039;);
</script>

</html>
<!--