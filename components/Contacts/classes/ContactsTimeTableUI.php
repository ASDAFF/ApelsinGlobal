<?php

class ContactsTimeTableUI {
    private $localization;
    private $days;
    private $mainDays;
    private $thisLang;
    private $timeTable;
    
    
    public function __construct($timeTable) {
        $this->localization = new Localization();
        $this->days = array("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun");
        $this->mainDays = array("Sat", "Sun");
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->timeTable = $timeTable;
        $this->generateTimeTable();
        $this->generateHTML();
    }
    
    private function setStartElementForTimeTable($i,$j) {
        foreach ($this->mainDays as $mainDays) {
            if($mainDays==$this->days[$j]) {
                $this->finalTimeTable[$i]['statrtText'] = "<span class='mainDay'>".$this->localization->getText($this->days[$j])."</span>";
                $this->finalTimeTable[$i]['time'] = $this->timeTable[$j];
                return;
            }
        }
        $this->finalTimeTable[$i]['statrtText'] = $this->localization->getText($this->days[$j]);
        $this->finalTimeTable[$i]['time'] = $this->timeTable[$j];
    }
    
    private function setEndElementForTimeTable($i,$j){
        $text1 = $this->finalTimeTable[$i]['statrtText'];
        $text2 = $this->localization->getText($this->days[$j-1]);
        foreach ($this->mainDays as $mainDays) {
            if($mainDays==$this->days[$j-1]) {
                $text2 = "<span class='mainDay'>".$this->localization->getText($this->days[$j-1])."</span>";
            }
        }
        if($text1==$text2) {
            $this->finalTimeTable[$i]['endText']="";
        } else {
            $this->setEndElementForTimeTableText($i,$j);
        }
    }
    
    private function setEndElementForTimeTableText($i,$j){
        foreach ($this->mainDays as $mainDays) {
            if($mainDays==$this->days[$j-1]) {
                $this->finalTimeTable[$i]['endText'] = " - <span class='mainDay'>".$this->localization->getText($this->days[$j-1])."</span>";
                return;
            }
        }
        $this->finalTimeTable[$i]['endText'] = " - ".$this->localization->getText($this->days[$j-1]);
    }


    private function generateTimeTable() {
        $this->finalTimeTable=null;
        $i=0;
        $this->setStartElementForTimeTable($i,$i);
        for($j=1; $j<count($this->timeTable); $j++){
            if($this->finalTimeTable[$i]['time']!=$this->timeTable[$j]){
                $this->setEndElementForTimeTable($i,$j);
                $i++;
                $this->setStartElementForTimeTable($i,$j);
            }
            if($j==count($this->timeTable)-1){
                $this->setEndElementForTimeTable($i,$j+1);
            }
        }
    }
    
    private function generateHTML() {
        $this->html = "<table class='time_table'>";
        foreach ($this->finalTimeTable as $timeTable) {
            $this->html .= "<tr>";
            $this->html .= "<td class='time_table_text'>";
            $this->html .= $timeTable['statrtText'];  
            $this->html .= $timeTable['endText'];
            $this->html .= "</td>";
            $this->html .= "<td class='time_table_time'>";
            $this->html .= $timeTable['time'];
            $this->html .= "</td>";
            $this->html .= "</tr>";  
        }
        $this->html .= "</table>";
    }
    
    public function getTimeTable(){
        echo $this->html;
    }
    
    public function getTimeTableHTML(){
        return $this->html;
    }
}
