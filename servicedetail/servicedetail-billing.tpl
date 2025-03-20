<div class="table-responsive">
  <table class="table mb-0 mt-3">
    <thead class="thead-light">
      <tr>
        <th>{$Lang.payment_time}</th>
        <th>{$Lang.source}</th>
        <th>{$Lang.payment_amount}</th>
        <th>{$Lang.serial_number}</th>
        <th>{$Lang.payment_method}</th>
      </tr>
    </thead>
    <tbody>
      {foreach $HostRecharge as $item}
      <tr>
        <td>{$item.pay_time|date="Y-m-d H:i:s"}</td>
        <td>{$item.type}</td>
        <td>{$Currency.prefix}{$item.amount_in}{$Currency.suffix}</td>
        <td>{$item.trans_id}</td>
        <td>{$item.gateway}</td>
      </tr>
      {/foreach}
    </tbody>
  </table>
</div>
<div class="table-footer">
  <div class="table-tools">

  </div>
  <div class="table-pagination">
    <div class="table-pageinfo mr-2">
      <span>{$Lang.common} {$Total} {$Lang.strips}</span>
      <span class="mx-2">
        {$Lang.each_page}
        <select name="" id="limitSel" class="billing-limit" onchange="getGeneralBilling('{$Think.get.id}', '{$Think.get.page}')">
          <option value="10" {if $Limit==10}selected{/if}>10</option>
          <option value="15" {if $Limit==15}selected{/if}>15</option>
          <option value="20" {if $Limit==20}selected{/if}>20</option>
          <option value="50" {if $Limit==50}selected{/if}>50</option>
          <option value="100" {if $Limit==100}selected{/if}>100</option>
        </select>
        {$Lang.strips}
      </span>
    </div>
    <ul class="pagination pagination-sm">
      {$Pages}
    </ul>
  </div>
</div>