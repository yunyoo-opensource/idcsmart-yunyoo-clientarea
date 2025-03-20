
<div class="table-responsive">
  <table class="table mb-0 mt-3">
    <thead class="thead-light">
      <tr>
        <th>{$Lang.operation_time}</th>
        <th>{$Lang.operation_details}</th>
        <th>{$Lang.operator}</th>
        <th>{$Lang.ip_address}</th>
      </tr>
    </thead>
    <tbody>
      {foreach $RecordLog as $item}
      <tr>
        <td>{$item.create_time|date="Y-m-d H:i:s"}</td>
        <td>{$item.description}</td>
        <td>{$item.user}</td>
        <td>{$item.ipaddr}</td>
      </tr>
      {/foreach}
    </tbody>
  </table>
</div>
<div class="table-footer">
  <div class="table-tools">

  </div>
  <div class="table-pagination generallog">
    <div class="table-pageinfo mr-2">
      <span>{$Lang.common} {$Total} {$Lang.strips}</span>
      <span class="mx-2">
        {$Lang.each_page}
        <select name="" id="limitSel" class="log-limit" onchange="getGeneralLog('{$Think.get.id}', '{$Think.get.page}')">
          <option value="10" {if $Limit==10}selected{/if}>10 </option>
          <option value="15" {if $Limit==15}selected{/if}>15 </option>
          <option value="20" {if $Limit==20}selected{/if}>20 </option>
          <option value="50" {if $Limit==50}selected{/if}>50 </option>
          <option value="100" {if $Limit==100}selected{/if}>100
          </option>
        </select> {$Lang.strips} </span>
    </div>
    <ul class="pagination pagination-sm">
      {$Pages}
    </ul>
  </div>
</div>

<script>

  $(document).on('click', ".generallog a[class='page-link']", function () {
    var _this = $(this)
    $.ajax({
      url: _this.prop('href'),
      type: 'GET',
      success: function (res) {
        $('#settings1').html(res)
      }
    })

    return false;
  });
</script>