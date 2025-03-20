

function addfundsBtn (_this) {
    $(_this).find('.addfunds-payment').addClass('active')
    $(_this).find('input[name="payment"]').prop('checked', true);
    $(_this).siblings('div').find('.addfunds-payment').removeClass('active').find('input[name="payment"]').prop('checked', false);
}

// function formSubmitBtn()
// {
//     beforeFormSubmitBtn(function(){
//         $("#pay .modal-body").html($('#loading-icon').html());
//         // e.preventDefault();
//         var amount = $('input[name=amount]').val();
//         var payment = $('input[name=payment]:checked').val();
//         var url = _url + '/pay?action=recharge';
//         $.ajax({
//             type: "POST",
//             data: { amount: amount, payment: payment },
//             url: url,
//             success: function (data) {
//                 $("#pay .modal-body").html(data);
//                 $('.pay').modal('show');
//             }
//         })
//     });
// }
function formSubmitBtn () {
    // e.preventDefault();
    let text = $('.pay-now-btn').text()
    $('.pay-now-btn').html('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"  style="color:#fff;"></i>' + text)
    var amount = $('input[name=amount]').val();
    var payment = $('input[name=payment]:checked').val();
    $.ajax({
        url: _url + '/pay?action=recharge'
        , data: { beforeCheck: 1, amount: amount, payment: payment }
        , type: 'post'
        , success: function (e) {
            if (e.status != undefined && (e.status == 400 || e.status == 406)) {
                var _html = '<div class="alert alert-danger alert-dismissible fade show beforecheck" role="alert">\n' +
                    '\t\t\t\t<i class="mdi mdi-block-helper mr-2"></i>\n' +
                    '\t\t\t\t<span class="msg-box">error:' + e.msg + '</span>\n' +
                    '\t\t\t\t<button type="button" class="close" data-dismiss="alert" aria-label="Close">\n' +
                    '\t\t\t\t\t<span aria-hidden="true">×</span>\n' +
                    '\t\t\t\t</button>\n' +
                    '\t\t\t</div>';
                $('.beforecheck-box').html(_html)
                //data-toggle="modal" data-target=".pay"
                $('#myModal').modal('hide');
                return false;
            }
            if (typeof (e) == 'object') {
                $("#pay .modal-body").html($('#loading-icon').html());
                return false;
            }
            $("#pay .modal-body").html(e);
            $('.pay').modal('show');
        }
    })
}

function checkOrder (invoiceid) {
    $.ajax({
        url: 'check_order',
        type: 'POST',
        data: { id: invoiceid },
        dataType: 'json',
        success: function (result) {

            if (result.status == '200') {

                layer.closeAll();
            }
        }
    });
}

// 充值金额最大最小值判断
function addfundsMaxMin () {
    if ($('#addfundsInp').val() < Number(min)) {
        $('#addfundsInp').val(min)
    }
    if ($('#addfundsInp').val() > Number(max)) {
        $('#addfundsInp').val(max)
    }
    // setTimeout(function(){
    //     if ($('#addfundsInp').val() < Number(min)) {
    //         $('#addfundsInp').val(min)
    //     }
    //     if ($('#addfundsInp').val() > Number(max)) {
    //         $('#addfundsInp').val(max)
    //     }
    // }, 1000);
}





