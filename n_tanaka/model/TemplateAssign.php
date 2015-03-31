<?php
/******************************
**
** HTMLの表示に関するクラス
**
******************************/

/**
** include block
**/


class TemplateAssign
{
    /**
    ** private variable block
    **/
    // 表示用データ
    private $_assign;
    private $_requestParameters;

    /**
    ** construct
    **/
    function __construct() {
        $this->_requestParameters = $_GET;
    }
    /*
    * 各キャンペーン配下にある/datas/~~.csvファイルよりデータを取得し
    * os、性別に一致するデータだけ抽出し、返す
    *
    * @param $os string ユーザのOS
    * @param $gender string ユーザの性別
    * @param $filePath string ~~.csvファイルのパス
    *
    * return $contents　配列 [中身 = ~~.csvファイルよりOS、性別に一致するデータを]
    *
    * 形式    array(
    *                0 => array(
    *                            "カラム名1" => データ1-1,
    *                            "カラム名2" => データ1-2,
    *                            ....
    *                            "カラム名n" => データ1-n,
    *                        ),
    *                1 => array(3行目のデータ),
    *                ...,
    *                n => array(n+1行目のデータ)
    *            )
    */
    public function getDatasByCSV($os = false, $gender = false ,$filePath){
        //iOS以外はAndroidとして処理
        if( (isset($os)) && ($os != 'iOS') ){
            $os = 'Android';
        }
        //male以外は女性として
        if( (isset($gender)) && ($gender != 'male')){
            $gender = 'female';
        }
        //ファイルパスがないときの処理
        if( !isset($filePath) ){
            return false;
        }
        //ファイルがないときの処理
        if( !file_exists($filePath) ){
            return false;
        }
        //
        $colKeyArray = array();
        $contents = array();
        $clms = array();
        $datas = array();
        if (($fp = fopen($filePath,'r')) !== false) {
            //　１行目のカラム名を取得する
            if($fp){
                $clmNames = ($data = fgetcsv($fp, 1000, ","));
                $row++;
            }
            // 1行目のカラム名をキーとして設定する
            foreach($clmNames as $clmName){
                $colKeyArray[$clmName] = null;
            }
            // 行末まで読み込む。
            $j = 0;
            while (($data = fgetcsv($fp, 1000, ",")) !== false) {
                //カラム名とデータのカラムを関連づける
                for( $i = 0 ; $i < count($clmNames) ; $i++ ){
                    $content[$clmNames[$i]] = $data[$i];
                }
                if(isset($content["os"]) && isset($content["gender"])){
                    //出し分け判定
                    $count = 0;
                    //条件１：osがbothか一致するか
                    //条件２：genderがbothか一致するか
                    if( (($content["os"] == "both") || ($content["os"] == $os)) && (($content["gender"] == "both") || ($content["gender"] == $gender))){
                        $contents[] = $content;
                    }
                } else {
                    $contents[] = $content;
                }
            $j++;
            }
        }
        $this->limitStrings($contents, "text",43);
        return $contents;
    }
    /*
    * 文字制限をもうける
    */
    public function limitStrings( &$contents, $columnNames, $length){
        if(is_array($contents)){
            foreach($contents as &$content){
                if(is_array($columnNames)){
                    foreach($columnNames as $columnName){
                        mb_strimwidth($content[$columnName], 0, $length, "...", utf8);
                    }
                } else {
                    $content[$columnNames] = mb_strimwidth($content[$columnNames], 0, $length, "...", utf8);
                }
            }
        } else {
            if(is_array($columnNames)){
                foreach($columnNames as $columnName){
                    mb_strimwidth($contents[$columnName], 0, $length, "...", utf8);
                }
            } else {
                mb_strimwidth($contents[$columnNames], 0, $length, "...", utf8);
            }
        }
    }
    /*
    *  パラメーター作成、表示(GET)
    *  引数(可変引数)：引き渡したいパラメーター名
    */
    public function makeQueryString() {
        // 引数の数
        $args = func_get_args();
                // 追加数
                $addNum = 0;
                // 作成文字列(戻り値)
                $returnString = "";
                // 接続箇所フラグ
                $setMode = "after";

                // 引数の数だけセット
                foreach ($args as $value) {
                        if (strpos($value, "extendParam") !== false) {
                                // extendParam-frm_id-first
                                $extendValue = explode("-", $value);
                                $paramValue = $extendValue[2];
                                if ($this->_requestParameters[$extendValue[1]] != "" && !is_null($this->_requestParameters[$extendValue[1]])) {
                                        // 通常
                                        $paramValue = $paramValue."-".$this->_requestParameters[$extendValue[1]];
                                } else if ($extendValue[1] == "skinName") {
                                        // スキン名指定
                                        $paramValue = $paramValue."-".$this->_skinDirectory;
                                }

                                if ($addNum == 0) {
                                        // 最初の場合は「?」
                                        $returnString = $returnString."?param=".$paramValue;
                                } else {
                                        // 最初以外は「&」
                                        $returnString = $returnString."&param=".$paramValue;
                                }
                                $addNum++;
                        } else if ($this->_requestParameters[$value] != "" && !is_null($this->_requestParameters[$value])) {
                                if ($addNum == 0) {
                                        // 最初の場合は「?」
                                        $returnString = $returnString."?".$value."=".$this->_requestParameters[$value];
                                } else {
                                        // 最初以外は「&」
                                        $returnString = $returnString."&".$value."=".$this->_requestParameters[$value];
                                }
                                $addNum++;
                        } else if ($value == "o-before") {
                                // 接続箇所(?がつく場合)
                                $setMode = $value;
                        }
                }
                if ($setMode == "after") {
                        $returnString = str_replace("?", "&", $returnString);
                }
        print($returnString);

    }
    /*
    * 共通テンプレート読み込み
    * 引数:呼び出し側コントローラー、テンプレートファイル名、表示フラグ
    * 戻り値:なし
    */
    public function includeCommonTemplate($myController, $templateFileName, $displayFlg = true) {
        if ($displayFlg) {
            include(dirname(__FILE__)."/../web/wall/sectionparts/".$templateFileName);
        }
    }
    /*
    * 共通テンプレート読み込み
    * 引数:呼び出し側コントローラー、テンプレートファイル(フルパス)、表示フラグ
    * 戻り値:なし
    */
    public function includeTemplate($myController, $templateFile, $displayFlg = true) {
        if ($displayFlg) {
            include($templateFile);
        }
    }

