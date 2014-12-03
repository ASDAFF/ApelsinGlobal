<?php
class ReviewsForm {
    private $thisLang;
    private $thisPage;
    
    private $localization;
    private $shop;
    
    private $url;
    
    private $html;
    
    private $insertError;
    private $insertOk;
    
    private $shopEmail;

    /*
     * $this->page = $page-1
     * $this->page - начианется с 0, а $page начианется с 1
     * $this->allPages - сколько всего страниц.
     * $this->page всегда < $this->allPages-1
     */
    public function __construct() {
        $this->insertError = null;
        $this->insertOk = null;
        global $_URL_PARAMS;
        global $_PARAM;
        // Выставляем параметры поу молчанию
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->thisPage = $_URL_PARAMS['page'];
        $this->shop = $_PARAM['name'];
        $this->localization = new Localization();        
        
        $this->insertReview();
        $_POST=null;
        $this->generateForm();
    }
    
    private function getEmail() {
        $query ="select `reviewsEmail` from `ContactsShop` where `alias`='$this->shop';";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getDataRow(0);
        return $listData['reviewsEmail'];
    }


    private function generateForm() {
        $out = "";
        if($this->insertError!=null) {
            echo '<script type="text/javascript">';
            echo 'alert("Во время добавления отзыва произошла ошибка:\n'.$this->insertError.'");';
            echo '</script>';
        }
        if($this->insertOk!=null) {    
            echo '<script type="text/javascript">';
            echo "alert('$this->insertOk');";
            echo '</script>';
        }
        $out .= '<a class="fancybox" href="#send_reviews"><button type="button" 
                    class="apelsin_button">оставить отзыв</button></a>';
        
        $out .= "<div id='send_reviews' style='display: none;'>";
        $out .= "<h2>";
        $out .= "Оставьте свой отзыв";
        $out .= "</h2>";
//        $out .= '<form class="reviews" name="shop_reviews" action="'.$this->url.'" 
//            method="post" accept-charset="UTF-8" autocomplete="on" 
//            onsubmit="return validate_form ( );">';
        $out .= '<form class="reviews" name="shop_reviews" action="'.$this->url.'" 
            method="post" accept-charset="UTF-8" autocomplete="on" >';
        $out .= '<input type="hidden" name="shop" value="'.$this->shop.'" id="shop" />';
        $out .= '<table class="reviews_table">';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_label">';
            $out .= '* ФИО: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= '<input type="text" name="fio" value="" id="fio" maxlength="100"/>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_label">';
            $out .= '* Email: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= '<input type="text" name="mail" value="" id="mail" maxlength="100"/>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_label">';
            $out .= 'Достоинства: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= '<textarea  name="dignity" value="" id="dignity" ></textarea>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_label">';
            $out .= 'Недостатки: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= '<textarea  name="limitations" value="" id="limitations" ></textarea>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_label">';
            $out .= 'Ваши пожелания: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= '<textarea  name="wishes" value="" id="wishes" ></textarea>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_label">';
            $out .= '* Ваши комментарии: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= '<textarea  name="comments" value="" id="comments" ></textarea>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_label">';
            $out .= '* Ваша отценка: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= '<select class="reviews_table_select" name="rating" id="rating">';
            $out .= '<option selected value="5">5</option>';
            $out .= '<option value="4">4</option>';
            $out .= '<option value="3">3</option>';
            $out .= '<option value="2">2</option>';
            $out .= '<option value="1">1</option>';
            $out .= '</select>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_label">';
            $out .= '<img class="captcha_img" src="./plugins/captcha/captcha.php" width="120" height="20" />';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= '<input type="text" name="captcha" value="" id="captcha" />';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '</tr>';
        $out .= '</table>';
        $out .= '<br>';
        $out .= '<center>';
        $out .= '<input class="apelsin_button" type="submit" name ="submit" value="Оставить отзыв"/>';
        $out .= '</center>';
        $out .= '<br>';
        $out .= '</form>';
        $out .= '<div class="inf">';
        $out .= 'Символом * отмечены обязательные для заполнения поля.';
        $out .= '</div>';
        $out .= '</div>';
        $this->html = $out;
    }
    
    public function get(){
        echo $this->html;
    }
    
    public function getHTML(){
        return $this->html;
    }
    
