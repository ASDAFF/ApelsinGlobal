<?php

class BackCall {
    private $thisLang;
    private $localization;
    private $urlHelper;
    private $SQL_HELPER;
    private $inputHelper;
    private $html;
    private $mail = 'polisteny@apelsin.ru';
    private $insertOk;
    private $insertError;


    public function __construct() {
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->localization = new Localization("backCall");
        $this->urlHelper = new UrlHelper();
        $this->inputHelper = new InputHelper();
        $this->generateHtml();
    }
    
    private function createLocalizationFormRow($input,$mandatory,$text,$info=null) {
        $text = $this->localization->getText($text);
        if($info != null && $info != "") {
            $info = $this->localization->getText($info);
        }
        return $this->createFormRow($input,$mandatory,$text,$info);
    }
    
    /**
     * Добавить строку к форме
     * @param type $input - input элемент формы
     * @param type $mandatory - обязателен к заполнению
     * @param type $text - текст
     * @param type $info - дополнительная информация
     * @return string - вернет код строки для таблицы формы
     */
    private function createFormRow($input,$mandatory,$text,$info=null) {
        $mandatoryText = "";
        if($mandatory) {
            $mandatoryText = '* ';
        }
        $out =  '<tr>';
        $out .=  '<td class="backCallFormTable_Text">';
        $out .=  '<div class="text">'.$mandatoryText.$text.'</div>';
        if($info != null && $info != "") {
            $out .=  '<div class="info">'.$info.'</div>';
        }
        $out .=  '</td>';
        $out .=  '<td class="backCallFormTable_Input">'.$input.'</td>';
        $out .=  '</tr>';
        return $out;
    }
    
    private function checkCaptcha() {
        @session_start();
        return (isset($_SESSION['captcha']) && strtoupper($_SESSION['captcha']) == strtoupper($_POST['captcha']));
    }
    
    private function getMysqlText($text) {
        global $_DBSETTINGS;
        $link = mysql_connect($_DBSETTINGS['host'], $_DBSETTINGS['user'], $_DBSETTINGS['password']) OR die(mysql_error());
        $text = nl2br($text);
        $text = strip_tags($text, '<br>');
        $text = htmlspecialchars_decode($text);
        $text = mysql_real_escape_string($text);
        return $text;
    }
    
    private function insertBackCall() {
        if(isset($_POST['backCallFormSubmit'])) {
            if($this->checkCaptcha()) {
                if((isset($_POST['fio']) && $_POST['fio']!=null && $_POST['fio']!="") && (isset($_POST['phone']) && $_POST['phone']!=null && $_POST['phone']!="")){
                    $fio = $this->getMysqlText($_POST['fio']);
                    $phone = $this->getMysqlText($_POST['phone']);
                    if(isset($_POST['time']) && $_POST['time']!=null && $_POST['time']!="") {
                        $time = $this->getMysqlText($_POST['time']);
                    } else {
                        $time = null;
                    }
                    if(isset($_POST['comments']) && $_POST['comments']!=null && $_POST['comments']!="") {
                        $comments = $this->getMysqlText($_POST['comments']);
                    } else {
                        $comments = null;
                    }
                    $this->sendingMail($fio, $phone, $time, $comments);
                    $this->insertTable($fio, $phone, $time, $comments);
                } else {
                    $this->insertError = 'Заполнены не все обязательные поля.';
                }
            } else {
                $this->insertError = 'Не верная каптча.';
            }
            
            if($this->insertError!=null) {
                echo '<script type="text/javascript">';
                echo 'alert("Произошла ошибка:\n'.$this->insertError.'");';
                echo '</script>';
            }
            if($this->insertOk!=null) {    
                echo '<script type="text/javascript">';
                echo "alert('$this->insertOk');";
                echo '</script>';
            }
        }
    }
    
