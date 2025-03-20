<script src="/themes/clientarea/yunyoo/assets/libs/echarts/echarts.min.js?v={$Ver}"></script>
{include file="includes/tablestyle"}
<style>
  .height_edu{
      height: 120px;
      border-radius: 6px;
  }
  .fontws{
    font-weight: bold;
  }
  .befoestl{position: relative;}
  .befoestl::before{
    content: "";
    position: absolute;
    width: 8px;
    height: 54px;
    background-color: rgba(255,255,255,.1);
    left: 16px;
    -webkit-transform: rotate(32deg);
    transform: rotate(32deg);
    top: -5px;
    -webkit-transition: all .4s;
    transition: all .4s;
  }
  .fontws div i{
    display: block;
    width: 5px;
    height: 5px;
    margin-top: 6px;
    border-radius: 50%;
    margin-right: 15px;
  }
  
@media screen and (max-width:  1700px) {
  .xianys{
      height: auto;
  }
}
@media screen and (max-width:  992px) {
    .marg_il{
      margin-bottom: 10px;
    }
}

.prepayment{
  display: inline-block;
  min-width: 59px;
  height: 20px;
  line-height: 16px;
  border: 1px solid #6064FF;
  border-radius: 100px;
  font-size: 12px;
  font-weight: 400;
  color: #6064FF;
  text-align: center;
  cursor: pointer;
  margin-left: 5px;
}

</style>
<script>
  $(function () {
    var percentNum = `{$Credit.credit_limit_used_percent}`
    var myChart = echarts.init(document.getElementById("MyCharts"));
    var placeHolderStyle = {
    normal: {
        label: {
            show: false
        },
        labelLine: {
            show: false
        },
        color: "rgba(0,0,0,0)",
        borderWidth: 0
    },
    emphasis: {
        color: "rgba(0,0,0,0)",
        borderWidth: 0
    }
};


var dataStyle = {
    normal: {
        formatter: '已用'+'{c}%',
        position: 'center',
        show: true,
        textStyle: {
            fontSize: '12',
            fontWeight: 'normal',
            color: '#34374E'
        }
    }
};


option = {
    title: [{
        left: 'center',
        top: 'center',
        textAlign: 'center',
        textStyle: {
            fontWeight: 'normal',
            fontSize: '12',
            color: '#AAAFC8',
            textAlign: 'center',
        },
    }],

    //第一个图表
    series: [{
            type: 'pie',
            hoverAnimation: false, //鼠标经过的特效
            radius: ['85%', '100%'],
            center: ['48%', '50%'],
            startAngle: 225,
            labelLine: {
                normal: {
                    show: false
                }
            },
            label: {
                normal: {
                    position: 'center'
                }
            },
            data: [{
                    value: 100,
                    itemStyle: {
                        normal: {
                            color: '#E1E8EE'
                        }
                    },
                }, {
                    value: 35,
                    itemStyle: placeHolderStyle,
                },

            ]
        },
        //上层环形配置
        {
            
            type: 'pie',
            hoverAnimation: false, //鼠标经过的特效
            radius: ['85%', '100%'],
            center: ['48%', '50%'],
            startAngle: 225,
            labelLine: {
                normal: {
                    show: false
                }
            },
            label: {
                normal: {
                    position: 'center'
                }
            },
            data: [{
                    value: percentNum,
                    itemStyle: {
                        normal: {
                            color: '#556ee6'
                        }
                    },
                    label: dataStyle,
                }, {
                    value: 35,
                    itemStyle: placeHolderStyle,
                },

            ]
        },


    ]
};
    myChart.setOption(option, true);

  })

