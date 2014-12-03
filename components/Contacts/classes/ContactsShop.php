<?php
class ContactsShop {
    private $thisLang;
    private $noData;
    private $html;
    private $printHtml;
    private $shop;
    private $map;
    private $mapData;
    private $workers;
    private $buildings;
    private $localization;
    
    private $workersListHTML;
    private $buildingsHTML;
    private $printBuildingsHTML;
    private $name;
    private $description;
    private $info;
    
    
    public function __construct() {
        $this->localization = new Localization();
        $this->noData = false;
        global $_URL_PARAMS;
        global $_PARAM;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->shop = $_PARAM['name'];
        $this->getData();
        $this->getMapData();
    }
    
    private function getData() {
        $query ="select * from `ContactsShop` where `alias`='$this->shop'";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getDataRow(0);
        $this->map = $listData['map'];
        $this->workers = $listData['workers'];
        $this->getLang();
        $this->getBildingsList();
        $this->getWorkersHTML();
        $this->getBildingsHTML();
        $this->getPrintBildingsHTML();
        $this->generateHTML();
        $this->generatePrintHTML();
    }
    
    private function getLang() {
        $langHelper = new LangHelper("ContactsShop_Lang","lang","shop",$this->shop,$this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
           $this->name = $langHelper->getLangValue("name");
           $this->description = $langHelper->getLangValue("description");
           $this->info = $langHelper->getLangValue("info");
        } else {
           $this->name = "";
           $this->description = "";
           $this->info = "";
        }
    }
    
    private function getBildingsList() {
        $query ="select `alias` from `ContactsShopBuilding` where `shop`='$this->shop'";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getAllData();
        $this->buildings = null;
        foreach ($listData as $value) {
            $this->buildings[] = $value['alias'];
        }
    }
    
    private function getWorkersHTML() {
        $contactsWorkersList = new ContactsWorkersList($this->workers);
        $this->workersListHTML = $contactsWorkersList->getListHtml();
    }
    
    private function getBildingsHTML() {
        $this->buildingsHTML = "";
        $this->buildingsHTML .= "<div class='shopContactAddressBlock'>";
        foreach ($this->buildings as $bilding) {
            $buildings = new ContactsShopBuilding($bilding,$this->map,$this->name);
            $this->buildingsHTML .= $buildings->getHTML();
        }
        $this->buildingsHTML .= "</div>";
    }
    
    private function getPrintBildingsHTML() {
        $this->printBuildingsHTML = "";
        foreach ($this->buildings as $bilding) {
            $buildings = new ContactsShopBuilding($bilding,$this->map,$this->name);
            $this->printBuildingsHTML .= $buildings->getPrintHTML();
        }
    }
    
    private function generateHTML() {
        $this->html = '';
        $this->html .= "<h1 class='shopContactTitle'>";
        $this->html .= $this->name;
        $this->html .= "</h1>";
        $this->html .= "<div class='shopContactMapAndContactBlock'>";
        $this->html .= "<div id='".$this->map."' class='shopContactMapBlock'></div>";
        $this->html .= $this->buildingsHTML;
        $this->html .= "<div class='shopContactMapAndContactBlockEND'></div>";
        $this->html .= "</div>";
        $this->html .= $this->description;
        $this->html .= $this->workersListHTML;
        $this->html .= '<center><div id="';
        $this->html .= $this->map;
        $this->html .= '" style="display: none;"> </div></center>';
        $this->html .= "<hr>";
        $this->html .= "<div class='inf'>";
        $this->html .= $this->info;
        $this->html .= "</div>";
    }
    
