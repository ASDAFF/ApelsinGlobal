<?php
/**
 * Description of AP_ContactsWorkersPostsMain
 *
 * @author olga
 */
class AP_ContactsWorkersPostsMain  extends AdminPanel_ComponentPanelUI_Element{
    
    /* Переопределенные функции */
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ContactsWorkersPosts` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $workersPosts) {
            $this->data[$key]['alias'] = $workersPosts['alias'];
            $this->data[$key]['name'] = $this->getWorkersPostData($workersPosts['alias']);
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
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_ContactsWorkersAdd = new AP_ContactsWorkersPostsAdd();
        $this->html = $ap_ContactsWorkersAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_ContactsWorkersPostsEdit = new AP_ContactsWorkersPostsEdit($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsWorkersPostsEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_ContactsWorkersPostsDelete = new AP_ContactsWorkersPostsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsWorkersPostsDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_ContactsWorkersPostsDelete = new AP_ContactsWorkersPostsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsWorkersPostsDelete->delete(false);
    }
    
    /* Новые функции */
    
    private function getWorkersPostData($post) {
        $name = "";
        $this->langHelper = new LangHelper("ContactsWorkersPosts_Lang","lang","post",$post,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $name = $langData["name"];
        }
        return $name;
    }
}