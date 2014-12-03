<?php
class SiteMap {
    private $thisLang;
    private $data;
    private $html;
    
    public function __construct() {
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->getSiteMapLVL1();
        $this->generateHtml();
    }
    
    private function getSiteMapLVL1() {
        $query = "select * from `SiteMapLVL1` order by `sequence` asc";
        $mySqlHelper = new MySqlHelper($query);
        $siteMapLVL1 = $mySqlHelper->getAllData();
        $urlHelper = new UrlHelper();
        $i=0;
        foreach ($siteMapLVL1 as $page) {
            $this->data[$i]['url'] = $urlHelper->pageUrl($page['page'], null);
            $this->data[$i]['title'] = $this->getSiteMapLVL1_Lang($page['page']);
            $this->data[$i++]['child'] = $this->getSiteMapLVL2($page['page']);
        }
    }
    
    private function getSiteMapLVL2($parent) {
        $query = "select * from `SiteMapLVL2` where `parent`='$parent' order by `sequence` asc";
        $mySqlHelper = new MySqlHelper($query);
        $siteMapLVL2 = $mySqlHelper->getAllData();
        $result = array();
        $urlHelper = new UrlHelper();
        $i=0;
        foreach ($siteMapLVL2 as $page) {
            $result[$i]['url'] = $urlHelper->pageUrl($page['page'], null);
            $result[$i++]['title'] = $this->getSiteMapLVL2_Lang($page['id']);
        }
        return $result;
    }
    
    private function getSiteMapLVL2_Lang($id) {
        $langHelper = new LangHelper("SiteMapLVL2_Lang","lang","page",$id,$this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
            $title = $langHelper->getLangValue("title");
        } else {
            $title = "";
        }
        return $title;
    }
    
    private function getSiteMapLVL1_Lang($id) {
        $langHelper = new LangHelper("SiteMapLVL1_Lang","lang","page",$id,$this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
            $title = $langHelper->getLangValue("title");
        } else {
            $title = "";
        }
        return $title;
    }
    
    private function generateHtml() {
        $out = "<table class='siteMap'>";
        $out .= "<tr class='siteMapParent'>";
        foreach ($this->data as $page) {
            $out .= "<td class='siteMapParentElement'>";
            $out .= "<a href='".$page['url']."'>";
            $out .= $page['title'];
            $out .= "</a>";
            $out .= "</td>";
        }
        $out .= "</tr>";
        $out .= "<tr class='siteMapChilde'>";
        foreach ($this->data as $page) {
            $out .= "<td class='siteMapParentElement'>";
            foreach ($page['child'] as $value) {
                $out .= "<a href='".$value['url']."'>".$value['title']."</a><br>";
            }
            $out .= "</td>";
        }
        $out .= "</tr>";
        $out .= "</table>";
        $this->html = $out;
    }
    
    public function getSiteMap() {
        echo $this->html;
    }
}
?>
