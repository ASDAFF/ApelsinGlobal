<?php
/**
 * Description of AP_VacanciesAdressMain
 *
 * @author olga
 */
class AP_VacanciesAdressMain extends AdminPanel_ComponentPanelUI_Element {
    
/* Переопределенные функции */
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `VacanciesAdress` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $vacancies) {
            $this->data[$key]['adress'] = $vacancies['adress'];
            $this->data[$key]['page'] = $this->getVacanciesAdressPagesData($vacancies['adress']);
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['adress'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['page'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['adress'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Category">';
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_VacanciesAdressAdd = new AP_VacanciesAdressAdd();
        $this->html = $ap_VacanciesAdressAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_VacanciesAdressEdit = new AP_VacanciesAdressEdit($this->URL_PARAMS[5]);
        $this->html = $ap_VacanciesAdressEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_VacanciesAdressDelete = new AP_VacanciesAdressDelete($this->URL_PARAMS[5]);
        $this->html = $ap_VacanciesAdressDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_VacanciesAdressDelete = new AP_VacanciesAdressDelete($this->URL_PARAMS[5]);
        $this->html = $ap_VacanciesAdressDelete->delete(false);
    }
    
    /* Новые функции */
    
    private function getVacanciesAdressPagesData($adress) {
        $adres = '';
        $query = "SELECT * FROM `VacanciesAdressPages`  where `adress` = '".$adress."';";
        $adresses = $this->SQL_HELPER->select($query);
        if($adresses != null) {
            foreach ($adresses as $adr) {
                $adres .= $adr['page'];
            }
        }
        return $adres;
    }
}