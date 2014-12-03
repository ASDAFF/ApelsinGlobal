<?php
class ContactDepartmentsList {
    private $thisLang;
    private $noData;
    private $html;
    private $departamentList;
    private $departments;
    private $showParam;
    private $count;
    
    public function __construct() {
        $this->noData = false;
        global $_URL_PARAMS;
        global $_PARAM;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->departamentList = $_PARAM['name'];
        $this->getData();
        $this->generateHTML();
    }
    
    private function getData() {
        $query ="select * from `ContactDepartments_has_ContactDepartmentsList` 
            where `list`='$this->departamentList'
            order by `sequence` asc;";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getAllData();
        if(count($listData)>0) {
            $this->count=0;
            foreach ($listData as $value) {
                $this->departments[$this->count] = $value['department'];
                $this->showParam[$this->count]['showWorkersContacts'] = $value['showWorkersContacts'];
                $this->showParam[$this->count]['showDescription'] = $value['showDescription'];
                $this->showParam[$this->count]['showInfo'] = $value['showInfo'];
                $this->showParam[$this->count]['showTimeTable'] = $value['showTimeTable'];
                $this->count++;
            }
        } else {
            $this->noData = true;
        }
    }
    
    private function generateHTML() {
        $this->html = "";
        if(!$this->noData) {
            for ($i=0; $i<$this->count; $i++) {
                $contactsDepartments = new ContactDepartments($this->departments[$i],$this->showParam[$i]);
                $this->html .= $contactsDepartments->getHTML();
            }
        }
    }
    
    public function get(){
        echo $this->html;
    }
    
    public function getHTML(){
        return $this->html;
    }
}
?>
