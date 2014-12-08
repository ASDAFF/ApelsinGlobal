<?php
/**
 * Description of AP_ContactDepartmentsListMain
 *
 * @author olga
 */
class AP_ContactDepartmentsListMain extends AdminPanel_ComponentPanelUI_Element {
    
    /* Переопределенные функции */
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ContactDepartmentsList` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $list) {
            $this->data[$key]['alias'] = $list['alias'];
            $this->data[$key]['department'] = $this->getDepartmensData($list['alias']);
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['alias'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['department'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['alias'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_ContactDepartmentsListAdd = new AP_ContactDepartmentsListAdd();
        $this->html = $ap_ContactDepartmentsListAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_ContactDepartmentsListEdit = new AP_ContactDepartmentsListEdit($this->URL_PARAMS[5]);
        $this->html = $ap_ContactDepartmentsListEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_ContactDepartmentsListDelete = new AP_ContactDepartmentsListDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactDepartmentsListDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_ContactDepartmentsListDelete = new AP_ContactDepartmentsListDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactDepartmentsListDelete->delete(false);
    }
    
    private function getDepartmensData($list) {
        
        $department = "";
        $query = "SELECT * FROM `ContactDepartments_has_ContactDepartmentsList` WHERE `list`='".$list."';";
        $departmentData = $this->SQL_HELPER->select($query);
        if($departmentData != null) {
            foreach ($departmentData as $departments) {
                $department .= $departments['department'].", "; 
            }
        }
        return $department;
    }
}