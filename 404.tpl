<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>404</title>

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

  .maintain-back {
    width: 97px;
    height: 34px;
    background: #6EACF8;
    border-radius: 17px;
    text-align: center;
    line-height: 34px;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
  }
</style>

<body>
  <div class="maintain-box">
    <img src="/static/images/404.png" alt="找不到页面">
    <div class="maintain-text">
      <p class="maintain-text-title">你来到了一个不存在的页面...</p>
      <p class="maintain-back" onclick="history.back()">返回</p>
    </div>
  </div>
</body>

</html>