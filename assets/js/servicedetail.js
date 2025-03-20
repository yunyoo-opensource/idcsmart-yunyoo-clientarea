// 升降级商品
function upgradeProduct (_this, id) {
  if (!_this.data('submit')) {
    _this.prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
    _this.data('submit', 1);


    $('#modalUpgradeStepOne .modal-body').html($('#loading-icon').html());

    $('#modalUpgradeStepOne').modal('show');
    //let _this = $(this);
    var url = setting_web_url + '/servicedetail?id=' + id + '&action=upgrade_page';
    $.ajax({
      type: "GET",
      url: url,
      success: function (data) {
        _this.html('产品升降级');

        $('#modalUpgradeStepOne .modal-body').html(data);
        _this.removeData('submit')
      },
      error: function () {
        _this.html('产品升降级');
        _this.removeData('submit')
      }
    })
  }
}

// 升降级配置
function upgradeConfig (_this, id) {
  if (!_this.data('submit')) {
    _this.data('submit', 1);
    _this.prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
    // let _this = $(this);
    var url = setting_web_url + '/servicedetail?id=' + id + '&action=upgrade_configoption_page';
    $('#modalUpgradeConfigStepOne .modal-body').html($('#loading-icon').html());

    $('#modalUpgradeConfigStepOne').modal('show');
    $.ajax({
      type: "GET",
      url: url,
      success: function (data) {
       let iEle =  _this.children('.bx.bx-loader.bx-spin.font-size-16.align-middle.mr-2')
        iEle.remove();
     
        if (data.indexOf('form-group row configureproduct') == -1) {
          let text = '<h3>该商品无法配置升降级，如需配置升降级，请前往后台进行设置</h3>'
          $('#modalUpgradeConfigStepOne .modal-body').html(text);
        } else {
          $('#modalUpgradeConfigStepOne .modal-body').html(data);
        }
        //$('#modalUpgradeStepOne').modal('hide');
        //$('#upgradeConfigDiv').html(data);

        _this.removeData('submit')
      },
      error: function () {
        //_this.html('升降级配置');
        _this.removeData('submit')
      }
    })
  }
}

// 订购流量
function orderFlow (_this, id) {
  if (!_this.data('submit')) {
    _this.data('submit', 1);
    //let _this = $(this);
    var url = setting_web_url + '/servicedetail?id=' + id + '&action=flowpacket';
    $.ajax({
      type: "GET",
      url: url,
      success: function (data) {
        $('#orderFlowDiv').html(data);
        $('#modalOrderFlow').modal('show');
        _this.removeData('submit')
      },
      error: function () {
        _this.removeData('submit')
      }
    })
  }
}

// 续费
function renew (_this, id) {
  if (!_this.data('submit')) {
    _this.data('submit', 1);
    //let _this = $(this);
    var url = setting_web_url + '/servicedetail?id=' + id + '&action=renew';
    $.ajax({
      type: "GET",
      url: url,
      success: function (data) {
        $('#renewDiv').html(data);
        $('#modalRenew').modal('show');
        _this.removeData('submit')
      },
      error: function () {
        _this.removeData('submit')
      }
    })
  }
}

// 模块通用按钮, TODO 二次验证
function service_module_button (_this, id, host_data_type) {
  var func = _this.data('func');
  var type = _this.data('type');
  var desc = _this.data('desc');

  var postData = {
    id: id,
    func: func,
  };
  //var _this = $(this)
  if (type == 'default') {
    var url = setting_web_url + '/provision/default';
    if (func == 'reinstall') {
      // 重装次数验证
      if (host_data_type == 'dcimcloud' || host_data_type == 'dcim') {
        if (!_this.data('submit')) {
          _this.data('submit', 1);
          $.ajax({
            type: "POST",
            url: setting_web_url + '/dcim/check_reinstall',
            data: {
              id: id
            },
            success: function (res) {
              if (res.status == 200) {
                // 显示字
                if (typeof res.max_times != 'undefined' && res.max_times > 0) {
                  $("#moduleReinstallMsg").html('您本周免费重装次数<span style="color: rgb(47, 84, 234);"> ' + res.max_times + ' </span>次，已重装次数<span style="color: rgb(47, 84, 234);"> ' + res.num + ' </span>次，剩余<span style="color: rgb(47, 84, 234);"> ' + (res.max_times - res.num) + ' </span>次');
                } else {
                  $("#moduleReinstallMsg").html('');
                }
                $('#moduleReinstall').modal('show');
              } else if (res.status == 400 && typeof res.price !== 'undefined') {
                // TODO 购买重装次数
                getModalConfirm('您已达到本周最大免费重装次数，￥ ' + res.price + ' 元 / 次，是否需要？', function () {
                  buyReinstallTimes(id);
                });
              } else {
                toastr.error(res.msg);
              }
              _this.removeData('submit')
            },
            error: function () {
              _this.removeData('submit')
            }
          })
        }
      } else {
        $('#moduleReinstall').modal('show');
      }
      return;
    } else if (func == 'crack_pass') {
      $('#moduleResetPass input[name="password"]').val(createRandPassword(Number(passwordRules.len_num), Number(passwordRules.num), Number(passwordRules.upper), Number(passwordRules.lower), Number(passwordRules.special)));
      $('#moduleResetPass').modal('show');
      return;
    }else if(host_data_type == 'dcimcloud' && func == 'rescue_system'){
        $('#moduleDcimCloudRescue input[name="temp_pass"]').val(createRandPassword(Number(passwordRules.len_num), Number(passwordRules.num), Number(passwordRules.upper), Number(passwordRules.lower), Number(passwordRules.special)));
        $('#moduleDcimCloudRescue').modal('show');
        return ;
    }else {

    }
    let postFunc = function (type, code) {
      if (code) {
        postData.code = code;
      }
      $.ajax({
        type: "POST",
        url: url,
        data: postData,
        success: function (res) {
          if (res.status == 200) {
            if (typeof res.data != 'undefined' && typeof res.data.url != 'undefined') {
              window.open(res.data.url);
            } else {
              toastr.success(res.msg);
              refreashPowerStatusCycle(id)
            }
          } else {
            toastr.error(res.msg);
          }
          $('#secondVerifyModal').modal('hide')
          $('#confirmModal').modal('hide')
        }
      })
    }
    if (desc) {
      if (isNeedSecond(func)) {
        getSecondModal(func, function (type, code) {
          postFunc(type, code)
        })
      } else {
        getModalConfirm(desc, postFunc);
      }
    } else {
      if (isNeedSecond(func)) {
        getSecondModal(func, function (type, code) {
          postFunc(type, code)
        })
      } else {
        postFunc();
      }
    }
  } else {
    var url = setting_web_url + '/provision/custom/' + id;
    $.ajax({
      type: "POST",
      url: url,
      data: postData,
      success: function (res) {
        if (res.status == 200) {
          if (typeof res.data != 'undefined' && typeof res.data.url != 'undefined') {
            window.open(res.data.url);
          } else {
            toastr.success(res.msg);
            refreashPowerStatusCycle(id)
          }
        } else {
          toastr.error(res.msg);
        }
      }
    })

  }
}

