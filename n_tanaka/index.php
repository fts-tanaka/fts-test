<?php
/******************************
**
** クレジットカード発行キャンペーン
**
******************************/

header("Content-type: text/html;charset=UTF-8");

require_once('controllers/IndexController.php');

// コントローラー呼び出し
$myController = new IndexController();
$myController->execute();
// テンプレート設定
include('tpl/index.tpl');

?>
