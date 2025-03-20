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
    changeStyle()
    function changeStyle() {
      $('.bg-light th.pointer').children('.text-black-50.d-inline-flex.flex-column.justify-content-center.ml-1.offset-3').children().css('color',`
      rgba(0, 0, 0, 0.1)`)
       var sort = '{$Think.get.sort}'
       let index 
       if(sort === 'desc'){
        index = 1
       } else if(sort === 'asc') {
        index = 0
       }
      
       $('.bg-light th.pointer').children('.text-black-50.d-inline-flex.flex-column.justify-content-center.ml-1.offset-3').children().eq(index).css('color',`
       rgba(0, 0, 0, 0.8)`)
    }
    // 排序
    $('.bg-light th').on('click', function () {
      var sort = '{$Think.get.sort}'
      location.href = '[url]?keywords={$Think.get.keywords}&sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') + '&page={$Think.get.page}&limit={$Think.get.limit}'
    })
  })
</script>
<div class="row justify-content-end">
  <div class="col-sm-6">
    <div class="search-box">
      <div class="position-relative">
        <input type="text" class="form-control" id="searchInp" placeholder="{$Lang['search_by_keyword']}">
        <i class="bx bx-search-alt search-icon" id="searchIcon"></i>
      </div>
    </div>
  </div>
</div>