// 重置密码提交
function moduleResetPass (_this) {
  
  if ($("#force")[0].checked) {
    $('#force-error-tip').css('display', 'none');
  } else {
    $("#force-error-tip").html('请勾选同意强制关机');
    $('#force-error-tip').css('display', 'block');
    return;
  }

  if (passwordRules) {
    let result = checkingPwd1($(".getPassword").val(), passwordRules.num, passwordRules.upper, passwordRules.lower, passwordRules.special)
    
    if (result.flag) {
      if (!_this.data('submit')) {
        var text = _this.html();
        _this.data('submit', 1)
        _this.prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
        //let _this = $(this);
        let tmpFunc = function (type, code) {
          $.ajax({
            type: "POST",
            url: setting_web_url + '/provision/default',
            data: $('#moduleResetPass form').serialize() + '&code=' + code,
            success: function (res) {
              _this.html(text);
              if (res.status == 200) {
                $('#moduleResetPass').modal('hide')
                toastr.success(res.msg);
                refreashPowerStatusCycle($('#moduleResetPass input[name="id"]').val())
              } else {
                toastr.error(res.msg);
              }
              // TODO 刷新电源状态
              _this.removeData('submit')
            },
            error: function () {
              _this.html(text);
              _this.removeData('submit')
            }
          })
        }
        if (isNeedSecond('crack_pass')) {
          $('#moduleResetPass').modal('hide');
          getSecondModal('crack_pass', function (type, code) {
            tmpFunc(type, code)
          })
          _this.removeData('submit')
        } else {
          tmpFunc()
        }
      }
    }
  } else {
    if (!_this.data('submit')) {
      _this.data('submit', 1);
      //let _this = $(this);
      let tmpFunc = function (type, code) {
        $.ajax({
          type: "POST",
          url: setting_web_url + '/provision/default',
          data: $('#moduleResetPass form').serialize() + '&code=' + code,
          success: function (res) {
            if (res.status == 200) {
              $('#moduleResetPass').modal('hide')
              toastr.success(res.msg);
              refreashPowerStatusCycle($('#moduleResetPass input[name="id"]').val())
            } else {
              toastr.error(res.msg);
            }
            // TODO 刷新电源状态
            _this.removeData('submit')
          },
          error: function () {
            _this.removeData('submit')
          }
        })
      }
      if (isNeedSecond('crack_pass')) {
        $('#moduleResetPass').modal('hide');
        getSecondModal('crack_pass', function (type, code) {
          tmpFunc(type, code)
        })
        _this.removeData('submit')
      } else {
        tmpFunc()
      }
    }
  }
}

// 随机密码
function create_random_pass () {
  $('#moduleResetPass input[name="password"]').val(createRandPassword(Number(passwordRules.len_num), Number(passwordRules.num), Number(passwordRules.upper), Number(passwordRules.lower), Number(passwordRules.special)));
  $('#dcimModuleResetPass input[name="password"]').val(createRandPassword(Number(passwordRules.len_num), Number(passwordRules.num), Number(passwordRules.upper), Number(passwordRules.lower), Number(passwordRules.special)));
  $('#dcimModuleReinstall input[name="password"]').val(createRandPassword(Number(passwordRules.len_num), Number(passwordRules.num), Number(passwordRules.upper), Number(passwordRules.lower), Number(passwordRules.special)));
  $('#moduleDcimCloudRescue input[name="temp_pass"]').val(createRandPassword(Number(passwordRules.len_num), Number(passwordRules.num), Number(passwordRules.upper), Number(passwordRules.lower), Number(passwordRules.special)));
}
// 20220301 删除%^
function createRandPassword (length, hasNum, hasUpper, hasLower, hasSpecial) {
  let num = '0123456789';
  let lower = 'abcdefghijklmnopqrstuvwxyz';
  let upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  let special = '~@#$&*(){}[]|';
  let tail = '';
  let all = '';
  let str = '';
  if (hasUpper == 1) {
    tail += upper[parseInt(Math.random() * 26)];
    all += upper;
  }
  if (hasLower == 1) {
    tail += lower[parseInt(Math.random() * 26)];
    all += lower;
  }
  if (hasNum == 1) {
    tail += num[parseInt(Math.random() * 10)];
    all += num;
  }
  if (hasSpecial == 1) {
    tail += special[parseInt(Math.random() * 15)];
    all += special;
  }
  for (let i = 0; i < length - tail.length; i++) {
    str += all[parseInt(Math.random() * all.length)];
  }
  str = str + tail;
  return str;
}
// /**
//  * 生成密码字符串
//  * 33~47：!~/
//  * 48~57：0~9
//  * 58~64：:~@
//  * 65~90：A~Z
//  * 91~96：[~`
//  * 97~122：a~z
//  * 123~127：{~
//  * @param length 长度
//  * @param hasNum 是否包含数字 1-包含 0-不包含
//  * @param hasUpper 是否包含大写字母 1-包含 0-不包含
//  * @param hasLower 是否包含小写字母 1-包含 0-不包含
//  * @param hasSpecial 是否包含特殊字符 1-包含 0-不包含
//  */
// function createRandPassword (length, hasNum, hasUpper, hasLower, hasSpecial) {
//   var pwd = ''
//   if (hasNum === 0 && hasUpper === 0 && hasLower === 0 && hasSpecial === 0) return pwd
//   for (var i = 0; i < length; i++) {
//     var num = Math.floor((Math.random() * 94) + 33)
//     if (((hasNum === 0) && ((num >= 48) && (num <= 57))) ||
//       ((hasUpper === 0) && ((num >= 65) && (num <= 90))) ||
//       ((hasLower === 0) && ((num >= 97) && (num <= 122))) ||
//       ((hasSpecial === 0) && (((num >= 33) && (num <= 47)) || ((num >= 58) && (num <= 64)) || ((num >= 91) && (num <= 96)) || ((num >= 123) && (num <= 127))))
//     ) {
//       i--
//       continue
//     }
//     pwd += String.fromCharCode(num)
//   }
//   return pwd
// }
// // 生成12随机密码
// function createRandPassword () {
//   let len_num = 12;
//   let has_upper = 1;
//   let has_lower = 1;
//   let has_num = 1;
//   let has_special = 0;
//   if (typeof password_rule === 'object') {
//     if (typeof password_rule.show != 'undefined' && password_rule.show == 1) {
//       len_num = password_rule.rule.len_num
//       // has_upper = password_rule.rule.upper
//       // has_lower = password_rule.rule.lower
//       // has_num = password_rule.rule.num
//       has_special = password_rule.rule.special
//     }
//   }
//   let num = '0123456789';
//   let lower = 'abcdefghijklmnopqrstuvwxyz';
//   let upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//   let special = '~@#$%^&*(){}[]|';
//   let tail = '';
//   let all = '';
//   let str = '';
//   if (has_upper == 1) {
//     tail += upper[parseInt(Math.random() * 26)];
//     all += upper;
//   }
//   if (has_lower == 1) {
//     tail += lower[parseInt(Math.random() * 26)];
//     all += lower;
//   }
//   if (has_num == 1) {
//     tail += num[parseInt(Math.random() * 10)];
//     all += num;
//   }
//   if (has_special == 1) {
//     tail += special[parseInt(Math.random() * 15)];
//     all += special;
//   }
//   for (let i = 0; i < len_num - tail.length; i++) {
//     str += all[parseInt(Math.random() * all.length)];
//   }
//   str = str + tail;
//   return str;
// }

