
<div class="row">
  <div class="col-xl-9 col-lg-8">
    <div class="card p-4">

      <div class="row justify-content-center">
        <div class="col-xl-12">
          <div class="mt-5">
            <hr class="mt-2">
            {if $NewsList}
            <div class="list-group list-group-flush">
              {foreach $NewsList as $news}
              <a href="./newsview?id={$news.id}" class="list-group-item text-muted d-flex justify-content-between">
                <div>
                  <i class="mdi mdi-circle-medium mr-1"></i> {$news.title}
                </div>
                <div>
                  <span>{$news.push_time|date='Y-m-d H:i'}</span>
                </div>
              </a>
              {/foreach}
            </div>
            {/if}
          </div>
        </div>
      </div>
		<!-- 表单底部调用开始 -->
			{include file="includes/tablefooter" url="news"}
      
     
    </div>
  </div>

  <div class="col-xl-3 col-lg-4">
    <div class="card">
      <div class="card-body p-4">
        <div class="search-box">
          <p class="text-muted">{$Lang.search}</p>
          <div class="table-search">
            <div class="row justify-content-end">
              <div class="col-sm-12">
                <div class="search-box">
                  <div class="position-relative">
                    <input type="text" class="form-control" id="searchInp" placeholder="{$Lang['search_by_keyword']}">
                    <i class="bx bx-search-alt search-icon" id="searchIcon"></i>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
        <hr class="my-4">
        <div>
          <p class="text-muted">{$Lang.classification}</p>
          <ul class="list-unstyled font-weight-medium">
            {foreach $NewsCate as $classify}
            <li><a href="./news?cate={$classify.id}" class="text-muted py-2 d-block"><i
                  class="mdi mdi-chevron-right mr-1"></i> {$classify.title} <span
                  class="badge badge-soft-success badge-pill float-right ml-1 font-size-12">{$classify.count}
                </span></a></li>
            {/foreach}
          </ul>
        </div>
      </div>
    </div>
    <!-- end card -->
  </div>
</div>

<script>
  $('#searchInp').on('keydown', function (e) {
      if (e.keyCode == 13) {
        location.href = 'news?keywords=' + $('#searchInp').val()
      }
    })
</script>