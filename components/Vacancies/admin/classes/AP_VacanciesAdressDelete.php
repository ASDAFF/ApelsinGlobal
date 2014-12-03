<?php
/**
 * Description of AP_VacanciesAdressDelete
 *
 * @author olga
 */
class AP_VacanciesAdressDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
    $this->alias = urldecode($this->alias);
        $this->deleteQuery = "DELETE FROM `VacanciesAdress` WHERE `adress`='".$this->alias."';";
    }

    protected function checkAlias() {
    $this->alias = urldecode($this->alias);
        $query = "SELECT * FROM `VacanciesAdress` WHERE `adress`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}