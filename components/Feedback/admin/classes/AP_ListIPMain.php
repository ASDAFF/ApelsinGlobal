<?php
/**
 * Description of AP_ListIPMain
 *
 * @author olga
 */
class AP_ListIPMain extends AdminPanel_ComponentPanelUI_Element {
    
    protected function getData() {
        parent::getData();
        $query = "SELECT * FROM `FeedbacksListIP` ;";
        $this->data = $this->SQL_HELPER->select($query);
    }
    
    public function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['ip'];
    }
    
    protected function getHtmlUI($dataElement) {
        $this->getDataFioAndIP($dataElement['ip']);
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
        $html .= '<span class="feedbackAdminStatus">'.$dataElement['status'].'</span>';
        foreach ($this->dataFioAndIP as $ip) {
            foreach ($ip as $fio){
                if ($fio['fio'] != null && $fio['fio'] != '') {
                    $html .= '&nbsp;&nbsp;&nbsp;&nbsp;"'.$fio['fio'].'"';
                }
            }
        }
        $html .= '</div>';
        $html .= '<div class="ElementBlock Title">';
        $html .= $dataElement['ip'];
        $html .= '</div>';
        $html .= '<div class="ElementBlock Category">';
        if ($dataElement['comment'] != null ) {
            $html .= $dataElement['comment'];
        } else {
            $html .= '';
        }
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_ListIPAdd = new AP_ListIPAdd();
        $this->html = $ap_ListIPAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_ListIPEdit = new AP_ListIPEdit($this->URL_PARAMS[5]);
        $this->html = $ap_ListIPEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
//    protected function generateDeleteYesUI() {
//        parent::generateDeleteYesUI();
//        $ap_ListIPDelete = new AP_ListIPDelete($this->URL_PARAMS[5]);
//        $this->html = $ap_ListIPDelete->delete(true);
//    }
//    
//    /**
//     * UI для удаления (удаление не подтверждено)
//     */
//    protected function generateDeleteNoUI() {
//        parent::generateDeleteNoUI();
//        $ap_ListIPDelete = new AP_ListIPDelete($this->URL_PARAMS[5]);
//        $this->html = $ap_ListIPDelete->delete(false);
//    }
    
    
    private function getDataFioAndIP($ip) {
        $query = "SELECT 
            FS.`fio` ,
            FL.`ip`
            FROM ( SELECT `ip` FROM `FeedbacksListIP` WHERE `ip` = '".$ip."') AS FL
            LEFT JOIN  `Feedbacks` AS FS 
            ON  FL.`ip`= FS.`ip`;";
        $parentFeedback = $this->SQL_HELPER->select($query);
        $this->dataFioAndIP = array();
        if ($parentFeedback != null ) {
            foreach ($parentFeedback as $value) {
                $this->dataFioAndIP[$value['ip']][$value['fio']] = $value;
            }
        }
    }
}