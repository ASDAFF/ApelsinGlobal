<?php
/**
 * Description of AP_ListIPDelete
 *
 * @author olga
 */
class AP_ListIPDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `FeedbacksListIP` WHERE `ip`='".$this->alias."';";
    }

    protected function checkAlias() {
        $query = "SELECT * FROM `FeedbacksListIP` WHERE `ip`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result) > 0;
    }
}