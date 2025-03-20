

<style>
  .pb-md-36, .py-md-36 {
    padding-bottom: 9rem!important;
  }
  .pt-md-36, .py-md-36 {
    padding-top: 9rem!important;
  }
  .pb-md-30, .py-md-30 {
    padding-bottom: 7.5rem!important;
  }
  .pt-md-30, .py-md-30 {
    padding-top: 7.5rem!important;
  }
  .text-dark-50 {
    color: #7e8299!important;
  }
  .mb-10, .my-10 {
    margin-bottom: 2.5rem!important;
  }
  .border-right-md {
    border-right: 1px solid #ebedf3!important;
  }

  .pl-md-5, .px-md-5 {
    padding-left: 1.25rem!important;
  }

  .pb-9, .py-9 {
      padding-bottom: 2.25rem!important;
  }
  .pt-1, .py-1 {
      padding-top: .25rem!important;
  }
  .table.noborr thead th{
    border: none;
  }
  li{list-style: none;}
  .order_title{
    margin: 0;
    padding: 0 0 0 20px;
  }
  .order_title li{
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 10px;
    justify-content: space-between;
  }
  .order_title li p{
    color: #495057;
    font-size: 0.8225rem;
  }
  .title_h4:nth-child(1){
    margin-top: 0px;
  }
  .title_h4{
    font-weight: bold;
    margin-top: 15px;
  }
  .title_h4 span{
    float: right;
  }
</style>
<div class="row">
  <div class="card card-custom position-relative overflow-hidden col-md-9" id="pdfCentent">
      <!--begin::Shape-->
      <div class="position-absolute opacity-30" style="left:0;z-index:1">
        <span class="svg-icon svg-icon-10x svg-logo-white">
          <!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/shapes/abstract-8.svg-->
          <svg xmlns="http://www.w3.org/2000/svg" width="176" height="165" viewBox="0 0 176 165" fill="none">
            <g clip-path="url(#clip0)">
              <path d="M-10.001 135.168C-10.001 151.643 3.87924 165.001 20.9985 165.001C38.1196 165.001 51.998 151.643 51.998 135.168C51.998 118.691 38.1196 105.335 20.9985 105.335C3.87924 105.335 -10.001 118.691 -10.001 135.168Z" fill="#AD84FF"></path>
              <path d="M28.749 64.3117C28.749 78.7296 40.8927 90.4163 55.8745 90.4163C70.8563 90.4163 83 78.7296 83 64.3117C83 49.8954 70.8563 38.207 55.8745 38.207C40.8927 38.207 28.749 49.8954 28.749 64.3117Z" fill="#AD84FF"></path>
              <path d="M82.9996 120.249C82.9996 144.964 103.819 165 129.501 165C155.181 165 176 144.964 176 120.249C176 95.5342 155.181 75.5 129.501 75.5C103.819 75.5 82.9996 95.5342 82.9996 120.249Z" fill="#AD84FF"></path>
              <path d="M98.4976 23.2928C98.4976 43.8887 115.848 60.5856 137.249 60.5856C158.65 60.5856 176 43.8887 176 23.2928C176 2.69692 158.65 -14 137.249 -14C115.848 -14 98.4976 2.69692 98.4976 23.2928Z" fill="#AD84FF"></path>
              <path d="M-10.0011 8.37466C-10.0011 20.7322 0.409554 30.7493 13.2503 30.7493C26.0911 30.7493 36.5 20.7322 36.5 8.37466C36.5 -3.98287 26.0911 -14 13.2503 -14C0.409554 -14 -10.0011 -3.98287 -10.0011 8.37466Z" fill="#AD84FF"></path>
              <path d="M-2.24881 82.9565C-2.24881 87.0757 1.22081 90.4147 5.50108 90.4147C9.78135 90.4147 13.251 87.0757 13.251 82.9565C13.251 78.839 9.78135 75.5 5.50108 75.5C1.22081 75.5 -2.24881 78.839 -2.24881 82.9565Z" fill="#AD84FF"></path>
              <path d="M55.8744 12.1044C55.8744 18.2841 61.0788 23.2926 67.5001 23.2926C73.9196 23.2926 79.124 18.2841 79.124 12.1044C79.124 5.92653 73.9196 0.917969 67.5001 0.917969C61.0788 0.917969 55.8744 5.92653 55.8744 12.1044Z" fill="#AD84FF"></path>
            </g>
          </svg>
          <!--end::Svg Icon-->
        </span>
      </div>
      <!--end::Shape-->
      <!--begin::Invoice header-->
      <div class="row justify-content-center py-8 px-8 py-md-36 px-md-0 bg-primary" style="position: relative;">
        <div class="col-md-9">
          <div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row" >
            <div class="d-flex flex-column px-0 order-2 order-md-1" style="z-index:2">
              <span class="font-size-20 font-weight-bold text-white mb-3">{$ViewBilling.detail.username}</span>

              <span class="d-flex flex-column font-size-16 font-weight-bold text-white">
                <span>{$ViewBilling.detail.companyname}</span>
                <span>{$UserInfo.user.address1}</span>
              </span>
            </div>
            <h3 class="display-4 font-weight-bold text-white order-1 order-md-2">
            {if $Pay.PayStatus=='Paid'}
            {$Lang.paid}
            {else}
            {$Lang.unpaid}
            {/if}
            </h3>
          </div>
        </div>

        <i class="bx bx-cloud-download text-white fs-24 pdfdownload pointer" style="position: absolute;right: 20px;bottom: 20px;"></i>
      </div>
      
      <!-- 下载pdf -->
      <!-- <div class="text-right pt-4" style="min-height: 43px;">
        <span class="pdfdownload pointer">
          <i class="bx bx-cloud-download"></i>
          下载
        </span>
      </div> -->
      
      <!--end::Invoice header-->
      <div class="row justify-content-center py-8 px-8 py-md-30 px-md-0">
        <div class="col-md-9">
          <!--begin::Invoice body-->
          <div class="row pb-26">
            <div class="col-md-12 py-10 pl-md-10">
              <div class="table-responsive" style="padding: 0 20px;">
                {if $CreditDetail.invoices}
                {foreach $CreditDetail.invoices  as $item}
                <h5 class="title_h4">账单#{$item.id} <span>{$item.subtotal}</span></h5>
                  <ul class="order_title">
                    {foreach $item.invoice_items  as $list}
                    <li>
                      <p style="width:70%">{$list.description}</p><p style="text-align: right;width:30%">{$CreditDetail.currency.prefix}{$list.amount}{$CreditDetail.currency.suffix}</p>
                    </li>
                    {/foreach}
                  </ul>
                {/foreach}
                {/if}
              </div>
            </div>
          </div>
          <!--end::Invoice body-->
          

          {if $ViewBilling.accounts}
          <div class="table-responsive mt-3">
              <table class="table table-bordered mb-0">

                  <thead>
                      <tr>
                          <th>{$Lang.transaction_date}</th>
                          <th>{$Lang.payment_method}</th>
                          <th>{$Lang.transaction_serial_number}</th>
                          <th>{$Lang.amount_money}</th>
                      </tr>
                  </thead>
                  <tbody>
                    {foreach $ViewBilling.accounts as $accounts}
                      <tr class="table-light">
                          <td>{$accounts.pay_time|date="Y-m-d H:i:s"}</td>
                          <td>{$accounts.gateway}</td>
                          <td>{if $accounts.trans_id}{$accounts.trans_id}{else}-{/if}</td>
                          <td>{$accounts.amount_in}</td>
                      </tr>
                    {/foreach}
                    
                  </tbody>
              </table>
          </div>
          {/if}
        </div>
      </div>


      
      
    </div>




	<div class="col-sm-3">
		<div class="card">
			<div class="card-body">
      
       <div id="pay-content">
          {include file="includes/pay"}
        </div>
    </div>
		</div>	
	</div>
