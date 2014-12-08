<?php
/**
 * Description of ContactsShopMain
 *
 * @author olga
 */
class AP_ContactsShopMain extends AdminPanel_ComponentPanelUI_Element {
    
    /* Переопределенные функции */
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ContactsShop` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $shop) {
            $this->data[$key]['name'] = $this->getShopDataText($shop['alias']);
            $this->data[$key]['list'] = $shop['workers'];
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
        $html .= $dataElement['list'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_ContactsShopAdd = new AP_ContactsShopAdd();
        $this->html = $ap_ContactsShopAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_ContactsShopEdit = new AP_ContactsShopEdit($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsShopEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_ContactsShopDelete = new AP_ContactsShopDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsShopDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_ContactsShopDelete = new AP_ContactsShopDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsShopDelete->delete(false);
    }
    
    /* Новые функции */
    
    private function getShopDataText($shop) {
        $name = "";
        $this->langHelper = new LangHelper("ContactsShop_Lang","lang","shop",$shop,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $name = $langData["name"];
        }
        return $name;
    }
}