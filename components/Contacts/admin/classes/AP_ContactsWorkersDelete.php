<?php
/**
 * Description of AP_ContactsWorkersDelete
 *
 * @author olga
 */
class AP_ContactsWorkersDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
    $this->alias = urldecode($this->alias);
        $this->deleteQuery = "DELETE FROM `ContactsWorkers` WHERE `id`='".$this->alias."';";
    }

    protected function checkAlias() {
    $this->alias = urldecode($this->alias);
        $query = "SELECT * FROM `ContactsWorkers` WHERE `id`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}