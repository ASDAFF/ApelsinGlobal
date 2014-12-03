<?php
class ApelsinContactsNavigationPanel_SiteMapTab {
    
    private $HTML;
    private $SITE_MAP;
    private $maxInColumn;
    private $CSS_ClassPostfix;
    
    private $mapData;
    
    public function __construct($group,$maxInColumn, $CSS_ClassPostfix) {
        global $SITE_MAP;
        $this->SITE_MAP = $SITE_MAP;
        $this->mapData = $this->SITE_MAP->getData($group);
        $this->maxInColumn = $maxInColumn;
        $this->CSS_ClassPostfix = $CSS_ClassPostfix;
        $this->HTML = "";
        $this->HTML = $this->generateHtml();
    }
    
    private function generateHtml() {
        $elementsAmount = count($this->mapData['pages']);
        $counter = 1;
        $elementsCounter = 1;
        $blockCounter = 1;
        if($elementsAmount % $this->maxInColumn != 0) {
            $blocks = floor($elementsAmount/$this->maxInColumn)+1;
        } else {
            $blocks = $elementsAmount/$this->maxInColumn;
        }
        
        $out = '';
//        $out .= "<div class='ApelsinContactsNavigationPanel_ContentWrapper ".$this->CSS_ClassPostfix."'>";
        $out .= "<div class='ApelsinContactsNavigationPanel_ContentWrapperSiteMapElement ".$this->CSS_ClassPostfix."'>";
            foreach ($this->mapData['pages'] as $element) {
                if($counter == 1) {
                    $lastClass = '';
                    if($blockCounter == $blocks) {
                        $lastClass = 'last';
                    }
                    $out .= "<ul class='ApelsinContactsNavigationPanel_ContentList ".$this->CSS_ClassPostfix." ".$lastClass."'>";
                }
                $lastInBlock = $counter == $this->maxInColumn || $elementsCounter == $elementsAmount;
                $out .= $this->generateBlockElement($element['name'],$element['url'],$lastInBlock);
                
                if($lastInBlock) {
                    $counter = 1;
                    $blockCounter++;
                    $out .= "</ul>";
                } else {
                    $counter++;
                }
                $elementsCounter++;
            }
        $out .= "</div>";
//        $out .= "</div>";
        return $out;
    }
    
    private function generateBlockElement($name,$url,$last=false) {
        $out = '';
        $out .= "<li>";
        $out .= "<a href='".$url."'>";
        $out .= "<div class='ApelsinContactsNavigationPanel_Element'>";
        $out .= "<div class='ApelsinContactsNavigationPanel_ElementName'>";
        $out .= $name;
        $out .= "</div>";
        $out .= "</div>";
        $out .= "</a>";
        if(!$last) {
            $out .= "<div class='ApelsinContactsNavigationPanel_ElementLine'></div>";
        }
        $out .= "</li>";
        return $out;
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
