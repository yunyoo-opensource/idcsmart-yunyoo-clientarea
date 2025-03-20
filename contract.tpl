{include file="includes/paymodal"}
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="utf-8" />
  <title>{$title}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta content="香港主机性价比低" name="description" />
  <meta content="idc,香港主机" name="keywords" />
  <meta content="顺戴财务" name="author" />


  <script type="text/javascript" src="/themes/clientarea/yunyoo/assets/js/jSignature.js"></script>
  <script src="/themes/clientarea/yunyoo/assets/libs/moment/moment.js?v={$Ver}"></script>

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

    .d-j-a-center {
      display: flex;
      /*justify-content: center;*/
      align-items: center;
      flex-flow: wrap;
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

    .poitner {
      cursor: pointer;
    }
    #signContractContent {
      padding: 20px 40px;
    }
    .dis-input:disabled {
      border: 0px;
      background: transparent;
    }
    .red-color{
      color: red;
      display: none;
    }
  </style>
</head>

<body>
  </div>
  <div class="card">
    <div class="card-body">
        {if $data.bases}
          <div class="alert alert-info" role="alert">
            <div>
              您有尚未签订的基础合同，未保证您的正常使用，请尽快签订
              <span id="signNowBtn" class="text-primary pointer">立即签订</span>
            </div>
          </div>
        {/if}
      <form action="combinebilling">
        <div class="table-container">
          <div class="table-header">
            <div class="table-tools">
              <a>
                <button type="button" class="btn btn-primary waves-effect waves-light mb-2" data-toggle="modal"
                  data-target="#afcModal">甲方信息管理</button>
              </a>
              <a href="contracthost">
                <button type="button" class="btn btn-primary waves-effect waves-light mb-2">签订合同</button>
              </a>
            </div>
            <div class="table-tools">
              <div class="table-search select_Div">
                <div class="d-flex align-items-center ml-2">
                  <span>产品状态：</span>
                  <select class="form-control" id="domainstatusSel" title="请选择状态" style="width: 150px">
                    {foreach $data.domainstatus as $k => $v}
                    <option value="{if $k != 'All'}{$k}{/if}"
                            {if $k == $Think.get.domainstatus}selected{/if}
                    >{$v}</option>
                    {/foreach}
                  </select>
                </div>
                <div class="d-flex align-items-center ml-2">
                  <span>合同状态：</span>
                  <select class="form-control" id="statusSel" title="请选择状态" style="width: 150px">
                    {foreach $data.status as $k => $v}
                      <option value="{if (string)$k != 'All'}{$k}{/if}"
                              {if (string)$k == $Think.get.status}selected{/if}
                      >{$v}</option>
                    {/foreach}
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="table-responsive">
            <table class="table tablelist">
              <thead class="bg-light">
                <tr>
                  <th>
                    <span>ID</span>
                  </th>
                  <th>
                    <span>合同编号</span>
                  </th>
                  <th>
                    <span>产品名称</span>
                  </th>
                  <th>
                    <span>金额</span>
                  </th>
                  <th>
                    <span>下单时间</span>
                  </th>
                  <th>
                    <span>产品到期时间</span>
                  </th>
                  <th>
                    <span>产品状态</span>
                  </th>
                  <th>
                    <span>合同状态</span>
                  </th>
                  <th width="180px">操作</th>
                </tr>
              </thead>
              <tbody>
              {if !empty($data.lists)}
              {foreach $data.lists as $vco}
                <tr>
                  <td>{$vco.id}</td>
                  <td>
                    {if $vco.status == 2}
                      <a class="text-primary mr-2" style="cursor: pointer;" onclick="generatePdf({$vco.id})">{$vco.pdf_num}</a>
                    {else}
                      <a class="text-primary mr-2" style="cursor: pointer;" onclick="downloadPdf({$vco.id})">{$vco.pdf_num}</a>
                    {/if}
                  </td>
                  <td>
                    {if empty($vco.host_id)}
                      -
                    {else}
                      {$vco.name}{if $vco.domain}-{$vco.domain}{/if}{if $vco.dedicatedip}-{$vco.dedicatedip}{/if}
                    {/if}
                  </td>
                  <td>
                    {if empty($vco.host_id)}
                    -
                    {else}
                      {$data.currency.prefix}{$vco.amount}
                    {/if}
                  </td>
                  <td>
                    {if empty($vco.host_id)}
                    -
                    {else}
                      {$vco.create_time}
                    {/if}
                  </td>
                  <td>
                    {if empty($vco.host_id)}
                    -
                    {else}
                      {$vco.nextduedate}
                    {/if}
                  </td>
                  <td>
                    {if empty($vco.host_id)}
                    -
                    {else}
                      {$vco.domainstatus_zh.name}
                    {/if}
                  </td>
                  <td>{$vco.status_zh}</td>
                  <td>
                    {if $vco.status == 0}
                      <a class="text-danger click-btn" style="cursor: pointer;" data-toggle="modal" data-contract-pdf-id="{$vco.id}" data-target="#deleteContract">删除</a>
                    {elseif $vco.status == 1}
                      <a class="text-success mr-2" target="_blank" style="cursor: pointer;" onclick="downloadPdf({$vco.id})">查看下载</a>
                      <a class="text-success mr-2 click-btn" style="cursor: pointer;" data-toggle="modal" data-contract-pdf-id="{$vco.id}" data-target="#applicationMailing">申请邮寄</a>
                    {elseif $vco.status == 2}
                      <a class="text-success mr-2" target="_blank" onclick="generatePdf({$vco.id})" style="cursor: pointer;">查看下载</a>
                      <a class="text-primary mr-2" style="cursor: pointer;" data-toggle="modal" data-target="#signContract" onclick="nowSign({$vco.id})">立即签订</a>
                      {if $vco.force}
                        <a style="cursor: not-allowed; color:#999">作废</a>
                      {else}
                        <a class="text-danger" onclick="contract_cancel({$vco.id})" style="cursor: pointer;" data-toggle="modal" data-target="#toVoidDialog">作废</a>
                      {/if}
                    {elseif $vco.status == 3}
                      <a class="text-success mr-2" target="_blank" onclick="downloadPdf({$vco.id})" style="cursor: pointer;">查看下载</a>
                      <a class="text-success mr-2 seeInformationBtn" data-id="{$vco.id}" style="cursor: pointer;" >邮寄信息</a>
                    {elseif $vco.status == 4}
                      <a class="text-success mr-2" target="_blank" onclick="downloadPdf({$vco.id})" style="cursor: pointer;">查看下载</a>
                      <a class="text-success mr-2 seeInformationBtn" data-id="{$vco.id}" style="cursor: pointer;">邮寄信息</a>
                    {/if}
                  </td>
                </tr>
              {/foreach}
              {else}
                <tr>
                  <td colspan="12">
                    <div class="no-data">{$Lang.nothing_content}</div>
                  </td>
                </tr>
              {/if}
              </tbody>
            </table>
          </div>
          <div class="table-footer">
            <div class="table-tools "></div>
            <div class="table-pagination">
              <div class="table-pageinfo mr-2">
                <span>{$Lang.common} {$page_data.Count} {$Lang.strips}</span>
                <span class="mx-2">
                        {$Lang.each_page}
                        <select name="" id="limitSel">
                          <option value="10" {if $page_data.Limit==10}selected{/if}>10</option>
                          <option value="15" {if $page_data.Limit==15}selected{/if}>15</option>
                          <option value="20" {if $page_data.Limit==20}selected{/if}>20</option>
                          <option value="50" {if $page_data.Limit==50}selected{/if}>50</option>
                          <option value="100" {if $page_data.Limit==100}selected{/if}>100</option>
                        </select>
                        条
                      </span>
              </div>
              <ul class="pagination pagination-sm">
                {$page_data.Pages}
              </ul>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- 模态框（Modal） -->
  <div class="modal fade" id="afcModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="popTitle"> 甲方信息管理</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="afcContent">
          <div class="afc-modal-tip">
            请仔细核对您的甲方信息，合同签订后具有法律效益，请确认以下信息的真实性、完整性，公司名称对此不承担任何责任：
          </div>
          <form>
            <div class="form-group d-j-a-center">
              <label for="paName" class="col-sm-3 control-label"><span class="red-color">*</span>甲方名称</label>
              <span style="margin-left: 26px;">
                {$data.client_data.companyname}
              </span>
              <div class="col-sm-4" style="margin-left: auto;">
                <span class="afc-update-name" data-toggle="popover" data-placement="top" data-trigger="hover"
                  data-content="如需修改甲方名称，请重新进行实名认证"><a href="/verified">修改名称</a></span>
              </div>
            </div>
            <div class="form-group d-j-a-center">
              <label for="paAddress" class="col-sm-3 control-label"><span class="red-color">*</span>地址</label>
              <div class="col-sm-9">
                <input type="text" value="{$data.client_data.address1}" disabled class="form-control dis-input" id="paAddress" placeholder="">
              </div>
            </div>
            <div class="form-group d-j-a-center">
              <label for="paPhone" class="col-sm-3 control-label"><span class="red-color">*</span>联系电话</label>
              <div class="col-sm-9">
                <input type="text" value="{$data.client_data.phonenumber}" class="form-control dis-input" disabled id="paPhone" placeholder="">
              </div>
            </div>
            <div class="form-group d-j-a-center">
              <label for="paEmail" class="col-sm-3 control-label"><span class="red-color">*</span>电子邮箱</label>
              <div class="col-sm-9">
                <input type="text" value="{$data.client_data.email}" class="form-control dis-input" disabled id="paEmail"
                  placeholder="">
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button id="afcCreateBtn" type="button" class="btn btn-primary">确认</button>
          <button id="afcUpdateBtn" type="button" class="btn btn-outline-light">修改</button>
          <!-- 保存/取消 -->
          <button id="afcSaveBtn" type="button" class="btn btn-primary display">保存</button>
          <button id="afcCancelBtn" type="button" class="btn btn-outline-light display">取消</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 邮件信息弹窗 -->
  <div class="modal fade" id="seeInformation" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customTitle">邮寄信息</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body" id="emailInformationN" style="display: none">
          <div>您的合同已发出，请注意查收</div>
          <div class="seeInformationDivN">

          </div>
          <div class="seeInformationDivT">

          </div>
        </div>

        <div class="modal-body" id="emailInformationT" style="display: none">
          <div class="seeInformationDivN"></div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal" id="seeInformationSub">确定</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 申请邮件弹窗 -->
  <div class="modal fade" id="applicationMailing" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customTitle">纸质合同申请确认</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="applicationMailingContent">
          <div>电子合同效力等同于纸质合同，您可以直接在线下载打印合同使用，无需申请纸质合同。如业务一定需要纸质合同，请点击确定申请纸质盖章合同，我们将在10个工作日内为您邮寄。</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="applicationMailingSub">确定</button>
          <button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 收件人信息 -->
  <div class="modal fade" id="recipientInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customTitle">收件人信息</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="recipientInfoContent">
          <div class="afc-modal-tip">
            为确保您能收到邮寄的合同，请仔细核对您的收件信息：
          </div>
          <form>
            <input type="hidden" value="{$data.address_client_data.voucher.id}" class="form-control" id="addressId" >
            <div class="form-group d-j-a-center">
              <label for="addressName" class="col-sm-3 control-label">收件人姓名</label>
              <div class="col-sm-5">
                <input type="text" value="{$data.address_client_data.voucher.username}" disabled class="form-control dis-input" id="addressName" placeholder="请输入收件人姓名">
              </div>
              <div class="col-sm-2 text-primary defualt-add-tag">默认地址</div>
              <div id="editAdreessBtn" class="col-sm-2 text-primary poitner">修改</div>
            </div>
            <div class="form-group d-j-a-center">
              <label for="addressPhone" class="col-sm-3 control-label">联系电话</label>
              <div class="col-sm-5">
                <input type="text" value="{$data.address_client_data.voucher.phone}" class="form-control dis-input" disabled id="addressPhone" placeholder="请输入联系电话">
              </div>
              <div class="col-sm-2 text-primary"></div>
            </div>
            <div class="form-group d-j-a-center">
              <label for="addressAddress" class="col-sm-3 control-label">收件地址</label>
              <div class="col-sm-5">
                <input type="text" value="{$data.address_client_data.voucher.detail}" class="form-control dis-input" disabled id="addressAddress"
                  placeholder="请输入收件地址">
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="recipientInfoSub">保存并提交</button>
          <button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 作废弹窗 -->
  <div class="modal fade" id="toVoidDialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customTitle">作废合同</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="toVoidDialogContent">
          <div>您确定要作废这份合同吗？</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="toVoidSub">确定</button>
          <button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 删除合同弹窗 -->
  <div class="modal fade" id="deleteContract" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customTitle">作废合同</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="deleteContractContent">
          <div>您确定要删除这份合同吗？</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="deleteContractSub">确定</button>
          <button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 取消邮寄弹窗 -->
  <div class="modal fade" id="cancelMailing" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customTitle">取消邮寄</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="deleteContractContent">
          <div>您确定要取消该合同的邮寄申请吗？</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="cancelMailingSub">确定</button>
          <button type="button" class="btn btn-outline-light" data-dismiss="modal">取消</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 签订合同弹窗 -->
  <div class="modal fade" id="signContract" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="signContract-modal-dialog modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header" style="border-color: #fff;">
          <h5 class="modal-title" id="customTitle"></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="qdhtBody" style="max-height: 600px;overflow-y: auto;">
          <div class="content_html">
            <div style="text-align:center;margin-bottom:30px;">
              <h3 class="content_title"></h3>
            </div>
            <div class="contractfirstParty">
              <!--<div class="contractfirstPartyDiv">
                <div style="font-weight: 600;">甲方：<span class="party_institutions"></span></div>
                <div>地址：<span class="party_addr"></span></div>
                <div>联系人：<span class="party_username"></span></div>
                <div>联系电话：<span class="party_phone"></span></div>
                <div>联系邮箱：<span class="party_email"></span></div>
              </div>
              <div class="contractfirstPartyDiv contractfirstPartyDivTwo">
              <div style="font-weight: 600;">乙方：<span class="party_b_institutions"></span></div>
              <div>地址：<span class="party_b_addr"></span></div>
              <div>联系人：<span class="party_b_username"></span></div>
              <div>联系电话：<span class="party_b_phone"></span></div>
              <div>联系邮箱：<span class="party_b_email"></span></div>
              </div>-->
              
              <table border="0" cellspacing="0" cellpadding="7" style="width: 100%;">
                <thead>
                <tr>
                    <td align="left" style="width: 50%">甲方：<span class="party_institutions"></span></td>
                    <td align="left" style="width: 50%">乙方：<span class="party_b_institutions"></span></td>
                </tr>
                <tr>
                    <td align="left" style="width: 50%">地址：<span class="party_addr"></span></td>
                    <td align="left" style="width: 50%">地址：<span class="party_b_addr"></span></td>
                </tr>
                <tr>
                    <td align="left" style="width: 50%">联系人：<span class="party_username"></span></td>
                    <td align="left" style="width: 50%">联系人：<span class="party_b_username"></span></td>
                </tr>
                <tr>
                    <td align="left" style="width: 50%">联系电话：<span class="party_phone"></span></td>
                    <td align="left" style="width: 50%">联系电话：<span class="party_b_phone"></span></td>
                </tr>
                <tr>
                    <td align="left" style="width: 50%">联系邮箱：<span class="party_email"></span></td>
                    <td align="left" style="width: 50%">联系邮箱：<span class="party_b_email"></span></td>
                </tr>
                </thead>
            </table>
            </div>
            <div class="modal-body" id="signContractContent">
            </div>
            <div class="contractfirstParty">
              <table border="0" cellspacing="0" cellpadding="7" style="width: 100%;">
                  <thead>
                  <tr>
                      <td align="left" style="width: 50%">甲方：<span class="party_institutions"></span></td>
                      <td align="left" style="width: 50%">乙方：<span class="party_b_institutions"></span></td>
                  </tr>
                  <tr>
                      <td align="left" style="width: 50%">（签章）</td>
                      <td align="left" style="width: 50%">（签章）</td>
                  </tr>
                  <tr>
                      <td align="left" style="width: 50%" class="time-add">时间：&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
                      <td align="left" style="width: 50%" class="time-add">时间：&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
                  </tr>
                  </thead>
              </table>
            </div>
          </div>
          <div class="enclosure">
            <h5>附件</h5>
            <div style="width:100%;font-weight: 600;text-align: center;">服务清单</div>
            <div class="cost">费用总计：<span class="fj_amount"></span></div>
            <div style="max-width: 100%;overflow-x: auto;">
              <div>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>订单号</th>
                      <th>产品名称</th>
                      <th>产品详情</th>
                      <th>数量</th>
                      <th>单价</th>
                      <th>服务期限</th>
                      <th>费用</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td class="fj_ordernum"></td>
                      <td class="fj_name"></td>
                      <td class="fj_description"></td>
                      <td>1</td>
                      <td class="fj_amount"></td>
                      <td class="fj_nextduedate"></td>
                      <td class="fj_amount"></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="button" style="width:100px;" class="btn btn-primary" id="signcontractSub" data-toggle="modal"
            data-target="#autographDialog">签订合同</button>
          <button type="button" style="width:100px;" class="btn btn-outline-light" data-dismiss="modal">关闭</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 签名弹窗 -->
  <div class="modal fade" id="autographDialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customTitle">请签字</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="deleteContractContent">
          <div id="signature"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary w-40" onclick="jSignatureTest()">生成签名</button>
          <button type="button" class="btn btn-outline-light" onclick="reset()">重置签名</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 未签订基础合同>1弹框 -->
  <div class="modal fade" id="signModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customTitle">请选择合同签订</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="signModalContent">
          {foreach $data.bases as $vco}
            <div>
              <span>{$vco.name}</span>
              <span class="text-primary pointer" onclick="ljSign({$vco.id})">立即签订</span>
            </div>
          {/foreach}
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
    // 获取接口需要的公共值
    var contract_cancel_id
    var contract_id
    var cancel_mail_id
    $(function () {
      $('#signcontractSub').click(function () {
        if($(".signatureCanvas").width() == undefined) {
          setTimeout(() => {
            $('#signature').jSignature({ lineWidth: 1, width: $('#signature').width(), height: 200, cssclass: 'signatureCanvas' });
          }, 500)
        }
      })
      // popover提示
      $("span").popover();
    })
    // 生成img
    function jSignatureTest() {

      if ($("#signature").jSignature("getData", "native").length == 0) {
        // 签名没有数据
        toastr.error('请签名后保存')
        return;
      } else {
        // 生成base64文件
        var datapair = $("#signature").jSignature("getData", "image")
        // 拼接文件
        var src_base64 = "data:" + datapair[0] + "," + datapair[1]
        $('.time-add').html("时间："+moment(new Date()).format('YYYY年MM月DD日')+"")
        let contract_html = $('.content_html').html()
        let contract_table = $('.enclosure').html()
        $.ajax({
            url: '/contract/contract/'+contract_id,
            type: 'POST',
            data: {
              sign: src_base64,
              content: contract_html,
              enclosure: contract_table
            },
            success: function (res) {
                let resData = res.data;
                if (res.status != 200) {
                  toastr.error(res.msg);
                } else {
                  toastr.success('签名生成成功');
                  location.href = '/contract'
                }
            }
        });
      }
    }
    // 重置
    function reset() {
      $("#signature").jSignature("reset");
    }

    // 修改甲方信息按钮
    $('#afcUpdateBtn').on('click', function () {
      // 变成可输入
      $('#paAddress').removeAttr('disabled')
      $('#paPhone').removeAttr('disabled')
      $('#paEmail').removeAttr('disabled')
      // 切换按钮
      $('#afcCreateBtn').hide()
      $('#afcUpdateBtn').hide()
      $('#afcSaveBtn').show()
      $('#afcCancelBtn').show()
      $('.red-color').show();
    })

    // 取消
    $('#afcCancelBtn').on('click', function () {
      // 变成不可输入
      $('#paAddress').attr('disabled', true)
      $('#paPhone').attr('disabled', true)
      $('#paEmail').attr('disabled', true)
      // 切换按钮
      $('#afcCreateBtn').show()
      $('#afcUpdateBtn').show()
      $('#afcSaveBtn').hide()
      $('#afcCancelBtn').hide()
      $('.red-color').hide();
      // TODO 取消,需要还原地址\电话\邮箱等信息

    })

    // 保存
    $('#afcSaveBtn').on('click', function () {
      // 变成不可输入
      $('#paAddress').attr('disabled', true)
      $('#paPhone').attr('disabled', true)
      $('#paEmail').attr('disabled', true)
      // 切换按钮
      $('#afcCreateBtn').show()
      $('#afcUpdateBtn').show()
      $('#afcSaveBtn').hide()
      $('#afcCancelBtn').hide()
      $.ajax({
          url: '/contract/base_info',
          type: 'POST',
          data: {
            address1: $('#paAddress').val(),
            phonenumber: $('#paPhone').val(),
            email: $('#paEmail').val()
          },
          success: function (res) {
              if (res.status != 200) {
                toastr.error(res.msg);
              } else {
                toastr.success('保存成功');
              }
          }
      });
    })

    // 确认创建
    $("#afcCreateBtn").on('click', function () {
      $(".modal").modal('hide')
    })

    // 创建合同按钮 TODO 列表渲染后再调试创建合同按钮
    $("#afcCreateContractBtn").on('click', function () {
      // 重置按钮
      $('#paAddress').attr('disabled', true)
      $('#paPhone').attr('disabled', true)
      $('#paEmail').attr('disabled', true)
      // 切换按钮
      $('#afcCreateBtn').show()
      $('#afcUpdateBtn').show()
      $('#afcSaveBtn').hide()
      $('#afcCancelBtn').hide()
    })

    $('#applicationMailingSub').on('click', function () {
      $("#applicationMailing").modal('hide')
      $("#recipientInfo").modal('show')
      $('#addressName').attr('disabled', true)
      $('#addressPhone').attr('disabled', true)
      $('#addressAddress').attr('disabled', true)
    })

    $('#editAdreessBtn').on('click', function () {
      $('#addressName').removeAttr('disabled')
      $('#addressPhone').removeAttr('disabled')
      $('#addressAddress').removeAttr('disabled')
    })

    $('#signNowBtn').on('click', function () {
      $('#signModal').modal('show')
    })
    function contract_cancel(id) {
      contract_cancel_id = id
    }
    $('#toVoidSub').on('click',function(){
      $.ajax({
        url: '/contract/cancel/'+ contract_cancel_id,
        success: function (res) {
            if (res.status != 200) {
              toastr.error(res.msg);
            } else {
              toastr.success("合同已作废");
            }
            location.reload();
        }
      });
    })
    function nowSign(id) {
      $.ajax({
        url: '/contract/contract_page',
        data: {
          id
        },
        success: function (res) {

          let resData = res.data;
          if (res.status != 200) {
            toastr.error(res.msg);
          } else {
            var checkedArr = []
            $('.row-checkbox:checked').each(function () {
              checkedArr.push($(this).data('value'))
            })
            // console.log(checkedArr)
            // TODO 创建合同
            $('.content_title').html(resData.contract.name)
            $('.party_addr').html(resData.party.addr)
            $('.party_email').html(resData.party.email)
            $('.party_institutions').html(resData.party.institutions)
            $('.party_phone').html(resData.party.phone)
            $('.party_username').html(resData.party.username)
            $('.party_b_addr').html(resData.party_b.addr)
            $('.party_b_email').html(resData.party_b.email)
            $('.party_b_institutions').html(resData.party_b.institutions)
            $('.party_b_phone').html(resData.party_b.phone)
            $('.party_b_username').html(resData.party_b.username)
            $('#signContractContent').html(HTMLDecode(resData.contract.content))
            if(resData.host.length == 0) {
              $('.enclosure').hide()
            } else {
              $('.fj_amount').html(resData.host.amount)
              $('.fj_description').html(resData.host.description.replace(/[\n\r]/g,'<br>'))
              $('.fj_name').html(resData.host.name)
              $('.fj_ordernum').html(resData.host.ordernum)
              $('.fj_nextduedate').html(moment(resData.host.nextduedate*1000).format('YYYY-MM-DD'))
            }
            $(".modal").modal('hide')
            $("#signContract").modal('show')
            contract_id = resData.id
          }
        }
      });
    }
    // html处理
    function HTMLDecode (text) {
      var temp = document.createElement('div')
      temp.innerHTML = text
      var output = temp.innerText || temp.textContent
      temp = null
      return output
    }
    // 邮寄信息
    function cancel_mail(id) {
      cancel_mail_id = id
    }

    // 查看下载
    function downloadPdf(id) {
      $.ajax({
        url: '/contract/download/'+ id,
        success: function (res) {
            if (res.status != 200) {
              toastr.error(res.msg);
            } else {
              window.open(res.data.pdf_address)
            }
        }
      });
    }
    function generatePdf(id) {
      $.ajax({
        url: '/contract/contract_page',
        data: {
          id
        },
        success: function (res) {
          let resData = res.data;
          if (res.status != 200) {
            toastr.error(res.msg);
          } else {
            // TODO 创建合同
            $('.content_title').html(resData.contract.name)
            $('.party_addr').html(resData.party.addr)
            $('.party_email').html(resData.party.email)
            $('.party_institutions').html(resData.party.institutions)
            $('.party_phone').html(resData.party.phone)
            $('.party_username').html(resData.party.username)
            $('.party_b_addr').html(resData.party_b.addr)
            $('.party_b_email').html(resData.party_b.email)
            $('.party_b_institutions').html(resData.party_b.institutions)
            $('.party_b_phone').html(resData.party_b.phone)
            $('.party_b_username').html(resData.party_b.username)
            $('#signContractContent').html(HTMLDecode(resData.contract.content))
            if(resData.host.length == 0) {
              $('.enclosure').hide()
            } else {
              $('.fj_amount').html(resData.host.amount)
              $('.fj_description').html(resData.host.description.replace(/[\n\r]/g,'<br>'))
              $('.fj_name').html(resData.host.name)
              $('.fj_ordernum').html(resData.host.ordernum)
              $('.fj_nextduedate').html(moment(resData.host.nextduedate*1000).format('YYYY-MM-DD'))
            }
            let contract_html = $('.content_html').html()
            let contract_table = $('.enclosure').html()
            $.ajax({
                url: '/contract/contract/'+resData.id,
                type: 'POST',
                data: {
                  content: contract_html,
                  enclosure: contract_table,
                  type: 'I'
                },
                success: function (res) {
                    if (res.status != 200) {
                      toastr.error(res.msg);
                    } else {
                      downloadPdf(id)
                    }
                }
            });
          }
        }
      });
    }
    // 立即签订
    function ljSign(id) {
      $.ajax({
          url: '/contract/contract',
          type: 'POST',
          data: {
            tplid: id
          },
          success: function (res) {
              let resData = res.data
              if (res.status != 200) {
                toastr.error(res.msg);
              } else {
                $('.content_title').html(resData.contract.name)
                $('.party_addr').html(resData.party.addr)
                $('.party_email').html(resData.party.email)
                $('.party_institutions').html(resData.party.institutions)
                $('.party_phone').html(resData.party.phone)
                $('.party_username').html(resData.party.username)
                $('.party_b_addr').html(resData.party_b.addr)
                $('.party_b_email').html(resData.party_b.email)
                $('.party_b_institutions').html(resData.party_b.institutions)
                $('.party_b_phone').html(resData.party_b.phone)
                $('.party_b_username').html(resData.party_b.username)
                $('#signContractContent').html(HTMLDecode(resData.contract.content))
                if(resData.host.length == 0) {
                  $('.enclosure').hide()
                } else {
                  $('.fj_amount').html(resData.host.amount)
                  $('.fj_description').html(resData.host.description.replace(/[\n\r]/g,'<br>'))
                  $('.fj_name').html(resData.host.name)
                  $('.fj_ordernum').html(resData.host.ordernum)
                  $('.fj_nextduedate').html(moment(resData.host.nextduedate*1000).format('YYYY-MM-DD'))
                }
                $(".modal").modal('hide')
                $("#signContract").modal('show')
                contract_id = resData.id
              }
          }
      });
    }
  </script>

  <script>
    var _url = '';
    var status = '{$Think.get.status}';
    // 排序
    $('.bg-light .pointer').on('click', function () {
      var sort = '{$Think.get.sort}'
      location.href = '/contract?domainstatus={$Think.get.domainstatus}&status={$Think.get.status}&sort=' + (sort == 'desc' ? 'asc' : 'desc') + '&order=' + $(this).attr('prop') + '&page={$Think.get.page}&limit={$Think.get.limit}'

    })
    //排序样式
    changeStyle()
    function changeStyle() {
      $('.bg-light th.pointer').children().children().css('color','rgba(0, 0, 0, 0.1)')
      var sort = '{$Think.get.sort}'
      let order = '{$Think.get.order}'
      let index,
              n
      if(order === 'create_time') {
        n = 0
      }
      if (sort === 'desc') {
        index = 1 + 2 * n
      } else if(sort === 'asc'){
        index = 0 + 2 * n
      }
      $('.bg-light th.pointer').children().children().eq(index).css('color','rgba(0, 0, 0, 0.8)')
    }

    // 产品状态
    $('#domainstatusSel').on('change', function () {
      location.href = '/contract?domainstatus=' + $('#domainstatusSel').val() + '&status={$Think.get.status}&sort={$Think.get.sort}&order={$Think.get.order}&page={$Think.get.page}&limit={$Think.get.limit}'
    });
    // 合同状态
    $('#statusSel').on('change', function () {
      location.href = '/contract?domainstatus={$Think.get.domainstatus}&status=' + $('#statusSel').val() + '&sort={$Think.get.sort}&order={$Think.get.order}&page={$Think.get.page}&limit={$Think.get.limit}'
    });

    // 每页数量选择改变
    $('#limitSel').on('change', function () {
      location.href = '/contract?domainstatus={$Think.get.domainstatus}&status={$Think.get.status}&sort={$Think.get.sort}&order={$Think.get.order}&page=1&limit=' + $('#limitSel').val()

    })
  </script>
  <script src="/themes/clientarea/yunyoo/assets/js/billing.js?v={$Ver}"></script>


  <script>
    var clickBtnId;
    $('.click-btn').click(function(){
      clickBtnId = $(this).attr('data-contract-pdf-id')
    })
    //删除
    $('#deleteContractSub').click(function () {
      var id = clickBtnId;
      $.ajax({
        type: "delete",
        url: '/contract/delete/'+ id,
        success: function (data) {
          if (data.status == 200) {
            toastr.success(data.msg)
            location.reload()
          } else {
            toastr.error(data.msg)
          }
        }
      });

    });

    //申请邮件
    $('#recipientInfoSub').click(function () {
      $.ajax({
        type: "POST",
        url: 'contract/post/'+ clickBtnId,
        data:{
          id: clickBtnId,
          voucher_id: $('#addressId').val(),
          username: $('#addressName').val(),
          phone: $('#addressPhone').val(),
          detail: $('#addressAddress').val(),
        },
        dataType: "json",
        success: function (data) {
          if (data.status == 200) {
            if (data.data.invoice_id > 0) {
              $('#recipientInfo').modal('hide');
              payamount(data.data.invoice_id);
            } else {
              location.reload();
            }
          } else {
            toastr.error(data.msg)
          }
        }
      });
    });

    //邮寄信息
    $('.seeInformationBtn').click(function(){
      var id = $(this).data('id')
      $.ajax({
        url: '/contract/mail/' + id
        ,dataType: 'json'
        ,type: 'get'
        ,success: function(res) {
          if(res.status != 200)
          {
            toastr.error(res.msg)
            return false;
          }
          $('#emailInformationT').hide()
          $('#emailInformationN').hide()
          if(res.data.type == 3)
          {
            $('#emailInformationT').show()
            $('#seeInformation .seeInformationDivN').html(res.msg);
            $('#seeInformation').modal('show')
          }
          if(res.data.type == 4)
          {
            $('#emailInformationN').show()
            $('#emailInformationN .seeInformationDivN').html(res.data.data.express_company);
            $('#emailInformationN .seeInformationDivT').html(res.data.data.express_order);
            $('#seeInformation').modal('show')
          }

        }
      })
    })


  </script>


</body>

</html>