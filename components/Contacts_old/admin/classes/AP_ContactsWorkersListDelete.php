<?php
/**
 * Description of AP_ContactsWorkersListDelete
 *
 * @author olga
 */
class AP_ContactsWorkersListDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
    $this->alias = urldecode($this->alias);
        $this->deleteQuery = "DELETE FROM `ContactsWorkersList` WHERE `alias`='".$this->alias."';";
    }

    protected function checkAlias() {
    $this->alias = urldecode($this->alias);
        $query = "SELECT * FROM `ContactsWorkersList` WHERE `alias`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}