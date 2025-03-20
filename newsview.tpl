<style>
  .newscontent pre,
  .newscontent .newscontent {
    max-width: 100%;
    word-break: break-all;
    white-space: pre-wrap;
  }
  .newscontent img {
    width: 90%;
    height: 50%;
  }

  .newscontent p {
    display: block !important;
    white-space: normal;
  }
</style>
<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="pt-3">
          <div class="row justify-content-center">
            <div class="col-xl-8">
              <div>
                <div class="text-center">
                  <div class="mb-4">
                    <span class="badge badge-light font-size-12"> <i class="bx bx-purchase-tag-alt align-middle text-muted mr-1"></i>{$ViewAnnouncement.cate_name} </span>
                  </div>
                  <h4>{$ViewAnnouncement.title}</h4>
                  <p class="text-muted mb-4"><i class="mdi mdi-calendar mr-1"></i> {$ViewAnnouncement.push_time | date='Y-m-d H:i'}</p>
                </div>
                <hr />
                <div class="mt-4">
                  <div class="text-muted font-size-14">
                    <div class="mb-4">
                      <iframe id="viewcontent" scrolling="no" style="border: none; width: 100%"></iframe>
                    </div>
                  </div>
                  <hr />
                </div>

                {if $ViewAnnouncement.label}
                <div class="mt-4">
                  <h5 class="mb-3">标签:</h5>

                  <div>
                    <div class="row">
                      <ul class="row w-100">
                        {foreach $ViewAnnouncement.label as $label}
                        <li class="py-1 col-sm-6">{$label}</li>
                        {/foreach}
                      </ul>
                    </div>
                  </div>
                </div>
                {/if}

                <div class="mt-4 d-flex {if !$ViewAnnouncement.prev && $ViewAnnouncement.next}justify-content-end{else}justify-content-between{/if}">
                  {if $ViewAnnouncement.prev}
                  <a href="newsview?id={$ViewAnnouncement.prev.id}" class="btn btn-primary"><i class="bx bx-left-arrow-alt font-size-16 align-middle mr-2"></i> {$ViewAnnouncement.prev.title}</a>
                  {/if} {if $ViewAnnouncement.next}
                  <a href="newsview?id={$ViewAnnouncement.next.id}" class="btn btn-primary"> {$ViewAnnouncement.next.title}<i class="bx bx-right-arrow-alt font-size-16 align-middle mr-2"></i></a>
                  {/if}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end card body -->
    </div>
    <!-- end card -->
  </div>
  <!-- end col -->
</div>
<!-- end row -->
<script>
  $(function () {
    $('.newscontent').find('*').css({ margin: '0px', display: 'inline-block' })
    $('.newscontent')
      .find('p')
      .each(function () {
        if ($(this).html() == '&nbsp;') {
          $(this).remove()
        }
      })
    $('.newscontent')
      .find('span')
      .each(function () {
        if ($(this).html() == '&nbsp;') {
          $(this).remove()
        }
      })

    // 内容显示到 ifrom 中
    const viewstyle = `<style>
        html, body { margin: 0; word-break: break-all; height: 100% }
        table { width: 100% }
        img { width: 90%; height: 50%; }
        p { display: block !important; white-space: normal; }
    </style>`
    let content = `{$ViewAnnouncement.content|raw}`
    content = content.indexOf('</head>') > 0 ? content.replace('</head>', `${viewstyle}</head>`) : `${content}${viewstyle}`
    const iframe = document.querySelector('#viewcontent')
    const viewdoc = iframe.contentDocument
    viewdoc.open()
    viewdoc.write(content)
    viewdoc.close()
    iframe.height = viewdoc.body.scrollHeight + 20
  })
</script>
