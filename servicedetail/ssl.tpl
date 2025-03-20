
  <style>
    .seeInformationDiv {
      margin: 10px 0px;
    }

    .signContract-modal-dialog {
      max-width: 900px;
      margin: 1.75rem auto;
    }

    .contractfirstParty {
      display: flex;
      padding: 0px 70px;
    }

    .contractfirstPartyDiv div {
      height: 30px;
    }

    .contractfirstPartyDivTwo {
      margin-left: 100px;
    }

    .select_Div {
      display: flex;
      justify-content: flex-end;
    }



    .enclosure {
      padding: 0px 40px;
    }

    .cost {
      border-top: 1px solid #eff2f7;
      border-left: 1px solid #eff2f7;
      border-right: 1px solid #eff2f7;
      width: 100%;
      height: 40px;
      line-height: 40px;
    }

    #signature {
      width: 100%;
      display: flex;
      justify-content: center;
    }

    .signatureCanvas {
      border: 1px dashed #000 !important;
    }

    .display {
      display: none;
    }

    .afc-update-name {
      cursor: pointer;
      color: #1890ff;
    }



    #afcContent .control-label {
      margin-bottom: 0;
      text-align: right;
    }

    #recipientInfoContent .control-label {
      margin-bottom: 0;
      text-align: right;
    }

    .afc-modal-tip {
      color: #929292;
      margin-bottom: 10px;
    }

    @media screen and (max-width: 768px) {
      .contractfirstParty {
        display: block;
      }

      .contractfirstPartyDivTwo {
        margin-left: 0px;
      }

      .select_Div {
        display: block;
      }

      #afcContent .control-label {
        margin-bottom: 0;
        text-align: left;
      }
    }

    .defualt-add-tag {
      background: #b0d4f6;
      color: #fff;
      color: #fff !important;
      border-radius: 5px;
    }

    



    .ssl_p{
        font-size: 16px;font-weight: bold;color: #333333;padding-left: 12px;
    }

    .sslStatus{
        height: 116px;
        background: linear-gradient(270deg, #000000 0%, #F8F8FB 0%, #3D63FF 0%, #4D83FF 100%);
    }
    .sslStatusOne{
        display: flex;align-items: center;
        padding-left: 20px;
        justify-content: space-between;
    }
    .sslStatusOnediv{
      display: flex;align-items: center;
    }
    .sslStatusOnedivTwo{
      padding-right:50px;
    }
    .sslStatusOnediv>div:first-child>div{
        width: 55px;height: 53px;background: #F8F8FB;border-radius: 10px;
        display: flex;align-items: center;justify-content: center;
    }
    .sslStatusOne_status{
        margin: 0px  20px;
    }
    .sslStatusTwo{
        display: flex;
        align-items: center;
    }
    .sslStatusTwo>div:first-child{
        border-left:1px solid rgba(255, 255, 255, 0.25);
        border-right:1px solid rgba(255, 255, 255, 0.25);
        padding: 5px 0px 5px 20px;
        width: 230px;
    }
    .sslStatusTwo>div:last-child{
        border-right:1px solid rgba(255, 255, 255, 0.25);
        padding: 5px 0px 5px 20px;
        width: 230px;
    }
    .sslStatusTwoDiv>div:first-child{
        margin-bottom: 5px;
        font-size: 14px;
        color: #A3BCFF;
    }
    .sslStatusTwoDiv>div:last-child{
        font-size: 16px;
        color: #FFFFFF;
    }
    .sslStatusThree{
        padding-right: 20px;
    }
    .sslStatusThree>.btn{
        background: #6F87FC;
        box-shadow: 2px 2px 9px rgba(0, 28, 144, 0.15);
        opacity: 1; 
        border-radius: 4px;
        color: #fff;
        border: 1px solid #6F87FC;
        padding-left:15px;
        padding-right:15px;
    }
    .ssl_operations{
        text-align: right;
    }
    @media screen and (max-width: 768px) {
      .sslStatus {
        height: 100% !important;
      }
      .sslStatusOne{
          padding: 0px;
      }
      .sslStatusOnedivTwo{
        padding-right:0px !important;
      }
      .ssl_operations{
          text-align: left !important;
      }
      .ssl_domain{
          margin: 15px 0px;
      }
      .ssl_detailDiv>div{
        padding-left: 0px !important;
    }
      .d-j-a-center-operation{
        display: block !important;
      }
      .td_width{
        /* max-width: auto !important; */
        /* min-width: auto !important; */
        width:auto !important;
      }
      .label-text-right{
        text-align: left !important;
      }
      .sslIssueDiv{
        height: auto !important;
      }
    }
    .ssl_orderDetail{
        display: flex;
    }
    .ssl_orderDetail>label{
        color: #999999;
        max-width: 100px;
        min-width: 100px;
        text-align: right;
    }
    .ssl_detailDiv>div{
        padding-left: 20px;
    }
    
    .stepDiv{
        margin:30px 15px;
        
    }
    .step{
        padding: 5px 25px 30px;
        border-left: 1px solid #EFEFFF;
        position: relative;
    }
    .step>.yuan{
        width: 30px;
        height: 30px;
        border-radius: 50%;
        text-align: center;
        line-height: 28px;
        left: -15px;
        border:1px solid;
        top: 0px;
        position: absolute;
    }
    .stepContent_text{
        margin:10px 0px;
    }
    .stepNoborder{
        border-color: #fff;
    }
    .ssl-dialog-tip>div{
        color: #006EFF;
        height: 32px;
        display: flex;
        align-items: center;
        background: #F3F8FF;
        opacity: 1;
    }
    .ssl-more-operations li a{
      color: #212529;
      padding: .35rem 0.5rem;
    }
    .d-j-a-center {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-flow: wrap;
    }
    .verification-method{
      display: flex;
      width: 60%;
    }
    .verification-method>div{
      width:50%;height: 34px;border:1px solid #D1D6DD;
      text-align: center;
      line-height: 32px;
      font-size: 12px;
    }
    .verification-method>div:first-child{
      border-radius: 3px 0px 0px 3px;
    }
    .verification-method>div:last-child{
      border-radius: 0px 3px 3px 0px;
      border-left: 0px;
    }
    .poitner {
      cursor: pointer;
    }
    .v-active{
      background: #6064FF;
      color: #fff;
    }
    .d-j-a-center-operation{
      display: flex;
    }
    #v-operation-text{
      margin-bottom: 20px;
      background: #eff2f7;
      padding: 5px 0px;
      font-weight: bold;
    }
    #v-operation-text-two{
      margin-bottom: 20px;
      background: #eff2f7;
      padding: 5px 0px;
      font-weight: bold;
    }
    .td_width{
      /* max-width: 200px; */
      /* min-width: 200px; */
      width:200px;
      text-align: center;
    }
    #file-table{
      display: none;
    }
    .issueCsrDiv{
      display: flex;
      align-items: center;
    }
    .issueCsrDiv >div{
      display: flex;
      align-items: center;
    }
    .issueCsrDiv >div>span{
      margin-left: 10px;
    }
    .issueCsrDiv >div>input{
      width: 16px;
      height: 16px;
    }
    .issueCsrDiv div:last-child{
      margin-left: 20px;
    }
    .issueContactsDiv{
      display: flex;
      align-items: center;
    }
    .issueContactsDiv>input{
      width: 16px;
      height: 16px;
    }
    .verificationDiv .d-j-a-center>label:before{
      content: '*';
      color: red;
    }
    .redStar:before{
      content: '*';
      color: red;
    }
    .red_label:before{
      content: '*';
      color: red;
    }
    .label-text-right{
      text-align: right;
    }
    .sslIssueDiv{
      overflow-y: auto;
      height: 450px;
      overflow-x: hidden;
    }
    /* 未完成步骤 */
    .sslIncompleteStep > .yuan {
      border-color: #999999;
      background: #fff;
      color: #999999;
    }
    .sslIncompleteStep > .stepContent {
      color: #999999;
    }
    .sslIncompleteStep  .btn-ssl-b{
      color: #999999;
      background-color: #fff;
      border-color: #EFEFFF;
    }
    .sslIncompleteStep  .btn-ssl{
      color: #999999;
      background-color: #fff;
      border-color: #EFEFFF;
    }
    /* 当前步骤 */
    .sslCurrentStep > .yuan{
      background: #6064FF;
      border-color:#6064FF; 
      color: #fff;
    }
    .sslCurrentStep  .btn-ssl-b{
      color: #fff;
      background-color: #6064ff;
      border-color: #6064ff;
    }
    .sslCurrentStep  .btn-ssl{
      border:1px solid #6064FF;color: #6064FF;
    }
    /* 已完成步骤 */
    .sslCompletedStep  > .yuan {
      background: #DFE0FF;
      border-color: #DFE0FF;
      color: #fff;
    }
    .sslCompletedStep  >.stepContent{
      color: #999;
    }

    #showDomain{
      color:#426dff;display: flex;align-items: center;
    }
    #showDomain span:first-child {
      display: inline-block;font-size: 24px;width: 26px;height: 26px;border: 1px solid #426dff;line-height: 22px;text-align: center;border-radius: 50%;
    }
    #showDomain span:last-child{
      margin-left: 5px;
    }
    #hideDomain{
      display: none;
      color:#999999;align-items: center;
    }
    #hideDomain span:first-child{
      display: inline-block;font-size: 24px;width: 26px;height: 26px;border: 1px solid #999999;line-height: 22px;text-align: center;border-radius: 50%;
    }
    #hideDomain span:last-child{
      margin-left: 5px;
    }

    /* ssl证书待验证 */
    .status-verifiy_active{
      color: #fff;
      background-color: #fca426 !important;
      border-color: #fca426 !important;
      padding: 5px 10px !important;
    }
    /* ssl证书即将过期 */
    .status-overdue_active{
      color: #fff;
      background-color: #6064FF !important;
      border-color: #6064FF !important;
      padding: 5px 10px !important;
    }
    /* ssl证书已签发 */
    .status-issue_active{
      color: #fff;
      background-color: #3FBF70 !important;
      border-color: #3FBF70 !important;
      padding: 5px 10px !important;
    }
    /* ssl证书未付款 */
    .status-pending{
      color: #fff;
      background-color: #EE6161 !important;
      border-color: #EE6161 !important;
      padding: 5px 10px !important;
    }
    /* ssl证书未使用 */
    .status-active{
      color: #fff;
      background-color: #67A4FF !important;
      border-color: #67A4FF !important;
      padding: 5px 10px !important;
    }
    .borderRed{
      border-color:red;
    }
    #ipdomainNames:hover {
    color: #FCA426
  }
  </style>

