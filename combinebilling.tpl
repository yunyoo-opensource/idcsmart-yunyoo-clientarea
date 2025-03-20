<style>
  .table-responsive{
    overflow: visible;
  }
  .table td{
    white-space: unset;
  }
</style>
<div class="card">
	<div class="card-body">
  <form action="combinebilling" method="post">
		<div class="table-container">
      
			<div class="table-responsive">
        <table class="table mb-0">
            <thead>
                <tr>
                    <th>{$Lang.describe}</th>
                    <th>{$Lang.amount_money}</th>
                </tr>
            </thead>
            <tbody>
                {foreach $Combine_billing as $index => $list}
                  <tr class="table-secondary">
                      <td>
                        <input type="hidden" name="ids[{$index}]" value="{$list.id}"/>
                        {$Lang.bill}#{$list.id}
                      </td>
                      <td>￥{$list.total}</td>
                  </tr>
                  {foreach $list.items as $item}
                  <tr>
                      <td>{$item.description}</td>
                      <td>￥{$item.amount}</td>
                  </tr>
                  {/foreach}
                {/foreach}
                
            </tbody>
        </table>

      </div>

      <!-- 表单底部调用开始 -->
			<div class="table-footer">
        <div class="table-tools">
          <button class="btn btn-primary mr-1" type="submit">{$Lang.pay_immediately}</button>
          <button class="btn btn-outline-light " type="button" id="rebackd" onClick="rebackd">{$Lang.return}</button>
        </div>
      </div>
				
		</div>
   </form>
	</div>
</div>

<script>

$('#rebackd').click(function(){
  window.history.go(-1);
})

</script>



