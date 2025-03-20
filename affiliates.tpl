<script type="text/javascript">
	$(function () {
		$('.activation').click(function () {
			$.get("activation", function (data) {
				if (data.status == '200') {
					toastr.success(data.msg);
					setTimeout(function () {
						location.reload();
					}, 1000);
				}
			});
		});
	});
</script>
{if $Affiliates.is_open == 1}
    {if !$Affiliates.aff}
        {include file="affiliates/unaffiliates"}
    {else}
        {include file="affiliates/affiliates"}
    {/if}
{else}
    <script type="text/javascript">
        location.href = '/404.html';
    </script>
{/if}