{include file="includes/paymodal"}
<body>
  <div class="card mb-4 bg-primary sslStatus mb-4">
    <div class="card-body">
        <div class="row align-items-center text-white" style="height: 100%;">
            <div class="col-sm-12 col-md-4">
                <div class="sslStatusOne">
                  <div class="sslStatusOnediv">
                    <div>
                        <div>
                            <img src="/static/images/{$Detail.host_data.domainstatus}.png" alt="">
                        </div>
                    </div>
                    <div class="sslStatusOne_status">
                        <span style="font-size: 20px;font-weight: bold;">{$Detail.host_data.productname}</span>
                        <span class="badge badge-pill font-size-12 status-{$Detail.host_data.domainstatus|strtolower}">{$Detail.host_data.domainstatus_desc}</span>
                    </div>
                  </div>
                  <div class="sslStatusOnedivTwo">
                      {if $Detail.host_data.domainstatus == 'Pending'}
                          <a href="#">
                              <button type="button" style="width:80px;" class="btn btn-primary btn-sm waves-effect waves-light" onclick="payamount({$Detail.host_data.invoice_id});">去付款</button>
                          </a>
                      {/if}
                      <!-- 未使用 ->签发 -->
                      {if $Detail.host_data.domainstatus == 'Active'}
                          <a href="#">
                              <button type="button" style="width:80px;" id="IssueBtn" class="btn btn-primary btn-sm waves-effect waves-light issueCertBtn">签发</button>
                          </a>
                      {/if}

                      {if ($Detail.host_data.domainstatus != 'Pending' && $Detail.host_data.domainstatus != 'Active' && $Detail.host_data.domainstatus != 'Deleted')}
                          <a href="#">
                              <button type="button" style="min-width:80px;" id="againIssueBtn" class="btn btn-primary btn-sm waves-effect waves-light issueCertBtn">重新签发</button>
                          </a>
                      {/if}


                  </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 ssl_domain">
                <div class="sslStatusTwo">
                    <div class="sslStatusTwoDiv">
                        <div>域名</div>
                        <div class="poitner" id="ipdomainNames" {if $Detail.host_data.certssl_orderinfo.domainNames} data-toggle="modal" data-target="#sslIPdialog" {/if}>
                            {$Detail.host_data.certssl_orderinfo.used_domainNames ?? '-'}
                            {if ($Detail.host_data.certssl_orderinfo.domainNames)}
                                ({:count($Detail.host_data.certssl_orderinfo.domainNames_arr)})
                            {/if}
                        </div>
                    </div>
                    <div class="sslStatusTwoDiv">

                        {if ($Detail.host_data.domainstatus != 'Issue_Active' && $Detail.host_data.domainstatus != 'Deleted' && $Detail.host_data.domainstatus != 'Overdue_Active')}
                            <div>购买周期</div>
                            <div>
                                {foreach $Detail.config_options as $k => $val}
                                    {if $val.name_k == 'certssl_cert_year'}
                                        {$val.sub_name}
                                    {/if}
                                {/foreach}
                            </div>
                        {else}
                            <div>到期时间</div>
                            <div>
                                {if ($Detail.host_data.domainstatus == 'Deleted')}
                                    已过期
                                {/if}
                                {if ($Detail.host_data.domainstatus == 'Issue_Active' || $Detail.host_data.domainstatus == 'Overdue_Active')}
                                    {$Detail.host_data.certssl_orderinfo.due_time_day}天后到期
                                {/if}
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
            <!-- <div class="col-sm-12 col-md-4 ssl_operations" style="text-align: right;">
                <div class="btn-group sslStatusThree">
                    <button type="button" class="btn btn-default dropdown-toggle btn-sm" data-toggle="dropdown">更多操作
                      <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu ssl-more-operations" role="menu">
                        <li>
                            <a href="#">功能</a>
                        </li>
                        <li>
                            <a href="#">另一个功能</a>
                        </li>
                        <li>
                            <a href="#">其他</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">分离的链接</a>
                        </li>
                    </ul>
                </div>
            </div> -->
        </div>
    </div>
  </div>
  <!-- 订单详情  其他信息 -->
  <div class="row">
      <div class="col-sm-12 col-md-8">
          <div class="card">
              <div class="card-body ssl_detailDiv">
                  <div style="background: #eff2f7;padding: 20px;">
                    <p class="ssl_p">证书信息</p>
                    <form class="form-horizontal" role="form">
                      <div class="row">
                          {foreach $Detail.config_options as $k => $val}
                              {if $val.name_k != 'certssl_cert_year'}
                                <div class="form-group ssl_orderDetail col-md-4 col-sm-12">
                                  <label class="control-label">{$val.name}：</label>
                                  <div>
                                    <span>{$val.sub_name}</span>
                                  </div>
                                </div>
                              {/if}
                          {/foreach}
                      </div>
                    </form>
                  </div>
                  <div style="margin-top: 20px;background: #eff2f7;padding: 20px;">
                      <p class="ssl_p">订单信息</p>
                      <form class="form-horizontal" role="form">
                          <div class="form-group ssl_orderDetail">
                            <label class="control-label">订单号：</label>
                            <div>
                              <span>{$Detail.host_data.ordernum}</span>
                            </div>
                          </div>
                          <div class="row">
                            <div class="form-group ssl_orderDetail col-md-4 col-sm-12">
                              <label class="control-label">订购时间：</label>
                              <div>
                                <span>{$Detail.host_data.regdate|date="Y-m-d H:i"}</span>
                              </div>
                            </div>
                            <div class="form-group ssl_orderDetail col-md-4 col-sm-12">
                              <label class="control-label">签发时间：</label>
                              <div>
                                <span>{$Detail.host_data.certssl_orderinfo.issus_time ?? '-'}</span>
                              </div>
                            </div>
                            <div class="form-group ssl_orderDetail col-md-4 col-sm-12">
                              <label class="control-label">到期时间：</label>
                              <div>
                                <span>{$Detail.host_data.certssl_orderinfo.due_time ?? '-'}</span>
                              </div>
                            </div>
                          </div>
                          <div class="form-group ssl_orderDetail">
                            <label class="control-label">客户备注：</label>
                            <div>
                              <span>{$Detail.host_data.remark}</span>
                              <i class="bx bx-edit-alt pointer text-primary" data-toggle="modal"
                              data-target="#sslOrderRemark"></i>
                            </div>
                          </div>
                      </form>
                  </div>
                  {if $Detail.host_data.domainstatus != 'Pending' && $Detail.host_data.domainstatus != 'Active'}
                  <div style="margin-top: 20px;background: #eff2f7;padding: 20px;">
                    <p class="ssl_p">其他信息</p>
                    <p style="padding-left: 12px;">联系人信息</p>
                    <form class="form-horizontal" role="form">
                      <div class="row">
                        <div class="form-group ssl_orderDetail col-md-6 col-sm-12">
                          <label class="control-label">姓名：</label>
                          <div>
                            <span>{$Detail.host_data.certssl_orderinfo.lastname ?? '-'}{$Detail.host_data.certssl_orderinfo.firstname ?? '-'}</span>
                          </div>
                        </div>
                          <div class="form-group ssl_orderDetail col-md-6 col-sm-12">
                            <label class="control-label">部门(职位)：</label>
                            <div>
                              <span>{$Detail.host_data.certssl_orderinfo.position ?? '-'}</span>
                            </div>
                          </div>
                          <div class="form-group ssl_orderDetail col-md-6 col-sm-12">
                            <label class="control-label">电子邮箱：</label>
                            <div>
                              <span>{$Detail.host_data.certssl_orderinfo.email ?? '-'}</span>
                            </div>
                          </div>
                          <div class="form-group ssl_orderDetail col-md-6 col-sm-12">
                            <label class="control-label">联系电话：</label>
                            <div>
                              <span>{$Detail.host_data.certssl_orderinfo.telephone ?? '-'}</span>
                            </div>
                          </div>
                      </div>
                    </form>
                      {if (isset($Detail.host_data.cert_pinfo) && $Detail.host_data.cert_pinfo.cert_type != 'dv')}
                      <p style="padding-left: 12px;">公司/组织信息</p>
                      <form class="form-horizontal" role="form">
                          <div class="row">
                              <div class="form-group ssl_orderDetail col-md-6 col-sm-12">
                                  <label class="control-label">公司名称：</label>
                                  <div>
                                      <span>{$Detail.host_data.certssl_orderinfo.orgName ?? '-'}</span>
                                  </div>
                              </div>
                              <div class="form-group ssl_orderDetail col-md-6 col-sm-12">
                                  <label class="control-label">地址：</label>
                                  <div>
                                      <span>{$Detail.host_data.certssl_orderinfo.country_name ?? '-'}、{$Detail.host_data.certssl_orderinfo.province ?? '-'}、{$Detail.host_data.certssl_orderinfo.locality ?? '-'}</span>
                                  </div>
                              </div>
                              <div class="form-group ssl_orderDetail col-md-6 col-sm-12">
                                  <label class="control-label">邮政编码：</label>
                                  <div>
                                      <span>{$Detail.host_data.certssl_orderinfo.postalCode ?? '-'}</span>
                                  </div>
                              </div>
                              <div class="form-group ssl_orderDetail col-md-6 col-sm-12">
                                  <label class="control-label">联系电话：</label>
                                  <div>
                                      <span>{$Detail.host_data.certssl_orderinfo.company_phone ?? '-'}</span>
                                  </div>
                              </div>
                              <div class="form-group ssl_orderDetail col-md-6 col-sm-12">
                                  <label class="control-label">公司地址：</label>
                                  <div>
                                      <span>{$Detail.host_data.certssl_orderinfo.address ?? '-'}</span>
                                  </div>
                              </div>
                          </div>
                        {/if}
                  </div>
                  {/if}
              </div>
          </div>
      </div>
      <div class="col-sm-12 col-md-4">
        <div class="card">
            <div class="card-body">
                <div>
                    <p class="ssl_p">快速上手</p>
                    <div class="stepDiv">
                        <div class="step
                            {if $Detail.host_data.domainstatus == 'Pending'} sslIncompleteStep {/if}
                            {if $Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Cancelled' || $Detail.host_data.domainstatus == 'Verifiy_Active'} sslCurrentStep {/if}
                            {if $Detail.host_data.domainstatus != 'Pending' && $Detail.host_data.domainstatus != 'Active' && $Detail.host_data.domainstatus != 'Cancelled' && $Detail.host_data.domainstatus != 'Verifiy_Active'} sslCompletedStep {/if}
                            ">
                            <div class="yuan">01</div>
                            <div class="stepContent">
                                <div style="font-size: 16px;font-weight: bold;">申请证书</div>
                                {if $Detail.host_data.domainstatus != 'Pending'}
                                    {if $Detail.host_data.domainstatus == 'Active'}
                                        <div class="stepContent_text">您可以点击签发开始进行证书申请</div>
                                    {/if}
                                    {if $Detail.host_data.domainstatus == 'Cancelled'}
                                        <div class="stepContent_text">您可以点击重新签发开始进行证书申请</div>
                                    {/if}
                                    {if $Detail.host_data.domainstatus == 'Verifiy_Active'}
                                        <div class="stepContent_text">请您尽快添加解析记录，CA扫描认证通过后即可发布证书</div>
                                    {/if}
                                    {if $Detail.host_data.domainstatus == 'Issue_Active' || $Detail.host_data.domainstatus == 'Deleted'}
                                        <div class="stepContent_text">当前证书已于{$Detail.host_data.certssl_orderinfo.issus_time ?? '-'}签发成功</div>
                                    {/if}

                                    <div>
                                        {if $Detail.host_data.domainstatus == 'Verifiy_Active'}
                                            <a href="#">
                                                <button type="button" style="min-width:80px;" class="btn btn-ssl-b btn-sm waves-effect waves-light verifyDoamin" data-hostid="{$Detail.host_data.id}">域名验证</button>
                                            </a>
                                        {/if}
                                        {if $Detail.host_data.domainstatus == 'Active'}
                                            <a href="#">
                                              <button type="button" style="width:80px;" class="btn btn-ssl-b btn-sm waves-effect waves-light issueCertBtn">签发</button>
                                            </a>
                                        {/if}
                                        {if $Detail.host_data.domainstatus == 'Cancelled'}
                                            <a href="#">
                                                <button type="button" style="min-width:80px;" class="btn btn-ssl btn-sm waves-effect waves-light issueCertBtn">重新签发</button>
                                            </a>
                                        {/if}
                                        <!-- 待验证时才显示中止审核 中止审核的意思就是取消订单 -->
                                        {if $Detail.host_data.domainstatus == 'Verifiy_Active'}
                                            <a href="#">
                                                <button type="button" style="min-width:80px;" class="btn btn-ssl btn-sm btn-outline-light" id="cancelIssueOrder">终止审核</button>
                                            </a>
                                        {/if}
                                    </div>
                                {/if}
                            </div>
                        </div>
                        <div class="step
                                    {if $Detail.host_data.domainstatus == 'Overdue_Active' || $Detail.host_data.domainstatus == 'Issue_Active'} sslCurrentStep {/if}
                                    {if $Detail.host_data.domainstatus == 'Pending' || $Detail.host_data.domainstatus == 'Active' || $Detail.host_data.domainstatus == 'Cancelled' || $Detail.host_data.domainstatus == 'Verifiy_Active'} sslIncompleteStep {/if}
                                    {if $Detail.host_data.domainstatus == 'Deleted'} sslCompletedStep {/if}
                            ">
                            <div class="yuan">02</div>
                            <div class="stepContent"> 
                                <div style="font-size: 16px;font-weight: bold;">使用证书</div>
                                {if $Detail.host_data.domainstatus != 'Pending'}
                                    <div class="stepContent_text">您可以下载证书进行安装</div>
                                    <div>
                                        <a href="#">
                                            <button type="button" style="min-width:80px;" class="btn btn-ssl-b btn-sm waves-effect waves-light" id="downSslCert">下载证书</button>
                                        </a>
                                    </div>
                                {/if}
                            </div>
                        </div>
                        <div style="border-color: #fff;" class="step
                            {if $Detail.host_data.domainstatus == 'Deleted'} sslCurrentStep {/if}
                            {if $Detail.host_data.domainstatus != 'Deleted'} sslIncompleteStep {/if}
                            ">
                            <div class="yuan">03</div>
                            <div class="stepContent"> 
                                <div style="font-size: 16px;font-weight: bold;">证书过期</div>
                                {if $Detail.host_data.domainstatus != 'Pending'}
                                    <div class="stepContent_text">证书到期后重新购买即可！</div>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
  </div>
  <!-- 验证 -->
  <div class="modal fade" id="sslVerification" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="verificationTitle">域名验证</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="sslVerificationContent">
          <form>
           <div class="form-group d-j-a-center">
              <label class="col-sm-2 control-label">当前域名</label>
              <div class="col-sm-10">
                <div style="display: flex;align-items: center;">
                    <select style="width: 200px;" class="form-control" id="domainCurrent">
                    </select>
                    <div style="margin-left: 20px;">
                      <span style="margin-right:10px;">状态：</span>
                      <span class="domain-info-status">待验证</span>
                    </div>
                </div>
              </div>
            </div>
            <div class="form-group d-j-a-center">
              <label for="verificationMethod" class="col-sm-2 control-label">验证方式</label>
              <div class="col-sm-10">
                <div class="verification-method">
                  <div id="dnsVerification" class="verify_type poitner v-active">dns验证</div>
                  <div id="fileVerification" class="verify_type poitner">文件验证</div>
                </div>
              </div>
            </div>
            <div class="form-group d-j-a-center-operation">
              <div class="col-sm-12">
                <div id="v-operation-text">1. 创建DNS解析记录</div>
                <div style="overflow-x: auto;">
                  <div id="dns-table">
                    <p>选择 DNS 域名授权验证方式，您需要到您的域名解析服务商（如阿里云、新网、腾讯、DNSpod等）提供的系统中进行配置。请根据下列提示，在域名管理处添加一个DNS解析记录，操作完成后，请点击按钮进行检测。</p>
                    <table class="table table-bordered">
                      <tbody>
                        <tr>
                          <td class="td_width" id="record_type">记录类型</td>
                          <td id="copyContent"><span id="record_type_info">CNAME</span> <i class="bx bx-copy pointer text-primary ml-1 btn-copy" id="record_typecopy" data-clipboard-action="copy" data-clipboard-target="#record_type"></i></td>
                        </tr>
                        <tr>
                          <td class="td_width" id="host_record">主机记录</td>
                          <td id="copyContent"><span id="host_record_info">CNAME</span><i class="bx bx-copy pointer text-primary ml-1 btn-copy" id="host_recordcopy" data-clipboard-action="copy" data-clipboard-target="#host_record"></i></td>
                        </tr>
                        <tr>
                          <td class="td_width" id="record_value">记录值</td>
                          <td id="copyContent"><span id="record_value_info"></span> <i class="bx bx-copy pointer text-primary ml-1 btn-copy" id="record_valuecopy" data-clipboard-action="copy" data-clipboard-target="#record_value"></i></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="file-table">
                    <p>如使用文件验证，请先确保自己网站可以正常访问。（ 注：HTTP 使用80端口，HTTPS 使用443端口），根据提示创建txt验证文件，同时上传到网站根目录  ，并且可以通过浏览器访问。请注意windows无法创建以点（ . ）开头的文件夹需要使用命令行 mkdir .well-known</p>
                    <table class="table table-bordered">
                      <tbody>
                        <tr>
                          <td class="td_width">文件位置</td>
                          <td id="copyContent"><span id="file_position"></span><i class="bx bx-copy pointer text-primary ml-1 btn-copy" id="file_positioncopy" data-clipboard-action="copy" data-clipboard-target="#record_value"></i></td>
                        </tr>
                        <tr>
                          <td class="td_width">文件名称</td>
                          <td id="copyContent"><span id="file_name"></span></span> <i class="bx bx-copy pointer text-primary ml-1 btn-copy" id="file_namecopy" data-clipboard-action="copy" data-clipboard-target="#record_value"></i></td>
                        </tr>
                        <tr>
                          <td class="td_width" id="record_value">文件内容</td>
                          <td id="copyContent" id="file_verified"><span id="file_verified"></span> <i class="bx bx-copy pointer text-primary ml-1 btn-copy" id="file_verifiedcopy" data-clipboard-action="copy" data-clipboard-target="#record_value"></i></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group d-j-a-center">
              <div class="col-sm-12">
                <div id="v-operation-text">2.  检查验证状态</div>
                <div>
                  <span>点击验证按钮检查域名验证状态</span>
                  <a href="#">
                      <button type="button" style="min-width:80px;" class="btn btn-primary btn-sm waves-effect waves-light" id="inspectVerifyStatus">立即检查</button>
                  </a>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button  data-dismiss="modal" id="closesslVerification" type="button" style="width:80px;border-color: #6064FF;color:#6064FF;" class="btn btn-outline-light">关闭</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 签发 -->
  <div class="modal fade" id="sslIssue" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="IssueTitle"> 申请签发</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="sslIssueContent">
          <div class="sslIssueDiv">
            <form id="issus_form">
              <div class="row">
                <div class="col-sm-6">
                    <div class="form-group d-j-a-center">
                      <label for="IssueDomain" class="col-sm-3 red_label control-label label-text-right">签发域名</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.used_domainNames ?? ''}" class="form-control" id="IssueDomain" name="used_domainNames" placeholder="请输入签发域名">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center" id="issueDomainTow" style="">
                      <label for="IssueDomainTow" class="col-sm-3 control-label label-text-right"></label>
                      <div class="col-sm-9">
                        <textarea class="form-control" rows="5" name="domainNames" id="domainVerification" placeholder="不同域名或公网 IP 地址之间请使用换行符隔开，我们支持以下格式：
