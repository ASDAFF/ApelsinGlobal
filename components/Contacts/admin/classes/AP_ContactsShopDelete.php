<?php
/**
 * Description of AP_ContactsShopDelete
 *
 * @author olga
 */
class AP_ContactsShopDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
        $this->deleteQuery = "DELETE FROM `ContactsShop` WHERE `alias`='".$this->alias."';";
    }
    
    protected function checkAlias() {
        $query = "SELECT * FROM `ContactsShop` WHERE `alias`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}