// 重装切换分组
function moduleReinstallOsGroupChange (_this) {
  var group = _this.val();
  var osAll = $('#moduleReinstall select[name="os"]').data('os');
  var option = "";
  $.each(osAll, function (i, val) {
    if (val.group == group) {

      option += '<option value="' + val.id + '">' + val.name + '</option>';
    }
  })
  $('#moduleReinstall select[name="os"]').html(option);
  if (typeof group != 'undefined') {
    if (/win/i.test(group)) {
      $('#moduleReinstall input[name="port"]').val(3389)
    } else {
      $('#moduleReinstall input[name="port"]').val(22)
    }
  }



  /* let first;
   $.each(osAll,function(i,v){
       if(v.group == group){
           
       }
   });
   $('#moduleReinstall select[name="os"]').find('option').each(function(){
       if($(this).data('group') == group){
           if(!first){
               first = $(this)
           }
           $(this).show();
       }else{
           $(this).hide();
       }
   })
   $('#moduleReinstall select[name="os"]').find('option').removeAttr('selected');
   if(first) first.attr('selected', 'selected');
   // 操作系统类型是否变化
   let os = $('#moduleReinstall select[name="os"]').find('option:selected').text()
   if(typeof os != 'undefined'){
       if(/win/i.test(os)){
           $('#moduleReinstall input[name="port"]').val(3389)
       }else{
           $('#moduleReinstall input[name="port"]').val(22)
       }
   }*/
}

// 随机端口
function module_reinstall_random_port () {
  $('#moduleReinstall input[name="port"]').val(parseInt(Math.random() * 65535));
}

// 发起重装
function moduleReinstall (_this) {
  const reinstallAgreeCheckbox = document.getElementById("reinstallAgreeCheckbox"); // 输入框的验证提示
  if (!$('#moduleReinstallConfirm').prop('checked')) {
    reinstallAgreeCheckbox.innerHTML = "请勾选我已完成备份";
    return false;
  } else {
    reinstallAgreeCheckbox.innerHTML = "";
  }
  if (!_this.data('submit')) {
    _this.data('submit', 1);
    //let _this = $(this);

    let tmpFunc = function (type, code) {
      $.ajax({
        type: "POST",
        url: setting_web_url + '/provision/default',
        data: $('#moduleReinstall form').serialize() + '&code=' + code,
        success: function (res) {
         
          if (res.status == 200) {
            $('#moduleReinstall').modal('hide')
            toastr.success(res.msg);
            refreashPowerStatusCycle($('#moduleReinstall input[name="id"]').val())
            $('#secondVerifyModal').modal('hide')
          } else {
            toastr.error(res.msg);
            if (typeof res.price != 'undefined') {
              $('#moduleReinstall').modal('hide')
            }
          }
          // TODO 刷新电源状态
          _this.removeData('submit')
        },
        error: function () {
          _this.removeData('submit')
        }
      })
    }
    if (isNeedSecond('reinstall')) {
      $('#moduleReinstall').modal('hide');
      getSecondModal('reinstall', function (type, code) {
        tmpFunc(type, code)
      })
      _this.removeData('submit')
    } else {
      tmpFunc()
    }
  }
}

// 重装勾选
function reinstallConfirm (_this) {
  let val = _this.prop('checked')
  if (val) {
    const reinstallAgreeCheckbox = document.getElementById("reinstallAgreeCheckbox"); // 输入框的验证提示
    reinstallAgreeCheckbox.innerHTML = "";
    // $('#moduleReinstall .submit').removeClass('disabled');
    // $('#moduleReinstall .submit').css('cursor', 'pointer');
  } else {
    // $('#moduleReinstall .submit').addClass('disabled');
    // $('#moduleReinstall .submit').css('cursor', 'not-allowed');
  }

}

// 购买重装次数
function buyReinstallTimes (id) {
  $.ajax({
    url: setting_web_url + "/dcim/buy_reinstall_times",
    type: "POST",
    data: {
      id: id
    },
    success: function (res) {
      if (res.status == 200) {
        window.open(setting_web_url + "/viewbilling?id=" + res.data.invoiceid, "_blank");
      } else if (res.status == 1001) {
        toastr.success(res.msg)
      } else {
        toastr.error(res.msg)
      }
    },
    error: function () {

    }
  })
}

function getGeneralBilling (id, page) {
  var url = setting_web_url + '/servicedetail?action=billing_page&id=' + id;
  url += '&page=' + page;
  url += '&limit=' + $('#finance .billing-limit').val();
  $.ajax({
    url: url,
    type: 'GET',
    success: function (res) {
      $('#finance').html(res)
    }
  })
}

function getGeneralLog (id, page) {
  var url = setting_web_url + '/servicedetail?action=log_page&id=' + id;
  url += '&page=' + page;
  url += '&limit=' + $('#settings1 .log-limit').val();
  $.ajax({
    url: url,
    type: 'GET',
    success: function (res) {
      $('#settings1').html(res)
    }
  })
}

// 日志
function getLogList (id) {
  var tableDataHtml = ''
  $.ajax({
    type: "get",
    url: '/user_logdcims',
    data: {
      hid: id,
      // keywords: $('#transactionsearchInp').val()
    },
    success: function (data) {
      if (data.status != 200) return false
      data.data.log_list.forEach(function (item) {
        tableDataHtml += `
            <tr>
              <td>${moment(item.create_time * 1000).format('YYYY-MM-DD HH:m:s')}</td>
              <td>${item.description}</td>
              <td>${item.user}</td>
              <td>${item.ipaddr}</td>
            </tr>
          `
      })
      $('#logTableData').html(tableDataHtml)
    }
  });
}


