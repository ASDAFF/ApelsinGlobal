<?php
/**
 * Description of AP_VacanciesTextEdit
 *
 * @author olga
 */
class AP_VacanciesTextEdit {
    
    private $form;
    private $langArray;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
            if(isset($_POST['AP_Submit']) && $_POST['AP_Submit'] != null && $_POST['AP_Submit'] != '') {
                $this->updateRun();
            } 
            $this->getForm();
    }

    private function getForm() {
        $urlHelper = new UrlHelper();
        $this->form = "";
        $this->form .= '<form class="AP_Form" name="AP_Form" enctype="multipart/form-data" action="'.$urlHelper->getThisPage().'" method="POST" accept - charset="UTF-8" required >';
            $this->form .= '<table class="AP_FormTable">';
            $this->getVacanciesTextData();
            $this->form .= '</table>';
            $this->form .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Изменить"></center>';
        $this->form .= '</form>';
    }
    
    protected function getData() {
        $this->langArray = array();
        $query = "SELECT * FROM  `Lang`;";
        $this->langArray = $this->SQL_HELPER->select($query);
    }
    
    private function getVacanciesTextData(){
        $this->getData();
        foreach ($this->langArray as $langData) {
            $query = "SELECT * FROM `VacanciesText` where `lang` = '".$langData['lang']."';";
            $data = $this->SQL_HELPER->select($query,1);
            $this->form .= '<tr>';
                $this->form .= '<td class="FormTable_RowText" colspan="2">';
                    $this->form .= '<div class="text">'.$langData['langName'].'</div>';
                $this->form .= '</td>';
            $this->form .= '</tr>';
            $this->form .= '<tr>';
                $this->form .= '<td class="FormTable_Text">';
                    $this->form .= '<div class="text">Текст</div>';
                $this->form .= '</td>';
                $this->form .= '<td class="FormTable_Input">';
                    $this->form .= '<textarea name="vacanciesText['.$langData['lang'].']" id="vacanciesText" class="text" maxlength="5000" >'.$data['text'].'</textarea>';
                $this->form .= '</td>';
            $this->form .= '</tr>';
        }
    }
    
    private function updateRun() {
        $this->getForm();
        $this->checkAllValue();
        $this->getAllValue();
        $this->updateExecute();
    }

    protected function getAllValue() {
        if(isset($_POST['vacanciesText']) && $_POST['vacanciesText']!=null && $_POST['vacanciesText']!="") {
            foreach ($_POST['vacanciesText'] as $lang => $text) {
                if ($text != null && $text != '') {
                    $key = InputValueHelper::getMysqlText($lang);    
                    $this->insertValue['vacanciesText'][$key] = InputValueHelper::getMysqlText($text);
                }  
            }
        }
    } 

    protected function checkAllValue() {   
        $error = false;
        $local = false;
        foreach ($this->langArray as $langData) {
            if(isset($_POST['vacanciesText'][$langData['lang']]) && $_POST['vacanciesText'][$langData['lang']]!=null && $_POST['vacanciesText'][$langData['lang']]!="" ) {
                $local = true;
            }
        }
        if(!$local){
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должны быть заполненo текстовoе полe";
        }
        return !$error;
    }
      
    protected function updateExecute() {
        $queryVacanciesText = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['vacanciesText'][$langData['lang']]) && $this->insertValue['vacanciesText'][$langData['lang']]!=null && 
                    $this->insertValue['vacanciesText'][$langData['lang']]!="") {
                $query = "INSERT INTO `VacanciesText` SET ";
                $query .= "`text`='".$this->insertValue['vacanciesText'][$langData['lang']]."', ";
                $query .= "`lang`='".$langData['lang']."'; ";
                $queryVacanciesText[] = $query;
            }
        }
        $queryVacanciesTextDel = "DELETE FROM  `VacanciesText`;";
        $this->SQL_HELPER->insert($queryVacanciesTextDel);
//        echo var_dump($queryVacanciesTextDel) .'<hr>';
        
        foreach($queryVacanciesText as $queryVacancies) {
            $this->SQL_HELPER->insert($queryVacancies);
//            echo var_dump($queryVacancies) .'<hr>';
        }
    }
    
    public function getHtml() {
        return $this->form;
    }
}