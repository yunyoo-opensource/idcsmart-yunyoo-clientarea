<div class="table-responsive">
  <table class="table table-centered table-nowrap table-hover mb-0">
    <thead>
      <tr>
        <th scope="col">{$Lang.file_name}</th>
        <th scope="col">{$Lang.upload_time}</th>
        <th scope="col" colspan="2">{$Lang.amount_downloads}</th>
      </tr>
    </thead>
    <tbody>
      {foreach $Detail.download_data as $item}
      <tr>
        <td>
          <a href="{$item.down_link}" class="text-dark font-weight-medium">
            <i
              class="{if $item.type == '1'}mdi mdi-folder-zip text-warning{elseif $item.type == '2'}mdi mdi-image text-success{elseif $item.type == '3'}mdi mdi-text-box text-muted{/if} font-size-16 mr-2"></i>
            {$item.title}</a>
        </td>
        <td>{$item.create_time|date='Y-m-d H:i'}</td>
        <td>{$item.downloads}</td>
        <td>
          <div class="dropdown">
            <a href="{$item.down_link}" class="font-size-16 text-primary">
              <i class="bx bx-cloud-download"></i>
            </a>
          </div>
        </td>
      </tr>
      {/foreach}
    </tbody>
  </table>
</div>