// 交易记录
function getRechargeList (id) {
  var tableDataHtml = ''
  $.ajax({
    type: "get",
    url: '/host/hostrecharge',
    data: {
      hostid: id,
      keywords: $('#transactionsearchInp').val()
    },
    success: function (data) {
      if (data.status != 200) return false
      data.data.invoices.forEach(function (item) {
        tableDataHtml += `
              <tr>
                <td>${moment(item.pay_time * 1000).format('YYYY-MM-DD')}</td>
                <td>${item.type}</td>
                <td>${item.amount_in}</td>
                <td>${item.trans_id}</td>
                <td>${item.gateway}</td>
              </tr>
          `
      })
      $('#transactionTableData').html(tableDataHtml)
    }
  });
}

// 重置授权后 获取新数据
function getNewStatus (id) {
  $.ajax({
    type: "POST",
    url: setting_web_url + '/provision/default',
    data: { id: id, func: 'status' },
    success: function (data) {
      if (data.status != 200) {
        toastr.error(data.msg)
      } else {
        $('#ipAddress').text(data.data.ip || '-')
        $('#validDomain').text(data.data.domain)
        $('#validPath').text(data.data.installation_path)
      }
    }
  });
}

// 重置授权
function resetAuth (id) {
  $.ajax({
    type: "POST",
    url: setting_web_url + '/provision/button',
    data: { id: id, func: 'resetLicense' },
    success: function (data) {
      if (data.status !== 200) {
        toastr.error(data.msg)
        return
      }
      toastr.success(data.msg)

      location.reload()
    }
  });
}

function cancelStop (cancelType, id) {
  var des = ''
  if (cancelType != 'Immediate') {
    des = '您已选择到期时自动删除产品，当前可关闭停用设置，是否关闭？'
  } else {
    des = '您已选择立刻删除产品，当前可关闭停用设置，是否关闭？'
  }

  getModalConfirm(des, function () {
    $.ajax({
      url: setting_web_url + "/host/cancel",
      type: 'DELETE',
      data: {
        id: id
      },
      success: function (res) {
        if (res.status == 200) {
          toastr.success(res.msg)
          location.reload()
        } else {
          toastr.error(res.msg)
        }

      }

    })
  })
}

// 自动余额续费
function automaticRenewal (id) {
  var weburl = setting_web_url + '/host/autorenew'
  var hostid = id;
  var initiative_renew = $('#automaticRenewal').prop("checked") ? 1 : 0
  var obj = {
    hostid,
    initiative_renew
  }
  $.ajax({
    type: "POST",
    url: weburl,
    data: obj,
    success: function (data) {

      if (data.status !== 200) {
        toastr.error(data.msg)
        return
      }
      toastr.success(data.msg)
    }
  });
}

function getRenew () {
  $('.renew').modal('show')
}

// 按钮操作
function dcim_service_module_button (_this, id) {
  let func = _this.data('func')
  let des = _this.data('des')
  //let _this = $(this)
  if (des) {
    let postFunc = function (type, code) {
      $.ajax({
        url: setting_web_url + "/dcim/" + func,
        type: 'POST',
        dataType: 'json',
        data: {
          id: id,
          code: code
        },
        success: function (res) {
          if (res.status == 200) {
            toastr.success(res.msg)
            // TODO 刷新电源状态
            refreashPowerStatusCycle(id)
          } else {
            toastr.error(res.msg)
          }
          $('#secondVerifyModal').modal('hide')
          $('#confirmModal').modal('hide')
        }
      })
    }

    if (isNeedSecond(func)) {
      getSecondModal(func, function (type, code) {
        postFunc(type, code)
      })
    } else {
      getModalConfirm(des, postFunc);
    }
    // function postFunc () {
    //   function tmpFunc (type, code) {
    //     $.ajax({
    //       url: setting_web_url + "/dcim/" + func,
    //       type: 'POST',
    //       data: {
    //         id: id,
    //         code: code
    //       },
    //       success: function (res) {
    //         if (res.status == 200) {
    //           toastr.success(res.msg)
    //           // TODO 刷新电源状态
    //           refreashPowerStatusCycle(id)
    //         } else {
    //           toastr.error(res.msg)
    //         }
    //         $('#confirmModal').modal('hide')
    //       }
    //     })
    //   }
    //   if (isNeedSecond(func)) {
    //     getSecondModal(func, function (type, code) {
    //       tmpFunc(type, code)
    //     })
    //   } else {
    //     tmpFunc()
    //   }
    // }
    // getModalConfirm(des, postFunc)
  } else {
    // 重装
    if (func == 'reinstall') {
      $('#dcimModuleReinstall input[name="port"]').val(parseInt(Math.random() * 65535));
      $('#dcimModuleReinstall input[name="password"]').val(createRandPassword(Number(passwordRules.len_num), Number(passwordRules.num), Number(passwordRules.upper), Number(passwordRules.lower), Number(passwordRules.special)));
      $("#dcimModuleReinstall select[name='os']").trigger('change')
      $('#dcimModuleReinstall').modal('show')
    } else if (func == 'crack_pass') {
      $('#dcimModuleResetPass input[name="password"]').val(createRandPassword(Number(passwordRules.len_num), Number(passwordRules.num), Number(passwordRules.upper), Number(passwordRules.lower), Number(passwordRules.special)));
      $("#dcimModuleResetPass").modal('show')
    } else if (func == 'rescue') {
      $('#dcimModuleRescue').modal('show')
    } else if (func == 'kvm' || func == 'ikvm') {
      if (!_this.data('submit')) {
        _this.data('submit', 1)

        let tmpFunc = function (type, code) {
          $.ajax({
            url: setting_web_url + "/dcim/" + func,
            type: 'POST',
            data: {
              id: id,
              code: code
            },
            success: function (res) {
              if (res.status == 200) {
                //toastr.success(res.msg)
                window.open(setting_web_url + "/dcim/download?name=" + res.name + "&token=" + res.token, '_parent', 'width=200,height=100,menubar=no,toolbar=no');
                refreashPowerStatusCycle(id)
              } else {
                toastr.error(res.msg)
              }
              _this.removeData('submit')
            }
          })
        }
        if (isNeedSecond(func)) {
          getSecondModal(func, function (type, code) {
            tmpFunc(type, code)
          })
          _this.removeData('submit')
        } else {
          tmpFunc()
        }
      }
    } else if (func == 'vnc') {
      if (!_this.data('submit')) {
        _this.data('submit', 1)

        let tmpFunc = function (type, code) {
          $.ajax({
            url: setting_web_url + "/dcim/novnc",
            type: 'POST',
            data: {
              id: id,
              code: code
            },
            success: function (res) {
              _this.removeData('submit')
              if (res.status == 200) {
                //toastr.success(res.msg)
                window.open(setting_web_url + "/dcim/novnc?password=" + res.data.password + "&url=" + res.data.url + '&id=' + id + '&type=dcim', '_blank', 'width=1280,height=680,menubar=no,toolbar=no');
                refreashPowerStatusCycle(id)
              } else {
                toastr.error(res.msg)
              }
            }
          })
        }
        if (isNeedSecond('vnc')) {
          getSecondModal('vnc', function (type, code) {
            tmpFunc(type, code)
          })
          _this.removeData('submit')
        } else {
          tmpFunc()
        }
      }
    }
  }
}
var timeOut = null
var timeInterval = null
// 查询电源状态 3秒钟一次 两分钟清除
function refreashPowerStatusCycle (id) {
  // console.log('Cycle id: ', id);
  clearTimeout(timeOut)
  clearInterval(timeInterval)
  // 点击开启刷新状态  3s一次
  timeInterval = setInterval(() => {
    var result = getPowerStatus(id)
    if (result) {
      location.reload();
    }
  }, 3000)
  // 两分钟后结束掉刷新状态
  timeOut = setTimeout(() => {
    clearInterval(timeInterval)
  }, 60000 * 2)
}


