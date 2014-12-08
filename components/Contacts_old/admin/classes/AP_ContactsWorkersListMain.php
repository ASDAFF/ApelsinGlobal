<?php
/**
 * Description of AP_ContactsWorkersListMain
 *
 * @author olga
 */
class AP_ContactsWorkersListMain extends AdminPanel_ComponentPanelUI_Element {
    
    /* Переопределенные функции */
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ContactsWorkersList` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $list) {
            $this->data[$key]['alias'] = $list['alias'];
            $this->data[$key]['name'] = $list['alias'];
            $this->data[$key]['contact'] = $this->getContactsWorkersData($list['alias']);
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
        $html .= $dataElement['contact'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_ContactsWorkersListAdd = new AP_ContactsWorkersListAdd();
        $this->html = $ap_ContactsWorkersListAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_ContactsWorkersListEdit = new AP_ContactsWorkersListEdit($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsWorkersListEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_ContactsWorkersListDelete = new AP_ContactsWorkersListDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsWorkersListDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_ContactsWorkersListDelete = new AP_ContactsWorkersListDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsWorkersListDelete->delete(false);
    }
    
    /* Новые функции */
    private function getContactsWorkersData($list) {
        $contact = "";
        $query = "SELECT * FROM `ContactsWorkers_has_ContactsWorkersList` WHERE `list`='".$list."';";
        $contactData = $this->SQL_HELPER->select($query);
        if($contactData != null) {
            foreach ($contactData as $contacts) {
                $contact .= substr($contacts['contact'], 0, stripos($contacts['contact'], ' ' )).", "; 
            }
        }
        return $contact;
    }
}