<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon.png" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" defer="defer">
        window.onload = function() { scrollBy(0, 1); }
    </script>
    <script type="text/javascript" src="<?php echo $myController->_userData->getJsFile();?>"></script>
</head>
<body id="index">
<div class="carWrap">
<!------------------------------------------------
    ヘッダー
------------------------------------------------->
<h1><img src="img/header.png" alt="" width="100%" height="auto" /></h1>

<!------------------------------------------------
    人気ランキング
------------------------------------------------->
<?php
    $myController->_templateAssign->includeTemplate($myController, $myController->_templateAssign->getAssignData("rankingTemplate"), true);
?>
<!------------------------------------------------
    オススメピックアップはこちら
------------------------------------------------->
<?php
    $myController->_templateAssign->includeTemplate($myController, $myController->_templateAssign->getAssignData("pickupTemplate"), true);
?>


<!------------------------------------------------
    注意事項
------------------------------------------------->
<section id="note">
    <h3>注意事項</h3>
    <ul>
        <li>不正な登録と判断した場合、対象外となります</li>
        <li>ご利用の際にはcookieとJavaScriptの設定をONにしてください</li>
        <li>設定がオフになっていると、正常にデータが取得できず成果が反映されません</li>
    </ul>
</section>
</div>

<!------------------------------------------------
    共通フッター
------------------------------------------------->
<footer id="footer"></footer>

</body>
</html>
