<?php
/**
 * Description of AP_ContactsWorkers
 *
 * @author olga
 */
class AP_ContactsWorkersMain extends AdminPanel_ComponentPanelUI_Element {
    
    /* Переопределенные функции */
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ContactsWorkers` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $worker) {
            $this->data[$key]['name'] = $this->getContactsWorkersDataText($worker['id']);
            $this->data[$key]['list'] = $this->getWorkersListData($worker['id']);
            $this->data[$key]['post'] = $worker['post'];
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['id'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['post'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['name'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Category">';
        $html .= $dataElement['list'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_ContactsWorkersAdd = new AP_ContactsWorkersAdd();
        $this->html = $ap_ContactsWorkersAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_ContactsWorkersEdit = new AP_ContactsWorkersEdit($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsWorkersEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_ContactsWorkersDelete = new AP_ContactsWorkersDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsWorkersDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_ContactsWorkersDelete = new AP_ContactsWorkersDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsWorkersDelete->delete(false);
    }
    
    /* Новые функции */
    
    private function getContactsWorkersDataText($worker) {
        $workers = "";
        $this->langHelper = new LangHelper("ContactsWorkers_Lang","lang","worker",$worker,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $workers = $langData["fio"];
        }
        return $workers;
    }
    
    private function getPostWorkersData($list) {
        $lists = "";
        $query = "SELECT * FROM `ContactsWorkers_has_ContactsWorkersList` WHERE `list`='".$list."';";
        $contactsWorkersListData = $this->SQL_HELPER->select($query);
        if($contactsWorkersListData != null) {
            foreach ($contactsWorkersListData as $list) {
                $lists .= $list['list'];
            }
        }
        return $lists;
    }
    
    private function getWorkersListData($list) {
        $lists = "";
        $query = "SELECT * FROM `ContactsWorkers_has_ContactsWorkersList` WHERE `contact`='".$list."';";
        $contactsWorkersListData = $this->SQL_HELPER->select($query);
        if($contactsWorkersListData != null) {
            foreach ($contactsWorkersListData as $list) {
                $lists .= $list['list'];
            }
        }
        return $lists;
    }
}