<?php

class AP_contactsUnitsTypesMain extends AdminPanel_ComponentPanelUI_Element {
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ContactsUnitsTypes` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $type) {
            $this->data[$key]['title'] = $this->getContactsUnitsType($type['type']);
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['type'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['type'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['title'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Category">';
        if ($dataElement['show'] == 0) {
            $show = 'Не показывать';
        } else {
            $show = 'Показывать';
        }
        $html .= $show.'; последовательность показа '.$dataElement['sequence'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_contactsUnitsTypesAdd = new AP_contactsUnitsTypesAdd();
        $this->html = $ap_contactsUnitsTypesAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_contactsUnitsTypesEdit = new AP_contactsUnitsTypesEdit($this->URL_PARAMS[5]);
        $this->html = $ap_contactsUnitsTypesEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_contactsUnitsTypesDelete = new AP_contactsUnitsTypesDelete($this->URL_PARAMS[5]);
        $this->html = $ap_contactsUnitsTypesDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_contactsUnitsTypesDelete = new AP_contactsUnitsTypesDelete($this->URL_PARAMS[5]);
        $this->html = $ap_contactsUnitsTypesDelete->delete(false);
    }
    
    private function getContactsUnitsType($type) {
        $title = "";
        $this->langHelper = new LangHelper("ContactsUnitsTypes_Lang","lang","type",$type,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $title = $langData["typeName"];
        }
        return $title;
    }
}