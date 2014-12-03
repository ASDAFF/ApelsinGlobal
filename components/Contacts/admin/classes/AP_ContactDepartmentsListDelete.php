<?php
/**
 * Description of AP_ContactDepartmentsListDelete
 *
 * @author olga
 */
class AP_ContactDepartmentsListDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ContactDepartmentsList` WHERE `alias`='".$this->alias."';";
    }

    protected function checkAlias() {
        $query = "SELECT * FROM `ContactDepartmentsList` WHERE `alias`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}