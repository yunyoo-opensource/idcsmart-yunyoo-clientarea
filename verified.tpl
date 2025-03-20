
<style>
	.explanation {
		width: 100%;
    height: 150px;
    background-color: #f5f6f7;
    display: flex;
    justify-content: space-around;
    align-items: center;
	}
	.explanation_msg {
		width: 175px;
    height: 85px;
    line-height: 24px;
	}
	.downloadTemplate{
		cursor: pointer;
		color: #169bd5;
		font-size:12px;
		padding-top: 5px;
	}
	.custom-file-label::after{
		content: '浏览' !important
	}
</style>
<!-- 图片上传 -->
<script src="/themes/clientarea/yunyoo/assets/libs/dropzone/min/dropzone.min.js?v={$Ver}"></script>
<!--二维码-->
<script type="text/javascript" src="/themes/clientarea/yunyoo/assets/libs/qrcode/jquery.qrcode.min.js?v={$Ver}"></script>
<!-- 增加支付 -->
<script>
	var _url = '';
</script>
<script src="/themes/clientarea/yunyoo/assets/js/billing.js?v={$Ver}"></script>
{include file="includes/paymodal"}

<!-- 开始认证页面 新增 20210419 已提交资料-->
{if $Verified.certifi_message.status == '4' && $Verified.plugin != 'artificial'}
	{if $ErrorMsg}{include file="error/alert" value="$ErrorMsg"}{/if}
	<script>
		$(function () {
			var url = '{$Url}'
			var type = '{$CertifiPlugin}'
			var qrcodeurl =  '{$QrcodeUrl}'
			if (qrcodeurl){
				$('#qrcode').qrcode({
					render: "canvas",
					width: 200,
					height: 200,
					text: qrcodeurl
				});
				$('#qrcodeUrl').attr('href', qrcodeurl);
			}
			if (url) {
				setTimeout(function(){
					startInterval(type)
				}, 3000);
			}
		})
	</script>
	<div class="card">
		<div class="card-body text-center">
			<!-- <h1 class="pt-4 font-weight-bold"><img src="/themes/clientarea/yunyoo/assets_custom/img/Certification_pass.png" alt=""> 申请资料已提交！</h1>
			<p class="mt-4 text-black-50">尊敬的客户，您的申请资料已成功提交！我们将会尽全力保护您的个人信息安全可靠，并致力于维持您对我们的信任！</p> -->
		</div>
		<!-- 需要支付 -->
		{if $Verified.invoiceid} <!-- 未支付 -->
			{if $Verified.freetimes>0}
				{if $Verified.freetimes_use>0}
					<!-- <div class="card"> -->
					<div class="card-body  text-center">
						<div><b>本次认证免费！</b> <span class="text-muted"> 剩余免费次数： {$Verified.freetimes_use}/{$Verified.freetimes}</span></div>
					</div>
					<div class="card-body text-center border-top">
						{if $CertifiHtml}
							{$CertifiHtml}
						{/if}
						{if $QrcodeUrl} <!-- 支付宝做特殊处理 -->
							<h5 class="pt-2 font-weight-bold h5 py-4">请使用支付宝扫描二维码</h5>
							<a href="" id="qrcodeUrl"><div id="qrcode" class="d-flex justify-content-center"></div></a>
						{/if}
					</div>
					<!-- </div> -->
				{else}
					<div class="card-body text-center d-flex justify-content-center py-5 border-top">
						<div>
							<b>本次认证需支付:</b>
							<span class="h2 font-weight-bold text-primary">{$Verified.total}{$Lang.element}</span>
							<span class="ml-3">(免费次数 ：{$Verified.freetimes_use}/{$Verified.freetimes}）</span>
							<a href="javascript: payamount({$Verified.invoiceid},0);" class="btn btn-primary py-1 px-4 ml-3" role="button">去支付</a>
						</div>
					</div>
				{/if}
			{else}
				<div class="card-body text-center d-flex justify-content-center py-5 border-top">
					<div>
						<b>本次认证需支付:</b>
						<span class="h2 font-weight-bold text-primary">{$Verified.total}{$Lang.element}</span>
						<span class="ml-3">(免费次数 ：{$Verified.freetimes_use}/{$Verified.freetimes}）</span>
						<a href="javascript: payamount({$Verified.invoiceid},0);" class="btn btn-primary py-1 px-4 ml-3" role="button">去支付</a>
					</div>
				</div>
			{/if}
		{else}
			{if  $Verified.paid } <!-- 已经支付 -->
				<div class="card-body text-center h4 font-weight-bold text-success ">
					<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
						<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
						<path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
					</svg> 支付成功！
				</div>
			{elseif $Verified.freetimes>0 && $Verified.freetimes_use>0}
				<div class="card-body  text-center">
					<div><b>本次认证免费！</b> <span class="text-muted"> 剩余免费次数： {$Verified.freetimes_use}/{$Verified.freetimes}</span></div>
				</div>
			{/if}
			<div class="card-body text-center border-top">
				{if $CertifiHtml}
					{$CertifiHtml}
				{/if}
				{if $QrcodeUrl} <!-- 支付宝做特殊处理 -->
					<h5 class="pt-2 font-weight-bold h5 py-4">请使用支付宝扫描二维码</h5>
					<a href="" id="qrcodeUrl"><div id="qrcode" class="d-flex justify-content-center"></div></a>
				{/if}
			</div>
		{/if}
  </div>
<!-- 2、个人认证 -->
{elseif $Think.get.action == 'personal' && $Think.get.step == 'info'}
	{if $ErrorMsg}{include file="error/alert" value="$ErrorMsg"}{/if}
	{if $SuccessMsg}
		<script>
			$(function () {
				var url = '{$Url}'
				var type = '{$CertifiPlugin}'
				if (url) {
					$('#qrcode').qrcode({
						render: "canvas",
						width: 200,
						height: 200,
						text: url
					});
					$('#qrcodeUrl').attr('href', url);
					getModal('verified', '{$Lang.personal_certification}');

					setTimeout(function(){
						startInterval(type)
					}, 3000);
				} else {
					location.href = 'verified'
				}

			})
		</script>
	{/if}
	<script>
	$(function () {
	var certifi_is_upload={$Verified.certifi_message.certifi_is_upload};
		$('#bankForm').hide()
		$('#phoneForm').hide()
		sieldsShow($('#verifiType').find("option:selected").data("key"))


		$('#verifiType').on('change', function () {
			// console.log('verifiType:', $('#verifiType').val())
			//setFieldsShow()
			var id=$(this).find("option:selected").data("key");
			sieldsShow(id)


		})
		function sieldsShow(id){
			$(".certifi_select").find("input").attr("disabled","disabled");
			$(".certifi_select").hide();
			$("#certifi_select"+id).find("input").removeAttr("disabled");
			$("#certifi_select"+id).show();
			if($("#certifi_select"+id).find("select[name='cert_type']").val()){
				$(".cert_type").hide();
				$("#mainland,#otherarea").prop("checked",false);
				$("#mainland").prop("checked",true);
				if(certifi_is_upload!==1){
					$(".idcardImg").hide();
					$(".idcardImg").find("input").attr("disabled","disabled");
				}
			}else{
				$(".cert_type").show();
				if(certifi_is_upload!==1){
					$(".idcardImg").find("input").removeAttr("disabled");
				}
			}
		}

		/*function setFieldsShow() {
			var verifType = $('#verifiType').val()
			console.log('verifType: ', verifType);
			// console.log($(".rzfsSelect option:selected").attr("custom_fields");
			$('.selectShow').remove();
			var rzfsObj={:json_encode($Verified.certifi_select)};
			rzfsObj.map(res=>{
				if(res.value === verifType){
					res.custom_fields.map(cField=>{
						if(cField.type=="text"){
							$(".idcardLocation").after(`<div class="form-group row mb-4 w-100 selectShow">
						<label class="col-md-6 offset-md-3 col-form-label">${cField.title}</label>
						<div class="col-md-6 offset-md-3">
							<input type="text" class="form-control" placeholder="${cField.tip}" name="idcard" value="${cField.value}" required>
						</div>
					</div>`)
						}
					})
				}
			})
			if (verifType == 'three') {
				$('#bankForm').show()
				$('#phoneForm').hide()
				$('#phoneForm').attr('required', false)
				// console.log('$phoneForm: ', $('#phoneForm'));
				var three = '{$Verified.three}'
				if (three == 'four') {
					$('#phoneForm').show()
					$('#phoneForm').attr('required', true)
				}
			} else if (verifType == 'phonethree') {
				$('#phoneForm').show()
				$('#bankForm').hide()
				$('#bankForm').attr('required', false)
			} else if (verifType == 'ali') {
				$('#bankForm, #phoneForm').hide()
				$('#phoneForm').attr('required', false)
				$('#bankForm').attr('required', false)
			}
		}*/


		// ======= 身份证上传 start
		// 上传图片 获取图片的宽高 文件大小
		$("#personIdFrontCardInp").change(function (e) {
			var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
			// 没有上传时, 才允许上传
			if ($('.personFrontimg').length > 0) {
				//toastr.error(''+{$Lang.card_allowed_front})
				//return
				$('.personFrontimg').attr('src', objUrl);
				return;
			}
			if (objUrl) {
				$('#personFrontImg').append("<img class='personFrontimg' src='" + objUrl +
					"' width='100px' height='50px'>"); //将图片路径存入src中，显示出图片
			}
		});
		$("#personIdBackCardInp").change(function (e) {
			var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
			if ($('.personBackimg').length > 0) {
				$('.personBackimg').attr('src', objUrl);
				return;
			}
			if (objUrl) {
				$('#personBackImg').append("<img class='personBackimg' src='" + objUrl + "' width='100px' height='50px'>"); //将图片路径存入src中，显示出图片
			}
		});
		// ======= 身份证上传 end

		<!-- 自定义字段 文件 类型 wyh 20210506 新增 -->
		{foreach $Verified.certifi_select as $k2=>$certifi_select_val}
		{foreach $certifi_select_val.custom_fields as $k3=>$custom_fields}
		$("#customfieldsImg{$k2}{$k3}").change(function (e) {
			var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
			if ($('.customfieldsimgArea{$k2}{$k3}').length > 0) {
				$('.customfieldsimgArea{$k2}{$k3}').attr('src', objUrl);
				return;
			}
			if (objUrl) {
				$('#customfieldsImgArea{$k2}{$k3}').append("<img class='customfieldsimgArea{$k2}{$k3}' src='" + objUrl + "' width='100px' height='50px'>"); //将图片路径存入src中，显示出图片
			}
		});
		{/foreach}
		{/foreach}

		// 提交加载中
		$('.submitBtn').on('click', function () {
			if ($('.personFrontimg').length > 1) {
				toastr.error(''+{$Lang.card_allowed_front})
				return
			}
			if ($('.personBackimg').length > 1) {
				toastr.error(''+{$Lang.card_allowed_back})
				return
			}
			$('.submitBtn').prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
		});

		$('input:radio[name="card_type"]').on('change', function () {
			// console.log(11)
			// console.log('val:', $(this).val())

			location.replace('/verified?action={$Think.get.action}&step=info&type=' + ($(this).val() == '0' ? 'other' : ''))
		});
	})

	// ======= 身份证上传 start
	//建立一可存取到file的url
	function getObjectURL(file) {
		var url = null;
		if (window.createObjectURL != undefined) { // basic
			url = window.createObjectURL(file);
		} else if (window.URL != undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file);
		} else if (window.webkitURL != undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file);
		}
		return url;
	}

	// ======= 身份证上传 end
