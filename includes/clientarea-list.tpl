<!-- start：资源列表 -->
<h4 class="card-title mt-0">{$Lang.resource_list}</h4>
<div class="h100p user-center_resources table-responsive">
  <table class="table tablelist mb-0 mt-3">
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="15%">
			<col width="10%">
		</colgroup>
    <thead class="bg-light">
      <tr>
        <th>{$Lang.machine_status}</th>
        <th>{$Lang.host_name}</th>
        <th class="pointer" prop="nextduedate">{$Lang.due_date}
          <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
            <i class="bx bx-caret-up"></i>
            <i class="bx bx-caret-down"></i>
          </span>
        </th>
        <th>{$Lang.cost}</th>
        <th>IP</th>
      </tr>
    </thead>
    <tbody>
      {if $ClientArea.hostlist}
      {foreach $ClientArea.hostlist as $list}
      <tr>
        <td scope="row">
          <span class="user-center_dot mr-1 bg-success"></span>
          {$list.domainstatus_desc}
        </td>
        <td>
          <a href="servicedetail?id={$list.id}" class="text-dark">{$list.productname}({$list.domain})</a>
        </td>
        <td>{if $list.billingcycle!="free" && $list.cycle_desc!='一次性'}{$list.nextduedate|date="Y-m-d H:i"}{else} - {/if}</td>
        <td>{if $list.billingcycle!="free"}{$list.price_desc}/{$list.cycle_desc}{else}{$list.cycle_desc}{/if}</td>
        <td>{$list.dedicatedip}</td>
      </tr>
      {/foreach}
      {else}
      <tr>
        <td colspan="8">
          <div class="no-data">{$Lang.nothing_content}</div>
        </td>
      </tr>
      {/if}
    </tbody>
  </table>
</div>
<!-- 表单底部调用开始 -->
<div class="table-footer">
  <div class="table-tools">

  </div>
  <div class="table-pagination">
    <div class="table-pageinfo mr-2">
      <span>{$Lang.common} {$ClientArea.Total} {$Lang.strips}</span>
      <span class="mx-2">
        {$Lang.each_page}
        <select name="" id="sourcelimitSel">
          <option value="5" {if $ClientArea.Limit==5}selected{/if}>5 </option>
          <option value="10" {if $ClientArea.Limit==10}selected{/if}>10 </option>
          <option value="15" {if $ClientArea.Limit==15}selected{/if}>15 </option>
          <option value="20" {if $ClientArea.Limit==20}selected{/if}>20 </option>
          <option value="50" {if $ClientArea.Limit==50}selected{/if}>50 </option>
          <option value="100" {if $ClientArea.Limit==100}selected{/if}>100
          </option>
        </select> {$Lang.strips}</span>
    </div>
    <ul class="pagination pagination-sm">
      {$ClientArea.Pages}
    </ul>
  </div>
</div>
<script>
  $(function () {
    // 排序
    $('.bg-light th').on('click', function () {
      if (!$(this).attr('prop')) return false
      getSourceList('sort', $(this).attr('prop'))
       
    })
    //改变排序样式
    changeStyle()
    function changeStyle() {
        $('.bg-light th.pointer span').children().css('color','rgba(0, 0, 0, 0.1)')
        let index
        let sort = localStorage.getItem('sort')
        if( sort=== 'desc') {
          index = 1
        } else if(sort=== 'asc'){
          index = 0
        }
        $('.bg-light th.pointer span').children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
    }
  

    // 每页数量选择改变
    $('#sourcelimitSel').on('change', function () {
      getSourceList('limit')
    })

    // 分页
    $('.page-link').on('click', function (e) {
      e.preventDefault()
      $.get('' + $(this).attr('href'), function (data) {
        $('#sourceListBox').html(data)
      })
    })
  })

  function getSourceList(searchType, orderby) {
    // 搜索条件
    var searchObj = {
      action: 'list'
    }

    if (searchType == 'sort') {
      searchObj.sort = (localStorage.getItem('sort') == 'asc') ? 'desc' : 'asc'
      localStorage.setItem('sort', searchObj.sort)
      searchObj.orderby = orderby
       }
    if (searchType == 'limit') {
      searchObj.limit = $('#sourcelimitSel').val()
      searchObj.page = 1
    }
    $.ajax({
      type: "get",
      url: '' + '/clientarea',
      data: searchObj,
      success: function (data) {
        $('#sourceListBox').html(data)
      }
    });
  }
</script>
