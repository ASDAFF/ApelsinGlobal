<?php
class AP_сontactsWorkersPostsDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ContactsWorkersPosts` WHERE `post`='".$this->alias."';";
    }
    
    protected function checkAlias() {
        $query = "SELECT * FROM `ContactsWorkersPosts` WHERE `post`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}