function showPartTypeConfirm (old_os) {
  let part = $("#dcimModuleReinstall input[name='part_type']:checked").val()
  let os = $("#dcimModuleReinstall select[name='os']:selected").text()
  if (part == 1) {
    if (old_os && !/win/i.test(old_os) && /win/i.test(os)) {
      let content = '如从' + old_os + '重装为 ' + os + '，选择第一分区重装，将会导致安装失败';
      $('#dcimModuleReinstallPartMsg .part_error').html(content);
      $('#dcimModuleReinstallPartMsg').show();
    } else {
      $('#dcimModuleReinstallPartMsg .part_error').html('');
      $('#dcimModuleReinstallPartMsg').hide();
    }
  } else {
    $('#dcimModuleReinstallPartMsg .part_error').html('');
    $('#dcimModuleReinstallPartMsg').hide();
  }
}

function showDcimDisk () {
  let check = $("#dcimModuleReinstallHigh").prop('checked')
  if (!$("#dcimModuleReinstallHigh").is(':hidden')) {
    if (check) {
      $('#dcimModuleReinstallDisk').show();
    } else {
      $('#dcimModuleReinstallDisk').hide();
    }
  } else {
    $('#dcimModuleReinstallDisk').hide();
  }
}

// 获取重装/救援系统..进度显示
function getResintallStatus (id) {
  let func = function () {
    $.ajax({
      url: setting_web_url + "/dcim/resintall_status?id=" + id,
      type: 'GET',
      success: function (res) {
        if (res.status == 200) {
          if (typeof res.data != 'undefined' && typeof res.data.task_type != 'undefined') {
            let content = '取消重装';
            if (res.data.task_type == 1) {
              content = '取消救援';
            } else if (res.data.task_type == 2) {
              content = '取消破解'
            } else if (res.data.task_type == 3) {
              content = '取消获取'
            }
            $('#powerStatusIcon').removeClass()
            $('#powerStatusIcon').addClass('bx bx-loader')
            $('#powerStatusIcon').attr('data-content', res.data.step)
            // $('#powerBox').html('<span id="powerStatusIcon" class="bx bx-loader" data-toggle="popover" data-trigger="hover" title="" data-html="true" data-content="' + res.data.step + '" data-original-title></span>')
            $('#cancelDcimTask').text(content);
            $('#cancelDcimTask').show();
          } else {
            $('#cancelDcimTask').hide();
            clearInterval(getResintallStatusTimer);
          }
        } else {
          clearInterval(getResintallStatusTimer);
        }
      }
    })
  }
  getResintallStatusTimer = setInterval(function () {
    func();
  }, 3000)
}

// 选择其他用户
function dcimModuleResetPassOther (_this) {
  let check = _this.prop('checked');
  if (check) {
    $('#dcimModuleResetPassOtherUser').show();
  } else {
    $('#dcimModuleResetPassOtherUser input[name="user"]').val('')
    $('#dcimModuleResetPassOtherUser').hide();
  }
}

// 破解密码
function dcimModuleResetPass (_this, id) {
  let result = checkingPwd($(".getCrackPsd").val(), passwordRules.num, passwordRules.upper, passwordRules.lower, passwordRules.special)
  if (result.flag) {
    //let _this = $(this)
    if (!_this.data('submit')) {
      var text = _this.html();
      _this.data('submit', 1)
      _this.prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
      let tmpFunc = function (type, code) {
        let data = $('#dcimModuleResetPass form').serialize()
        if ($('#dcimModuleResetPassOther').prop('checked')) {
          data += '&other_user=1'
        } else {
          data += '&other_user=0'
        }
        if (code) {
          data += '&code=' + code;
        }
        $.ajax({
          url: setting_web_url + "/dcim/crack_pass",
          type: 'POST',
          data: data,
          success: function (res) {
            _this.html(text);
            _this.removeData('submit')
            if (res.status == 200) {
              $('#dcimModuleResetPass').modal('hide')
              toastr.success(res.msg)
              // getResintallStatus(id)预防页面刷新过程中唤起取消操作提示内容被刷新掉的情况
              refreashPowerStatusCycle(id)
            } else {
              toastr.error(res.msg)
            }
          },
          error: function () {
            _this.html(text);
            _this.removeData('submit')
          }
        })
      }
      if (isNeedSecond('crack_pass')) {
        $('#dcimModuleResetPass').modal('hide');
        getSecondModal('crack_pass', function (type, code) {
          tmpFunc(type, code)
        })
        _this.removeData('submit')
      } else {
        tmpFunc()
      }
    }
  }
}

// 救援系统
function dcimModuleRescue (_this, id) {
  //let _this = $(this)
  if (!_this.data('submit')) {
    _this.data('submit', 1)

    let tmpFunc = function (type, code) {
      $.ajax({
        url: setting_web_url + "/dcim/rescue",
        type: 'POST',
        data: $('#dcimModuleRescue form').serialize() + '&code=' + code,
        success: function (res) {
          _this.removeData('submit')
          if (res.status == 200) {
            $('#dcimModuleRescue').modal('hide')
            toastr.success(res.msg)
            // getResintallStatus(id); 预防页面刷新过程中唤起取消操作提示内容被刷新掉的情况
            refreashPowerStatusCycle(id)
          } else {
            toastr.error(res.msg)
          }
        },
        error: function () {
          _this.removeData('submit')
        }
      })
    }
    if (isNeedSecond('rescue')) {
      $('#dcimModuleRescue').modal('hide');
      getSecondModal('rescue', function (type, code) {
        tmpFunc(type, code)
      })
      _this.removeData('submit')
    } else {
      tmpFunc()
    }
  }
}

