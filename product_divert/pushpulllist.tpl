{include file="includes/tablestyle"}

{include file="includes/deleteConfirm"}
<style>
    body{margin:0;} .table-responsive {
        min-height: 385px;
    }

    .table-container .table td, .table-container .table thead th{padding: .75rem;} .table td, .table thead th, .box_nowrap {
        white-space: nowrap;
    }

    .table tr {
        border-bottom: 1px solid #333;
    }

    .table {
        width: 100%;
        margin-bottom: 1rem;
        color: #495057;
    }

    .bg-light {
        background-color: #eff2f7 !important;
    }

    .table thead th {
        vertical-align: bottom;
        border-bottom: 2px solid #eff2f7;
    }

    button {
        display: inline-block;
        line-height: 1;
        white-space: nowrap;
        cursor: pointer;
        background: #fff;
        border: 1px solid #dcdfe6;
        color: #606266;
        -webkit-appearance: none;
        text-align: center;
        box-sizing: border-box;
        outline: none;
        margin: 0;
        transition: .1s;
        font-weight: 500;
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
        padding: 5px 10px;
        font-size: 12px;
        border-radius: 3px;
    }

    .table-pageinfo {
        text-align: right;
        padding-right: 60px;
    }
</style>
<div>转出列表</div>
<div class="table-container">
    <div class="table-responsive">
        <table class="table tablelist">
            <colgroup>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
            </colgroup>
            <thead class="bg-light">
            <tr>

                <th class="pointer" prop="id">
                    <span>商品</span>
                    <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                            <i class="bx bx-caret-up"></i>
                            <i class="bx bx-caret-down"></i>
                          </span>
                </th>
                <th class="pointer" prop="type">
                    <span>交易方</span>
                    <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                            <i class="bx bx-caret-up"></i>
                            <i class="bx bx-caret-down"></i>
                          </span>
                </th>
                <th class="pointer" prop="subtotal">
                    <span>费用</span>
                    <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                            <i class="bx bx-caret-up"></i>
                            <i class="bx bx-caret-down"></i>
                          </span>
                </th>
                <th class="pointer" prop="paid_time">
                    <span>类型</span>
                    <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                            <i class="bx bx-caret-up"></i>
                            <i class="bx bx-caret-down"></i>
                          </span>
                </th>
                <th class="pointer" prop="due_time">
                    <span>状态</span>
                    <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
                            <i class="bx bx-caret-up"></i>
                            <i class="bx bx-caret-down"></i>
                          </span>
                </th>
                <th width="180px">操作</th>
            </tr>
            </thead>
            <tbody>
            {if !empty($product_divert)}
                {foreach $product_divert as $pro}
                    <tr>
                        <td>{$pro.product_name} {$pro.product_domain} {$pro.product_ip}</td>
                        <td>{if $pro.push_userid == $user_now}
                                {$pro.pull_username}
                            {else}
                                {$pro.push_username}
                            {/if}
                        </td>
                        <td>{if $pro.push_userid == $user_now}
                                ￥{$pro.push_cost}元
                            {else}
                                ￥{$pro.pull_cost}元
                            {/if}
                        </td>
                        <td>{if $pro.push_userid == $user_now}
                                转出
                            {else}
                                转入
                            {/if}
                        </td>
                        <td>{$pro.status}</td>
                        {if $pro.push_userid == $user_now}
                        <td>
                            {if $pro.push_pay_status == 'Unpaid'}
                                <a href="javascript: payamount({$pro.push_invoice_id});" class="text-primary mr-2"><i class="fas fa-check-circle"></i> {$Lang.payment}</a>
                                <a href="/product_divert/pushrefuse?id={$pro.id}" class="text-primary mr-2"><i class="fas fa-check-circle"></i> 取消</a>
                            {elseif $pro.push_invoice_id > 0}
                                <a href="/viewbilling?id={$pro.push_invoice_id}" class="text-success mr-2"><i class="fas fa-eye"></i> {$Lang.see}</a>
                            {/if}
                        </td>
                        {else}
                            <td>
                                {if empty($pro.pull_invoice_id) && $pro.push_pay_status == 'Paid' && $pro.status == '待接收'}
                                    <a href="/product_divert/pullserver?id={$pro.id}" class="text-success mr-2"><i class="fas fa-eye"></i> 操作</a>
                                {elseif $pro.pull_pay_status == 'Unpaid'}
                                    <a href="javascript: payamount({$pro.pull_invoice_id});" class="text-primary mr-2"><i class="fas fa-check-circle"></i> {$Lang.payment}</a>
                                    <a href="/product_divert/pullrefuse?id={$pro.id}" class="text-primary mr-2"><i class="fas fa-check-circle"></i> 拒绝</a>
                                {elseif $pro.pull_invoice_id > 0}
                                    <a href="/viewbilling?id={$pro.pull_invoice_id}" class="text-success mr-2"><i class="fas fa-eye"></i> {$Lang.see}</a>
                                    {if $pro.pull_pay_status == 'Paid' && $pro.status == '待接收'}
                                        <a href="/product_divert/verificationResult?id={$pro.id}" class="text-success mr-2"><i class="fas fa-eye"></i> 手动验证</a>
                                    {/if}
                                {/if}
                            </td>
                        {/if}
                    </tr>
                {/foreach}
            {else}
                <tr>
                    <td colspan="8">
                        <div class="no-data">没有任何内容</div>
                    </td>
                </tr>
            {/if}
            </tbody>
        </table>
    </div>
    <!-- 表单底部调用开始 -->
    <div class="table-footer">
        <div class="table-tools ">
            <!-- <button class="btn btn-primary mr-1 " id="readBtn" type="submit">{$Lang.consolidated_payment}</button>
                    <span id="pay-combine">{$Lang.you_have}{$Count}{$Lang.paid_total}{$Total_money}{$Lang.element}<span> -->
        </div>
        <div class="table-pagination">
            <div class="table-pageinfo mr-2">
                <span>共 0 条</span>
                <span class="mx-2">
                        每页
                        <select name="" id="limitSel">
                          <option value="10" {if $Limit==10}selected{/if}>10</option>
                          <option value="15" {if $Limit==15}selected{/if}>15</option>
                          <option value="20" {if $Limit==20}selected{/if}>20</option>
                          <option value="50" {if $Limit==50}selected{/if}>50</option>
                          <option value="100" {if $Limit==100}selected{/if}>100</option>
                        </select>
                        条
                      </span>
            </div>
            <ul class="pagination pagination-sm">
                {$Pages}
            </ul>
        </div>
    </div>
</div>

{include file="includes/paymodal"}


<script>
    var _url = '';
    var status = '{$Think.get.status}'
    // 排序
    $('.bg-light .pointer').on('click', function () {
        var sort = '{$Think.get.sort}'
        location.href = '/billing?status={$Think.get.status}&sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&orderby=' + $(this).attr('prop') + '&page={$Think.get.page}&limit={$Think.get.limit}'
    })
    // 状态筛选
    $('#statusSel').on('change', function () {
        location.href = "/billing?status=" + $('#statusSel').val() + "&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page={$Think.get.page}&limit={$Think.get.limit}"
    });
    // 每页数量选择改变
    $('#limitSel').on('change', function () {
        location.href = '/billing?keywords={$Think.get.keywords}&sort={$Think.get.sort}&orderby={$Think.get.orderby}&page=1&limit=' + $('#limitSel').val()

    })
</script>
<script src="/themes/clientarea/yunyoo/assets/js/billing.js?v={$Ver}"></script>