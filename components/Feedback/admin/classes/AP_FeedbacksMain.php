<?php
/**
 * Description of AP_EditFeedbacksMain
 *
 * @author olga
 */
class AP_FeedbacksMain extends AdminPanel_ComponentPanelUI_Element {
    
    private $dataCommentsKeyFeedbackParent;
    private $dataCommentsKeyFeedbackPure;

    protected function getData() {
        parent::getData();
        $this->getDataComments();
        $query = "SELECT * FROM `Feedbacks` ORDER BY `date` DESC ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $value) {
            if (!in_array($value['id'], $this->dataCommentsKeyFeedbackPure)) {
                $this->data[] = $value;
            }
        }
    }
    
    protected function setElementAliasID($dataElement) {
        $this->elementAliasID = $dataElement['id'];
    }
    
    protected function getHtmlUI($dataElement) {
        $html = '';
//        echo '<pre>';
//        echo print_r($this->dataCommentsKeyFeedbackPure);
//        echo '</pre>';
        $this->getDataParentFeedback($dataElement['id']);
        $createdDate = new DateTime($dataElement['date']);
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
                    $html .= 'Отзыв';
                    $html .= '</td>';
                    $html .= '<td>';
                        $html .= $dataElement['text'];
                    $html .= '</td>';
                    $html .= '</tr>';
                $html .= '</table>';
            $html .= '</div>';
        $html .= '</div>';
        $html .= '<div class="ElementBlock Category">';
        foreach ($this->dataCommentsKeyFeedbackParent as $keyParent) {
            foreach ($keyParent as $keyFeedback){
                $html .= $keyFeedback['feedback'].' - '.$keyFeedback['fio'].';&nbsp;&nbsp; ';
            }
        }
        $html .= $dataElement['rating'];
        $html .= '</div>';
        return $html;
    }
    
    /**
     * UI для добавления
     */
    protected function generateAddUI() {
        parent::generateAddUI();
        $ap_editFeedbacksAdd = new AP_FeedbacksAdd();
        $this->html = $ap_editFeedbacksAdd->getForm();
    }
    
    /**
     * UI для редактирования
     */
    protected function generateEditUI() {
        parent::generateAddUI();
        $ap_editFeedbacksEdit = new AP_FeedbacksEdit($this->URL_PARAMS[5]);
        $this->html = $ap_editFeedbacksEdit->getForm();
    }
    
    /**
     * UI для удаления (удаление подтверждено)
     */
    protected function generateDeleteYesUI() {
        parent::generateDeleteYesUI();
        $ap_editFeedbacksDelete = new AP_FeedbacksDelete($this->URL_PARAMS[5]);
        $this->html = $ap_editFeedbacksDelete->delete(true);
    }
    
    /**
     * UI для удаления (удаление не подтверждено)
     */
    protected function generateDeleteNoUI() {
        parent::generateDeleteNoUI();
        $ap_editFeedbacksDelete = new AP_FeedbacksDelete($this->URL_PARAMS[5]);
        $this->html = $ap_editFeedbacksDelete->delete(false);
    }
    
    private function getDataComments() {
        $this->dataCommentsKeyFeedbackPure = array();
        $query = "SELECT * FROM `FeedbacksIsComments` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key) {
            $this->dataCommentsKeyFeedbackPure[] = $key['feedback'];
        }
    }
    
    private function getDataParentFeedback($id) {
        $query = "SELECT 
            FS.`fio` ,
            FS.`id` ,
            FIC.`feedback`,
            FIC.`parentFeedback`
            FROM ( SELECT * FROM `FeedbacksIsComments` WHERE `parentFeedback` = '".$id."') AS FIC
            LEFT JOIN  `Feedbacks` AS FS 
            ON  FIC.`feedback`= FS.`id`;";
        $parentFeedback = $this->SQL_HELPER->select($query);
        $this->dataCommentsKeyFeedbackParent = array();
        if ($parentFeedback != null ) {
            foreach ($parentFeedback as $value) {
                $this->dataCommentsKeyFeedbackParent[$value['parentFeedback']][$value['feedback']] = $value;
            }
        }
    }
}