    private function sendingMail($fio,$phone,$time,$comments) {
        # Заголовки (дополнительно укажете ещё)
        $headers = "Content-Type: text/plain; charset=UTF-8\r\n";
        $headers .= "From: $this->mail\r\n";        
        $message = "Заказ обратного звонка с сайта ПОЛ & СТЕНЫ\r\n\r\n";      
        $message .= "ФИО: ".$fio."\r\n";
        $message .= "Телефон: ".$phone."\r\n";
        if($time!=null) {
            $message .= "Время: ".$time."\r\n";
        }
        if($comments!=null) {
            $message .= "Комментарии: ".$comments."\r\n";
        }
        $message .= "\r\n";
        $message .= "Заявка оставлена: ".date("d.m.Y - h:i:s")."\r\n";

        $this->insertOk = "Ваша заявка сохранена в базе, наши менеджеры свяжутся с вами в ближайшее время.";
        if(!mail($this->mail, 'Обратный звонок с сайта ПОЛ & СТЕНЫ', $message, $headers )){
            $this->insertError = 'Ошибка при сохранении';
        }
    }
    
    private function insertTable($fio,$phone,$time,$comments) {
        $query = "INSERT INTO `BackCall`(`created`, `fio`, `phone`, `time`, `comments`) VALUES ('".date("Y-m-d h:i:s")."','".$fio."','".$phone."','".$time."','".$comments."');";
        $this->SQL_HELPER->insert($query);
    }


    private function generateHtml() {
        $this->html = "";
        $this->html .= "<div class='backCallButton' onClick='showBackCallFloatArea();'>";
        $this->html .= "<div class='backCallButtonBox'>";
        $this->html .= "<span class='backCallButtonText'>";
        $this->html .= $this->localization->getText('backCallButtonText');
        $this->html .= "</span>";
        $this->html .= "</div>";
        $this->html .= "</div>";
        $this->html .= "<div id='backCallFloatArea' class='backCallFloatArea' style='display: none;'>";
        $this->html .= "<div class='backCallFloatBox'>";
        $this->html .= "<div class='backCallFloatBoxTitle'>";
        $this->html .= "<div class='backCallFloatBoxTitleExitButton' onClick='hideBackCallFloatArea();'>";
        $this->html .= "&#8855;";
        $this->html .= "</div>";
        $this->html .= "<div class='backCallFloatBoxTitleText'>";
        $this->html .= $this->localization->getText('backCallFloatBoxTitle');
        $this->html .= "</div>";
        $this->html .= "</div>";
        $this->html .= '<form class="backCallForm" name="backCallForm" action="'.$this->urlHelper->getThisPage().'" method="post" accept-charset="UTF-8" autocomplete="on">';
        $this->html .= '<table class="RegistrationFormTable" >';
        $fio = $this->inputHelper->textBox('fio', 'fio', 'backCallFormTextBox', 200, true, null);
        $this->html .= $this->createLocalizationFormRow($fio, true, 'fio');
        $phone = $this->inputHelper->paternTextBox("phone", "phone", "backCallFormTextBox", 30, true, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", null);
        $this->html .= $this->createLocalizationFormRow($phone, true, 'phone');
        $time = $this->inputHelper->textBox('time', 'time', 'backCallFormTextBox', 200, false, null);
        $this->html .= $this->createLocalizationFormRow($time, false, 'time');
        $comments = $this->inputHelper->textarea('comments', 'comments', 'backCallFormTextarea', 500, false, null);
        $this->html .= $this->createLocalizationFormRow($comments, false, 'comments');
        $captcha = $this->inputHelper->textBox("captcha", "captcha", "captcha", 20, true, null);
        $this->html .= $this->createFormRow($captcha, true, getCaptcha(120, 25));
        $this->html .= '</table>';
        $this->html .= '<input class="backCallFormButton" type="submit" name="backCallFormSubmit" value="'.$this->localization->getText("backCallFormButtonText").'">';
        $this->html .= '</form>';
        $this->html .= "</div>";
        $this->html .= "</div>";
        
        $this->insertBackCall();
    }
    
    public function get() {
        return $this->html;
    }
}