// 重装
function dcimModuleReinstall (_this, id) {
  if (!$('#dcimModuleReinstallConfirm').prop('checked')) {
    return false;
  }
  let result = checkingPwd($(".getRebuildPsd").val(), passwordRules.num, passwordRules.upper, passwordRules.lower, passwordRules.special)
  if (result.flag) {
    //let _this = $(this)
    if (!_this.data('submit')) {
      _this.data('submit', 1)

      let tmpFunc = function (type, code) {
        let data = $('#dcimModuleReinstall form').serialize()
        if (code) {
          data += '&code=' + code;
        }
        $.ajax({
          url: setting_web_url + "/dcim/reinstall",
          type: 'POST',
          data: data + '&check_disk_size=1',
          success: function (res) {
            _this.removeData('submit')
            if (res.status == 200) {
              $('#dcimModuleReinstall').modal('hide')
              toastr.success(res.msg)
              // getResintallStatus(id);预防页面刷新过程中唤起取消操作提示内容被刷新掉的情况
              refreashPowerStatusCycle(id)
            } else {
              if (typeof res.confirm != 'undefined' && res.confirm) {
                getModalConfirm('确定要重装...', function () {

                })
              } else if (typeof res.price != 'undefined' && res.price > 0) {
                // 唤起支付

              } else {
                toastr.error(res.msg)
              }
            }
          },
          error: function () {
            _this.removeData('submit')
          }
        })
      }
      if (isNeedSecond('reinstall')) {
        $('#dcimModuleReinstall').modal('hide');
        getSecondModal('reinstall', function (type, code) {
          tmpFunc(type, code)
        })
        _this.removeData('submit')
      } else {
        tmpFunc()
      }
    }
  }
}

if ($('.configoption_os_group')) {
  dcimModuleReinstallOsGroup($('.configoption_os_group'))
}
function dcimModuleReinstallOsGroup (_this) {
  var group = _this.val();
  var osAll = $('#dcimModuleReinstall select[name="os"]').data('os');
  var option = "";
  $.each(osAll, function (i, val) {
    if (val.group == group) {

      option += '<option value="' + val.id + '">' + val.name + '</option>';
    }
  })
  $('#dcimModuleReinstall select[name="os"]').html(option);
  if (typeof group != 'undefined') {
    if (/win/i.test(group)) {
      $('#dcimModuleReinstall input[name="port"]').val(3389)
    } else {
      $('#dcimModuleReinstall input[name="port"]').val(22)
    }
  }
  $('#dcimModuleReinstall select[name="os"]').trigger('change')
  /*var group = _this.val();
  let first;
  $('#dcimModuleReinstall select[name="os"]').find('option').each(function () {
    if ($(this).data('group') == group) {
      if (!first) {
        first = $(this)
      }
      $(this).show();
    } else {
      $(this).hide();
    }
  })
  $('#dcimModuleReinstall select[name="os"]').find('option').removeAttr('selected');
  if (first) {
    first.attr('selected', 'selected');
  }
  $('#dcimModuleReinstall select[name="os"]').trigger('change')*/
}

function dcimModuleReinstallOs (_this, old_os) {
  var os = _this.find('option:selected').text();
  if (/win/i.test(os) && os.indexOf('2003') == -1) {
    $('#dcimModuleReinstallPart').show();
  } else {
    $('#dcimModuleReinstallPart').hide();
  }
  if (/win/i.test(os) && os.indexOf('2003') !== -1) {
    $('#dcimModuleReinstallPartInfo').hide();
  } else {
    $('#dcimModuleReinstallPartInfo').show();
  }
  showPartTypeConfirm(old_os);
  showDcimDisk();
  reinstallPartInfoChange();
  dcimModuleReinstallPartInfoConfig();
}

function dcimReinstallConfirm (_this) {
  let val = _this.prop('checked')
  if (val) {
    $('#dcimModuleReinstall .submit').removeClass('disabled');
    $('#dcimModuleReinstall .submit').css('cursor', 'pointer');
  } else {
    $('#dcimModuleReinstall .submit').addClass('disabled');
    $('#dcimModuleReinstall .submit').css('cursor', 'not-allowed');
  }
}

function cancelDcimTask (id) {
  getModalConfirm('取消获取操作进度吗？', function () {
    $.ajax({
      url: setting_web_url + "/dcim/cancel_task",
      type: "POST",
      data: {
        id: id
      },
      success: function (res) {
        if (res.status == 200) {
          toastr.success(res.msg)
          $('#cancelDcimTask').hide();
          $('#confirmModal').modal('hide')
          clearInterval(getResintallStatusTimer);
          dcimGetPowerStatus(id);
        } else {
          toastr.error(res.msg)
        }
      }
    })
  })
}

// 获取电源状态
function getPowerStatus (id) {
  // console.log('getPowerStatus id: ', id);

  $('#powerStatusIcon').removeClass()
  $('#powerStatusIcon').addClass('bx bx-loader')

  $.ajax({
    type: "POST",
    url: setting_web_url + '/provision/default',
    data: {
      id: id,
      func: 'status'
    },
    success: function (data) {
      $('#powerStatusIcon').attr('data-content', data.data ? data.data.des : data.msg)
      $('#powerStatusIcon').removeClass()
      if (data.status != 200) {
        powerStatus.status = 'unknown'
        powerStatus.des = data.msg
        $('#powerStatusIcon').addClass('sprite unknown')
        return 0;
      } else {
        powerStatus.status = data.data ? data.data.status : 'unknown'
        powerStatus.des = data.data ? data.data.des : '未知'
        // 

        $('#moduleDcimCloudRescueForceDiv').hide();
        $('#moduleDcimCloudRescueForceDiv').removeClass('force_show');
        if (powerStatus.status === 'process') {
          $('#powerStatusIcon').addClass('bx bx-loader')
          $('#moduleDcimCloudRescueForceDiv').show();
          $('#moduleDcimCloudRescueForceDiv').addClass('force_show');
        } else if (powerStatus.status === 'on') {
          $('#powerStatusIcon').addClass('sprite start')
          $('#moduleDcimCloudRescueForceDiv').show();
          $('#moduleDcimCloudRescueForceDiv').addClass('force_show');
        } else if (powerStatus.status === 'off') {
          $('#powerStatusIcon').addClass('sprite closed')
        } else if (powerStatus.status === 'waiting') {
          $('#powerStatusIcon').addClass('sprite waitOn')
        } else if (powerStatus.status === 'suspend') {
          $('#powerStatusIcon').addClass('sprite pause')
        } else if (powerStatus.status === 'wait_reboot' || powerStatus.status === 'wait') {
          $('#powerStatusIcon').addClass('sprite waiting')
        } else if (powerStatus.status === 'cold_migrate') {
          $('#powerStatusIcon').addClass('iconfont icon-shujuqianyi')
        } else if (powerStatus.status === 'hot_migrate') {
          $('#powerStatusIcon').addClass('iconfont icon-shujuqianyi')
        } else {
          $('#powerStatusIcon').addClass('sprite unknown')
        }

        if (data.data.status !== 'process') { // 状态改变, 清除定时器
          if (timeInterval) {
            location.reload();
          }
          clearInterval(timeInterval)
        }

      }

    }
  });
}

