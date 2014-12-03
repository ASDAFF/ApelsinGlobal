<?php
/**
 * Description of EditCommentsMain
 *
 * @author olga
 */
class AP_CommentsMain extends AdminPanel_ComponentPanelUI_Element {

    protected function getData() {
        parent::getData();
        $query = "SELECT *
            FROM ( SELECT `feedback` FROM `FeedbacksIsComments`) AS FIC
            LEFT JOIN  `Feedbacks` AS FS 
            ON  FIC.`feedback`= FS.`id` ORDER BY `date` DESC ;";
        $this->data = $this->SQL_HELPER->select($query);
        foreach ($this->data as $key => $comment) {
            $parent = $this->getDataParentFeedback($comment['id']);
            $this->data[$key]['parentFeedback'] = $parent['parentFeedback'];
            $this->data[$key]['parentFeedbackFio'] = $parent['fio'];
        }
    }
    
    private function getDataParentFeedback($id) {
        $query = "SELECT 
            FS.`fio` ,
            FIC.`parentFeedback`
            FROM ( SELECT * FROM `FeedbacksIsComments` WHERE `feedback` = '".$id."') AS FIC
            LEFT JOIN  `Feedbacks` AS FS 
            ON  FIC.`parentFeedback`= FS.`id`;";
        $parentFeedback = $this->SQL_HELPER->select($query,1);
        return $parentFeedback;
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['id'];
    }
    
    protected function getHtmlUI($dataElement) {
        $createdDate = new DateTime($dataElement['date']);
        $html = '';
        $html .= '<div class="ElementBlock Alias">';
            $html .= $dataElement['ip'];
            $html .= "<div class='Date'>";
                $html .= $createdDate->format('d.m.Y h:i');
            $html .= '</div>';
        $html .= '</div>';
        $html .= '<div class="feedbackElementAdmin">';
            $html .= '<div class="feedbackTitleAdmin">';
                $html .= $dataElement['fio'];
            $html .= '</div>';
            $html .= '<div>';
                $html .= '<table class="feedbackElementTableAdmin" border="0">';
                    if ($dataElement['title'] != '' && $dataElement['title'] != null) {
                        $html .= '<tr>';
                        $html .= '<td class="feedbackElementAdminContent">';
                        $html .= 'Тема';
                        $html .= '</td>';
                        $html .= '<td>';
                            $html .= $dataElement['title'];
                        $html .= '</td>';
                        $html .= '</tr>';
                    }
                    $html .= '<tr>';
                    $html .= '<td class="feedbackElementAdminContent">';
                    $html .= 'Комментарий';
                    $html .= '</td>';
                    $html .= '<td>';
                        $html .= $dataElement['text'];
                    $html .= '</td>';
                    $html .= '</tr>';
                $html .= '</table>';
            $html .= '</div>';
        $html .= '</div>';
        $html .= '<div class="ElementBlock Category">';
//        $html .= $dataElement['parentFeedback'].', '.$dataElement['rating'];
        $html .= $dataElement['parentFeedback'].', '.$dataElement['parentFeedbackFio'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_editCommentsAdd = new AP_CommentsAdd();
        $this->html = $ap_editCommentsAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_editCommentsEdit = new AP_CommentsEdit($this->URL_PARAMS[5]);
        $this->html = $ap_editCommentsEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_editCommentsDelete = new AP_CommentsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_editCommentsDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_editCommentsDelete = new AP_CommentsDelete($this->URL_PARAMS[5]);
        $this->html = $ap_editCommentsDelete->delete(false);
    }
}