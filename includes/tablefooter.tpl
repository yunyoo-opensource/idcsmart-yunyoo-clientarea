<div class="table-footer">
	<div class="table-tools">

	</div>
	<div class="table-pagination">
		<div class="table-pageinfo mr-2">
			<span>{$Lang['common']} {$Total} {$Lang['strips']}</span>
			<span class="mx-2">
				{$Lang['each_page']}
				<select name="" id="limitSel">
					<option value="10" {if $Limit==10}selected{/if}>10</option>
					<option value="15" {if $Limit==15}selected{/if}>15</option>
					<option value="20" {if $Limit==20}selected{/if}>20</option>
					<option value="50" {if $Limit==50}selected{/if}>50</option>
					<option value="100" {if $Limit==100}selected{/if}>100</option>
				</select>
				{$Lang['strips']}
			</span>
		</div>
		<ul class="pagination pagination-sm">
			{$Pages}
		</ul>
	</div>
</div>

<script>
	$(function () {

		// 每页数量选择改变
		$('#limitSel').on('change', function () {
			if ('{$Think.get.action}') {
				location.href = '[url]?action={$Think.get.action}&keywords={$Think.get.keywords}&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page=1&limit=' + $('#limitSel').val()
			} else {
				location.href = '[url]?keywords={$Think.get.keywords}&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page=1&limit=' + $('#limitSel').val()
			}

		})


	})
</script>