<?php
/**
 * Description of FeedBackAdd
 *
 * @author olga
 */
class FeedBackAdd {
    
    private $html;
    private $SQL_HELPER;
    private $inputHelper;
    private $urlHelper;
    private $error;
    private $errorEncounter = false;
    private $insertValue;
    private $status;
    // для вывода ошибок без модального окна
//    private $message;
    private $yourUser;
    private $userData;
    private $authorization;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->yourUser = new UserData();
        $this->authorization = $this->yourUser->checkAuthorization();
        if($this->authorization) {
            $this->userData = $this->yourUser->getUserData();
        }
        $this->error = array();
//        $this->message="";
        $this->inputHelper = new InputHelper();
        $this->setDefaltInput();
        if(isset($_POST['AP_Submit'])) {            
            $this->addFeedback();
        }
        $this->generationFormAdd();
    } 
    
    private function addFeedback() {
        $this->getAllValue();
        if($this->checkAllValue()) {
            $this->insertFeedbacks();
            $this->refreshPage();
        } else {
            if($this->error !=null ) {
                foreach ($this->error as $error) {
                    $this->errorEncounter = true;
                    ErrorHelper::getMessageError($error);
//                    $this->message .= "<br>".$error;
                }
            }
        }
    }
    
    private function refreshPage() {
        echo '<script language="JavaScript">';
//        echo 'window.location.href = "'.$this->urlHelper->getThisPage().'"';
        echo 'setTimeout(function () {
                window.location.href = "'.$this->urlHelper->getThisPage().'"
             }, 30000)';
        echo '</script>';
    }
    
    private function getAllValue() {
        $this->insertValue = array();
        $this->insertValue['fio'] = InputValueHelper::getPostValue('fio');
        $this->insertValue['phone'] = InputValueHelper::getPostValue('phone');
        $this->insertValue['email'] = InputValueHelper::getPostValue('email');
        $this->insertValue['title'] = InputValueHelper::getPostValue('title');
        $this->insertValue['text'] = InputValueHelper::getPostValue('text');
        $this->insertValue['rating'] = InputValueHelper::getPostValue('rating');
    }
    
    private function setDefaltInput() { 
        $this->insertValue['fio'] = $this->userData['ferstName'].' '.$this->userData['lastName'];
        $this->insertValue['phone'] = '';
        $this->insertValue['email'] = '';
        $this->insertValue['title'] = '';
        $this->insertValue['text'] = '';
        $this->insertValue['rating'] = '';
        $this->originalInsertValue = $this->insertValue;
    }
    
    private function generationFormAdd() {
        $this->html .= '<form class="AP_Form" name="AP_Form" action="'.$this->urlHelper->getThisPage().'"  method="post" accept-charset="UTF-8"  autocomplete="on">';
//            $this->html .= "<div class='message'>$this->message</div>";
            $this->html .= '<table class="AP_FormTable" >';
            // fio
            $fio = $this->inputHelper->paternTextBox('fio', 'fio', 'fio', 100, true, 'Латиница, кирилица, цифры, знак пробела', '[А-Яа-яЁёЙйЦцA-Za-z0-9\s]{2,100}', $this->originalInsertValue['fio']);
            $this->html .= $this->inputHelper->createFormRow($fio, true, 'Представьтесь');
            // phone
            $phone = $this->inputHelper->paternTextBox('phone', 'phone', 'phone', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phone']);
            $this->html .= $this->inputHelper->createFormRow($phone, false, '** Номер телефона');
            // email
            $email = $this->inputHelper->paternTextBox('email', 'email', 'email', 200, false, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['email']);
            $this->html .= $this->inputHelper->createFormRow($email, false, '** E-mail');
            // title
            $title = $this->inputHelper->paternTextBox('title', 'title', 'title', 100, false, 'Латиница, кирилица цифры и знаки - и _ и ()', '[А-Яа-яЁёЙйЦцA-Za-z0-9-_\)\(\s]{2,100}', $this->originalInsertValue['title']);
            $this->html .= $this->inputHelper->createFormRow($title, false, 'Тема');
            // text
            $text = $this->inputHelper->textarea('text', 'text', 'text', 50000, true,$this->originalInsertValue['text']);
            $this->html .= $this->inputHelper->createFormRow($text, true, 'Текст');
            // rating для select - box
            $rating = $this->inputHelper->select('rating', 'rating', $this->getDataRatingSelect(), true, $this->originalInsertValue['rating']);
            $this->html .= $this->inputHelper->createFormRow($rating, true, 'Рейтинг');
            $this->html .= '</table>';
            $this->html .= '<div class="feedbackFormFootNote">** Одно из полей, отмеченных ** должно быть обязательно заполнено</div>';
            $this->html .= '<center>';
            $this->html .= '<input class="AP_Submit" type="submit" name="AP_Submit" value="Отправить">';
            $this->html .= '</center>';
        $this->html .= '</form>';
        
        if($this->errorEncounter) {
            $this->html .= '<script type="text/javascript">';
//            $this->html .= "$.fancybox({content:$('#formFeedback').fancybox()});";
            $this->html .= "$(document).ready(function(){";
            $this->html .= "$('#formFeedbackFancybox').click();";
            $this->html .= "});";
            $this->html .= '</script>';
        }
    }
    
    private function getDataIPStatus($ip) {
        $query = "SELECT 
            FLIP.`status` ,
            FLIP.`ip` ,
            FLIPS.`timeLimit` ,
            FLIPS.`showReview`, 
            FLIPS.`checkingModerator` 
            FROM (
                SELECT `status`, `ip` FROM `FeedbacksListIP`  WHERE `ip` = '".$ip."'
                ) AS FLIP
            LEFT JOIN  `FeedbacksListIPStatus` AS FLIPS 
            ON  FLIP.`status`= FLIPS.`status`;";
        $this->status = $this->SQL_HELPER->select($query,1);
    }
    
    private function getDataRatingSelect() {
        $rating = array();
        $query = "SELECT  `id`, `value`, `name`,  `forFeedbacks` FROM `FeedbacksRating` WHERE `forFeedbacks`=1 ORDER BY `value` DESC ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $rating[$key]['text'] = $value['name'];
            $rating[$key]['value'] = $value['id'];
        }
        return $rating;
    }
    
    private function checkAllValue() {
        $error = false;
        if(!InputValueHelper::checkValue('fio',"/[А-Яа-яЁёЙйЦцA-Za-z0-9\s]{2,100}+$/u")) {
            $error = true;
            $this->error[] = "Разрешена латиница, кирилица, цифры, знак пробела";
        }
        if((isset($_POST['phone']) && $_POST['phone']!=null && $_POST['phone']!="") || (isset($_POST['email']) && $_POST['email']!=null && $_POST['email']!="")) {
            if(isset($_POST['phone']) && $_POST['phone']!=null && $_POST['phone']!="" ) {
                if(!InputValueHelper::checkValue('phone',"/^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$/")) {
                    $error = true;
                    $this->error[] = "Неверно указан номер телефона. Данные добавляются без пробелов";
                }
            }
            if(isset($_POST['email']) && $_POST['email']!=null && $_POST['email']!="" ) {
                if(!InputValueHelper::checkValue('email',"/^([A-Za-z0-9_\.-]+)@([A-Za-z0-9_\.-]+)\.([A-Za-z\.]{2,6})$/")) {
                    $error = true;
                    $this->error[] = "Указан не корректный E-mail.";
                }
            }
        } else {
            $error = true;
            $this->error[] = "Одно из полей 'Номер телефона' или 'E-mail' должно быть заполнено";
        }
        if(isset($_POST['title']) && $_POST['title']!=null && $_POST['title']!="" ) {
            if(!InputValueHelper::checkValue('title',"/[^А-ЯA-Z]{1}[А-ЯA-Zа-яa-z0-9-_\)\(\s]{1,99}+$/u")) {
                $error = true;
                $this->error[] = "Разрешена латиница, кирилица цифры, тире, нижнее подчеркивание и скобки ";
            }
        }
        if(!InputValueHelper::checkValue('text')) {
            $error = true;
            $this->error[] = "Введите текст";
        }
        if(!InputValueHelper::checkValue('rating')) {
            $error = true;
            $this->error[] = "Поставьте рейтинг";
        }
        return !$error;
    }
    
    private function getInsertSql($ip) {
        $this->getDataIPStatus($ip);
        $queryFeedbacks = "INSERT INTO `Feedbacks` SET ";
        $queryFeedbacks .= "`fio` = '".$this->insertValue['fio']."', ";
        $queryFeedbacks .= "`title` = ".InputValueHelper::mayByNull($this->insertValue['title']).", ";
        $queryFeedbacks .= "`text` = '".$this->insertValue['text']."', ";
        $queryFeedbacks .= "`email` = ".InputValueHelper::mayByNull($this->insertValue['email']).", ";
        $queryFeedbacks .= "`phone` = ".InputValueHelper::mayByNull($this->insertValue['phone']).", ";
        $queryFeedbacks .= "`ip` = '".$ip."', ";
        $queryFeedbacks .= "`date` = '".date("Y-m-d h:i:s")."', ";
        $queryFeedbacks .= "`rating` = '".$this->insertValue['rating']."', ";
        $queryFeedbacks .= "`show` = '".$this->status['showReview']."', ";
        $queryFeedbacks .= "`like` = '0', ";
        $queryFeedbacks .= "`dislike` = '0' ;";
        return $queryFeedbacks;
    }
    
    private function insertFeedbacks() {
        $ip = $_SERVER['REMOTE_ADDR'];
        $this->getDataIPStatus($ip);
        // проверка существования IP в таблице `FeedbacksListIP`
        if (!(isset($this->status['ip']))) {
            $queryListIP = "INSERT INTO `FeedbacksListIP` SET ";
            $queryListIP .= "`ip` = '".$ip."', ";
            $queryListIP .= "`status` = 'default';";

            $this->SQL_HELPER->insert($queryListIP);
            $this->SQL_HELPER->insert($this->getInsertSql($ip));
            $this->checkingModerator();
        } else {
            $this->SQL_HELPER->insert($this->getInsertSql($ip));
            $this->checkingModerator();
        }
    }
    
    // проверяем нужна ли проверка модератора
    private function checkingModerator() {
        if ($this->status['checkingModerator'] == 1) {
            ErrorHelper::getMessageError("Ваш отзыв направлен модератору.");
        }
    }

    public function getForm() {
        return $this->html ;
    }
}
