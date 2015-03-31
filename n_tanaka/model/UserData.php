<?php
/******************************
**
** UserDataクラス
**
******************************/

/**
** include block
**/
require_once(BASE_PATH.'/common/models/CookieAccess.php');
class UserData
{
    /**
    ** private variable block
    **/
    // アクセスユーザーエージェント
    private $_userAgent;
    private $_cookieAccess;
    /**
    ** construct
    **/
    function __construct() {
        $this->_cookieAccess = new CookieAccess();

        // ユーザーエージェント設定
        $this->setUserAgent();
    }

    /*
    * ユーザーエージェントから、OSを判別する
    * 引数：なし
    * 戻り値：OS(Android:Android、iOS:iOS)
    */
    public function getAccessOS() {
        return $this->_userAgent;
    }

    /*
    * デカグラフからユーザー情報を取得
    * 引数：なし
    * 戻り値：なし
    */
    private function setUserAgent() {
        // ユーザエージェント判定
        $getAgent = $_SERVER["HTTP_USER_AGENT"];
        $agent = "other";
        if(strpos($getAgent, "Android" )){
            $agent = "Android";
        }elseif(strpos($getAgent, "iPhone") || strpos($getAgent, "iPod" ) || strpos($getAgent, "iPad" )){
            $agent = "iOS";
        }
        $this->_userAgent = $agent;
    }
}