    /**
    ** getter block
    **/
    /*
    *  テンプレートアサインデータ取得
    *  引数:取得したいパラメーター名(何も渡されていない場合は配列)
    *  戻り値:引数に対応した値(何も渡されていない場合は配列)
    */
    public function getAssignData($getParameterName = "") {
        if ($getParameterName == "") {
            $retData = $this->_assign;
        } else {
            $retData = $this->_assign[$getParameterName];
        }
        return $retData;
    }
    /*
    * テンプレートアサインデータ特定カラム取得
    * 引数：アサインデータパラメーター名、カラム名
    * 戻り値:引数に対応した値
    */
    public function getAssignDataColumn($getParameterName, $getParameterColumnName) {
        return $this->_assign[$getParameterName][$getParameterColumnName];
    }
    /*
    * テンプレートアサインデータ特定配列カラム取得
    * 引数:アサインデータパラメーター名、カラム名、配列インデックス
    * 戻り値:引数に対応した値
    */
    public function getAssignDataColumnForIndex($getParameterName, $getParameterColumnName, $index) {
        return $this->_assign[$getParameterName][$index][$getParameterColumnName];
    }
    /*
    * テンプレートアサインデータ特定配列抜き出し
    * 引数:アサインデータの抜き出したい開始インデックス、アサインデータの抜き出したい終了インデックス
    * 戻り値:引数に対応した配列データ
    */
    public function getAssignDataArrayForIndex($getParameterName, $startIndex, $endIndex) {
        $returnArrayData = array();
        for ($i = $startIndex; $i <= $endIndex; $i++) {
            $returnArrayData[] = $this->_assign[$getParameterName][$i];
        }
        return $returnArrayData;
    }

    /*
    * 共通ディレクトリパス取得
    * 戻り値:共通ディレクトリパス
    */
    public function getCommonDirectoryPATH() {
        return sprintf('%s/common', BASE_PATH);
    }

    /**
    ** setter block
    **/
    /*
    *  テンプレートアサインデータを設定
    *  引数：設定したいパラメーター名
    *  戻り値：なし
    */
    public function setAssignData($setParameterName, $setParameterValue) {
        $this->_assign[$setParameterName] = $setParameterValue;
    }
    /*
    * プッシュ枠（削除予定）
    */
    public function inculdePush($fileName, $os, $pushFromid = "", $pushFromid){
        if($os == "iOS"){
            include(BASE_PATH."/cni/views/default/sectionParts/$fileName");
        } else {
            include(BASE_PATH."/cna/views/default/sectionParts/$fileName");
        }
    }
    /*
    * 共通ディレクトリURL取得
    * 戻り値:共通ディレクトリURL
    */
    public function getCommonDirectoryURL() {
        // return sprintf('%s/common', BASE_URL);
        return sprintf('%s/common', BASE_URL.BASE_DIR);
    }
    /*
    * 条件付きinclude
    * flgがtrueの時だけincludeする
    * @datas 基本的に設定する必要は無いが、スマーティから呼び出されたときに、getAssignが出来ないの場合に、
    *        ここで設定する
    */
    public function conditionalInclude($myController, $templateFileName, $directory, $flg, $datas = array()){
        foreach($datas as $key => $data){
            if(!isset($$key)){
                $$key = $data;
            }
        }
        if($directory == "common" && $flg){
            $indexController = $myController;
            include($this->getCommonDirectoryPATH().$templateFileName);
        }
    }
}