idcsmart.com
*.idcsmart.com">{$Detail.host_data.certssl_orderinfo.domainNames ?? ''}</textarea>
                        <div style="position: absolute;bottom: 5px;right: 30px;">
                          <span id="currentNum">0</span>/<span id="domainNum">0</span>
                        </div>
                      </div>
                    </div>
                    
                    
                    <div class="form-group d-j-a-center">
                      <label for="issueCsr" class="col-sm-3 red_label control-label label-text-right">CSR</label>
                      <div class="col-sm-9">
                        <div class="issueCsrDiv" style="display: flex;align-items: center;">
                          <div>
                            <input type="radio" name="is_csr" id="issueCsrRadios1" value="0" checked> <span>自动生成</span>
                          </div>
                          <div>
                            <input type="radio" name="is_csr" id="issueCsrRadios2"  value="1"> <span>自行上传</span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group d-j-a-center" id="RadioTextarea" style="display: none">
                      <label for="issueCsr" class="col-sm-3 control-label"></label>
                      <div class="col-sm-9">
                        <textarea class="form-control" rows="3" name="csr_text" id="algorithmTips"></textarea>
                      </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group d-j-a-center">
                      <div class="col-sm-8">
                        <!-- 域名验证 -->
                      </div>
                      <div class="col-sm-4">

                      </div>
                    </div>
                </div>
              </div>
              <div style="font-weight: bold;margin-bottom: 5px;padding-left:28px;" id="issueseniorDivTitle">其他信息</div>
              <div class="row" id="issueseniorDiv">
                <div class="col-sm-12">
                  <div style="margin-bottom: 10px;padding-left: 28px;">联系人信息</div>
                  <div class="row verificationDiv">
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueLastname" class="col-sm-3 control-label label-text-right">姓</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.lastname ?? ''}" class="form-control" name="lastname" id="issueLastname" placeholder="请输入姓">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueName" class="col-sm-3 control-label label-text-right">名</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.firstname ?? ''}" class="form-control" name="firstname" id="issueName" placeholder="请输入名">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issuePosition" class="col-sm-3 control-label label-text-right">职位</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.position ?? ''}" class="form-control" name="position" id="issuePosition" placeholder="请输入职位">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueEmail" class="col-sm-3 control-label label-text-right">邮箱</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.email ?? ''}" class="form-control" name="email" id="issueEmail" placeholder="请输入邮箱">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issuePhone" class="col-sm-3 control-label label-text-right">电话</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.telephone ?? ''}" class="form-control" name="telephone" id="issuePhone" placeholder="请输入电话">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-12 company-box">
                  <div style="margin-bottom: 10px;padding-left: 28px;">企业信息</div>
                  <div class="row verificationDiv_t">
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCorporatename" class="col-sm-3 redStar control-label label-text-right">公司名称</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.orgName ?? ''}" class="form-control" name="orgName" id="issueCorporatename" placeholder="请输入公司名称">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCorporatephone" class="col-sm-3 redStar control-label label-text-right">公司电话</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.company_phone ?? ''}" class="form-control" id="issueCorporatephone" name="company_phone" placeholder="请输入公司名称">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCreditCode" class="col-sm-3 redStar control-label label-text-right">信用代码</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.creditCode ?? ''}" class="form-control" name="creditCode" id="issueCreditCode" placeholder="请输入信用代码">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCountry" class="col-sm-3 redStar control-label label-text-right">国家</label>
                      <div class="col-sm-9">
                        <select class="form-control" id="issueCountry" name="country">
                          {foreach $Detail.host_data.iso_arr as $key => $val}
                              <option value="{$val.iso}" {if(isset($Detail.host_data.certssl_orderinfo.country) && $Detail.host_data.certssl_orderinfo.country == $val.iso)} selected {/if}
                                      {if(!isset($Detail.host_data.certssl_orderinfo.country) && $val.iso == 'CN')} selected {/if}
                                      {if(isset($Detail.host_data.certssl_orderinfo.country) && empty($Detail.host_data.certssl_orderinfo.country) && $val.iso == 'CN')} selected {/if}
                              >{$val.name_zh}({$val.iso})</option>
                          {/foreach}
                        </select>
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueProvince" class="col-sm-3 redStar control-label label-text-right">省份</label>
                      <div class="col-sm-9">
                          <input type="text" value="{$Detail.host_data.certssl_orderinfo.province ?? ''}" class="form-control" name="province" id="issueCreditCode" placeholder="请输入省份">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCity" class="col-sm-3 redStar control-label label-text-right">城市</label>
                      <div class="col-sm-9">
                          <input type="text" value="{$Detail.host_data.certssl_orderinfo.locality ?? ''}" class="form-control" name="locality" id="issueCreditCode" placeholder="请输入城市">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCompanyaddress" class="col-sm-3 redStar control-label label-text-right">公司地址</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.address ?? ''}" class="form-control" id="issueCompanyaddress" name="address" placeholder="请输入公司地址">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issuePostalCode" class="col-sm-3 redStar control-label label-text-right">邮政编码</label>
                      <div class="col-sm-9">
                          <input type="text" value="{$Detail.host_data.certssl_orderinfo.postalCode ?? ''}" class="form-control" id="issuePostalCode" placeholder="请输入邮政编码" name="postalCode">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueCountryRegistration" class="col-sm-3 redStar control-label label-text-right">注册国家</label>
                      <div class="col-sm-9">
                          <select class="form-control" id="issueCountry" name="joiCountry">
                              {foreach $Detail.host_data.iso_arr as $key => $val}
                                  <option value="{$val.iso}" {if(isset($Detail.host_data.certssl_orderinfo.joiCountry) && $Detail.host_data.certssl_orderinfo.joiCountry == $val.iso)} selected {/if}
                                          {if(!isset($Detail.host_data.certssl_orderinfo.joiCountry) && $val.iso == 'CN')} selected {/if}
                                          {if(isset($Detail.host_data.certssl_orderinfo.joiCountry) && empty($Detail.host_data.certssl_orderinfo.joiCountry) && $val.iso == 'CN')} selected {/if}
                                  >{$val.name_zh}({$val.iso})</option>
                              {/foreach}
                          </select>
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueRegisteredProvince" class="col-sm-3 redStar control-label label-text-right">注册省份</label>
                      <div class="col-sm-9">
                          <input type="text" value="{$Detail.host_data.certssl_orderinfo.joiProvince ?? ''}" class="form-control" name="joiProvince" id="issueCreditCode" placeholder="请输入注册省份">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueRegisteredCity" class="col-sm-3 redStar control-label label-text-right">注册城市</label>
                      <div class="col-sm-9">
                          <input type="text" value="{$Detail.host_data.certssl_orderinfo.joiLocality ?? ''}" class="form-control" name="joiLocality" id="issueCreditCode" placeholder="请输入注册城市">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueRegisteredAddress" class="col-sm-3 redStar control-label label-text-right">注册地址</label>
                      <div class="col-sm-9">
                        <input type="text" value="{$Detail.host_data.certssl_orderinfo.registryAddr ?? ''}" class="form-control" id="issueRegisteredAddress" placeholder="请输入注册地址" name="registryAddr">
                      </div>
                    </div>
                    <div class="form-group d-j-a-center col-sm-12 col-md-6">
                      <label for="issueDateRegistration" class="col-sm-3 redStar control-label label-text-right">注册日期</label>
                      <div class="col-sm-9">
                        <input type="date" value="{$Detail.host_data.certssl_orderinfo.dateOfIncorporation ?? ''}" class="form-control" id="issueDateRegistration" placeholder="请输入注册日期" name="dateOfIncorporation">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
                <input type="hidden" name="id" value="{$Detail.host_data.id}">
                <input type="hidden" name="func" value="issue">
             </form>
          </div>
        </div>
        <div class="modal-footer">
          <button id="issueApply" type="button" class="btn btn-primary" style="width:80px;">提交</button>
          <button id="issueApplyCancel" type="button" class="btn btn-outline-light" style="width:80px;"  data-dismiss="modal">取消</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 修改备注弹窗 -->
  <div class="modal fade" id="sslOrderRemark" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">修改备注</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="sslOrderRemarkForm" class="needs-validation" novalidate>
            <div class="form-group row">
              <label class="col-sm-3 col-form-label label-text-right">备注</label>
              <div class="col-sm-8">
                <input type="textarea" class="form-control" id="sslOrderRemarkInput" value='{$Detail.host_data.remark}' placeholder="请输入备注" required />
              </div>
            </div>
          </form>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
          <button type="button" class="btn btn-primary mr-2" id="modifyNotesSubmit" onclick="editSubmit({$Detail.host_data.id})">确定</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ip弹窗 -->
  <div class="modal fade" id="sslIPdialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">IP地址</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div id="ipDiv">

              {if ($Detail.host_data.certssl_orderinfo.domainNames)}
                  {foreach $Detail.host_data.certssl_orderinfo.domainNames_arr as $k => $v)}
                      <p>{$v}</p>
                  {/foreach}
              {/if}

          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
          <button type="button" class="btn btn-primary mr-2" >确定</button>
        </div>
      </div>
    </div>
  </div>
  <script src="/themes/clientarea/default/assets/js/billing.js?v={$Ver}"></script>
  <script type="text/javascript">

    $("#domainVerification").on('blur', function () {
      let verificationText=''
      var arrtwo=[]
      var arr=$(this).val().split("\n").map(item =>{
        if(item.replace(/\s+/g,"") != '') arrtwo.push(item)
      })
      var ary=arrtwo
      var nary=ary.sort();
      for(var i=0;i<ary.length;i++){
        if (nary[i]==nary[i+1]){
          // alert("数组重复内容："+nary[i]);
          verificationText+=` ${nary[i]},`
        }
      }
      $('#currentNum').text(arrtwo.length)
      if($('#domainNum').text() == arrtwo.length){
        $(this).removeClass('borderRed')
      }else{
        $(this).addClass('borderRed')
      }
      if(verificationText!='') toastr.error(verificationText.slice(0,verificationText.length-1)+'域名重复');
    })

      let isCompanyInfo = 0
      var hostId = '{$Detail.host_data.id}';
      var domainStatus = '{$Detail.host_data.domainstatus}';
      var timer;

      // 状态为未付款时， 轮询
      if(domainStatus == 'Pending')
      {
          var timer = setInterval(function() {

              $.ajax({
                  url: '/getHostStatus'
                  ,data: {hid:hostId}
                  ,type: 'get'
                  ,dataType: 'json'
                  ,success: function (e) {
                      if(e.status != 200)
                      {
                          clearInterval(timer);
                      }
                      if(e.data == 1)
                      {
                          clearInterval(timer);
                          location.reload();
                      }
                  }
              })
          }, 3000);
      }



      $('.sslIncompleteStep button').attr('disabled', true);
      $('.sslCompletedStep button').attr('disabled', true)
      // 签发提交
      $('#issueApply').click(function(){
          let _that= $(this)
          let text= $(this).text()
          $(this).html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"  style="color:#fff;"></i>' + text)
          $.ajax({
              url: '/provision/sslCertFunc'
              ,data: $('#issus_form').serialize()
              ,type:'post'
              ,dataType: 'json'
              ,success: function(e){
                    _that.html(text)
                    if(e.status != 200)
                    {
                      toastr.error(e.msg);
                      return false;
                    }
                    toastr.success(e.msg);
                    setTimeout(function () {
                      location.reload();
                    }, 2000)
              }
          })

      })
      $('#downSslCert').click(function () {
          let _that= $(this)
          let text= $(this).text()
          $(this).html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2" style="color:#fff;"></i>' + text)
          $.ajax({
              url: '/provision/sslCertFunc'
              ,data: {id:hostId, func:'downloadCert'}
              ,type:'post'
              ,success: function(e){
                   _that.html(text)
                  if(e.status != 200)
                  {
                      toastr.error(e.msg);
                      return false;
                  }
                  window.open(e.data.path + hostId );
              }
          })
      })
      // 域名验证 获取验证所需信息
      $('.verifyDoamin').click(function() {
          let text= $(this).text()
          $(this).html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"  style="color:#fff;"></i>' + text)
          getVerifyInfo();
      })
      // 取消审核
      $('#cancelIssueOrder').click(function () {
          let _that= $(this)
          let text= $(this).text()
          $(this).html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>' + text)
          $.ajax({
              url: '/provision/sslCertFunc'
              ,data: {id:hostId, func:'cancelVerify'}
              ,type:'post'
              ,dataType: 'json'
              ,success: function(e){
                  _that.html(text)
                  if(e.status != 200)
                  {
                      toastr.error(e.msg);
                      return false;
                  }
                  toastr.success(e.msg);
                  setTimeout(function () {
                      location.reload();
                  }, 2000)
              }
          })
      })

      /*
       * 签发是 企业信息是否必填，以及 csr 算法的提示信息
       */
      $('.issueCertBtn').click(function () {

          let _that= $(this)
          let text= $(this).text()
          if(_that.hasClass("btn-ssl")){
            $(this).html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>' + text)
          }else{
            $(this).html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2" style="color:#fff;"></i>' + text)
          }
          issueBeforeCheckInfo(function (e) {
            _that.html(text)
              if(e.status != 200)
              {
                  toastr.error(e.msg);
                  return false;
              }
              // 企业信息是否必填
              var is_companyInfo = e.data.is_companyInfo
              isCompanyInfo = e.data.is_companyInfo
              for(let item of $('.verificationDiv_t')[0].children){
                 if(is_companyInfo == 0){
                   item.children[0].classList.remove("redStar");
                 }else{
                  item.children[0].classList.add("redStar");
                 }
              }

              if(is_companyInfo == 0)
              {
                  $('.company-box').hide();
              }
              // csr提示信息
              var algorithm_tips = e.data.algorithm_tips
              if(algorithm_tips!=''){
                  $('#algorithmTips')[0].placeholder=algorithm_tips
              }else{
                  $('#algorithmTips')[0].placeholder=''
              }
              $('#sslIssue').modal('show');
              if(e.data.flex_num == 1)
              {
                  $('#issueDomainTow').hide()
              }
              if(e.data.flex_num > 1)
              {
                  $('#issueDomainTow').show()
              }
              $('#domainNum').text(e.data.flex_num - 1)
              var arrtwo=[]
              var arr=$("#domainVerification").val().split("\n").map(item =>{
                if(item.replace(/\s+/g,"") != '') arrtwo.push(item)
              })
              $('#currentNum').text(arrtwo.length)
          })
      });
      // 检查验证状态
      $('#inspectVerifyStatus').click(function () {
          let _that= $(this)
          let text= $(this).text()
          $(this).html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"  style="color:#fff;"></i>' + text)
          $.ajax({
              url: '/provision/sslCertFunc'
              ,data: {id:hostId, func:'getVerifiedStatus'}
              ,type:'post'
              ,dataType: 'json'
              ,success: function(e){
                  _that.html(text)
                  if(e.status != 200)
                  {
                      toastr.error(e.msg);
                      return false;
                  }
                  toastr.success(e.msg);
                  setTimeout(function () {
                      location.reload();
                  }, 2000)
              }
          })
      })

      function issueBeforeCheckInfo(fun)
      {   
          $.ajax({
              url: '/provision/sslCertFunc'
              ,data: {id:hostId, func:'issueBeforeCheckInfo'}
              ,type: 'post'
              ,dataType: 'json'
              ,success: function (e) {
                  fun(e)
              }
          })
      }

      /**
       * 获取验证信息
       */
      function getVerifyInfo()
      {
          var domainName = $('#domainCurrent').val();
          $.ajax({
              url: '/provision/sslCertFunc'
              ,data: {id:hostId, func:'getVerifiedInfo', domainName : domainName}
              ,type:'post'
              ,dataType: 'json'
              ,success: function(e){
                $('.verifyDoamin').html('域名验证')
                  if(e.status != 200)
                  {
                      toastr.error(e.msg);
                      return false;
                  }
                  handleVerifyContent(e.data)
              }
          })
      }

      $('#domainCurrent').change(function () {
          getVerifyInfo();
      })

      /**
       * 验证信息回显
       * @param data
       */
      function handleVerifyContent(data)
      {
          var list_html = '';

          for(var o in data.list)
          {
              list_html += '<option value="'+ data.list[o].dnsNames +'"';
              if(data.list[o].dnsNames == data.info.dnsNames)
              {
                  $('.domain-info-status').html(data.list[o].status == 2002 ? '已验证' : '待验证');
                  list_html += 'selected';
              }
              list_html += '>' + data.list[o].dnsNames;
              if(data.list[o].status == 2001)
              {
                  list_html += '-待验证'
              }
              if(data.list[o].status == 2002)
              {
                  list_html += '-已验证'
              }
              list_html += '</option>';
          }

          $('.verify_type').removeClass('v-active');

          if(data.info.dcvMethod == 'dns')
          {
              $('#dnsVerification').addClass('v-active');
              $('#v-operation-text').text('1. 创建DNS解析记录');
              $('#dns-table').css({'display':'block'})
              $('#file-table').css({'display':'none'})
              $('#record_type_info').html(data.info.recordType);
              $('#host_record_info').html(data.info.hostRecord);
              $('#record_value_info').html(data.info.hashValue);

              $('#sslVerification').modal('show');
              $('#domainCurrent').html(list_html);
              return;
          }
          $('#fileVerification').addClass('v-active');
          $('#v-operation-text').text('1. 创建文件解析记录');
          $('#dns-table').css({'display':'none'})
          $('#file-table').css({'display':'block'})
          $('#file_position').html(data.info.filePath);
          $('#file_name').html(data.info.fileName);
          $('#file_verified').html(data.info.hashValue);

          $('#sslVerification').modal('show');
          $('#domainCurrent').html(list_html);
      }
  // 选择验证方式
  $("#dnsVerification").on('click', function () {

      $('.verify_type').removeClass('v-active');
      $(this).addClass('v-active');
      $('#v-operation-text').text('1. 创建DNS解析记录')
      $('#dns-table').css({'display':'block'})
      $('#file-table').css({'display':'none'})

      switchVerifyMode('dns', function (e) {
          if(e.status != 200)
          {
              toastr.error(e.msg);
          }
          getVerifyInfo()
      })
  })
  $("#fileVerification").on('click', function () {

      $('.verify_type').removeClass('v-active');
      $(this).addClass('v-active');
      $('#v-operation-text').text('1. 上传文件进行验证')
      $('#dns-table').css({'display':'none'})
      $('#file-table').css({'display':'block'})

      switchVerifyMode('file', function(e) {
          if(e.status != 200)
          {
              toastr.error(e.msg);
          }
          getVerifyInfo()
      })

  })

      function switchVerifyMode(verifyMethod = 'dns', fun)
      {
          var domainName = $('#domainCurrent').val();

          $.ajax({
              url: '/provision/sslCertFunc'
              ,data: {id:hostId, func:'replaceDcvMethod',verifyMethod: verifyMethod, domainName : domainName}
              ,type:'post'
              ,dataType: 'json'
              ,success: function(e){
                  fun(e)
              }
          })
      }

      // 修改备注 
    function editSubmit(serverid){
      $.ajax({
        type: "POST",
        url: '/host/remark',
        data: {
          id: serverid,
          remark: $('#sslOrderRemarkInput').val()
        },
        dataType: "json",
        success: function (data) {
          toastr.success(data.msg);
          $('#sslOrderRemark').modal('hide')
          location.reload()
        }
      });
    }

    //复制 记录类型
    var clipboard = new ClipboardJS('#record_typecopy', {
      text: function (trigger) {
        console.log($('#record_type_info').text())
        return $('#record_type_info').text()
      },
      container: document.getElementById('sslVerification')   //弹框里的复制 必须获取焦点
    });
    clipboard.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
    //复制 主机记录
    var clipboardT = new ClipboardJS('#host_recordcopy', {
      text: function (trigger) {
        return $('#host_record_info').text()
      },
      container: document.getElementById('sslVerification') 
    });
    clipboardT.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
    //复制 记录值
    var clipboardS = new ClipboardJS('#record_valuecopy', {
      text: function (trigger) {
        return $('#record_value_info').text()
      },
      container: document.getElementById('sslVerification') 
    });
    clipboardS.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
    //复制 文件位置
    var clipboardS = new ClipboardJS('#file_positioncopy', {
      text: function (trigger) {
        return $('#file_position').text()
      },
      container: document.getElementById('sslVerification') 
    });
    clipboardS.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
    //复制 文件名
    var clipboardS = new ClipboardJS('#file_namecopy', {
      text: function (trigger) {
        return $('#file_name').text()
      },
      container: document.getElementById('sslVerification') 
    });
    clipboardS.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
    //复制 文件内容
    var clipboardS = new ClipboardJS('#file_verifiedcopy', {
      text: function (trigger) {
        return $('#file_verified').text()
      },
      container: document.getElementById('sslVerification') 
    });
    clipboardS.on('success', function (e) {
      toastr.success('{$Lang.copy_succeeded}');
    })
  
  //高级选择
  $("#issueContacts").on('click', function () {
    console.log(123123,$("#issueContacts")[0].checked)
    if($("#issueContacts")[0].checked){
      $('#issueseniorDiv').show()
      $('#issueseniorDivTitle').show()
    }else{
      $('#issueseniorDiv').hide()
      $('#issueseniorDivTitle').hide()
    }
  })
  //csr 操作
  $("#issueCsrRadios2").on('change', function () {
      $('#RadioTextarea').show()

  })
  $("#issueCsrRadios1").on('change', function () {
      $('#RadioTextarea').hide()
  })
  //签发打开弹窗
  $("#IssueBtn").on('click', function () {
    $('#IssueTitle')[0].innerText='申请签发'
  })
  $("#againIssueBtn").on('click', function () {
    $('#IssueTitle')[0].innerText='重新签发'
  })

  //输入姓 验证
  $("#issueLastname").on('blur', function () {
    var dom = $("#issueLastname")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入 名验证
  $("#issueName").on('blur', function () {
    var dom = $("#issueName")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入职位验证
  $("#issuePosition").on('blur', function () {
    var dom = $("#issuePosition")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入邮箱验证
  $("#issueEmail").on('blur', function () {
    var dom = $("#issueEmail")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入电话验证
  $("#issuePhone").on('blur', function () {
    var dom = $("#issuePhone")[0]
		if (dom.value == '') {
			
			dom.classList.add("is-invalid"); //添加非法状态
			return
		} else {
			dom.classList.remove("is-invalid");
			
		}
  })
  //输入公司名称验证
  $("#issueCorporatename").on('blur', function () {
    var dom = $("#issueCorporatename")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入公司电话验证
  $("#issueCorporatephone").on('blur', function () {
    var dom = $("#issueCorporatephone")[0]
    if(isCompanyInfo == 1){    
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入信用代码验证
  $("#issueCreditCode").on('blur', function () {
    var dom = $("#issueCreditCode")[0]
    if(isCompanyInfo == 1){    
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入国家验证
  $("#issueCountry").on('blur', function () {
    var dom = $("#issueCountry")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入省份验证
  $("#issueProvince").on('blur', function () {
    var dom = $("#issueProvince")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入城市验证
  $("#issueCity").on('blur', function () {
    var dom = $("#issueCity")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入公司地址验证
  $("#issueCompanyaddress").on('blur', function () {
    var dom = $("#issueCompanyaddress")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入邮政编码验证
  $("#issuePostalCode").on('blur', function () {
    var dom = $("#issuePostalCode")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册国家
  $("#issueCountryRegistration").on('blur', function () {
    var dom = $("#issueCountryRegistration")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册省份
  $("#issueRegisteredProvince").on('blur', function () {
    var dom = $("#issueRegisteredProvince")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册城市
  $("#issueRegisteredCity").on('blur', function () {
    var dom = $("#issueRegisteredCity")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册地址
  $("#issueRegisteredAddress").on('blur', function () {
    var dom = $("#issueRegisteredAddress")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  //输入注册日期
  $("#issueDateRegistration").on('blur', function () {
    var dom = $("#issueDateRegistration")[0]
    if(isCompanyInfo == 1){
      if (dom.value == '') {
        
        dom.classList.add("is-invalid"); //添加非法状态
        return
      } else {
        dom.classList.remove("is-invalid");
        
      }
    }
  })
  
  $('#showDomain').on('click', function (){
    console.log(123)
    $(this).css("display","none")
    $('#hideDomain').css("display","flex")
    $('#issueDomainTow').show()
  })
  $('#hideDomain').on('click', function (){
    console.log(123)
    $(this).css("display","none")
    $('#showDomain').css("display","flex")
    $('#issueDomainTow').hide()
  })
  </script>


</body>

</html>