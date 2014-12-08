<?php
/**
 * Description of AP_ContactsListDepartmensMain
 *
 * @author olga
 */
class AP_ContactsDepartmensInListMain extends AdminPanel_ComponentPanelUI_Element {
    
//    /* Переопределенные функции */
//    
//    protected function getData() {
//        parent::getData();
//        $query = "SELECT * FROM `ContactDepartments_has_ContactDepartmentsList` ;";
//        $this->data = $this->SQL_HELPER->select($query);
//        foreach ($this->data as $key => $list) {
//            $this->data[$key]['sequence'] = $list['sequence'];
//            $this->data[$key]['list'] = $this->getDepartmensListData($list['list']);
//            $this->data[$key]['department'] = $this->getDepartmensData($list['department']);
//        }
//    }
//    
//    protected function setElementAliasID($dataElement) {
//        $this->elementAliasID = $dataElement['department'];
//    }
//    
//    protected function getHtmlUI($dataElement) {
//        $html = '';
//        $html .= '<div class="ElementBlock Alias">';
//        $html .= $dataElement['list'];
//        $html .= '</div>';
//        $html .= '<div class="ElementBlock Title">';
//        $html .= $dataElement['department'];
//        $html .= '</div>';
//        $html .= '<div class="ElementBlock Category">';
//        $html .= $dataElement['sequence'];
//        $html .= '</div>';
//        return $html;
//    }
//    
//    /**
//     * UI для добавления
//     */
//    protected function generateAddUI() {
//        parent::generateAddUI();
//        $ap_ContactsListDepartmensAdd = new AP_ContactsDepartmensInListAdd();
//        $this->html = $ap_ContactsListDepartmensAdd->getForm();
//    }
//    
//    /**
//     * UI для редактирования
//     */
//    protected function generateEditUI() {
//        parent::generateAddUI();
//        $ap_ContactsListDepartmensEdit = new AP_ContactsDepartmensInListEdit($this->URL_PARAMS[5]);
//        $this->html = $ap_ContactsListDepartmensEdit->getForm();
//    }
//    
//    /**
//     * UI для удаления (удаление подтверждено)
//     */
//    protected function generateDeleteYesUI() {
//        parent::generateDeleteYesUI();
//        $ap_ContactsListDepartmensDelete = new AP_ContactsDepartmensInListDelete($this->URL_PARAMS[5]);
//        $this->html = $ap_ContactsListDepartmensDelete->delete(true);
//    }
//    
//    /**
//     * UI для удаления (удаление не подтверждено)
//     */
//    protected function generateDeleteNoUI() {
//        parent::generateDeleteNoUI();
//        $ap_ContactsListDepartmensDelete = new AP_ContactsDepartmensInListDelete($this->URL_PARAMS[5]);
//        $this->html = $ap_ContactsListDepartmensDelete->delete(false);
//    }
//    
//    /* Новые функции */
//    
//    private function getDepartmensData($department) {
//        $departments = "";
//        $query = "SELECT * FROM `ContactDepartments` WHERE `alias`='".$department."';";
//        $departmentsData = $this->SQL_HELPER->select($query);
//        if($departmentsData != null) {
//            foreach ($departmentsData as $department) {
//                $departments .= $this->getDepartmensDataText($department['alias']);
//            }
//        }
//        return $departments;
//    }
//    
//    private function getDepartmensDataText($department) {
//        $departments = "";
//        $this->langHelper = new LangHelper("ContactDepartments_Lang","lang","department",$department,$this->thisLang);
//        $this->langType = $this->langHelper->getLangType();
//        if($this->langType != -1){
//            $langData = $this->langHelper->getLangData();
//            $departments = $langData["name"];
//        }
//        return $departments;
//    }
//    
//    private function getDepartmensListData($list) {
//        $lists = "";
//        $query = "SELECT * FROM `ContactDepartmentsList` WHERE `alias`='".$list."';";
//        $departmentsListData = $this->SQL_HELPER->select($query);
//        if($departmentsListData != null) {
//            foreach ($departmentsListData as $list) {
//                $lists .= $list['alias'];
//            }
//        }
//        return $lists;
//        
//    }
}