</script>
<div class="card">  
	<div class="card-body">
    <div class="row">
      <div class="col-lg-4 col-md-12">
         <div class="clearfix height_edu shadow p-3 mb-5 bg-white rounded xianys">
            <div class="float-left">
              <div style="width: 200px;height: 100px;" id="MyCharts"></div>
            </div>
            <div class="float-left fontws">
                <div class="clearfix mt-2"><i class="float-left bg-light"></i> 剩余可用额度：<span>{$Credit.prefix}{$Credit.credit_limit_balance}{$Credit.suffix}</span></div>
                <div class="clearfix mt-2"><i class="float-left bg-primary"></i>已&nbsp;&nbsp;用&nbsp;&nbsp;额&nbsp;&nbsp;&nbsp;度：<span>{$Credit.prefix}{$Credit.credit_limit_used}{$Credit.suffix}</span></div>
                <div class="clearfix mt-2"><i class="float-left bg-light"></i>总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度：<span>{$Credit.prefix}{$Credit.credit_limit}{$Credit.suffix}</span></div>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 marg_il"> 
        <div class="d-flex justify-content-between bg-light height_edu">
          <div class="px-3 py-3" style="width: 100%;">
            <div class="float-left pt-2">
              <div class="fontws">{$Lang.bill_this_month}</div>
              <div class="mt-2">
                {if $Credit.this_month_bill.status == 'Paid'}
                -
                {else}
                <span class="fontws font-size-14">
                {$Credit.prefix}{:isset($Credit.this_month_bill.subtotal) ? $Credit.this_month_bill.subtotal : '0.00'}{$Credit.suffix}
                </span>
                <span class="badge badge-warning">{$Lang.to_repaid}</span>
                {/if}
              </div>
           <!--   <div class="fontws mt-2 text-primary">{$Credit.username}</div>-->
            </div>
            <div class="float-right pt-3">
                <div class="avatar-sm rounded-circle bg-primary align-self-center befoestl">
                  <span class="avatar-title rounded-circle bg-primary"><i class="bx bx-file font-size-24"></i></span>
                </div>
            </div>

          </div>
          <div></div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 marg_il">
        <div class="d-flex justify-content-between bg-light height_edu">
          <div class="px-3 py-3" style="width: 100%;">
            <div class="float-left pt-2">
              <div class="fontws">
                {$Lang.amount_settled}
                <a  href="javascript: prepayment();">
                  <span class="prepayment">{$Lang.prepayment}</span>
                </a>
              </div>
              <div class="fontws mt-2 font-size-14">{$Credit.prefix}
                {$Credit.amount_to_be_settled}{$Credit.suffix}</div>
              <div class="mt-2">{$Lang.next_month}：{$Credit.bill_generation_date}日</div>
            </div>
            <div class="float-right pt-3">
              <div class="avatar-sm rounded-circle bg-primary align-self-center befoestl">
                <span class="avatar-title rounded-circle bg-primary"><i class="bx bx-yen font-size-24"></i></span>
              </div>
            </div>

          </div>
          <div></div>
        </div>
      </div>
    </div>

    <h4 class="mt-1">{$Lang.credit_bill}</h4>
		<div class="table-container">
			<div class="table-header">
				<div class="table-filter">

				</div>
				<div class="table-search d-flex justify-content-end">
					
				</div>
			</div>
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
								<span>{$Lang.credit_id}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="type">
								<span>{$Lang.amount_money}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="subtotal">
								<span>{$Lang.generation_date}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th class="pointer" prop="paid_time">
								<span>{$Lang.expected_date_bill}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>
							<th>
								<span>{$Lang.payment_method}</span>
							</th>
							<th class="pointer" prop="status">
								<span>{$Lang.state}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i> 
								</span>
							</th>
							<th width="180px">{$Lang.operating}</th>
						</tr>
					</thead>
					<tbody>
						{if $Invoices}
						{foreach $Invoices as $index => $item}
						<tr>
							<td><a href="creditdetail?id={$item.id}"><span class="badge badge-light">#{$item.id}</span></a></td>
							<td>{$item.subtotal}</td>
							<td>{$item.create_time|date="Y-m-d"}</td>
							<td>{$item.due_time|date="Y-m-d"}</td>
							<td>{$item.payment}</td>
              {if $item.status == 'Paid'}	<td>{$Lang['paid']}</td>{/if}
              {if $item.status == 'Unpaid'}	<td>{$Lang['unpaid']}</td>{/if}
              {if $item.status == 'Draft'}	<td>{$Lang['completed']}</td>{/if}
              {if $item.status == 'Overdue'}	<td>{$Lang['overdue']}</td>{/if}
              {if $item.status == 'Cancelled'}	<td>{$Lang['paid']}cancelled</td>{/if}
              {if $item.status == 'Refunded'}	<td>{$Lang['refunded']}</td>{/if}
              {if $item.status == 'Collections'}	<td>{$Lang['collected']}</td>{/if}
							<td>
								{if $item.status == 'Unpaid'}
								<a href="javascript: payamount({$item.id});" class="text-primary mr-2"><i class="fas fa-check-circle"></i> {$Lang.payment}</a>
								{/if}
								<a href="creditdetail?id={$item.id}" class="text-success mr-2"><i class="fas fa-eye"></i> {$Lang.detailed}</a>
							</td>
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
        <div class="table-tools " >
          <!-- <button class="btn btn-primary mr-1 " id="readBtn" type="submit">{$Lang.consolidated_payment}</button>
          <span id="pay-combine">{$Lang.you_have}{$Count}{$Lang.paid_total}{$Total_money}{$Lang.element}<span> -->
        </div>
        <div class="table-pagination">
          <div class="table-pageinfo mr-2">
            <span>{$Lang.common} {$Total} {$Lang.strips}</span>
            <span class="mx-2">
              {$Lang.each_page}
              <select name="" id="limitSel">
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
		</div>
    
	</div>
</div>
<script>
	var _url = '';
</script> 
{include file="includes/paymodal"}
<script src="/themes/clientarea/yunyoo/assets/js/billing.js?v={$Ver}"></script>