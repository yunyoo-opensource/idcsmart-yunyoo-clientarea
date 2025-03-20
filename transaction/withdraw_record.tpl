<table class="table tablelist">
  <colgroup>
    <col>
    <col>
    <col>
    <col>
    <col>
  </colgroup>
  <thead class="bg-light">
    <tr>
      <th class="pointer" prop="id">
        <span>ID</span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th class="pointer" prop="num">
        <span>{$Lang.amount_money}</span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
      <th>
        <span>{$Lang.describe}</span>
      </th>
      <th>
        <span>{$Lang.source}</span>
      </th>
      <th class="pointer" prop="create_time">
        <span>{$Lang.withdrawal_time}</span>
        <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
          <i class="bx bx-caret-up"></i>
          <i class="bx bx-caret-down"></i>
        </span>
      </th>
    </tr>
  </thead>
  <tbody>
    {if $Transaction}
    {foreach $Transaction as $list}
    <tr>
      <td>{$list.id}</td>
      <td>{$list.num}</td>
      <td>{$list.des}</td>
      <td>{$list.reason}</td>
      <td>{$list.create_time|date="Y-m-d H:i"}</td>
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