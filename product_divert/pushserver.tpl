<style>
    .digbox {
        position: fixed;
        top: 20%;
        left: 35%;
        padding: 30px 20px;
        border: 1px solid #333;
        /* margin:0 auto; */
    }

    .digbox h5 {
        margin: 0;
        font-size: 18px;
    }

    .font_text {
        padding-left: 30px;
    }

    .button_box {
        margin-top: 30px;
    }

    .button_box button {
        display: inline-block;
        line-height: 1;
        white-space: nowrap;
        cursor: pointer;
        background: #fff;
        border: 1px solid #dcdfe6;
        color: #606266;
        -webkit-appearance: none;
        text-align: center;
        box-sizing: border-box;
        outline: none;
        margin: 0;
        transition: .1s;
        font-weight: 500;
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
        padding: 7px 15px;
        font-size: 12px;
        border-radius: 3px;
    }
</style>
<form method="post" action="/product_divert/pushserver" class="needs-validation" novalidate>
    <div class="digbox">
        <h5>转出产品</h5>
        <div class="font_text">
            <p>{$product.name} {$product.domain}-{$product.dedicatedip}</p>
            <p>接受方:
            <div id="usertext"></div>
            <input type="text" id="search" class="form-control"> 请输入接收方帐号（手机或邮箱）</p>
            <input type="hidden" name="userid" id="userid" class="form-control">
            <input type="hidden" name="id" id="id" value="{$product.hid}" class="form-control">
            <input type="hidden" name="token" id="token" value="{$token}" class="form-control">
            {if $system.push_cost > 0}
                <p>转出费用：{$system.push_cost}元</p>
            {/if}
            <div>本次转移您需要支付{$system.push_cost}元，支付后，接收方会受到产品转入通知<br>
                确认后接收方会受到产品转入通知
            </div>

        </div>
        <div class="button_box">
            <button>取消</button>
            <button type="submit" id="submit">立即转出</button>
        </div>
    </div>
</form>
<script type="text/javascript">
    $("#submit").hide();
    $('#search').blur(function () {
        var search = this.value;
        $.ajax({
            type: "POST",
            url: '/product_divert/postNameToUser',
            data: {
                tranfer_name: search
            },
            dataType: "json",
            success: function (res) {
                if (res.status == 200) {
                    var name = res.data.username;
                    var long = name.length;
                    var start = Math.floor(long / 2);
                    var nametext = name.substring(-1, start);
                    for (var i = 0; i < start; i++) {
                        nametext += '*';
                    }
                    $('#userid').val(res.data.id);
                    $('#usertext').html(nametext);
                    $("#usertext").css("color", "red");
                    $("#submit").show();
                } else {
                    alert(res.msg);
                    $('#usertext').html('');
                    $('#userid').val('');
                    $("#submit").hide();
                }
            }
        });
    });
</script>
