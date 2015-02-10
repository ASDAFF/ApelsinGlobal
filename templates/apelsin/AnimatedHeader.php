<?php
class AnimatedHeader {
    private $HTML;
    private $count = 1;
    private $tableSize;
    private $imgDir;
    
    public function __construct() {
        global $ROOT;
        $this->imgDir = $ROOT->getTemplatePath().'AnimatedHeaderIMG/';
        $this->count;
        $this->setTableSize();
        $this->generateHTML();
    }
    private function createFirstCellRow() {
        return '<td class="FirstCellRow"></td>';
    }
    private function createFirstCellColumn() {
        return '<td class="FirstCellColumn"></td>';
    }
    private function createCornerCell() {
        return '<td class="CornerCell"></td>';
    }

    private function createTableCell($size = 1) {
        $class = 'class="CellSize'.$size.'"';
        $id = 'id="AnimatedHeaderCell_'.$this->count++.'"';
        if($size > 1) {
            $size = 'colspan="'.$size.'" rowspan="'.$size.'"';
        } else {
            $size = '';
        }
        return '<td '.$class.' '.$id.' '.$size.'></td>';
    }
    
    private function createTableRow($cells) {
        return '<tr>'.$cells.'</tr>';
    }
    
    private function createTable($rows) {
        return '<table class="AnimatedHeaderColumn">'.$rows.'</table>';
    }
    private function setTableSize() {
        $this->tableSize = array();
//        $this->tableSize[1] = array(2,4,1,2,1,1,2,2,1,2,1,1,1,2,3,2,4,1,1,1,1,2,2);
//        $this->tableSize[2] = array(1,2,1,3,3,1);
//        $this->tableSize[3] = array(1,1,3,4,1,1,1,2,1,1,3,2);
//        $this->tableSize[4] = array(2,1,1,3,3,2);
//        $this->tableSize[5] = array(2,2,2,1,2,2,2,2,1,2,2);
//        $this->tableSize[6] = array(1,1,1,1,1,1,1,1,1,1,1,1);
        $this->tableSize[1] = array(2,4,1,2,1,1,2,2,1,2,1,1,1,2,3,2,4,1,1,1,1,2,2,2,4,1,2,1,1,2,2,1,2,1,1,1,2,3,2,4,1,1,1,1,2,2);
        $this->tableSize[2] = array(1,2,1,3,3,1,1,2,1,3,3,1);
        $this->tableSize[3] = array(1,1,3,4,1,1,1,2,1,1,3,2,1,1,3,4,1,1,1,2,1,1,3,2);
        $this->tableSize[4] = array(2,1,1,3,3,2,2,1,1,3,3,2);
        $this->tableSize[5] = array(2,2,2,1,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,1,2,2);
        $this->tableSize[6] = array(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
    }
    
    
    private function generateHTML() {
        $rows = '';
        $cells = $this->createCornerCell();
        for($i=0;$i<80;$i++) {
            $cells .= $this->createFirstCellRow();
        }
        $rows .= $this->createTableRow($cells);
        foreach ($this->tableSize as $row) {
            $cells = $this->createFirstCellColumn();
            foreach ($row as $cell) {
                $cells .= $this->createTableCell($cell);
            }
            $rows .= $this->createTableRow($cells);
        }
        $this->HTML = $this->createTable($rows);
    }
    
    public function get() {
        echo $this->HTML;
    }
    
    public function getJS() {
        $html = '';
        $html .= "<script type='text/javascript'>";
        $html .= "$(document).ready(function() {";
//        $html .= "alert('".($this->count-1)."')";
        $html .= "AnimatedHeader_START('".($this->count-1)."',".json_encode($this->scanDir()).");";
        $html .= "});";
        $html .= "</script>";
        echo $html;
    }
    
    public function scanDir() {
        $imgArray = array();
        $this->imgDir;
        foreach (glob("$this->imgDir*.{jpg,png,JPG,PNG}", GLOB_BRACE) as $img) {
            $imgArray[] = $img;
        }
//        $imgArray = substr($imgArray, 0, strlen($imgArray)-2);
//        $imgArray .= ']';
//        $html = '';
//        $html .= "<script type='text/javascript'>";
//        $html .= "$(document).ready(function() {";
//        $html .= "alert('".$imgArray."')";
//        $html .= "});";
//        $html .= "</script>";
//        echo $html;
        return $imgArray;
    }
}


$animatedHeader = new AnimatedHeader();
$animatedHeader->get();
$animatedHeader->getJS();
$animatedHeader->scanDir();
?>