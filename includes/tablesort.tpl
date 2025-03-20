<script>
  $(function () {
    // 关键字搜索
    $('#searchInp').val('{$Think.get.keywords}')

    $('#searchInp').on('keydown', function (e) {
      if (e.keyCode == 13) {
        location.href = '[url]?keywords=' + $('#searchInp').val() + '&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}'
      }
    })
    $('#searchIcon').on('click', function () {
      location.href = '[url]?keywords=' + $('#searchInp').val() + '&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}'
    });

    // 排序
    $('.bg-light th').on('click', function () {
      var sort = '{$Think.get.sort}'
      location.href = '[url]?keywords={$Think.get.keywords}&sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') + '&page={$Think.get.page}&limit={$Think.get.limit}'
    })
  })
</script>