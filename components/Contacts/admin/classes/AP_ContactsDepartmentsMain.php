<?php
/**
 * Description of AP_ContactsDepartmentsMain
 *
 * @author olga
 */
class AP_ContactsDepartmentsMain extends AdminPanel_ComponentPanelUI_Element {
    
    /* Переопределенные функции */
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ContactDepartments` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $department) {
            $this->data[$key]['name'] = $this->getDepartmentDataText($department['alias']);
            $this->data[$key]['listWorker'] = $this->getListWorkerData($department['alias']);
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['alias'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['alias'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['name'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Category">';
        $html .= $dataElement['listWorker'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_ContactsDepartmentsAdd = new AP_ContactsDepartmentsAdd();
        $this->html = $ap_ContactsDepartmentsAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_ContactsDepartmentsEdit = new AP_ContactsDepartmentsEdit($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsDepartmentsEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $AP_ContactsDepartmentsDelete = new AP_ContactsDepartmentsDelete($this->URL_PARAMS[5]);
        $this->html = $AP_ContactsDepartmentsDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $AP_ContactsDepartmentsDelete = new AP_ContactsDepartmentsDelete($this->URL_PARAMS[5]);
        $this->html = $AP_ContactsDepartmentsDelete->delete(false);
    }
    
    /* Новые функции */
    
    private function getDepartmentDataText($shop) {
        $name = "";
        $this->langHelper = new LangHelper("ContactDepartments_Lang","lang","department",$shop,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $name = $langData["name"];
        }
        return $name;
    }
    
    private function getListWorkerData($department) {
        $list = "";
        $query = "SELECT * FROM `ContactDepartments_has_ContactsWorkersList` WHERE `department`='".$department."';";
        $departments = $this->SQL_HELPER->select($query);
        if($departments != null) {
            foreach ($departments as $department) {
                $list .= $department['list'];
            }
        }
        return $list;
    }
}