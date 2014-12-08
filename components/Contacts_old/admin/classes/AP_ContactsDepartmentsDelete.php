<?php
/**
 * Description of AP_ContactsDepartmentsDelete
 *
 * @author olga
 */
class AP_ContactsDepartmentsDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    private $dir = './resources/Components/Contacts/Departments/';
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ContactDepartments` WHERE `alias`='".$this->alias."';";
    }

    protected function clearResours() {
        unlink($this->dir.$this->alias.".png");
    }
    
    protected function checkAlias() {
        $query = "SELECT * FROM `ContactDepartments` WHERE `alias`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}