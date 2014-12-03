<?php
class Map { 
    private $thisLang;
    private $noData;
    private $html;
    
    private $blocks;
    private $bildings;
    
    public function __construct() {
        $this->noData = false;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->getData();
        $this->generateHTML();
    }
    
    private function getData() {
        $this->getBlocksData();
        foreach($this->blocks as $block) {
            $this->getBildingsData($block['block']);
        }
    }
    
    private function getBlocksData() {
        $query ="select * from `MapBildingsBlocks` order by `sequence` asc";
        $mySqlHelper = new MySqlHelper($query);
        $this->blocks = $mySqlHelper->getAllData();
    }
    
    private function getName($bilding) {
        $langHelper = new LangHelper("MapBildings_Lang","lang","bild",$bilding,$this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
           $name = $langHelper->getLangValue("name");
        } else {
           $name = "";
        }
        return $name;
    }
    
    private function getBildingsData($block) {
        $query ="select * from `MapBildings` where `block`='$block' order by `sequence` asc";
        $mySqlHelper = new MySqlHelper($query);
        $this->bildings[$block] = $mySqlHelper->getAllData();
        for ($i = 0; $i < count($this->bildings[$block]); $i++) {
            $this->bildings[$block][$i]['name']=$this->getName($this->bildings[$block][$i]['alias']);
        }
    }
    
    private function generateHTML() {
        $this->html = "";
        foreach ($this->blocks as $block) {
            $this->html .= "<div class='".$block['block']."'>";
            $this->html .= "<ul>";
            foreach ($this->bildings[$block['block']] as $bilding) {
                $urlHelper = new UrlHelper();
                $url = $urlHelper->pageUrl($bilding['page'], null);
                $this->html .= "<li class='".$bilding['alias']." ".$this->thisLang."' style='margin: ".
                        $bilding['top']."px ".$bilding['right']."px ".
                        $bilding['bottom']."px ".$bilding['left']."px;'>";
                $this->html .= "<a href='$url'>";
                $this->html .= $bilding['name'];
                $this->html .= "</a>";
                $this->html .= "</li>";
            }
            $this->html .= "</ul>";
            $this->html .= "</div>";
        }
    }
    
    public function get(){
        echo $this->html;
    }
    
    public function getHTML(){
        return $this->html;
    }
}
?>
