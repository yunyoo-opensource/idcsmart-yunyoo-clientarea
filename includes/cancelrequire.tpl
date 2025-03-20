<style>
  .w-100{
    width: 100%;
  }
</style>
<div class="modal fade cancelrequire" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title mt-0" id="myLargeModalLabel">{$Lang.out_service}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <input type="hidden" value="{$Token}" />
          <input type="hidden" name="id" value="{$Detail.host_data.id}" />

          <div class="form-group row mb-4">
            <label class="col-3 col-form-label text-right">{$Lang.cancellation_time}</label>
            <div class="col-8">
              <select class="form-control second_type w-100"  name="type">
                <option value="Immediate">{$Lang.immediately}</option>
                <option value="Endofbilling">{$Lang.cycle_end}</option>
              </select>
            </div>
          </div>

          <div class="form-group row mb-4">
            <label class="col-3 col-form-label text-right">{$Lang.reason_cancellation}</label>
            <div class="col-8">
              <select class="form-control second_type w-100" name="temp_reason">
                {foreach $Cancel.cancelist as $item}
                <option value="{$item.reason}">{$item.reason}</option>
                {/foreach}
                <option value="other">{$Lang.other}</option>
              </select>
            </div>
          </div>

          <div class="form-group row mb-4" style="display:none;">
            <label class="col-3 col-form-label text-right"></label>
            <div class="col-8">
              <textarea class="form-control" maxlength="225" rows="3" placeholder="{$Lang.please_reason}" name="reason"
                value="{$Cancel.cancelist[0]['reason']}"></textarea>
            </div>
          </div>

        </form>

        <div class="modal-footer">
          <button type="button" class="btn btn-primary waves-effect waves-light" onClick="cancelrequest()">{$Lang.submit}</button>
          <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">{$Lang.cancel}</button>

        </div>

      </div>
    </div>
  </div>
</div>



<script>

  var WebUrl = '/';
  $('.cancelrequire textarea[name="reason"]').val($('.cancelrequire select[name="temp_reason"]').val())
  $('.cancelrequire select[name="temp_reason"]').change(function () {
    if ($(this).val() == "other") {
      $('.cancelrequire textarea[name="reason"]').val('');
      $('.cancelrequire textarea[name="reason"]').parents('.form-group').show();
    } else {
      $('.cancelrequire textarea[name="reason"]').val($(this).val())
      $('.cancelrequire textarea[name="reason"]').parents('.form-group').hide();
    }
  })

  function cancelrequest() {
    $('.cancelrequire').modal('hide');
    var content = '';
    var type = $('.cancelrequire select[name="type"]').val();
    if (type == 'Immediate') {
      content = '这将会立刻删除您的产品，操作不可逆，所有数据丢失';
    } else {
      content = '产品将会在到期当天被立刻删除，操作不可逆，所有数据丢失';
    }
    getModalConfirm(content, function () {
      $.ajax({
        url: WebUrl + 'host/cancel',
        type: 'POST',
        data: $('.cancelrequire form').serialize(),
        success: function (data) {
          if (data.status == '200') {
            toastr.success(data.msg);
            setTimeout(function () {
              window.location.reload();
            }, 1000)
          } else {
            toastr.error(data.msg);
          }
        }
      });
    })
  }
</script>