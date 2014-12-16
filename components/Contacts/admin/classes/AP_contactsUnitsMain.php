<?php

class AP_contactsUnitsMain extends AdminPanel_ComponentPanelUI_Element {
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `ContactsUnits` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $type) {
            $this->data[$key]['title'] = $this->getContactsUnits($type['unit']);
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['unit'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['unit'];
        $html .= "<div class='Date'>";
        $html .= $dataElement['type'];
        $html .= '</div>';
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
        $html .= $show.' '.$dataElement['sequence'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_contactsUnitsAdd = new AP_contactsUnitsAdd();
        $this->html = $ap_contactsUnitsAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_contactsUnitsEdit = new AP_contactsUnitsEdit($this->URL_PARAMS[5]);
        $this->html = $ap_contactsUnitsEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_contactsUnitsDelete = new AP_contactsUnitsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_contactsUnitsDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_contactsUnitsDelete = new AP_contactsUnitsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_contactsUnitsDelete->delete(false);
    }
    

    private function getContactsUnits($type) {
        $title = "";
        $this->langHelper = new LangHelper("ContactsUnits_Lang","lang","unit",$type,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $title = $langData["name"];
        }
        return $title;
    }
}
