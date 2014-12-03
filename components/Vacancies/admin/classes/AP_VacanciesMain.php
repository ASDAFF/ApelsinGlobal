<?php
/**
 * Description of AP_VacanciesMain
 *
 * @author olga
 */
class AP_VacanciesMain  extends AdminPanel_ComponentPanelUI_Element {
    
/* Переопределенные функции */
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `Vacancies` order by `importance`;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $vacancies) {
            $this->data[$key]['alias'] = $vacancies['name'];
            $this->data[$key]['importance'] = $vacancies['importance'];
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['alias'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['importance'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['alias'];
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
        $ap_VacanciesAdd = new AP_VacanciesAdd();
        $this->html = $ap_VacanciesAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_VacanciesEdit = new AP_VacanciesEdit($this->URL_PARAMS[5]);
        $this->html = $ap_VacanciesEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_VacanciesDelete = new AP_VacanciesDelete($this->URL_PARAMS[5]);
        $this->html = $ap_VacanciesDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_VacanciesDelete = new AP_VacanciesDelete($this->URL_PARAMS[5]);
        $this->html = $ap_VacanciesDelete->delete(false);
    }
}