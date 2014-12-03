<?php
class ApelsinContactsNavigationPanel {
    
    private $SQL_HELPER;
    private $thisLang;
    private $HTML;
    private $TABS_DATA;
    private $tab = 1;


    public function __construct() {
        global $_SQL_HELPER;
        global $_URL_PARAMS;
        global $_PARAM;
        global $SITE_MAP;
        if(isset($_PARAM['tab'])) {
            $this->tab = $_PARAM['tab'];
        }
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->SITE_MAP = $SITE_MAP;
//        $this->localization = new Localization("ApelsinContactsNavigationPanel");
        $this->HTML = "";
        $this->getTabData();
        
    }
    
    public function getJS() {
        $out = '';
        $out .= '<script>';
        $out .= '$(document).ready(function() {';
        $out .= 'ApelsinContactsNavigationPanel_GetTab('.$this->tab.');';
        $out .= '});';
        $out .= '</script>';
        return $out;
    }


    private function getTabData() {
        $query = "SELECT ACNP.`alias`, ACNP.`htmlFirst`, ACNP.`classPostfix`, ACNP_SMG.`group`, ACNP_SMG.`maxInColumn`
                    FROM `ApelsinContactsNavigationPanel` as ACNP LEFT JOIN `ApelsinContactsNavigationPanel_SiteMapGroup` as ACNP_SMG
                    on ACNP.`alias` = ACNP_SMG.`alias`
                    ORDER BY ACNP.`sequence` ASC;";
        $result = $this->SQL_HELPER->select($query);
        $this->TABS_DATA = array();
        if($result != null) {
            foreach ($result as $key => $tab) {
                $text = $this->getTabText($tab['alias']);
                $this->TABS_DATA[$key]['alias'] = $tab['alias'];
                $this->TABS_DATA[$key]['id'] = "ACNPCW_".($key+1);
                $this->TABS_DATA[$key]['tabName'] = $text['tabName'];
                $this->TABS_DATA[$key]['content'] = $this->getContentBlock($this->TABS_DATA[$key]['id'],$text['html'],$this->getSiteMapTabData($tab['group'],$tab['maxInColumn'],$tab['classPostfix']),$tab['htmlFirst'],$tab['classPostfix']);
            }
        }
        $this->generateMainBlock();
    }
    
    private function getContentBlock($id,$html,$mapData,$htmlFirst,$classPostfix) {
        $out = '';
        $out .= "<div id='".$id."' class='ApelsinContactsNavigationPanel_ContentWrapper ".$classPostfix."'>";
        if($html != null || $html != '') {
            if($htmlFirst > 1) {
                $out .= "<div class='ApelsinContactsNavigationPanel_ContentWrapperHtml ".$classPostfix."'>";
                $out .= $html;
                $out .= "</div>";
                $out .= $mapData;
            } else {
                $out .= $mapData;
                $out .= "<div class='ApelsinContactsNavigationPanel_ContentWrapperHtml ".$classPostfix."'>";
                $out .= $html;
                $out .= "</div>";
            }
        } else {
            $out .= $mapData;
        }
        $out .= "</div>";
        return $out;
    }
    
    private function getSiteMapTabData($group,$maxInColumn,$classPostfix) {
        if($group == null || $group == '') {
            return '';
        }
        $shop = new ApelsinContactsNavigationPanel_SiteMapTab($group, $maxInColumn, $classPostfix);
        return $shop->getHtml();
    }
    
    private function getTabText($alias) {
        $langHelper = new LangHelper("ApelsinContactsNavigationPanel_Lang","lang","alias",$alias,$this->thisLang);
        $text["tabName"] = $langHelper->getLangValue("tabName");
        $text["html"] = $langHelper->getLangValue("html");
        return $text;
    }
    
    public function get() {
        echo $this->HTML;
    }
    
    private function generateMainBlock() {
        $this->HTML = "";
//        $this->HTML .= "<h1 class='ApelsinContactsNavigationPanelTitle'>";
//        $this->HTML .= 'Навигация по контактам';
//        $this->HTML .= "</h1>";
        $this->HTML .= "<div class='ApelsinContactsNavigationPanel_MainWrapper'>";
        $this->HTML .= "<div class='ApelsinContactsNavigationPanel_LeftWrapper'>";
        $this->HTML .= "<ul class='ApelsinContactsNavigationPanel_menu'>";
        foreach ($this->TABS_DATA as $key => $tab) {
            $this->HTML .= "<li class='ApelsinContactsNavigationPanel_Tab' onclick='ApelsinContactsNavigationPanel_GetTab(".($key+1).");'>";
            $this->HTML .= $tab['tabName'];
            $this->HTML .= "</li>";
        }
        $this->HTML .= "</ul>";
        $this->HTML .= "</div>";
        $this->HTML .= "<div class='ApelsinContactsNavigationPanel_RightWrapper'>";
        foreach ($this->TABS_DATA as $key => $tab) {
            $this->HTML .= $tab['content'];
        }
        $this->HTML .= "</div>";
    }
}
