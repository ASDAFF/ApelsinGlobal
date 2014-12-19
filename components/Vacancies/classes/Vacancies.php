<?php
class Vacancies {
    private $thisLang;
    private $noData;
    private $firstHtml;
    private $html;
    private $printHtml;
    private $localization;
    
    private $text;
    private $vacanciesData;
    private $blank;
    
    public function __construct() {
        $this->blank = new BlankForm();
        $this->localization = new Localization();
        $this->noData = false;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->getData();
        $this->generateHtmlFirst();
        $this->generateHtml();
        $this->generatePrintHtml();
    }
    
    private function getData() {
        $this->getTextData();
        $this->getVacanciesData();
    }
    
    private function getTextData() {
        $query ="select `text` from `VacanciesText` where `lang`='$this->thisLang'";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getDataRow(0);
        $this->text = $listData['text'];
    }
    
    private function getVacanciesData() {
        $query ="SELECT  
            `vacancies`,
            `responsibility`,
            `terms`,
            `requirements`,
            `importance`
            FROM  `VacanciesValid` as VV left join `Vacancies` as Va
            on VV.`vacancies` = Va.`name`
            GROUP BY  `vacancies`
            order by Va.`importance` asc;";
        $mySqlHelper = new MySqlHelper($query);
        $this->vacanciesData = $mySqlHelper->getAllData();
        foreach ($this->vacanciesData as $key => $vacancy) {
            $this->vacanciesData[$key]['position'] = $this->getVacanciesValidData($vacancy['vacancies']);
        }
    }
    
    private function getVacanciesValidData($vacancy) {
        $query ="SELECT
            Va.`adress`,
            VAP.`page`,
            Va.`contactUser`,
            Va.`contactInfo`
            FROM
            (SELECT 
            VV.`id`,
            VV.`vacancies`,
            VA.`adress`,
            VV.`contactUser`,
            VV.`contactInfo`
            FROM  
            `VacanciesValid` as VV 
            left join
            `VacanciesAdress` as VA
            on VV.`adress` = VA.`adress`
            WHERE  VV.`vacancies` =  '".$vacancy."') as Va
            left join
            `VacanciesAdressPages` as VAP
            on Va.`adress` = VAP.`adress`;";
        $mySqlHelper = new MySqlHelper($query);
        return $mySqlHelper->getAllData();
    }
    
    private function getVacanciesValidBlock($vacancy,$key) {
        $html = "";
        $html .= "<div class='VacanciesValidBlock'>";
            $html .= "<div class='VacanciesValidBlockTitle'>";
                $html .= "<div class='VacanciesValidBlockTitleText'>";
                    $html .= $vacancy['vacancies'];
                    $html .= "<div class='VacanciesValidBlockTitleInfoIcon'>";
                        $html .= '<a class="fancybox-doc" href="#VacanciesValidBlock_'.$key.'" title="Информация о вакансии"></a>';
                    $html .= "</div>";
                $html .= "</div>";
                $html .= "<div class='clear'></div>";
            $html .= "</div>";
            foreach ($vacancy['position'] as $vacancyPosition) {
                $html .= $this->getVacanciesValidString($vacancyPosition);
            }
            $html .= '<div class="doc_div" id="VacanciesValidBlock_'.$key.'" style="display: none;">';
            $html .= "<h2>";
            $html .= $vacancy['vacancies'];
            $html .= "</h2>";
            if(($vacancy['responsibility']!=null && $vacancy['responsibility']!="") || 
                    ($vacancy['terms']!=null && $vacancy['terms']!="") ||
                    ($vacancy['requirements']!=null && $vacancy['requirements']!="")) {
                $html .= "<div class='VacanciesValidText_description'>";
                if($vacancy['responsibility']!=null && $vacancy['responsibility']!="") {
                    $html .= "<span class='VacanciesValidText_text'>";
                    $html .= $this->localization->getText('responsibility');
                    $html .= "</span>";
                    $html .= $vacancy['responsibility'];
                    $html .= "<br />";
                }
                if($vacancy['terms']!=null && $vacancy['terms']!="") {
                    $html .= "<span class='VacanciesValidText_text'>";
                    $html .= $this->localization->getText('terms');
                    $html .= "</span>";
                    $html .= $vacancy['terms'];
                    $html .= "<br />";
                }
                if($vacancy['requirements']!=null && $vacancy['requirements']!="") {
                    $html .= "<span class='VacanciesValidText_text'>";
                    $html .= $this->localization->getText('requirements');
                    $html .= "</span>";
                    $html .= $vacancy['requirements'];
                    $html .= "<br />";
                }
                $html .= "</div>";
            } else {
                $html .= "<div class='inf'><center>";
                $html .= $this->localization->getText('noInfo');
                $html .= "</center></div>";
            }
            $html .= '</div>';
        $html .= "</div>";
//        $html .= "<div class='clear'></div>";
        return $html;
    }

    private function getVacanciesValidString($vacancy) {
        $html = "";
        $html .= "<div class='VacanciesValidString'>";
        $html .= $this->getAdresString($vacancy['adress'],$vacancy['page']);
        $html .= $this->getContactUserString($vacancy['contactUser']);
        $html .= $this->getContactInfoString($vacancy['contactInfo']);
        $html .= "<div class='clear'></div>";
        $html .= "</div>";
        return $html;
    }
    
    private function getAdresString($adress,$page) {
        if($page!=null && $page!="") {
            $urlHelper = new UrlHelper();
            $url = $urlHelper->pageUrl($page, null);
            $adress = "<a href='$url' title='".$this->localization->getText('openContact')."' class='validVacancyAdressURL'><span class='validVacancyAdressText'>".$adress."</span></a>";
        }
        return "<div class='validVacancyAdress'>".$adress."</div>";
    }
    
    private function getContactUserString($contactUser) {
        return "<div class='validVacancyContactUser'><span class='validVacancyContactUserText'>".$contactUser."</span></div>";
    }
    private function getContactInfoString($contactInfo) {
        return "<div class='validVacancyContactInfo'><span class='validVacancyContactInfoText'>".$contactInfo."</span></div>";
    }
    
    private function generateHtmlFirst() {
        $this->firstHtml = "";
        $this->firstHtml .= $this->text;
        $this->firstHtml .= "<br>";
        $this->firstHtml .= "<div id='VacanciesValidBlockArchive' class='VacanciesValidBlockArchive'>";
        if(!$this->noData) {
            foreach ($this->vacanciesData as $key => $vacancy) {
                $this->firstHtml .= $this->getVacanciesValidBlock($vacancy,$key);
            }
        }
        $this->firstHtml .= "</div>";
        $this->firstHtml .= "<div id='VacanciesValidBlockColumn_01' class='VacanciesValidBlockColumn_01'></div>";
        $this->firstHtml .= "<div id='VacanciesValidBlockColumn_02' class='VacanciesValidBlockColumn_02'></div>";
        $this->firstHtml .= "<div class='clear'></div>";
    }


    private function generatePrintHtml() {
        $this->printHtml = $this->firstHtml;
    }


    private function generateHtml() {
//        $this->blank = new BlankForm();
        $this->html = $this->firstHtml;
        $this->html .= "<center>";
        $this->html .= $this->blank->getHTML();
        $this->html .= "</center>";
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
    
//    public function insert() {
//        $this->blank->insert();
//    }
}
?>
