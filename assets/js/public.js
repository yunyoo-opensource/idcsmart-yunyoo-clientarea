
//获取验证码
var timer;// 设置倒计时
function getCode(getCodeBtn,url,code_captcha){   
	if(!url) return false;
	if($(getCodeBtn).data("disabled")) return false;
	if(url=="register_email_send"){
        formdata = { mk: mk, email: $('#emailInp').val(), captcha: $('#captcha_allow_register_email_captcha').val() }
	}else if(url=="register_phone_send"){
		formdata = { mk: mk, phone: $('#phoneInp').val(), phone_code: $('#phoneCodeSel').val(),captcha: $('#captcha_allow_register_phone_captcha').val() }
	}else if(url=="login_send"){
		formdata = { mk: mk, phone: $('#phoneInp').val(), phone_code: $('#phoneCodeSel').val(),captcha: $('#captcha_allow_login_code_captcha').val() }
	}else if(url=="login/second_verify_send"){
		var secondVerifyType=$("#secondVerifyType").val();
		formdata = { action: "login", "username":$("input[name='"+secondVerifyType+"']").val(),"password":$("#"+secondVerifyType+" input[name='password']").val(),type: secondVerifyType}
	}else if(url=="reset_phone_send"){
		formdata = { mk: mk, phone: $('#phoneInp').val(), phone_code: $('#phoneCodeSel').val(),captcha: $('#captcha_allow_phone_forgetpwd_captcha').val() }
	}else if(url=="reset_email_send"){
		formdata = { mk: mk, email: $('#emailInp').val(),captcha: $('#captcha_allow_email_forgetpwd_captcha').val() }
	}else if(url=="oauth/bind_phone_send"){
		formdata = { mk: mk, phone: $('#phoneInp').val(), phone_code: $('#phoneCodeSel').val(),captcha: $('#captcha_allow_register_phone_captcha').val() }
	}else if(url=="oauth/bind_email_send"){
		formdata = { mk: mk, email: $('#emailInp').val(), captcha: $('#captcha_allow_register_email_captcha').val() }
	}
	$(getCodeBtn).data("disabled",true); 
    $.ajax({
        type: "POST",
        url: url,
        data: formdata,
        dataType: "json",
        success: function (res) {
            if (res.status !== 200) {
                $(getCodeBtn).text('获取验证码')
                clearInterval(timer)
                toastr.error(res.msg)
				if(code_captcha) getVerify(code_captcha)
				$(getCodeBtn).removeData("disabled");	
            } else {
                setCutdown(getCodeBtn)
                toastr.success(res.msg)
            }
			
        },
        error: function (e) {
            toastr.error(res.msg)
			if(code_captcha) getVerify(code_captcha)
        }
    });
}
function setCutdown(getCodeBtn){
    clearInterval(timer)
    var seconds = 60
    timer = setInterval( function(){
        if (seconds == 0) {
            $(getCodeBtn).text('获取验证码')
            $(getCodeBtn).removeAttr('disabled')
            $(getCodeBtn).removeData("disabled");
            clearInterval(timer)
            return
        }
        seconds--
        $(getCodeBtn).text(seconds + 's后重试')
        $(getCodeBtn).attr('disabled', 'disabled')
        $(getCodeBtn).data("disabled",true);
    }, 1000);
}
//二次验证模态框
function loginBefore(loginType){	
	$.get("login/second_verify_page",{"username":$("input[name='"+loginType+"']").val(),"password":$("#"+loginType+" input[name='password']").val(),"captcha":$("#"+loginType+" input[name='captcha']").val()},function(res){
		if(res.status==200){
			$('#secondVerifyModal').modal('show');
			var option='';
			$.each(res.data.allow_type,function(i,v){
				//if(loginType==v.name)
					option+='<option value="'+v.name+'">'+v.name_zh+':'+v.account+'</option>';
			});
			$("#secondVerifyModal select").html(option);
		}else{
			toastr.error(res.msg);
		}
	},'json');
}
//二次验证提交数据
$(function(){
	$('#secondVerifySubmit').on('click', function () {
		$('#'+$("#secondVerifyType").val()+" form")
		.append($('<input type="hidden" name="code" value="'+ $("#secondVerifyCode").val() +'">'))
		.append($('<input type="hidden" name="code_type" value="'+ $("#secondVerifyType").val() +'">'))
		.submit();
	});
});
//收验证码和密码切换

function phoneCheck(button,phone){
	if(button) $(button).hide().siblings().show();
	if(phone=="allow_login_phone_captcha"){
		$("#phone form").attr("action","/login?action=phone_code");
		$(".allow_login_phone_captcha").hide();
		$(".allow_login_phone_captcha input").attr("disabled","disabled");
		$(".allow_login_code_captcha").show();
		$(".allow_login_code_captcha input").removeAttr("disabled");
	}else if(phone=="allow_login_code_captcha"){
		$("#phone form").attr("action","/login?action=phone");
		$(".allow_login_code_captcha").hide();
		$(".allow_login_code_captcha input").attr("disabled","disabled");
		$(".allow_login_phone_captcha").show();
		$(".allow_login_phone_captcha input").removeAttr("disabled");
	}
}

  //获取验证码
function getVerify(type,id){
$.ajax({
  url: setting_web_url +'/verify',
		type: 'GET',
  xhrFields: { responseType: "arraybuffer" },
  data: {name:type},
  success(data){
	var isCaptcha = false
	//转换图片数据
	var str = String.fromCharCode.apply(null, new Uint8Array(data))
	if (str.indexOf('400') !== -1) {
	  isCaptcha = false
	} else {
	  isCaptcha = true
	  var imgUrl = 'data:image/png;base64,' + btoa(new Uint8Array(data).reduce((data, byte) => data + String.fromCharCode(byte), ''))
	  $('#'+type).attr('src',imgUrl);
	  $('#'+type+id).attr('src',imgUrl);
	}
  }
})
}