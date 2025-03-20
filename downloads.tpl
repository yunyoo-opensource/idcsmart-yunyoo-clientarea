{if $Downloads.location_url}
<script>
	window.open("{$Downloads.location_url}");
</script>
{/if}

<div class="d-flex">
  <div class="card filemanager-sidebar mr-md-2">
    <div class="card-body">

      <div class="d-flex flex-column h-100">
        <div class="mb-4">
          <ul class="list-unstyled categories-list">
            {foreach $Downloads.downloads.cate_data as $cate_data}
            <li>
              <a href="./downloads?cate_id={$cate_data.id}" class="text-body d-flex align-items-center">
                <i class="mdi mdi-folder font-size-16 text-warning mr-2"></i>
                {$cate_data.name}
                <span class="badge badge-success badge-pill ml-2">{$cate_data.file_count}</span>
              </a>
            </li>
            {/foreach}


          </ul>
        </div>
      </div>

    </div>
  </div>
  <!-- filemanager-leftsidebar -->

  <div class="w-100">
    <div class="card">
      <div class="card-body">

        {if $ErrorMsg}
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
          <i class="mdi mdi-block-helper mr-2"></i>
          {$ErrorMsg}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        {/if}

        <div class="mt-4">
          <div class="d-flex flex-wrap">
            <h5 class="font-size-14 mr-3">{$Lang['downloads_directory']}</h5>

          </div>
          <hr class="mt-2">

          <div class="table-responsive">
            <table class="table table-centered table-nowrap table-hover mb-0">
              <thead>
                <tr>
                  <th scope="col">{$Lang['file_name']}</th>
                  <th scope="col">{$Lang['upload_time']}</th>
                  <th scope="col" colspan="2">{$Lang['amount_downloads']}</th>
                </tr>
              </thead>
              <tbody>

                {foreach $Downloads.downloads.downloads as $downloads}
                <tr>
                  <td>
                    <a href="{$downloads.down_link}" class="text-dark font-weight-medium">
                      <i
                        class="{if $downloads.type == '1'}mdi mdi-folder-zip text-warning{elseif $downloads.type == '2'}mdi mdi-image text-success{elseif $downloads.type == '3'}mdi mdi-text-box text-muted{/if} font-size-16 mr-2"></i>
                      {$downloads.title}</a>
                  </td>
                  <td>{$downloads.update_time|date='Y-m-d H:i'}</td>
                  <td>{$downloads.downloads}</td>
                  <td>
                    <div class="dropdown">
                      <a href="{$downloads.down_link}" class="font-size-16 text-primary">
                        <i class="bx bx-cloud-download"></i>
                      </a>
                    </div>
                  </td>
                </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- end card -->
  </div>

</div>