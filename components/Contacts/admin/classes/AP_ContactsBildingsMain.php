<?php
/**
 * Description of AP_ContactsBildingsMain
 *
 * @author olga
 */
class AP_ContactsBildingsMain  extends AdminPanel_ComponentPanelUI_Element {
    
    /* Переопределенные функции */
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ContactsShopBuilding` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $shopBuilding) {
            $this->data[$key]['name'] = $this->getShopBuildingDataText($shopBuilding['alias']);
            $this->data[$key]['shop'] = $this->getShopData($shopBuilding['alias']);
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
        $html .= $dataElement['shop'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_ContactsBildingsAdd = new AP_ContactsBildingsAdd();
        $this->html = $ap_ContactsBildingsAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_ContactsBildingsEdit = new AP_ContactsBildingsEdit($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsBildingsEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_ContactsBildingsDelete = new AP_ContactsBildingsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsBildingsDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_ContactsBildingsDelete = new AP_ContactsBildingsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_ContactsBildingsDelete->delete(false);
    }
    
    /* Новые функции */
    
    private function getShopBuildingDataText($shopBuilding) {
        $name = "";
        $this->langHelper = new LangHelper("ContactsShopBuilding_Lang","lang","shopBuilding",$shopBuilding,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $name = $langData["name"];
        }
        return $name;
    }
    
    private function getShopData($shopBuilding) {
        $shop = "";
        $query = "SELECT * FROM `ContactsShopBuilding` WHERE `alias`='".$shopBuilding."';";
        $shopBuildingData = $this->SQL_HELPER->select($query);
        if($shopBuildingData != null) {
            foreach ($shopBuildingData as $shopBuilding) {
                $shop .= $this->getShopDataText($shopBuilding['shop']).", ";
            }
        }
        return $shop;
    }
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