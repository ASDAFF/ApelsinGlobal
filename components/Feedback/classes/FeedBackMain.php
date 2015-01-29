<?php
/**
 * Description of FeedBackMain
 *
 * @author olga
 */
class FeedBackMain {
    
    private $html;
    private $inputHelper;
    private $formAddFeedback;
    private $listFeedback;
    private $SQL_HELPER;
    private $timeValide = '30';

    public function __construct() {
        $this->inputHelper = new InputHelper();
        $this->listFeedback = new FeedBackList();
        $this->formAddFeedback = new FeedBackAdd();
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        if(isset($_PARAM['timeValide'])) {
            $this->timeValide = $_PARAM['timeValide'];
        }
    }
    
    private function generationPage() {
        $this->html = '';
        $this->html .= $this->generationButtonAdd();
        $this->html .= $this->listFeedback->getList();
        $this->html .= '<div id="formFeedback" class="formFeedback">';
            $this->html .= $this->formAddFeedback->getForm();
        $this->html .= '</div>';
        $this->html .= $this->generationButtonAdd();
    }
    
    private function generationButtonAdd() {
        $ip = $_SERVER['REMOTE_ADDR'];
        $status = $this->getDataIPStatus($ip);
        if ($status['status'] == 'blocked') {
            $this->html .= '<div id="errorCommentBlocked" style="display: none;">';
                $this->html .= ErrorHelper::getMessageErrorFeedbackNoComments("Этот IP заблокирован. Вы не можете оставлять отзывы и комментарии ", 'errorCommentBlocked');
            $this->html .= '</div>';
            $this->html .= '<input type="button" value="Оставить отзыв" onclick="errorComments(\'errorCommentBlocked\');">';
        } else {
            if ($status['timeLimit'] != 1) {
                $this->html .= '<a id="formFeedbackFancybox" class="fancybox-doc" href="#formFeedback">';
                    $this->html .= '<input type="button" value="Оставить отзыв">';
                $this->html .= '</a>';
            } else {
                if (floor(($this->checkDifferenceBetweenVisits($ip))) < $this->timeValide) {
                    $this->html .= '<div id="errorCommentTimeLimit" style="display: none;">';
                        $this->html .= ErrorHelper::getMessageErrorFeedbackNoComments("Вы можете добавить отзыв только один раз в ".$this->timeValide." дней", 'errorCommentTimeLimit');
                    $this->html .= '</div>';
                }
                $this->html .= '<input type="button" value="Оставить отзыв" onclick="errorComments(\'errorCommentTimeLimit\');">';
            }
        }
    }

    private function getDataIPStatus($ip) {
        $query = "SELECT 
            FLIP.`status` ,
            FLIP.`ip` ,
            FLIPS.`timeLimit` ,
            FLIPS.`checkingModerator` 
            FROM (
                SELECT `status`, `ip` FROM `FeedbacksListIP`  WHERE `ip` = '".$ip."'
                ) AS FLIP
            LEFT JOIN  `FeedbacksListIPStatus` AS FLIPS 
            ON  FLIP.`status`= FLIPS.`status`;";
        $status = $this->SQL_HELPER->select($query,1);
        return $status;
    }
    
    // определяем разницу (кол-во) дней прошедших с даты последнего отзыва
    private function checkDifferenceBetweenVisits($ip) {
        $last = strtotime($this->checkLastVisit($ip));
        $current = strtotime(date("Y-m-d H:i:s"));
        $difference = ($current - $last)/(60*60*24);
        return $difference;
    }

    // определяем дату последнего отзыва
    private function checkLastVisit($ip) {
        $query = "SELECT `ip`, `date` FROM `Feedbacks`  WHERE `ip`= '".$ip."' ORDER BY `date` DESC LIMIT 1 ;";
        $result = $this->SQL_HELPER->select($query,1);
        return $result['date'];
    }  
    
// определяем с каким кол-вом дней сравнивать разницу с даты последнего отзыва, если надо ровно раз в МЕСЯЦ
//    private function checkCountDaysInMonth($date) {
//        $dateMonth = substr($date, 5, 2);
//        $thirtyOne = array(1,3,5,7,8,10,12);
//        $thirty = array(4,6,9,11);
//        $twentyEight = array(2016,2020,2024);
//        if (in_array($dateMonth, $thirtyOne)) {
//            $countDays = '31';
//        } elseif (in_array($dateMonth, $thirty)) {
//            $countDays = '30';
//        } else {
//            $dateMonth = substr($date, 0, 4);
//            if (in_array($dateMonth, $twentyEight)) {
//                $countDays = '29';
//            } else {
//                $countDays = '28'; 
//            }
//        }
//        return $countDays;
//    }
    
    public function getUI() {
        $this->generationPage();
        return $this->html;
    }       
}
