{if $ErrorMsg}
    {include file="error/alert" value="$ErrorMsg"}
{/if}
<div class="card">
  <div class="card-body">
  <form action="mulitrenew?action=batchrenew" method="post" onsubmit="checkSubmit()">
      <div class="table-responsive">
        
          <table class="table table-centered mb-0 table-nowrap">
              <thead class="thead-light">
                  <tr>
                      <th>{$Lang.product}</th>
                      <th>IP</th>
                      <th>{$Lang.current_due_time}</th>
                      <th>{$Lang.expiration_renewal}</th>
                      <th>{$Lang.renewal_period}</th>
                  </tr>
              </thead>
              <tbody>
                  {foreach $MultiRenew.hosts as $index=>$item}
                  <tr  >
                      <td>{$item.name}</td>
                      <td>{$item.dedicatedip}</td>
                      <td >{$item.nextduedate|date='Y-m-d H:i'}</td>
                      <td class="nextduedate_renew">{$item.nextduedate_renew|date='Y-m-d H:i'}</td>
                      <td>
                        <input type="hidden" class="hostid" name="host_ids[{$index}]" value="{$item.id}"/>
                        <select class="form-control cycles"  name="cycles[{$item.id}]" onchange="changeCycle()">
                         {foreach $item.allow_billingcycle as $bill}
                          <option value="{$bill.billingcycle}" {if $item.billingcycle==$bill.billingcycle} selected{/if}>￥{$bill.amount}/{$bill.billingcycle_zh}</option>
                          {/foreach}
                        </select>
                      </td>
                      <!--<td class="saleproducts">￥{$item.saleproducts}</td>!-->
                  </tr>
                  {/foreach}
 
                  
              </tbody>
          </table>
      </div>

      

      <div class="row mt-4">
          <div class="col-sm-6 ">
               <button class="btn btn-primary col-sm-4 mr-1 xfSubmit" type="submit">{$Lang.immediate_renewal}</button>
               <button class="btn btn-outline-light col-sm-4 goBack" type="button">{$Lang.return}</button>
          </div> <!-- end col -->
          <div class="col-sm-6">
              <div class="text-sm-right">{$Lang.total}: <span class="text-primary font-size-24 total">{$MultiRenew.currency.prefix}<span class="total">{$MultiRenew.total}</span>{$MultiRenew.currency.suffix}</span></div>
          </div> 
      </div> <!-- end row-->
  </form>
  </div>
</div>
<script src="/themes/clientarea/yunyoo/assets/libs/moment/moment.js?v={$Ver}"></script>
<script>

$(function(){
  if(location.href.indexOf("host_ids")==-1){
    $(".xfSubmit,.goBack").attr("disabled","disabled")
    history.go(-1);
  }
  $(".goBack").click(function(){
    $(this).attr("disabled","disabled").css('color','#999');
    $(".xfSubmit").attr("disabled","disabled");
    history.back();
  })
})
 
  function checkSubmit() {
    $(".xfSubmit").attr("disabled","disabled");
    $(".goBack").attr("disabled","disabled").css('color','#999');
  }
 function changeCycle(){
    var formdata = $('form').serialize()

   
   $.ajax({
     type: "POST",
     url:"/host/batchrenewpage",
     data: formdata,
     success(data){
       if(data.status!=200){
         return
       }else{
         data.data.hosts.forEach((item,index)=>{
           $('.nextduedate_renew').eq(index).text(moment(item.nextduedate_renew*1000).format('YYYY-MM-DD HH:mm'))
           $('.saleproducts').eq(index).text('￥'+item.saleproducts)
         })
         $('.total').text(data.data.total)
       }
     }
   })
 }


</script>