//DCIM获取电源状态
function dcimGetPowerStatus (id) {

  $('#powerStatusIcon').removeClass()
  $('#powerStatusIcon').addClass('bx bx-loader')

  $.ajax({
    type: "POST",
    url: setting_web_url + '/dcim/refresh_all_power_status',
    data: { id: id },
    success: function (data) {
      if (data.status != 200) {
        toastr.error(data.msg)
        $('#powerStatusIcon').attr('data-content', data.msg)
        $('#powerStatusIcon').removeClass()
        $('#powerStatusIcon').addClass('sprite unknown')
      } else {
        powerStatus = data.data[0]
        // 
        $('#powerStatusIcon').attr('data-content', powerStatus.msg)
        $('#powerStatusIcon').removeClass()
        if (powerStatus.status === 'process') {
          $('#powerStatusIcon').addClass('bx bx-loader')
        } else if (powerStatus.status === 'on') {
          $('#powerStatusIcon').addClass('sprite start')
        } else if (powerStatus.status === 'off') {
          $('#powerStatusIcon').addClass('sprite closed')
        } else if (powerStatus.status === 'waiting') {
          $('#powerStatusIcon').addClass('sprite waitOn')
        } else if (powerStatus.status === 'suspend') {
          $('#powerStatusIcon').addClass('sprite pause')
        } else if (powerStatus.status === 'wait_reboot' || powerStatus.status === 'wait') {
          $('#powerStatusIcon').addClass('sprite waiting')
        } else if (powerStatus.status === 'cold_migrate') {
          $('#powerStatusIcon').addClass('iconfont icon-shujuqianyi')
        } else if (powerStatus.status === 'hot_migrate') {
          $('#powerStatusIcon').addClass('iconfont icon-shujuqianyi')
        } else {
          $('#powerStatusIcon').addClass('sprite unknown')
        }
        if (data.data.status !== 'process') { // 状态改变, 清除定时器
          clearInterval(timeInterval)
        }
      }

    }
  });
}


// 服务器内页 修改备注 
function modifyRemarkSubmit (serverid) {
  $.ajax({
    type: "POST",
    url: '/host/remark',
    data: {
      id: serverid,
      remark: $('#remarkInp').val()
    },
    dataType: "json",
    success: function (data) {
      toastr.success(data.msg);
      $('#modifyRemarkModal').modal('hide')
      location.reload()
    }
  });
}

