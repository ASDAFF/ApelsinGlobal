<?php
/**
 * Description of AP_ContactsBildingsDelete
 *
 * @author olga
 */
class AP_ContactsBildingsDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ContactsShopBuilding` WHERE `alias`='".$this->alias."';";
    }

    protected function checkAlias() {
        $query = "SELECT * FROM `ContactsShopBuilding` WHERE `alias`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}