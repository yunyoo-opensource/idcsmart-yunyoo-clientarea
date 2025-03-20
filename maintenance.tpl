<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>维护中</title>

</head>

<style>
    html,
    body {
        background-color: #fff;
        height: 100%;
        padding: 0;
        margin: 0;
    }

    .maintain-box {
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .maintain-text {
        margin-left: 92px;
        max-width: 35%;
    }

    .maintain-text-title {
        font-size: 34px;
        font-family: Source Han Sans CN;
        font-weight: 500;
        color: #666666;
        word-wrap:break-word
    }

    .maintain-text-subtitle {
        font-size: 24px;
        font-family: Source Han Sans CN;
        font-weight: 300;
        color: #666666;
        line-height: 24px;
    }
</style>

<body>
<div class="maintain-box">
    <img src="/static/images/maintain.png" alt="维护中...">
    <div class="maintain-text">
        <p class="maintain-text-title">{$msg}</p>
    </div>
</div>
</body>

</html>