    private function checkCaptcha() {
        @session_start();
        return (isset($_SESSION['captcha']) && strtoupper($_SESSION['captcha']) == strtoupper($_POST['captcha']));
    }

    private function insertReview() {
        if(isset($_POST['submit'])) {
            if($this->checkCaptcha()) {
                if(
                        (isset($_POST['fio']) && $_POST['fio']!=null && $_POST['fio']!="") &&
                        (isset($_POST['shop']) && $_POST['shop']!=null && $_POST['shop']!="") &&
                        (isset($_POST['mail']) && $_POST['mail']!=null && $_POST['mail']!="") &&
                        (isset($_POST['comments']) && $_POST['comments']!=null && $_POST['comments']!="") &&
                        (isset($_POST['rating']) && $_POST['rating']!=null && $_POST['rating']!="" 
                                && $_POST['rating']>0 && $_POST['rating']<6)){
                    $shop = $this->getMysqlText($_POST['shop']);
                    $fio = $this->getMysqlText($_POST['fio']);
                    $mail = $this->getMysqlText($_POST['mail']);
                    if (!preg_match("|^[-0-9a-z_\.]+@[-0-9a-z_^\.]+\.[a-z]{2,6}$|i", $mail)) {
                        $this->insertError = "Неправильно задан Email.";
                        return;
                    }
                    if(isset($_POST['dignity']) && $_POST['dignity']!=null && $_POST['dignity']!="") {
                        $dignity = $this->getMysqlText($_POST['dignity']);
                    } else {
                        $dignity = null;
                    }
                    if(isset($_POST['limitations']) && $_POST['limitations']!=null && $_POST['limitations']!="") {
                        $limitations = $this->getMysqlText($_POST['limitations']);
                    } else {
                        $limitations = null;
                    }
                    if(isset($_POST['wishes']) && $_POST['wishes']!=null && $_POST['wishes']!="") {
                        $wishes = $this->getMysqlText($_POST['wishes']);
                    } else {
                        $wishes = null;
                    }
                    $comments = $this->getMysqlText($_POST['comments']);
                    $rating = $this->getMysqlText($_POST['rating']);
                    $query = "INSERT INTO `ContactsShopReviews` SET ";
                    $query .= "`shop`='".$shop."',";
                    $query .= "`fio`='".$fio."',";
                    $query .= "`mail`='".$mail."',";
                    $query .= "`dignity`='".$dignity."',";
                    $query .= "`limitations`='".$limitations."',";
                    $query .= "`wishes`='".$wishes."',";
                    $query .= "`comments`='".$comments."',";
                    $query .= "`rating`='".$rating."',";
                    $query .= "`date`='".date("Y-m-d h:i:s")."';";
                    $mySqlInserHelper = new MySqlInserHelper($query);
                    $mySqlInserHelper->insert();
                    
                    # Заголовки (дополнительно укажете ещё)
                    $headers = "Content-Type: text/plain; charset=UTF-8\r\n";
                    $headers .= "From: $mail\r\n";
                    
                    $message = "Магазин: ".$shop."\r\n";
                    $message .= "ФИО: ".$fio."\r\n";
                    $message .= "Email: ".$mail."\r\n";
                    $message .= "Достоинства: ".$dignity."\r\n";
                    $message .= "Недостатки: ".$limitations."\r\n";
                    $message .= "Пожелания: ".$wishes."\r\n";
                    $message .= "Комментарии: ".$comments."\r\n";
                    $message .= "Отценка: ".$rating."\r\n";
                    $message .= "Дата: ".date("d.m.Y - h:i:s")."\r\n";
                    
                    $this->insertOk = "Ваш отзыв успешно добавлен. 
                        Наши менеджеры рассмотрят его в ближайшее 
                        время и при необходимости свяжутся с вами по Email";
                    # Отправляем
//                    echo $this->getEmail();
//                    echo 'mail: '.$this->getEmail().'<br>';
//                    echo 'message: '.$message.'<br>';
//                    echo 'headers: '.$headers.'<br>';
                    if(!mail($this->getEmail(), 'Отзыв', $message, $headers )){
                        $this->insertError = 'Ошибка при отправке сообщения<br>';
                    }
                    
                } else {
                    $this->insertError = "Не заполнены обязательные поля";
                }
            } else {
                $this->insertError = "Введен неверный проверочный код";
            }
        }
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
}
?>
