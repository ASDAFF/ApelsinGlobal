<?php
/**
 * Description of AP_ContactsWorkersPostsDelete
 *
 * @author olga
 */
class AP_ContactsWorkersPostsDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
    $this->alias = urldecode($this->alias);
        $this->deleteQuery = "DELETE FROM `ContactsWorkersPosts` WHERE `alias`='".$this->alias."';";
    }

    protected function checkAlias() {
    $this->alias = urldecode($this->alias);
        $query = "SELECT * FROM `ContactsWorkersPosts` WHERE `alias`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}