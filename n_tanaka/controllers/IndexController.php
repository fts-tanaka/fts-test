<?php
/******************************
**
** 研修用ソース
** コントローラー
**
******************************/

require_once('./model/TemplateAssign.php');
require_once('./model/UserData.php');

class IndexController
{
    /**
    ** public method execute
    **/
    public $_htmlHelper;
    /* 実行本体 */
    public function execute() {
        //　モデルのインスタンスを作成
        $userData = new UserData();
        //　header.tplファイル（共通部分）に合わせるために
        //　_htmlheperに_templateAssignを代入
        $this->_htmlHelper = $this->_templateAssign;

        // OS(ユーザーエージェント)をアサイン
        $this->_htmlHelper->setAssignData("os", $this->_userData->getAccessOS());
        // 名前をアサイン
        $this->_htmlHelper->setAssignData("myname", "credit");

        // ランキング広告テンプレートをアサイン
        $this->_templateAssign->setAssignData("rankingTemplate", dirname(__FILE__)."/../tpl/sectionParts/rankingContent.tpl");
        // ピックアップテンプレートをアサイン
        $this->_templateAssign->setAssignData("pickupTemplate", dirname(__FILE__)."/../tpl/sectionParts/pickupContent.tpl");
        // ltvテンプレートをアサイン
        $this->_templateAssign->setAssignData("ltvTemplate", dirname(__FILE__)."/../tpl/sectionParts/ltv_list.tpl");
        // バナーのテンプレート
        $this->_templateAssign->setAssignData("topBanner", dirname(__FILE__)."/../tpl/sectionParts/top_banner.tpl");
    }
}