</div>

<script src="/themes/clientarea/yunyoo/assets/libs/html2canvas/html2canvas.min.js?v={$Ver}"></script>
<script src="/themes/clientarea/yunyoo/assets/libs/jspdf/jspdf.umd.min.js?v={$Ver}"></script>


<script>
  $(function() {
    $(document).on('click', '.pdfdownload', function () {
      $(this).hide()
      setTimeout(function(){
        $(this).show()
      }, 50);
      toastr.success('{$Lang.please_wait_while_building}...')
      html2canvas(document.getElementById('pdfCentent'), {
        logging: false
      }).then(function (canvas) {
        var pdf = new jsPDF('p', 'mm', 'a4') // A4纸，纵向
        var ctx = canvas.getContext('2d')
        var a4w = 190; var a4h = 257 // A4大小，210mm x 297mm，四边各保留20mm的边距，显示区域170x257
        var imgHeight = Math.floor(a4h * canvas.width / a4w) // 按A4显示比例换算一页图像的像素高度
        var renderedHeight = 0

        while (renderedHeight < canvas.height) {
          var page = document.createElement('canvas')
          page.width = canvas.width
          page.height = Math.min(imgHeight, canvas.height - renderedHeight)// 可能内容不足一页

          // 用getImageData剪裁指定区域，并画到前面创建的canvas对象中
          page.getContext('2d').putImageData(ctx.getImageData(0, renderedHeight, canvas.width, Math.min(imgHeight, canvas.height - renderedHeight)), 0, 0)
          pdf.addImage(page.toDataURL('image/jpeg', 1.0), 'JPEG', 10, 10, a4w, Math.min(a4h, a4w * page.height / page.width)) // 添加图像到页面，保留10mm边距

          renderedHeight += imgHeight
          if (renderedHeight < canvas.height) { pdf.addPage() }// 如果后面还有内容，添加一个空页
          // delete page;
        }
        pdf.save('{$Lang.bill}#{$Think.get.id}_' + new Date().getTime())
      })
    });
  })
</script>

