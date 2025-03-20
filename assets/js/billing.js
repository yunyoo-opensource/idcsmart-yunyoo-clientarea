
init();
function init () {
    $('#statusSel').val(status)

}
function payamount (invoiceid, use_credit_limit) {
    $("#pay .modal-body").html($('#loading-icon').html());
    $('.pay').modal('show');
    var url = _url + '/pay?action=billing';
    $.ajax({
        type: "POST",
        data: { invoiceid: invoiceid, use_credit_limit: use_credit_limit },
        url: url,
        success: function (data) {

            // $("#"+invoiceid).siblings("#pay").find(".modal-body").html(data);
            // $("#"+invoiceid).siblings("#pay").find("#myLargeModalLabel").html('账单 - '+invoiceid);
            // $("#"+invoiceid).siblings("#pay").find(".pay").modal('show');
            $("#pay .modal-body").html(data);
            $('.pay').modal('show');
        }
    })
}

function combineBtn () {
    var checkedArr = []
    $('.row-checkbox:checked').each(function () {
        checkedArr.push($(this).data('value'))
    })
    $.ajax({
        url: _url + '/get_combine_invoices',
        method: 'GET',
        data: { ids: checkedArr },
        success (data) {
            data = data.data
            if (data.count >= 2) {
                $('#readBtn').removeAttr('disabled').removeClass('not-allowed');
                $('#pay-combine').text('您有' + data.count + '笔账单未支付,总金额￥' + data.total + '元')
            } else {
                $('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
                $('#pay-combine').text('请选择2笔及以上的未支付账单')
            }
        }
    })
}

function headCheckboxAll (_this) {
    // 表格多选
    $('.row-checkbox').prop("checked", $(_this).is(':checked'))
    if ($('.row-checkbox:checked').length) {
        $('#readBtn').removeAttr('disabled').removeClass('not-allowed');
    } else {
        $('#readBtn').attr('disabled', 'disabled').addClass('not-allowed');
    }
    combineBtn()
}

function rowCheckbox (_this) {

    // if($(_this).is(':checked')){
    //     $(_this).parent().append("<input type='hidden' class='value-s'  name="+$(_this).data('name')+" value='"+$(_this).data('value')+"'>")
    // }else{
    //     $(_this).parent().children(".value-s").remove()
    // }
    combineBtn()
}


function prepayment () {
    var url = _url + '/credit_limit/prepayment';
    $.ajax({
        type: "POST",
        data: {},
        url: url,
        success: function (data) {
            if (data.status !== 200) {
                toastr.error(data.msg)
            } else {
                // 会返回账单id，之后就是付款逻辑，付款不允许信用额支付
                payamount(data.invoiceid)
            }
        }
    })
}