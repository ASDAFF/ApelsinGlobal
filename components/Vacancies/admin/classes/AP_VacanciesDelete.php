<?php
/**
 * Description of AP_VacanciesDelete
 *
 * @author olga
 */
class AP_VacanciesDelete extends AdminPanel_ComponentPanelUI_Element_Delete {
    
    protected function setDeleteQuery() {
    $this->alias = urldecode($this->alias);
        $this->deleteQuery = "DELETE FROM `Vacancies` WHERE `name`='".$this->alias."';";
    }

    protected function checkAlias() {
    $this->alias = urldecode($this->alias);
        $query = "SELECT * FROM `Vacancies` WHERE `name`='".$this->alias."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>0;
    }
}