</script>
	<div class="card">
		<div class="card-body p-5">
			<h4 class="card-title mt-0">{$Lang.personal_certification}</h4>
			<div class="container-fluid">
				<div class="row">
					<form class="needs-validation w-100" novalidate method="post" enctype="multipart/form-data">
						{if count($Verified.certifi_select) >= 1}
							<div class="form-group row mb-4 w-100">
								<label class="col-md-6 offset-md-3 col-form-label">
									{$Lang.authentication_method}</label>
								<div class="col-md-6 offset-md-3">
									<select id="verifiType" class="form-control select2 rzfsSelect" name="certifi_type" data-select2-id="1" tabindex="-1"
											aria-hidden="true" required>
										{foreach $Verified.certifi_select as $key=>$list}
											<option {if $list.value==$Post.certifi_type} selected{/if} value="{$list.value}" data-key="{$key}">{$list.name}</option>
										{/foreach}
									</select>
								</div>
							</div>
						{/if}
						{foreach $Verified.certifi_select as $certifi_select_key=>$certifi_select_val}
							<div class="certifi_select" id="certifi_select{$certifi_select_key}" style="display:none;">
								{foreach $certifi_select_val.custom_fields as $k1=>$custom_fields}
									{if $custom_fields.type == 'text'}
										<div class="form-group row mb-4 w-100">
											<label class="col-md-6 offset-md-3 col-form-label">{$custom_fields.title}</label>
											<div class="col-md-6 offset-md-3">
												<input type="text" class="form-control" name="{$custom_fields.field}" value="{if $custom_fields.field == 'phone' && $Verified.phonenumber}{$Verified.phonenumber}{/if}" placeholder="{$custom_fields.title}" required {if $custom_fields.field == 'phone' && $Verified.phonenumber}{$Verified.disabled}{/if}>
											</div>
										</div>
									{elseif $custom_fields.type == 'file'}
										<div class="form-group row mb-4 w-100" id="customfieldsImg">
											<label class="col-md-6 offset-md-3 col-form-label">{$custom_fields.title}</label>
											<div class="col-md-6 offset-md-3">
												<div class="input-group mb-1 attachment-group">
													<div class="custom-file">
														<label class="custom-file-label text-truncate" for="customfieldsImg{$certifi_select_key}{$k1}" data-default="Choose file">
															{$Lang.select_file}
														</label>
														<input type="file" class="custom-file-input" name="{$custom_fields.field}" id="customfieldsImg{$certifi_select_key}{$k1}">
													</div>
												</div>
												<div id="customfieldsImgArea{$certifi_select_key}{$k1}"></div>
												<div class="text-muted">
													<small>{$Lang.allowed_suffixes}: .jpg、.gif、.jpeg、.png</small>
												</div>
											</div>
										</div>
									{elseif $custom_fields.type == 'select'}
										<div class="form-group row mb-4 w-100">
											<label class="col-md-6 offset-md-3 col-form-label">{$custom_fields.title}</label>
											<div class="col-md-6 offset-md-3">
												<select class="form-control select2" name="{$custom_fields.field}" data-select2-id="1" tabindex="-1"
														aria-hidden="true" required>
													{foreach $custom_fields.options as $key=>$item}
														<option {if $key==$Post[$custom_fields.field]} selected{/if} value="{$key}" >{$item}</option>
													{/foreach}
												</select>
											</div>
										</div>
									{/if}
								{/foreach}
							</div>
						{/foreach}

						<div class="form-group row mb-4 w-100">
							<label class="col-md-6 offset-md-3 col-form-label">{$Lang.real_name}</label>
							<div class="col-md-6 offset-md-3">
								<input type="text" class="form-control" name="real_name" value="{$Post.real_name}" required>
							</div>
						</div>
						<div class="form-group row mb-4 w-100 cert_type">
							<label class="col-md-6 offset-md-3 col-form-label">{$Lang.document_type}</label>
							<div class="col-md-6 offset-md-3">
								<input type="text" class="form-control" name="" value="{$Lang.resident_identity_card}" disabled>
							</div>
						</div>
						<div class="form-group row mb-4 w-100 cert_type">
							<label class="col-md-6 offset-md-3 col-form-label">{$Lang.type_idcard}</label>
							<div class="col-md-6 offset-md-3">
								<div class="custom-control custom-radio">
								<span class="mr-5">
									<input type="radio" id="mainland" name="card_type" value="1" class="custom-control-input" {if
											$Think.get.type=='other' } {else} checked {/if}> <label class="custom-control-label"
																									for="mainland">{$Lang.mainland}</label>
								</span>
									<span>
									<input type="radio" id="otherarea" name="card_type" value="0" class="custom-control-input" {if
									$Think.get.type=='other' }checked {else} {/if}> <label class="custom-control-label"
																						   for="otherarea">{$Lang.other_regions}</label>
								</span>
								</div>
							</div>
						</div>
						<div class="form-group row mb-4 w-100">
							<label class="col-md-6 offset-md-3 col-form-label">{$Lang.identification_number}</label>
							<div class="col-md-6 offset-md-3">
								<input type="text" class="form-control" name="idcard" value="{$Post.idcard}" required>
							</div>
						</div>
						{if $Verified.certifi_message.certifi_is_upload == '1'||$Think.get.type == 'other'}
							<div class="form-group row mb-4 w-100 idcardImg" id="idcardImg">
								<label class="col-md-6 offset-md-3 col-form-label">{$Lang.front_idcard}</label>
								<div class="col-md-6 offset-md-3">
									<div class="input-group mb-1 attachment-group">
										<div class="custom-file">
											<label class="custom-file-label text-truncate" for="personIdFrontCardInp" data-default="Choose file">
												{$Lang.select_file}
											</label>
											<input type="file" class="custom-file-input" name="attachments[]" id="personIdFrontCardInp">
										</div>
									</div>
									<div id="personFrontImg"></div>
									<div class="text-muted">
										<small>{$Lang.allowed_suffixes}: .jpg、.gif、.jpeg、.png</small>
									</div>
								</div>
							</div>
							<div class="form-group row mb-4 w-100 idcardImg" id="idcardImg">
								<label class="col-md-6 offset-md-3 col-form-label">{$Lang.reverse_side_idcard}</label>
								<div class="col-md-6 offset-md-3">
									<div class="input-group mb-1 attachment-group">
										<div class="custom-file">
											<label class="custom-file-label text-truncate" for="personIdBackCardInp" data-default="Choose file">
												{$Lang.select_file}
											</label>
											<input type="file" class="custom-file-input" name="attachments[]" id="personIdBackCardInp" multiple>
										</div>
									</div>
									<div id="personBackImg"></div>
									<div class="text-muted">
										<small>{$Lang.allowed_suffixes}: .jpg、.gif、.jpeg、.png</small>
									</div>
								</div>
							</div>

							<div class="form-group row mb-4 idcardImg">
								<div class="col-md-6 offset-md-3">
									<div class="explanation">
										<div class="explanation_msg">{$Lang.requirement}</div>
										<img src="/themes/clientarea/yunyoo/assets_custom/img/upload-id-card-fron.png" alt="">
										<img src="/themes/clientarea/yunyoo/assets_custom/img/upload-id-card-back.png" alt="">
									</div>
								</div>
							</div>
						{/if}
						<div class="row">
							<div class="col-md-6 offset-md-3">
								<button type="submit" class="btn btn-primary w-md submitBtn">{$Lang.submit}</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	$('input[type=radio][name=card_type]').change(function () {
		if (this.value == '2') {
			location.replace('verified?action=personal&step=info&type=other')
		}
	});