    private function generatePrintHTML() {
        $this->printHtml = "";
        #настройки
        $this->printHtml .= "<div class='print_settings'>";
        $this->printHtml .= $this->localization->getText('shopID_text');
        $this->printHtml .= "<br>";
        
        $this->printHtml .= "<span class='checkbox_text'>";
        $this->printHtml .= '<input type="checkbox" id="checkbox_shopIDbuildings" checked onClick="change_show_hide()">';
        $this->printHtml .= $this->localization->getText('shopIDbuildings_text');
        $this->printHtml .= "</span>";
        
        if($this->description==null || $this->description=="") {
            $this->printHtml .= "<span class='checkbox_text' style='display: none;'>";
        } else {
            $this->printHtml .= "<span class='checkbox_text'>";
        }
        $this->printHtml .= '<input type="checkbox" id="checkbox_shopIDdescription" checked onClick="change_show_hide()">';
        $this->printHtml .= $this->localization->getText('shopIDdescription_text');
        $this->printHtml .= "</span>";
        
        $this->printHtml .= "<span class='checkbox_text'>";
        $this->printHtml .= '<input type="checkbox" id="checkbox_shopIDworkersList" checked onClick="change_show_hide()">';
        $this->printHtml .= $this->localization->getText('shopIDworkersList_text');
        $this->printHtml .= "</span>";
        
        $this->printHtml .= "<span class='checkbox_text'>";
        $this->printHtml .= '<input type="checkbox" id="checkbox_shopIDmap" checked onClick="change_show_hide()">';
        $this->printHtml .= $this->localization->getText('shopIDmap_text');
        $this->printHtml .= "</span>";
        
        $this->printHtml .= "<span class='checkbox_text'>";
        $this->printHtml .= '<input type="checkbox" id="checkbox_shopIDinf" checked onClick="change_show_hide()">';
        $this->printHtml .= $this->localization->getText('shopIDinf_text');
        $this->printHtml .= "</span>";
        $this->printHtml .= "</div>";
        
        $this->printHtml .= "<div class='clear'></div>";
        #buildings
        $this->printHtml .= "<div class='buildings' id='shopIDbuildings' style='display: ;'>";
        $this->printHtml .= $this->printBuildingsHTML;
        $this->printHtml .= "</div>";
        $this->printHtml .= "<div class='clear'></div>";
        #description
        $this->printHtml .= "<div class='description' id='shopIDdescription' style='display: ;'>";
        $this->printHtml .= $this->description;
        $this->printHtml .= "</div>";
        $this->printHtml .= "<div class='clear'></div>";
        #workersList
        $this->printHtml .= "<div class='workersList' id='shopIDworkersList' style='display: ;'>";
        $this->printHtml .= $this->workersListHTML;
        $this->printHtml .= "</div>";
        $this->printHtml .= "<div class='clear'></div>";
        #map
        $this->printHtml .= "<div class='map' id='shopIDmap' style='display: ;'>";
        $this->printHtml .= '<br /><center><div id="print_';
        $this->printHtml .= $this->map;
        $this->printHtml .= '"> </div></center>'."<br />";
        $this->printHtml .= "</div>";
        $this->printHtml .= "<div class='clear'></div>";
        #info
        $this->printHtml .= "<div class='inf' id='shopIDinf' style='display: ;'>";
        $this->printHtml .= "<hr>";
        $this->printHtml .= $this->info;
        $this->printHtml .= "</div>";
        $this->printHtml .= "<div class='clear'></div>";
    }
    
    public function get(){
        echo $this->html;
    }
    
    public function getHTML(){
        return $this->html;
    }
    
    public function getPrint(){
        echo $this->printHtml;
    }
    
    public function getPrintHTML(){
        return $this->printHtml;
    }
    
    private function getMapData() {
        $query ="select * from `Maps` where `alias`='$this->map'";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getDataRow(0);
        $this->mapData['alias'] = $listData['alias'];
        $this->mapData['sid'] = $listData['sid'];
        $this->mapData['width'] = $listData['width'];
        $this->mapData['height'] = $listData['height'];
    }
    
    public function getHead() {
        $out = "";
        $out .= '<script type="text/javascript" charset="utf-8" ';
        $out .= 'src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=';
        $out .= $this->mapData['sid'];
        $out .= '&width=';
        $out .= $this->mapData['width'];
        $out .= '&height=';
        $out .= $this->mapData['height'];
        $out .= '&id=';
        $out .= $this->mapData['alias'];
        $out .= '"></script>'."\n";
        echo $out;
    }
    
    public function getPrintHead() {
        $out = "";
        $out .= '<script type="text/javascript" charset="utf-8" ';
        $out .= 'src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=';
        $out .= $this->mapData['sid'];
        $out .= '&width=';
        $out .= $this->mapData['width'];
        $out .= '&height=';
        $out .= $this->mapData['height'];
        $out .= '&id=print_';
        $out .= $this->mapData['alias'];
        $out .= '"></script>'."\n";
        echo $out;
    }
}
?>
