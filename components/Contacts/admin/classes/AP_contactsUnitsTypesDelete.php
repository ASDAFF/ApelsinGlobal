<?php

class AP_contactsUnitsTypesDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    private $dir = './resources/Components/Contacts/UnitsTypes/';
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ContactsUnitsTypes` WHERE `type`='".$this->alias."';";
    }

    protected function checkAlias() {
        $query = "SELECT * FROM `ContactsUnitsTypes` WHERE `type`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
           
    protected function clearResours() {
        $oldImage = $this->getImageData();
        unlink($oldImage);
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