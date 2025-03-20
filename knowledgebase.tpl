<div class="row">
  <div class="col-xl-9 col-lg-8">
    <div class="card p-4">

      <div class="row justify-content-center">
        <div class="col-xl-12">
          <div class="mt-5">
            <hr class="mt-2">
            {if $HelpList}
            <div class="list-group list-group-flush">
              {foreach $HelpList as $help}
              <a href="./knowledgebaseview?id={$help.id}"
                class="list-group-item text-muted d-flex justify-content-between">
                <div>
                  <i class="mdi mdi-circle-medium mr-1"></i> {$help.title}
                </div>
                <div style="width: 110px;">
                  <span>{$help.create_time|date='Y-m-d H:i'}</span>
                </div>
              </a>
              {/foreach}
            </div>
            {/if}
          </div>
        </div>
      </div>

      <!-- 表单底部调用开始 -->
			{include file="includes/tablefooter" url="knowledgebase"}

    </div>
  </div>

  <div class="col-xl-3 col-lg-4">
    <div class="card">
      <div class="card-body p-4">
        <div class="search-box">
          <p class="text-muted">{$Lang.search}</p>
          <div class="table-search">
            <!-- {include file="includes/tablesearch" url="knowledgebase"} -->
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
            {foreach $HelpCate as $classify}
            <li><a href="./knowledgebase?cate={$classify.id}" class="text-muted py-2 d-block"><i
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
        location.href = 'knowledgebase?keywords=' + $('#searchInp').val()
      }
    })
</script>