</script>
	<!-- 弹窗 -->
	<div class="verified" style="display: none;">
	<a href="" id="qrcodeUrl"><div id="qrcode" class="d-flex justify-content-center"></div></a>
	</div>

<!-- 3、企业认证 -->
{elseif $Think.get.action == 'enterprises' && $Think.get.step == 'info'}
	{if $ErrorMsg}
		{include file="error/alert" value="$ErrorMsg"}
	{/if}
	{if $SuccessMsg}
		<script type="text/javascript" src="/themes/clientarea/yunyoo/assets/libs/qrcode/jquery.qrcode.min.js?v={$Ver}"></script>
<script>
	$(function () {
		var url = '{$Url}'
		var type = '{$CertifiPlugin}'
		if (url) {
			$('#qrcodeEnterprises').qrcode({
				render: "canvas",
				width: 200,
				height: 200,
				text: url
			});
			getModal('verified', '{$Lang.enterprise_certification}');

			setTimeout(function(){
				startInterval(type)
			}, 3000);
		} else {
			location.href = 'verified'
		}
	})

</script>
{/if}

	<script>
		$(function () {
			$('#bankForm').hide()
			$('#phoneForm').hide()
			sieldsShow($('#verifiType').find("option:selected").data("key"))


			$('#verifiType').on('change', function () {
				// console.log('verifiType:', $('#verifiType').val())
				//setFieldsShow()
				var id=$(this).find("option:selected").data("key");
				sieldsShow(id)


			})
			function sieldsShow(id){
				$(".certifi_select").find("input").attr("disabled","disabled");
				$(".certifi_select").hide();
				$("#certifi_select"+id).find("input").removeAttr("disabled");
				$("#certifi_select"+id).show();
			}

			/*setFieldsShow()
            $('#verifiType').on('change', function () {
                setFieldsShow()
            })

            function setFieldsShow() {
                var verifType = $('#verifiType').val()
                if (verifType == 'three') {
                    $('#bankForm').show()
                    $('#phoneForm').hide()
                    $('#phoneForm').attr('required', false)
                    var three = '{$Verified.three}'
				if (three == 'four') {
					$('#phoneForm').show()
					$('#phoneForm').attr('required', true)
				}
			} else if (verifType == 'phonethree') {
				$('#phoneForm').show()
				$('#bankForm').hide()
				$('#bankForm').attr('required', false)
			} else if (verifType == 'ali' || verifType == 'artificial') {
				$('#bankForm, #phoneForm').hide()
				$('#bankForm').attr('required', false)
				$('#phoneForm').attr('required', false)
			}
		}*/

			//企业认证：建立一可存取到file的url
			function getObjectURL(file) {
				var url = null;
				if (window.createObjectURL != undefined) { // basic
					url = window.createObjectURL(file);
				} else if (window.URL != undefined) { // mozilla(firefox)
					url = window.URL.createObjectURL(file);
				} else if (window.webkitURL != undefined) { // webkit or chrome
					url = window.webkitURL.createObjectURL(file);
				}
				return url;
			}

			$("#corporateIdImg").change(function (e) {
				var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
				if (objUrl) {
					$('#enterprisesFrontImg').html("<img src='" + objUrl +
							"' width='100px' height='50px'>"); //将图片路径存入src中，显示出图片
				}
			});
			$("#corporateBackIdImg").change(function (e) {
				var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
				if (objUrl) {
					$('#enterprisesBackImg').html("<img src='" + objUrl +
							"' width='100px' height='50px'>"); //将图片路径存入src中，显示出图片
				}
			});
			$("#businessLicenseInput").change(function (e) {
				var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
				if (objUrl) {
					$('#businessLicenseImg').html("<img src='" + objUrl +
							"' width='100px' height='50px'>"); //将图片路径存入src中，显示出图片
				}
			});
			// 授权书
			$("#certifiAuthorInput").change(function (e) {
				var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
				if (objUrl) {
					$('#certifiAuthorImg').html("<img src='" + objUrl +
							"' width='100px' height='50px'>"); //将图片路径存入src中，显示出图片
				}
			});
			<!-- 自定义字段 文件 类型 wyh 20210506 新增 -->
			{foreach $Verified.certifi_select as $k2=>$certifi_select_val}
			{foreach $certifi_select_val.custom_fields as $k3=>$custom_fields}
			$("#customfieldsImg{$k2}{$k3}").change(function (e) {
				var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
				if ($('.customfieldsimgArea{$k2}{$k3}').length > 0) {
					$('.customfieldsimgArea{$k2}{$k3}').attr('src', objUrl);
					return;
				}
				if (objUrl) {
					$('#customfieldsImgArea{$k2}{$k3}').append("<img class='customfieldsimgArea{$k2}{$k3}' src='" + objUrl + "' width='100px' height='50px'>"); //将图片路径存入src中，显示出图片
				}
			});
			{/foreach}
			{/foreach}

			// 提交加载中
			$('.submitBtn').on('click', function () {
				$('.submitBtn').prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
			});

		})
	</script>
	<!-- 企业认证表单 -->
	<div class="card">
		<div class="card-body p-5">
			<h4 class="card-title mt-0">{$Lang.enterprise_certification}</h4>
			<div class="container-fluid">
				<div class="row">
					<form method="post" enctype="multipart/form-data" class="needs-validation w-100" novalidate>
						<!--{if count($Verified.certifi_select) > 1}
					<div class="form-group row mb-4 w-100">
						<label class="col-md-6 offset-md-3 col-form-label">{$Lang.authentication_method}</label>
						<div class="col-md-6 offset-md-3">
							<select id="verifiType" class="form-control select2" name="certifi_type" data-select2-id="1" tabindex="-1"
								aria-hidden="true">
								{foreach $Verified.certifi_select as $list}
								<option {if $list.value==$Post.certifi_type} selected{/if} value="{$list.value}" data-key="{$key}">{$list.name}</option>
								{/foreach}
							</select>
						</div>
					</div>
					{/if}
{if count($Verified.certifi_select) == 1}
					<input type="hidden" id="verifiType" name="certifi_type" value="{$Verified.certifi_select.0.value}" />
					{/if}-->

						<!-- 实名认证改变 wyh -->
						{if count($Verified.certifi_select) >= 1}
							<div class="form-group row mb-4 w-100">
								<label class="col-md-6 offset-md-3 col-form-label">
									{$Lang.authentication_method}</label>
								<div class="col-md-6 offset-md-3">
									<select id="verifiType" class="form-control select2 rzfsSelect" name="certifi_type" data-select2-id="1" tabindex="-1"
											aria-hidden="true" required>
										{foreach $Verified.certifi_select as $key=>$list}
											<option {if $list.value==$Post.certifi_type} selected{/if} value="{$list.value}" data-key="{$key}">{$list.name}</option>
										{/foreach}
									</select>
								</div>
							</div>
						{/if}
						{foreach $Verified.certifi_select as $certifi_select_key=>$certifi_select_val}
							<div class="certifi_select" id="certifi_select{$certifi_select_key}" style="display:none;">
								{foreach $certifi_select_val.custom_fields as $k1=>$custom_fields}
									{if $custom_fields.type == 'text'}
										<div class="form-group row mb-4 w-100">
											<label class="col-md-6 offset-md-3 col-form-label">{$custom_fields.title}</label>
											<div class="col-md-6 offset-md-3">
												<input type="text" class="form-control" name="{$custom_fields.field}" value="{if $custom_fields.field == 'phone' && $Verified.phonenumber}{$Verified.phonenumber}{/if}" placeholder="{$custom_fields.title}" required {if $custom_fields.field == 'phone' && $Verified.phonenumber}{$Verified.disabled}{/if}>
											</div>
										</div>
									{elseif $custom_fields.type == 'file'}
										<div class="form-group row mb-4 w-100" id="customfieldsImg">
											<label class="col-md-6 offset-md-3 col-form-label">{$custom_fields.title}</label>
											<div class="col-md-6 offset-md-3">
												<div class="input-group mb-1 attachment-group">
													<div class="custom-file">
														<label class="custom-file-label text-truncate" for="customfieldsImg{$certifi_select_key}{$k1}" data-default="Choose file">
															{$Lang.select_file}
														</label>
														<input type="file" class="custom-file-input" name="{$custom_fields.field}" id="customfieldsImg{$certifi_select_key}{$k1}">
													</div>
												</div>
												<div id="customfieldsImgArea{$certifi_select_key}{$k1}"></div>
												<div class="text-muted">
													<small>{$Lang.allowed_suffixes}: .jpg、.gif、.jpeg、.png</small>
												</div>
											</div>
										</div>
									{elseif $custom_fields.type == 'select'}
										<div class="form-group row mb-4 w-100">
											<label class="col-md-6 offset-md-3 col-form-label">{$custom_fields.title}</label>
											<div class="col-md-6 offset-md-3">
												<select class="form-control select2" name="{$custom_fields.field}" data-select2-id="1" tabindex="-1"
														aria-hidden="true" required>
													{foreach $custom_fields.options as $key=>$item}
														<option {if $key==$Post[$custom_fields.field]} selected{/if} value="{$key}" >{$item}</option>
													{/foreach}
												</select>
											</div>
										</div>
									{/if}
								{/foreach}
							</div>
						{/foreach}

						<div class="form-group row mb-4 w-100">
							<label class="col-md-6 offset-md-3 col-form-label">{$Lang.enterprise_name}</label>
							<div class="col-md-6 offset-md-3">
								<input type="text" class="form-control" name="company_name" value="{$Post.company_name}"  required>
							</div>
						</div>
						<div class="form-group row mb-4 w-100">
							<label class="col-md-6 offset-md-3 col-form-label">{$Lang.business_license_corporation}</label>
							<div class="col-md-6 offset-md-3">
								<input type="text" class="form-control" name="company_organ_code" value="{$Post.company_organ_code}" required>
							</div>
						</div>
						<div class="form-group row mb-4 w-100">
							<label class="col-md-6 offset-md-3 col-form-label">{$Lang.name_author}</label>
							<div class="col-md-6 offset-md-3">
								<input type="text" class="form-control" name="real_name" value="{$Post.real_name}" required>
							</div>
						</div>
						<div class="form-group row mb-4 w-100 idcardLocation">
							<label class="col-md-6 offset-md-3 col-form-label">{$Lang.id_number}</label>
							<div class="col-md-6 offset-md-3">
								<input type="text" class="form-control" name="idcard" value="{$Post.idcard}" required>
							</div>
						</div>
						<!--<div class="form-group row mb-4 w-100" id="bankForm" style="display:none;">
						<label class="col-md-6 offset-md-3 col-form-label">{$Lang.bank_card_number}</label>
						<div class="col-md-6 offset-md-3">
							<input type="text" class="form-control" name="bank" value="{$Post.bank}" oninput="value=value.replace(/[^\d]/g,'')">
						</div>
					</div>
					<div class="form-group row mb-4 w-100" id="phoneForm" style="display:none;">
						<label class="col-md-6 offset-md-3 col-form-label">{$Lang.phone_number}</label>
						<div class="col-md-6 offset-md-3">
							<input type="text" class="form-control" name="phone"  value="{$Post.phone}"
								oninput="value=value.replace(/[^\d]/g,'');if(value.length>11)value=value.slice(0,11)">
						</div>
					</div>-->
						{if $Verified.certifi_message.certifi_is_upload == '1'}
							<div class="form-group row mb-4 w-100">
								<label class="col-md-6 offset-md-3 col-form-label">{$Lang.front_idcard}</label>
								<div class="col-md-6 offset-md-3">
									<div class="input-group mb-1 attachment-group">
										<div class="custom-file">
											<label class="custom-file-label text-truncate" for="corporateIdImg" data-default="Choose file">
												{$Lang.select_file}
											</label>
											<input type="file" class="custom-file-input" name="attachments[]" id="corporateIdImg">
										</div>
									</div>
									<div id="enterprisesFrontImg"></div>
									<div class="text-muted">
										<small>{$Lang.allowed_suffixes}: .jpg、.gif、.jpeg、.png</small>
									</div>
								</div>
							</div>
							<div class="form-group row mb-4 w-100">
								<label class="col-md-6 offset-md-3 col-form-label">{$Lang.reverse_side_idcard}</label>
								<div class="col-md-6 offset-md-3">
									<div class="input-group mb-1 attachment-group">
										<div class="custom-file">
											<label class="custom-file-label text-truncate" for="corporateBackIdImg" data-default="Choose file">
												{$Lang.select_file}
											</label>
											<input type="file" class="custom-file-input" name="attachments[]" id="corporateBackIdImg">
										</div>
									</div>
									<div id="enterprisesBackImg"></div>
									<div class="text-muted">
										<small>{$Lang.allowed_suffixes}: .jpg、.gif、.jpeg、.png</small>
									</div>
								</div>
							</div>

						{/if}
						<!-- 营业执照上传 -->
						{if $Setting.certifi_business_is_upload == '1'}
							<div class="form-group row mb-4 w-100">
								<label class="col-md-6 offset-md-3 col-form-label">
									{$Lang.business_license}</label>
								<div class="col-md-6 offset-md-3">
									<div class="input-group mb-1 attachment-group">
										<div class="custom-file">
											<label class="custom-file-label text-truncate" for="businessLicenseInput" data-default="Choose file">
												{$Lang.select_file}
											</label>
											<input type="file" class="custom-file-input" name="business_license[]" id="businessLicenseInput">
										</div>
									</div>
									<div id="businessLicenseImg"></div>
									<div class="text-muted">
										<small>{$Lang.allowed_suffixes}: .jpg、.gif、.jpeg、.png</small>
									</div>
								</div>
							</div>
						{/if}

						<!-- 授权书上传 -->
						{if $Setting.certifi_business_is_author == '1'}
							<div class="form-group row mb-4 w-100">
								<label class="col-md-6 offset-md-3 col-form-label">
									{$Lang.certificate_of_authorization}</label>
								<div class="col-md-6 offset-md-3">
									<div class="input-group mb-1 attachment-group">
										<div class="custom-file">
											<label class="custom-file-label text-truncate" for="certifiAuthorInput" data-default="Choose file">
												{$Lang.select_file}
											</label>
											<input type="file" class="custom-file-input" name="certifi_author[]" id="certifiAuthorInput">
										</div>
									</div>
									<div id="certifiAuthorImg"></div>
									<div class="text-muted">
										<small>{$Lang.allowed_suffixes}: .jpg、.gif、.jpeg、.png</small>
										<a href="/authorDown" target="_blank"><p class="downloadTemplate">{$Lang.downloadTemplate}</p></a>
									</div>
								</div>
							</div>
						{/if}



						<div>
							<div class="row">
								<div class="col-md-6 offset-md-3">
									<button type="submit" class="btn btn-primary w-md submitBtn">{$Lang.submit}</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹窗 -->
	<div class="verified" style="display: none;">
		<div id="qrcodeEnterprises" class="d-flex justify-content-center"></div>
	</div>