function moduleDownloadStr (filename, content) {
  try {
    var blob = new Blob([content], {
      type: "text/plain;charset=utf-8"
    });

    saveAs(blob, filename);
  } catch (e) {
    var element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(content));
    element.setAttribute('download', filename);

    element.style.display = 'none';
    document.body.appendChild(element);

    element.click();
    document.body.removeChild(element);
  }
}
/*
  正则匹配验证密码规则
  val：校验的值
  num：数字
  capital：大写字母
  lowercase：小写字母
  character： 特殊字符
  minLength：最小长度
  maxLength： 最大长度
*/
function checkingPwd (val, num, capital, lowercase, character, minLength = 6, maxLength = 20) {
  let checkNum = /.*[0-9]{1,}.*/; // 判断是否包含数字
  let checkCapital = /.*[a-z]{1,}.*/ // 判断是否包含小写字母
  let checkLc = /.*[A-Z]{1,}.*/ // 判断是否包含大写字母
  let checkCharacter = /[`~!@#$%^&*()_\-+=<>?:"{}|,.\/;'\\[\]·~！@#￥%……&*（）——\-+={}|《》？：“”【】、；‘'，。、]/ //判断是否包含特殊字符
  let msg = '密码由 ' // 提示语句
  let result = {}
  let flagNum = false, flagCap = false, flagLow = false, flagSpec = false;

  if (val.length < minLength) {
    console.log("密码最短" + minLength + "位");
    result.msg = "密码最短" + minLength + "位 "
    result.flag = false
    return result
  }
  if (val.length > maxLength) {
    console.log("密码最长" + maxLength + "位");
    result.msg = "密码最长" + maxLength + "位 "
    result.flag = false
    return result
  }
  if (parseInt(num)) {
    msg += '数字 '
    if (!checkNum.test(val)) {
      console.log("缺少数字");
      flagNum = false
    } else {
      console.log("有数字，正确！")
      flagNum = true
    }
  } else {
    if (checkNum.test(val)) {
      console.log("不应该有数字");
      flagNum = false
    } else {
      console.log("没有数字，正确！")
      flagNum = true
    }
  }
  if (parseInt(lowercase)) {
    msg += '小写字母 '
    if (!checkCapital.test(val)) {
      console.log("缺少小写字母");
      flagLow = false
    } else {
      console.log("有小写字母，正确！")
      flagLow = true
    }
  } else {
    if (checkCapital.test(val)) {
      console.log("不应该有小写字母");
      flagLow = false
    } else {
      console.log("没有小写字母，正确！")
      flagLow = true
    }
  }
  if (parseInt(capital)) {
    msg += '大写字母 '
    if (!checkLc.test(val)) {
      console.log("缺少大写字母");
      flagCap = false
    } else {
      console.log("有大写字母，正确！")
      flagCap = true
    }
  } else {
    if (checkLc.test(val)) {
      console.log("不应该有大写字母");
      flagCap = false
    } else {
      console.log("没有大写字母，正确！")
      flagCap = true
    }
  }
  if (parseInt(character)) {
    msg += '特殊字符 '
    if (!checkCharacter.test(val)) {
      console.log("缺少特殊字符");
      flagSpec = false
    } else {
      console.log("有特殊字符，正确！")
      flagSpec = true
    }
  } else {
    if (checkCharacter.test(val)) {
      console.log("不应该有特殊字符");
      flagSpec = false
    } else {
      console.log("没有特殊字符，正确！")
      flagSpec = true
    }
  }

  result.msg = msg + ' 组成'
  result.flag = flagNum && flagCap && flagLow && flagSpec
  return result
}
/*
  正则匹配验证密码规则
  val：校验的值
  num：数字
  capital：大写字母
  lowercase：小写字母
  character： 特殊字符
  minLength：最小长度
  maxLength： 最大长度
  去掉了^和%的验证
*/
function checkingPwd1 (val, num, capital, lowercase, character, minLength = 6, maxLength = 20) {
  let checkNum = /.*[0-9]{1,}.*/; // 判断是否包含数字
  let checkCapital = /.*[a-z]{1,}.*/ // 判断是否包含小写字母
  let checkLc = /.*[A-Z]{1,}.*/ // 判断是否包含大写字母
  let checkCharacter = /[`~!@#$&^%*()_\-+=<>?:"{}|,.\/;'\\[\]·~！@#￥……&*（）——\-+={}|《》？：“”【】、；‘'，。、]/ //判断是否包含特殊字符
  let noSomeReg = /[\^%]+/ //是否包含^和%
  let msg = '密码由 ' // 提示语句
  let result = {}
  let flagNum = false, flagCap = false, flagLow = false, flagSpec = false;

  if (val.length < minLength) {
    console.log("密码最短" + minLength + "位");
    result.msg = "密码最短" + minLength + "位 "
    result.flag = false
    return result
  }
  if (val.length > maxLength) {
    console.log("密码最长" + maxLength + "位");
    result.msg = "密码最长" + maxLength + "位 "
    result.flag = false
    return result
  }
  if (parseInt(num)) {
    msg += '数字 '
    if (!checkNum.test(val)) {
      console.log("缺少数字");
      flagNum = false
    } else {
      console.log("有数字，正确！")
      flagNum = true
    }
  } else {
    if (checkNum.test(val)) {
      console.log("不应该有数字");
      flagNum = false
    } else {
      console.log("没有数字，正确！")
      flagNum = true
    }
  }
  if (parseInt(lowercase)) {
    msg += '小写字母 '
    if (!checkCapital.test(val)) {
      console.log("缺少小写字母");
      flagLow = false
    } else {
      console.log("有小写字母，正确！")
      flagLow = true
    }
  } else {
    if (checkCapital.test(val)) {
      console.log("不应该有小写字母");
      flagLow = false
    } else {
      console.log("没有小写字母，正确！")
      flagLow = true
    }
  }
  if (parseInt(capital)) {
    msg += '大写字母 '
    if (!checkLc.test(val)) {
      console.log("缺少大写字母");
      flagCap = false
    } else {
      console.log("有大写字母，正确！")
      flagCap = true
    }
  } else {
    if (checkLc.test(val)) {
      console.log("不应该有大写字母");
      flagCap = false
    } else {
      console.log("没有大写字母，正确！")
      flagCap = true
    }
  }
  if (parseInt(character)) {
    msg += '特殊字符 且不含^%'
    if (!checkCharacter.test(val)) {
      console.log("缺少特殊字符");
      flagSpec = false
    } else {
      console.log("有特殊字符，正确！")
      flagSpec = true
    }

    if (noSomeReg.test(val)) {
      console.log('包含^%');
      flagSpec = false
    } else {
      console.log('不包含^%');
      flagSpec = true
    }
  } else {
    if (checkCharacter.test(val)) {
      console.log("不应该有特殊字符");
      flagSpec = false
    } else {
      console.log("没有特殊字符，正确！")
      flagSpec = true
    }
  }

  result.msg = msg + ' 组成'
  result.flag = flagNum && flagCap && flagLow && flagSpec
  return result
}
function reinstallPartInfoChange () {
  // let val = $('#dcimModuleReinstallPartInfo input[name="action"]:checked').val();
  // if(val == 1){
  //   if($('#dcimModuleReinstallPartInfo').is(':hidden')){
  //     $('#dcimModuleReinstallPartSetting').hide();
  //   }else{
  //     $('#dcimModuleReinstallPartSetting').show();
  //   }
  // }else{
  //   $('#dcimModuleReinstallPartSetting').hide();
  //   $('#dcimModuleReinstallPartSetting select[name="mcon"]').val(0)
  // }
}

function dcimModuleReinstallPartInfoConfig () {
  // var os = $('#dcimModuleReinstall select[name="os"]').val()
  // var config = $('#dcimModuleReinstallPartSetting').data('data');
  // var option = "<option value='0'>无可用附加分区配置</option>";
  // if(config){
  //   $.each(config, function (i, val) {
  //   if (val.osname == os) {
  //     option += '<option value="' + val.id + '">' + val.name + '</option>';
  //   }
  // })
  // }
  // $('#dcimModuleReinstallPartSetting select[name="mcon"]').html(option);
}

// 魔方云救援系统
function moduleDcimCloudRescue (_this) {
  if($('#moduleDcimCloudRescueForceDiv').hasClass('force_show')){
    if ($("#moduleDcimCloudRescue input[name=force]").prop('checked')) {
      $('#moduleDcimCloudRescue .force-error-tip').css('display', 'none');
    } else {
      $("#moduleDcimCloudRescue .force-error-tip").html('请勾选同意强制关机');
      $('#moduleDcimCloudRescue .force-error-tip').css('display', 'block');
      return;
    }
  }

  if (passwordRules) {
    let result = checkingPwd1($("#moduleDcimCloudRescue input[name='temp_pass']").val(), passwordRules.num, passwordRules.upper, passwordRules.lower, passwordRules.special)
    
    if (result.flag) {
      if (!_this.data('submit')) {
        var text = _this.html();
        _this.data('submit', 1)
        _this.prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
        //let _this = $(this);
        let tmpFunc = function (type, code) {
          $.ajax({
            type: "POST",
            url: setting_web_url + '/provision/default',
            data: $('#moduleDcimCloudRescue form').serialize(),
            success: function (res) {
              _this.html(text);
              if (res.status == 200) {
                $('#moduleDcimCloudRescue').modal('hide')
                toastr.success(res.msg);
                refreashPowerStatusCycle($('#moduleDcimCloudRescue input[name="id"]').val())
              } else {
                toastr.error(res.msg);
              }
              // TODO 刷新电源状态
              _this.removeData('submit')
            },
            error: function () {
              _this.html(text);
              _this.removeData('submit')
            }
          })
        }
        if (isNeedSecond('crack_pass')) {
          $('#moduleDcimCloudRescue').modal('hide');
          getSecondModal('rescue', function (type, code) {
            tmpFunc(type, code)
          })
          _this.removeData('submit')
        } else {
          tmpFunc()
        }
      }
    }
  } else {
    if (!_this.data('submit')) {
      _this.data('submit', 1);
      //let _this = $(this);
      let tmpFunc = function (type, code) {
        $.ajax({
          type: "POST",
          url: setting_web_url + '/provision/default',
          data: $('#moduleResetPass form').serialize() + '&code=' + code,
          success: function (res) {
            if (res.status == 200) {
              $('#moduleResetPass').modal('hide')
              toastr.success(res.msg);
              refreashPowerStatusCycle($('#moduleResetPass input[name="id"]').val())
            } else {
              toastr.error(res.msg);
            }
            // TODO 刷新电源状态
            _this.removeData('submit')
          },
          error: function () {
            _this.removeData('submit')
          }
        })
      }
      if (isNeedSecond('rescue')) {
        $('#moduleResetPass').modal('hide');
        getSecondModal('rescue', function (type, code) {
          tmpFunc(type, code)
        })
        _this.removeData('submit')
      } else {
        tmpFunc()
      }
    }
  }
}
