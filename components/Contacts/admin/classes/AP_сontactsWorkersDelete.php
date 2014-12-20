<?php
class AP_сontactsWorkersDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ContactsWorkers` WHERE `worker`='".$this->alias."';";
    }
    
    protected function checkAlias() {
        $query = "SELECT * FROM `ContactsWorkers` WHERE `worker`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}