<!-- 4、其他状态 -->
{else}

<!-- 已认证 -->
{if $Verified.certifi_message.status == '1'}
<div class="card ststus-box">
	<div class="card-body p-5">
		<div class="container-fluid mt-0">
			<div class="row">
				<div class="mx-auto pb-5 col-sm-9 d-flex flex-column justify-content-center align-items-center">
					<h3 class="mt-4">	<img class="mr-4" style="width:48px;" src="/themes/clientarea/yunyoo/assets_custom/img/Certification_pass.png" alt="">{$Lang.certification_complete}</h3>
					<span class="text-muet mt-2">{$Verified.certifi_message.type=="certifi_person" || $Verified.certifi_message.show_type == '1' ? $Lang.congratulations :$Lang.enterprisecongratulations}</span>
          <div class="border-bottom pt-4"  style="width:60%;margin:0 auto;"></div>
          <h5 class="pt-4 font-weight-bold" style="margin-bottom: 20px;">会员信息</h5>
						<div class="mt-4 text-center" style="width: 300px">
						<p class="d-flex justify-content-between"><span>{$Lang.member_id}：</span><span>{$Verified.certifi_message.auth_user_id}</span></p>
						<p class="d-flex justify-content-between"><span>{$Lang.real_name}: </span><span>{$Verified.certifi_message.auth_real_name}</span></p>
						<p class="d-flex justify-content-between"><span>{$Lang.id_number}: </span><span>{$Verified.certifi_message.auth_card_number}</span></p>
						{if ($Verified.certifi_message.img_one || $Verified.certifi_message.img_two || $Verified.certifi_message.img_three || (isset($Verified.certifi_message.img_four) && $Verified.certifi_message.img_four))}
							<p class="d-flex justify-content-between"><span>{$Lang.certificate_picture}: </span><span>{if ($Verified.certifi_message.img_one && $Verified.certifi_message.img_two)}{$Lang.uploaded}{else}{$Lang.not_uploaded}{/if}</span></p>
						{/if}
						<p class="d-flex justify-content-between"><span>{$Lang.authentication_type}: </span><span>{$Verified.certifi_message.type=="certifi_person" || $Think.get.status == 'closed' ? $Lang.personal_certification :$Lang.enterprise_certification}</span></p>
					</div>
					{if $Verified.certifi_message.type == 'certifi_person' || $Think.get.status == 'closed'}
					<a id="#go-enterprises" href="verified?action=enterprises&step=info" class="btn btn-primary mt-5 mb-5">{$Lang.goto_enterprise_certification}</a>
					{/if}
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 首页 -->
{elseif $Think.get.status == 'home' || $Verified.certifi_message.status == '0'}
<div class="card">
	<div class="card-body">
		<div class="row justify-content-center">
			<div class="col-md-10 col-sm-12">

				<div class="verified_not_certified">
					<div class="not_certified_title phonehide">
						{$Lang.not_name_authentication}
					</div>
					<div class="not_certified_text phonehide">
					{$Lang.chinese_people_method}
					</div>
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<div class="type-item">
								<div class="type-icon personal mb-4"></div>
								<div class="type-title">{$Lang.personal_certification}</div>
								<div class="type-desc">{$Lang.personal_card}</div>
								<ul class="list-unstyled type-info">
									<li><i class="fas fa-check-circle"></i> {$Lang.automatic_audit_instant_pass}</li>
									<li><i class="fas fa-check-circle"></i> {$Lang.upgrade_enterprise_user}</li>
								</ul>
								<a href="verified?action=personal&step=info" class="btn btn-primary btn-block waves-effect waves-light">{$Lang.certification_now}</a>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="type-item">
								<div class="type-icon enterprises mb-4"></div>
								<div class="type-title">{$Lang.enterprise_certification}</div>
								<div class="type-desc">{$Lang.business_license_corporation}</div>
								<ul class="list-unstyled type-info">
									<li><i class="fas fa-check-circle"></i> {$Lang.automatic_audit_instant_pass}</li>
									<li><i class="fas fa-check-circle"></i> {$Lang.application_enterprise_record}</li>
								</ul>
								<a href="verified?action=enterprises&step=info"
									class="btn btn-primary btn-block waves-effect waves-light">{$Lang.certification_now}</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- 未通过 -->
{elseif $Verified.certifi_message.status == '2'}
<div class="card ststus-box">
	<div class="card-body p-5">
		<div class="container-fluid mt-5">
			<div class="row">
				<div class="mx-auto pt-4 pb-5 col-sm-9 border d-flex flex-column justify-content-center align-items-center">
					<img class="mt-5" src="/themes/clientarea/yunyoo/assets_custom/img/Certification_fail.png" alt="">
					<h3 class="mt-4">{$Lang.authentication_failed}</h3>
					<span class="text-muet mt-2">{$Lang.real_authentication_failed}</span>
					<div class="mt-5 ">
						<p>{$Lang.reasons_failure}：{$Verified.certifi_message.auth_fail}</p>
					</div>
          <div class="mt-5 mb-5">
			  {if $PersonalCertifiStatus}
				  <a href="verified?action=enterprises&step=info" style="min-width:80px;" id="resubmit" class="btn btn-primary">{$Lang.re_submit}</a>
				  {else}
				  <a href="/verified?status=home" style="min-width:80px;" id="resubmit" class="btn btn-primary">{$Lang.re_submit}</a>
			  {/if}

					    <a href="/verified?status=closed" style="min-width:80px;border-color:#eaeaea;color:#adadad;" id="closedsubmit" class="btn btn-default ml-3">{$Lang.return}</a>
          </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 待审核 -->
{elseif $Verified.certifi_message.status == '3' || $Verified.plugin == 'artificial'}
<div class="card ststus-box">
	<div class="card-body p-5">
		<div class="container-fluid mt-5">
			<div class="row">
				<div class="mx-auto pt-4 pb-5 col-sm-9 border d-flex flex-column justify-content-center align-items-center">
					<img class="mt-5" src="/themes/clientarea/yunyoo/assets_custom/img/Certification_review.png" alt="">
					<h3 class="mt-4">{$Lang.under_review}</h3>
					<span class="text-muet mt-2">{$Lang.wait_for}</span>
					<div class="mt-5 mb-5">
						<p>{$Lang.member_id}：{$Verified.certifi_message.auth_user_id}</p>
						<p>{$Lang.real_name}: {$Verified.certifi_message.auth_real_name}</p>
						<p>{$Lang.id_number}: {$Verified.certifi_message.auth_card_number}</p>
						{if ($Verified.certifi_message.img_one || $Verified.certifi_message.img_two || $Verified.certifi_message.img_three || (isset($Verified.certifi_message.img_four) && $Verified.certifi_message.img_four))}
							<p>{$Lang.certificate_picture}: {if ($Verified.certifi_message.img_one || $Verified.certifi_message.img_two || $Verified.certifi_message.img_three || $Verified.certifi_message.img_four)}{$Lang.uploaded}{else}{$Lang.not_uploaded}{/if}</p>
						{/if}
						<p>{$Lang.authentication_type}: {$Verified.certifi_message.type=="certifi_person" ? $Lang.personal_certification :$Lang.enterprise_certification}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{/if}

{/if}
<!-- getModal 自定义body弹窗 -->
<div class="modal fade" id="customModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="customTitle">{$Lang.alipay_scan_code_real_name_authentication}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="customBody">

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary" id="customSureBtn">{$Lang.determine}</button>
			</div>
		</div>
	</div>
<!-- </div> -->
<script type="text/javascript" src="/themes/clientarea/yunyoo/assets/js/verified.js?v={$Ver}"></script>