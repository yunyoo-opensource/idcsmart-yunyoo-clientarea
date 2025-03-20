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
<form method="post" action="/product_divert/pullserver" class="needs-validation" novalidate>
<div class="digbox">
    <h5>转入产品</h5>
    <div class="font_text">
        <p>>{$product.product_name} {$product.product_domain} {$product.product_ip}</p>
        <p>转出方: {$product.push_username}</p>
        {if $product.pull_cost > 0}
            <p>转入费用：{$product.pull_cost}元</p>
        {/if}
        <div>本次转移您需要支付{$product.pull_cost}元，支付后,产品将会立刻转到您的账户中</div>
        <input type="hidden" name="id" id="id" value="{$product.id}" class="form-control">
    </div>
    <div class="button_box">
        <button> <a href="/product_divert/pullrefuse?id={$product.id}" class="text-primary mr-2">拒绝接收</a></button>
        <button type="submit" id="submit">立即接收</button>
    </div>
</div>
</form>