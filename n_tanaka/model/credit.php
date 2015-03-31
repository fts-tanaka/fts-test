<?php

/******************************
**
** HtmlHelperクラス
**
******************************/

require_once(dirname(__FILE__).'/../config/setting.php');
class Credit
{
    /**
    ** construct
    **/
    function __construct($gender, $os, $decaAsId='') {
        $this->_csvFileAccess = new CsvFileAccess();
        $this->_contentData = array();
        // 広告データをセット(上部とキラー枠)
        $this->_managementUseCidModels = new ManagementUseCidModels(array("credit"), $previewDate, $decaAsId, "Credit", $gender);
    }
    /**
    * managementUseCidModelsからデータを取得する
    * (モデルを使用して取得するもの)
    * @param categoryName string カテゴリの名前(例 killer1 など)
    * @return カテゴリに一致するapiのデータを指定の「モデル」を通して返す
    */
    public function getContentsFromManagementModels($categoryName, $sectionno){
        return $this->_managementUseCidModels->getContentsByModel($categoryName, $sectionno);
    }
    /**
    * managementUseCidModelsからデータを取得する
    * (csvで指定したcidかつapiで返ってきたデータを取得する)
    * @param categoryName string カテゴリの名前(例 killer1 など)
    * @return カテゴリに一致するcidをapiに投げて返ってきたデータを返す
    */
    public function getContentsFromManagementCsv($categoryName, $sectionno){
        $apiDatas = $this->_managementUseCidModels->getContentsByCsv($categoryName, $sectionno);
        return $apiDatas;
    }
    /*
    * managementUseCidModelsからデータを取得する
    * (csvのデータを取得する)
    * @param categoryName string カテゴリの名前(例 killer1 など)
    * @return 指定したカテゴリのcsvのデータを返す
    */
    public function getKeyAndValueByCsvData($categoryName, $sectionno){
        return $this->_managementUseCidModels->getKeyAndValueByCsvDate($categoryName, $sectionno);
    }
    /*
    * managementUseCidModelsからデータを取得する
    * (2種類のデータをcid基準で合体させる)
    * @param changeColumns array array("apiの追加したい・上書きしたいカラム" => "csvの上書きさせたいカラム")
    * @param APIdatas array 基本apiのデータ
    * @param csvDatas array 基本csvのデータ
    * @param forcedFlg boolean apiの指定したカラムの有無を見て、強制上書きするかしないか
    * @param noDataFlg boolean apiになくて、csvにcidがある場合、apiに追加するかしないか
    */
    public function getAPIDateAddCsvData($changeColumns, $APIdatas, $csvDatas, $forcedFlg, $noDataFlg){
        return $this->_managementUseCidModels->ChangeDataByColumn($changeColumns, $APIdatas, $csvDatas, $forcedFlg, $noDataFlg);
    }
}


?>
