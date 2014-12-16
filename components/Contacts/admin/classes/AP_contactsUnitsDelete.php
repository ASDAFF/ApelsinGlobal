<?php

class AP_contactsUnitsDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    private $dir = './resources/Components/Contacts/Units/';
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ContactsUnits` WHERE `unit`='".$this->alias."';";
    }
           
    protected function clearResours() {
        $oldImage = $this->getImageData();
        unlink($oldImage);
    }
    
    protected function checkAlias() {
        $query = "SELECT * FROM `ContactsUnits` WHERE `unit`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
      
    private function getImageData() {
        if(file_exists($this->dir.$this->alias.".png")) {
            $desiredValue = $this->dir.$this->alias.".png";
            if ($desiredValue != null && $desiredValue != '') { 
                return $desiredValue; 
            }
        } elseif (file_exists($this->dir.$this->alias.".jpg")) {
            $desiredValue = $this->dir.$this->alias.".jpg";
            if ($desiredValue != null && $desiredValue != '') { 
                return $desiredValue; 
            }
        } else {
            echo "Файла с таким названием не существует";
        }
    }
}