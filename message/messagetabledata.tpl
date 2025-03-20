
<table class="table tablelist">
  <colgroup>
    <col>
    <col>
    <col>
  </colgroup>
  <thead class="thead-light">
    <tr>
      <th style="width: 20px;">
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="customCheckHead" name="headCheckbox">
          <label class="custom-control-label" for="customCheckHead">&nbsp;</label>
        </div>
      </th>
      <th>{$Lang.title_content}</th>
      <th>{$Lang.submission_time}</th>
      <th>{$Lang.type}</th>
    </tr>
  </thead>
  <tbody>
    {if $Message}
    {foreach $Message as $key=>$list}
    <tr>
      <td>
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input row-checkbox" id="customCheck{$list.id}">
          <label class="custom-control-label" for="customCheck{$list.id}">&nbsp;</label>
        </div>
      </td>
      <td onclick="openContent({$key},[{$list.id}])" style="cursor: pointer;" data-toggle="modal" data-target=".bs-example-modal-lg">
        {if $list.read_time == '0'}
        <span class="bg-danger d-inline-block rounded-circle mr-1"
          style="width: 6px;height: 6px;margin-bottom: 2px;"></span>
        {/if}
        {$list.title}
      </td>
      <td>{if $list.create_time}{$list.create_time|date="Y-m-d H:i"}{else}-{/if}</td>
      <td>{$Lang[$list.type_text]}</td>
    </tr>
    {/foreach}
    {else}
    <tr>
      <td colspan="8">
        <div class="no-data">{$Lang.nothing}</div>
      </td>
    </tr>
    {/if}
  </tbody>
</table>


<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-0" id="myExtraLargeModalLabel">{$Lang.news_details}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="msgContent">

        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog modal-dialog-centered -->
</div>

<script>
  // 打开详情
var message={:json_encode($Message)};
function openContent(key,ids) {
  $('#msgContent').html(message[key].content);
  if (message[key].attachment?.length) {
    const str = `
      <hr />
      <p class="mb-2">{$Lang.enclosure}:</p>
    `
    $("#msgContent").append(str);
  }
	$.each(message[key].attachment,function(k,v){
    down=`
    <div class="mb-1">
      <a href="${v.path}" target="_blank">${v.name}</a>
    </div>
    `;
		$("#msgContent").append(down);
  });
  
  $.get('' + '/read_messgage', {ids},
    function (data, textStatus, jqXHR) {},
    "dataType"
  );
}

</script>