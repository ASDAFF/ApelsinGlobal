<?php
class AP_сontactsWorkersMain extends AdminPanel_ComponentPanelUI_Element {
    
    protected function getData() {
        parent::getData();
        parent::getData();
        $query = "SELECT * FROM `ContactsWorkers` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $worker) {
            $this->data[$key]['name'] = $worker['worker'];
            $this->data[$key]['unit'] = $this->getWorkersUnitData($worker['worker']);
            $this->data[$key]['post'] = $worker['post'];
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['worker'];
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
        $html .= $dataElement['unit'];
        $html .= '</div>';
        return $html;
    }
    
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_contactsWorkersAdd = new AP_сontactsWorkersAdd();
        $this->html = $ap_contactsWorkersAdd->getForm();
    }
   
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_contactsWorkersEdit = new AP_сontactsWorkersEdit($this->URL_PARAMS[5]);
        $this->html = $ap_contactsWorkersEdit->getForm();
    }
    
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_contactsWorkersDelete = new AP_сontactsWorkersDelete($this->URL_PARAMS[5]);
        $this->html = $ap_contactsWorkersDelete->delete(true);
    }
    
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_contactsWorkersDelete = new AP_сontactsWorkersDelete($this->URL_PARAMS[5]);
        $this->html = $ap_contactsWorkersDelete->delete(false);
    }
   
    private function getWorkersUnitData($worker) {
        $unit = "";
        $query = "SELECT * FROM `ContactsUnitsWokers` WHERE `worker`='".$worker."';";
        $unitData = $this->SQL_HELPER->select($query);
        if($unitData != null) {
            foreach ($unitData as $worker) {
                $unit .= $this->getWorkersUnitDataLang($worker['unit']).", ";
            }
        }
        return $unit;
    }
    
    private function getWorkersUnitDataLang($unit) {
        $title = "";
        $this->langHelper = new LangHelper("ContactsUnits_Lang","lang","unit",$unit,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $title = $langData["name"];
        }
        return $title;
    }
}