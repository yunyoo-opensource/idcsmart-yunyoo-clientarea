
<style>
  .paySelect {
    float: right;
    width: 25%;
    height: 1.5rem;
    border-color: #ddd;
    margin-left: 42%;
  }

  @media screen and (max-width: 440px) {
    .paySelect {
      width: 33%;
    }

  }

  @media screen and (max-width: 375px) {
    .paySelect {
      margin-left: 21%;
    }
  }

  @media screen and (max-width: 320px) {
    .paySelect {
      margin-left: 7%;
      width: 36%;
    }
  }
</style>
<script>
  var _url = '';

  function payTypeChange(invoiceid) {
    let paymt = 1;
    var url = _url + '/change_paymt';
    if ($('.paySelect option:selected').val() == 0) {
      paymt = 0
    }
    let invoiceidNew = $("#myLargeModalLabel").html().split(' - ')[1]

    $.ajax({
      type: "POST",
      data: {
        invoiceid: invoiceidNew,
        paymt: paymt
      },
      url: url,
      success: function (data) {
        if ($('.paySelect option:selected').val() == 0) {
          payamount(invoiceidNew, 0)
        } else {
          payamount(invoiceidNew)
        }
      }
    })
  }

  $(function () {
    $(".close").click(function () {
      $(".modal-header .paySelect").remove();
    })
  })
</script>
<div id="pay">
  <div class="modal fade pay" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered ">
      <div class="modal-content">
        <div class="modal-header">
          <h6 class="modal-title mt-0" id="myLargeModalLabel"></h6>
          <!--{if $Action != 'recharge'}
                <select class="paySelect" onchange="payTypeChange({$Pay.invoiceid})">
                  <option value="0">现金支付</option>
                    {if (!empty($paymt.is_open_credit_limit) && $paymt.credit_limit_balance >= $paymt.subtotal)}
                        <option value="1">信用额支付</option>
                    {/if}
                </select>
                {/if}-->
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">

        </div>
      </div>
    </div>
  </div>

</div>


<div id="loading-icon" style="display:none">
  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
    style="margin:auto;background:#fff;display:block;" width="200px" height="200px" viewBox="0 0 100 100"
    preserveAspectRatio="xMidYMid">
    <g>
      <circle cx="73.801" cy="68.263" fill="#93dbe9" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="0s">
        </animateTransform>
      </circle>
      <circle cx="68.263" cy="73.801" fill="#689cc5" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.062s">
        </animateTransform>
      </circle>
      <circle cx="61.481" cy="77.716" fill="#5e6fa3" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.125s">
        </animateTransform>
      </circle>
      <circle cx="53.916" cy="79.743" fill="#3b4368" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.187s">
        </animateTransform>
      </circle>
      <circle cx="46.084" cy="79.743" fill="#191d3a" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.25s">
        </animateTransform>
      </circle>
      <circle cx="38.519" cy="77.716" fill="#d9dbee" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.312s">
        </animateTransform>
      </circle>
      <circle cx="31.737" cy="73.801" fill="#b3b7e2" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.375s">
        </animateTransform>
      </circle>
      <circle cx="26.199" cy="68.263" fill="#93dbe9" r="3">
        <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;360 50 50"
          times="0;1" keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s" begin="-0.437s">
        </animateTransform>
      </circle>
      <animateTransform attributeName="transform" type="rotate" calcMode="spline" values="0 50 50;0 50 50" times="0;1"
        keySplines="0.5 0 0.5 1" repeatCount="indefinite" dur="1.4925373134328357s">
      </animateTransform>
    </g>
  </svg>
</div>