<?php
class AP_сontactsWorkersPostsMain extends AdminPanel_ComponentPanelUI_Element {
    
    protected function getData() {
        parent::getData();
        parent::getData();
        $query = "SELECT * FROM `ContactsWorkersPosts` ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $worker) {
            $this->data[$key]['name'] = $worker['post'];
            $this->data[$key]['sequence'] = $worker['sequence'];
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['post'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= $dataElement['sequence'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['name'];
        $html .= '</div>';
        return $html;
    }
    
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_contactsWorkersAdd = new AP_сontactsWorkersPostsAdd();
        $this->html = $ap_contactsWorkersAdd->getForm();
    }
   
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_contactsWorkersEdit = new AP_сontactsWorkersPostsEdit($this->URL_PARAMS[5]);
        $this->html = $ap_contactsWorkersEdit->getForm();
    }
    
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_contactsWorkersDelete = new AP_сontactsWorkersPostsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_contactsWorkersDelete->delete(true);
    }
    
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_contactsWorkersDelete = new AP_сontactsWorkersPostsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_contactsWorkersDelete->delete(false);
    }
   
    private function getWorkersUnitData($post) {
        $posts = "";
        $query = "SELECT * FROM `ContactsWorkersPosts` WHERE `post`='".$post."';";
        $unitData = $this->SQL_HELPER->select($query);
        if($unitData != null) {
            foreach ($unitData as $worker) {
                $posts .= $this->getWorkersUnitDataLang($post['unit']).", ";
            }
        }
        return $posts;
    }
}