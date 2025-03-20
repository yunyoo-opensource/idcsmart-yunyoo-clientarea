<div class="modal fade" id="modalOrderFlow" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title mt-0" id="myLargeModalLabel">订购流量包</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table class="table table-centered mb-0 table-nowrap">
                        <thead class="thead-light">
                        <tr>
                            <th scope="col">流量包名称</th>
                            <th scope="col">流量</th>
                            <th scope="col">支付金额</th>
                            <th scope="col" width="100px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            {foreach $Flowpacket as $item}
                        <tr>
                            <td>{$item.name}</td>
                            <td>{$item.capacity}GB</td>
                            <td>{$item.price}</td>
                            <td>
                                {if $item.leave}
                                <a class="text-primary buy_flowpacket" href="javascript:void(0)" data-id="{$item.id}">订购</a>
                                {/if}
                            </td>
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
                            <span>共 {$Total} 条</span>
                        </div>
                        <ul class="pagination pagination-sm">
                            {$Pages}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#modalOrderFlow .buy_flowpacket').on('click', function(){
        let _this = $(this)
        let fid = $(this).data('id')
        if(!$(this).data('submit')){
            $(this).data('submit', 1)
            $.ajax({
                url: "/dcim/buy_flow_packet",
                type: "POST",
                data: {
                    id: '{$Think.get.id}',
                    fid: fid,
                },
                success: function(res){
                    if(res.status == 200){
                        window.location.href = "/viewbilling?id="+ res.data.invoiceid;
                    }else if(res.status == 1001){
                        toastr.success(res.msg)
                    }else{
                        toastr.error(res.msg)
                    }
                    _this.removeData('submit')
                },
                error: function(){
                    _this.removeData('submit')
                }
            })
        }
    })
</script>


