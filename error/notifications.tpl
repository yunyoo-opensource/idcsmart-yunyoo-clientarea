<script type="text/javascript">
	$(function () {
		toastr.success('[value]');
		setTimeout(function () {
			var url = '[url]'
			if (url) {
				location.href = url
			}
		}, 500);
	});
</script>