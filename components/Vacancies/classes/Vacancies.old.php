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
        /*$query ="select
            Va.`vacancies`,Va.`responsibility`,
            Va.`terms`,Va.`requirements`,
            Va.`adress`,Va.`contactInfo`,
            Va.`contactUser`,VAP.`page`
            from
            (select
            Va.`vacancies`,Va.`responsibility`,
            Va.`terms`,Va.`requirements`,
            Va.`adress`,Va.`contactInfo`,
            Va.`contactUser`
            from
            (select
            VV.`vacancies`,Va.`responsibility`,
            Va.`terms`,Va.`requirements`,
            VV.`adress`,VV.`contactInfo`,
            VV.`contactUser`
            from 
            `VacanciesValid` as VV
            left join
            `Vacancies` as Va
            on VV.`vacancies` = Va.`name`) as Va
            left join
            `VacanciesAdress` as VA
            on Va.`adress` = VA.`adress`) as Va
            left join
            `VacanciesAdressPages` as VAP
            on Va.`adress` = VAP.`adress`";*/
        $query ="select
	      Va.`vacancies`,Va.`responsibility`,
	      Va.`terms`,Va.`requirements`,
	      Va.`adress`,Va.`contactInfo`,
	      Va.`contactUser`,VAP.`page`,Va.`id`
	      from
	      (select
	      Va.`vacancies`,Va.`responsibility`,
	      Va.`terms`,Va.`requirements`,
	      Va.`adress`,Va.`contactInfo`,
	      Va.`contactUser`,Va.`id`
	      from
	      (select
	      VV.`vacancies`,Va.`responsibility`,
	      Va.`terms`,Va.`requirements`,
	      VV.`adress`,VV.`contactInfo`,
	      VV.`contactUser`,VV.`id`
	      from 
	      `VacanciesValid` as VV
	      left join
	      `Vacancies` as Va
	      on VV.`vacancies` = Va.`name`) as Va
	      left join
	      `VacanciesAdress` as VA
	      on Va.`adress` = VA.`adress`) as Va
	      left join
	      `VacanciesAdressPages` as VAP
	      on Va.`adress` = VAP.`adress`
	      order by Va.`id` desc";
        $mySqlHelper = new MySqlHelper($query);
        $this->vacanciesData = $mySqlHelper->getAllData();
        if(count($this->vacanciesData)<1) {
            $this->noData = true;
        }
    }
    
    private function getAdresString($adress,$page) {
        $adress = "<div class='valid_vacancy_adress'><span class='valid_vacancy_text_adress'>".$adress."</span></div>";
        if($page!=null && $page!="") {
            $urlHelper = new UrlHelper();
            $url = $urlHelper->pageUrl($page, null);
            return "<a href='$url' title='".$this->localization->getText('openContact')."'>".$adress."</a>";
        } else {
            return $adress;
        }
    }
    
    private function generateHtmlFirst() {
        $this->firstHtml = "";
        $this->firstHtml .= "<h2>";
        $this->firstHtml .= $this->localization->getText('vacancies');
        $this->firstHtml .= "</h2>";
        $this->firstHtml .= $this->text;
        $this->firstHtml .= "<center>";
//        $this->firstHtml .= $this->blank->getButonHTML();
        $this->firstHtml .= "</center>";
        $this->firstHtml .= "<h2>";
        $this->firstHtml .= $this->localization->getText('available_vacancies');
        $this->firstHtml .= "</h2>";
        if(!$this->noData) {
            foreach ($this->vacanciesData as $vacancy) {
                $this->firstHtml .= "<div class='valid_vacancy'>";
                $this->firstHtml .= "<div class='valid_vacancy_vacancy'>";
                $this->firstHtml .= "<span class='valid_vacancy_text_vacancies'>";
                $this->firstHtml .= $vacancy['vacancies'];
                $this->firstHtml .= "</span>";
                $this->firstHtml .= "</div>";
                $this->firstHtml .= $this->getAdresString($vacancy['adress'],$vacancy['page']);
                $this->firstHtml .= "<div class='clear'></div>";
                if(($vacancy['responsibility']!=null && $vacancy['responsibility']!="") || 
                        ($vacancy['terms']!=null && $vacancy['terms']!="") ||
                        ($vacancy['requirements']!=null && $vacancy['requirements']!="")) {
                    $this->firstHtml .= "<div class='valid_vacancy_description'>";
                    if($vacancy['responsibility']!=null && $vacancy['responsibility']!="") {
                        $this->firstHtml .= "<span class='valid_vacancy_text'>";
                        $this->firstHtml .= $this->localization->getText('responsibility');
                        $this->firstHtml .= "</span>";
                        $this->firstHtml .= $vacancy['responsibility'];
                        $this->firstHtml .= "<br />";
                    }
                    if($vacancy['terms']!=null && $vacancy['terms']!="") {
                        $this->firstHtml .= "<span class='valid_vacancy_text'>";
                        $this->firstHtml .= $this->localization->getText('terms');
                        $this->firstHtml .= "</span>";
                        $this->firstHtml .= $vacancy['terms'];
                        $this->firstHtml .= "<br />";
                    }
                    if($vacancy['requirements']!=null && $vacancy['requirements']!="") {
                        $this->firstHtml .= "<span class='valid_vacancy_text'>";
                        $this->firstHtml .= $this->localization->getText('requirements');
                        $this->firstHtml .= "</span>";
                        $this->firstHtml .= $vacancy['requirements'];
                        $this->firstHtml .= "<br />";
                    }
                    $this->firstHtml .= "</div>";
                } else {
                    $this->firstHtml .= "<div class='inf'><center>";
                    $this->firstHtml .= $this->localization->getText('noInfo');
                    $this->firstHtml .= "</center></div>";
                }
                $this->firstHtml .= "<div class='valid_vacancy_contacts'>";
                $this->firstHtml .= "<span class='valid_vacancy_contacts_fio'>";
                $this->firstHtml .= $vacancy['contactUser'];
                $this->firstHtml .= "</span>";
                $this->firstHtml .= '<img src="./images/icons/contacts/phone.png" align="absmiddle">';
                $this->firstHtml .= "<span class='valid_vacancy_contacts_phone'>";
                $this->firstHtml .= $vacancy['contactInfo'];
                $this->firstHtml .= "</span>";
                $this->firstHtml .= "</div>";
                $this->firstHtml .= "<div class='clear'></div>";
                $this->firstHtml .= "</div>";
            }
        }
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
