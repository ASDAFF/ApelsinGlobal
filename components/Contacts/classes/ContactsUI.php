<?php

class ContactsUI {
    private $contactsData;
    private $mainPageData;
    private $HTML;
    
    public function __construct($contactsData) {
        $this->contactsData = $contactsData['all'];
        $this->mainPageData = $contactsData['mainPage'];
        $this->HTML = '';
        $this->HTML .= ContactsUI_Tabs::ContactsTabsUI($this->contactsData,$this->mainPageData);
    }
    
    public function getHTML() {
        return $this->HTML;
    }
    
    public function getJS() {
        $html = '';
        $html .= "<script type='text/javascript'>";
        $html .= "$(document).ready(function() {";
        $html .= "ContactsUnitsTypes_OpenTab('".$this->contactsData[0]['type']."');";
        $html .= "});";
        $html .= "</script>";
        return $html;
    }
}
