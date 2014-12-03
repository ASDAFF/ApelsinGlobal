<?php
/**
 * Description of AP_CheckingModertorMain
 *
 * @author olga
 */
class AP_CheckingModertor {
    
    private $html;
    private $data;
    private $SQL_HELPER;
    private $urlHelper;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->getDataFeedbacks();
        $this->publicFeedback();
    }

    private function getDataFeedbacks() {
        $query = "SELECT * FROM `Feedbacks` WHERE `show` = '0';";
        $this->data = $this->SQL_HELPER->select($query);
    }
    
    private function getDataStatus($ip) {
        $query = "SELECT `status` FROM `FeedbacksListIP` WHERE `ip` = '".$ip."';";
        $status = $this->SQL_HELPER->select($query,1);
        return ($status != null) ? $status['status'] : null;
    }

    private function getDataHtml(){
//        $this->html = '';
        if ($this->data != null ) {
            foreach ($this->data as $dataElement ) { 
                
                $this->html .= '<tr>';
                    $this->html .= '<td>';
                        $this->html .= '<div class="ElementBlock Alias">';
                        $this->html .= $dataElement['ip'].';&nbsp;&nbsp; статус - '.$this->getDataStatus($dataElement['ip']);
                        $this->html .= "<div class='Date'>";
                        $this->html .= $dataElement['date'];
                        $this->html .= '</div>';
                        $this->html .= '</div>';
                        $this->html .= '<div class="feedbackElementAdmin">';
                        $this->html .= '<div class="feedbackTitleAdmin">';
                        $this->html .= $dataElement['fio'];
                        $this->html .= '</div>';
                        $this->html .= '<div>';
                        $this->html .= '<table class="feedbackElementTableAdmin" border="0">';
                        if ($dataElement['title'] != '' && $dataElement['title'] != null) {
                            $this->html .= '<tr>';
                            $this->html .= '<td class="feedbackElementAdminContent">';
                            $this->html .= 'Тема';
                            $this->html .= '</td>';
                            $this->html .= '<td>';
                            $this->html .= $dataElement['title'];
                            $this->html .= '</td>';

                            $this->html .= '</tr>';
                        }
                        $this->html .= '<tr>';
                        $this->html .= '<td class="feedbackElementAdminContent">';
                        $this->html .= 'Отзыв';
                        $this->html .= '</td>';
                        $this->html .= '<td>';
                        $this->html .= $dataElement['text'];
                        $this->html .= '</td>';
                        $this->html .= '</tr>';
                        $this->html .= '</table>';
                        $this->html .= '</div>';
                        $this->html .= '</div>';
                        $this->html .= '<div class="ElementBlock Category FeedbackAdmin">';
                        $this->html .= 'id - '.$dataElement['id'].';&nbsp;&nbsp; рейтинг - '.$dataElement['rating'];
                        $this->html .= '</div>';
                    $this->html .= '</td>';
                
                    $this->html .= '<td>';
                        $this->html .= '<p class="checkingModertorFeedbackAdmin">Проверено и одобрено к публикации</p>';
                        $this->html .= '<center><input type="checkbox" name="checkingModertorFeedbackAdmin[]" id="checkingModertorFeedbackAdmin" value="'.$dataElement['id'].'" style="vertical-align:middle;"></center>';
                    $this->html .= '</td>';
                $this->html .= '</tr>';
            }
        }
    }

    private function getForm() {
        $this->html = "";
        $this->html .= '<form class="AP_Form" name="AP_Form" enctype="multipart/form-data" action="'.  $this->urlHelper->getThisPage().'" method="POST" accept - charset="UTF-8" required >';
            $this->html .= '<table class="AP_FormTable">';
            $this->getDataHtml();
            $this->html .= '</table>';
            $this->html .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Опубликовать"></center>';
        $this->html .= '</form>';
    }
    
    private function updateExecute ($feedback) {
        $queryFeedbacks = "UPDATE `Feedbacks` SET ";
        $queryFeedbacks .= "`show` = '1' ";
        $queryFeedbacks .= "WHERE `id` =' ".$feedback."';";
        $this->SQL_HELPER->insert($queryFeedbacks);
    }

    private function updateFeedback() {
        if (isset($_POST['AP_Submit'])) {
            if (isset($_POST['checkingModertorFeedbackAdmin']) && $_POST['checkingModertorFeedbackAdmin'] != null && $_POST['checkingModertorFeedbackAdmin'] != '') {
                $arrFeedback = $_POST['checkingModertorFeedbackAdmin'];
                if ($arrFeedback != null) {
                    foreach ($arrFeedback as $feedback) {
                        $this->updateExecute($feedback);
                    }
                } else {
                    echo "Отзыв для публикации не выбран"; 
                }
            } else {
                echo "Выберите отзыв";
            }
            $this->refreshPage();
            
          } else {
            echo "Выберите отзыв для публикации"; 
        }
    }
    
    
    private function publicFeedback() {
        if ($this->data == null ) {
            $this->html = 'Все отзывы опубликованы';
        } else {
            $this->getForm();
            $this->updateFeedback();
        }
    }
    private function refreshPage() {
        echo '<script language="JavaScript">';
//        echo 'window.location.href = "'.$this->urlHelper->getThisPage().'"';
        echo 'setTimeout(function () {
                window.location.href = "'.$this->urlHelper->getThisPage().'"
             }, 0)';
        echo '</script>';
    }


    public function getHtml() {
        return $this->html;
    }
}
