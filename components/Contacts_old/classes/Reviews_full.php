<?php
class Reviews_full {
    private $thisLang;
    private $thisPage;
    
    private $noData;
    private $wrongPage;
    private $localization;
    private $shop;
    private $shopName;
    private $reviews;
    
    private $url;
    
    private $reviewsOnPage;
    private $start;
    private $page;
    private $showAllPage;
    private $count;
    private $allPages;
    
    private $html;
    private $printHtml;
    private $formHtml;
    private $reviewsHtml;
    private $pagePanel;
    private $printPagePanel;
    
    private $insertError;
    private $insertOk;

    /*
     * $this->page = $page-1
     * $this->page - начианется с 0, а $page начианется с 1
     * $this->allPages - сколько всего страниц.
     * $this->page всегда < $this->allPages-1
     */
    public function __construct($page) {
        $this->insertError = null;
        $this->insertOk = null;
        $this->insertReview();
        $_POST=null;
        global $_URL_PARAMS;
        global $_PARAM;
        // Выставляем параметры поу молчанию
        $this->reviewsOnPage = 5;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->thisPage = $_URL_PARAMS['page'];
        $this->shop = $_PARAM['name'];
        $this->noData = false;
        $this->wrongPage = false;
        $this->showAllPage = false;
        $this->localization = new Localization();
        // Расчитываем текущую страницу и генерируем url
        if($page=='all') {
            $this->showAllPage = true;
            $this->page = 0;
        } else {
            $this->page = $page!=null ? $page-1 : 0;
        }
        $this->countReviews ();
        $this->countAllPages();
        $this->start = $this->page * $this->reviewsOnPage;
        if($this->wrongPage) {
            return;
        }
        $this->generatorHtml();
    }
    
    private function generatorHtml() {
        if($this->count < 1) {
            $this->noData = true;
        }
        $this->getData();
        $this->getShopName();
        $this->generateReviewsHtml();
        $this->generateForm();
        $this->generatePagePanel();
        $this->generatePrintPagePanel();
        
        $this->html = "";
        $this->html .= "<h2>";
//        $this->html .= $this->shopName;
//        $this->html .= " - ";
        $this->html .= "Отзывы клиентов";
        $this->html .= "</h2>";
        $this->html .= $this->reviewsHtml;
        $this->html .= $this->formHtml;
        $this->html .= $this->pagePanel;
        
        $this->generatorPrintHtml();
    }
    
    private function generatorPrintHtml() {
        $this->printHtml = "";
        $this->printHtml .= '<div class="clear"></div>';
        $this->printHtml .= "<h2>";
        $this->printHtml .= $this->shopName;
        $this->printHtml .= " - ";
        $this->printHtml .= "Отзывы клиентов";
        $this->printHtml .= "</h2>";
        if($this->count>0) {
            $this->printHtml .= $this->reviewsHtml;
            $this->printHtml .= $this->printPagePanel;
        } else {
            $this->printHtml .= "Отзывов нет.";
        }
    }

    private function wrongPageError() {
        if($this->wrongPage) {
            global $_SITECONFIG;
            header('Location: '.$this->url);
            echo '<script type="text/javascript">'; 
            echo 'window.location.href="http://'.$_SITECONFIG['host_name'].'/'.$this->url.'";'; 
            echo '</script>'; 
        }
    }
    
    private function countReviews () {
        $query ="select count(`id`) as count from `ContactsShopReviews` where `shop`='$this->shop' and `show`>0";
        $mySqlHelper = new MySqlHelper($query);
        $data = $mySqlHelper->getDataRow(0);
        $this->count = $data['count'];
    }
    
    private function countAllPages() {
        if(($this->count % $this->reviewsOnPage) != 0) {
            $this->allPages = (int) floor($this->count / $this->reviewsOnPage) +1;
        } else {
            $this->allPages = (int) $this->count / $this->reviewsOnPage;
        }
        if($this->page >= $this->allPages || $this->page < 0) {
            $this->page = 0;
            if($this->count>0) {
                $this->wrongPage = true;
            }
        }
        $urlHelper = new UrlHelper();
        $this->url = $urlHelper->pageUrl($this->thisPage, null);
        $this->wrongPageError();
    }

    private function getData() {
        if($this->showAllPage) {
            $query ="select * from `ContactsShopReviews` where `shop`='$this->shop' and `show`>0
                order by `date` desc
                LIMIT $this->start,$this->count";
        } else {
            $query ="select * from `ContactsShopReviews` where `shop`='$this->shop' and `show`>0
                order by `date` desc
                LIMIT $this->start,$this->reviewsOnPage";
        }
        $mySqlHelper = new MySqlHelper($query);
        $this->reviews = $mySqlHelper->getAllData();
//        if(count($this->reviews < 1)) {
//            $this->wrongPage = true;
//            $this->wrongPageError();
//        }
    }
    
    private function getShopName() {
        $query ="select `name` from `ContactsShop_Lang` where `lang`='RU' and `shop`='$this->shop'";
        $mySqlHelper = new MySqlHelper($query);
        $shop = $mySqlHelper->getDataRow(0);
        $this->shopName = $shop['name'];
    }
    
    private function generateForm() {
        $out = "";
        $out .= '<center><a class="fancybox" href="#send_reviews"><button type="button" 
                    class="apelsin_button">Оставить отзыв</button></a></center>';
        $out .= "<div id='send_reviews' style='display: none;'>";
        $out .= "<h2>";
        $out .= "Оставьте свой отзыв";
        $out .= "</h2>";
        $out .= '<form class="reviews" name="shop_reviews" action="'.$this->url.'" 
            method="post" accept-charset="UTF-8" autocomplete="on" 
            onsubmit="return validate_form ( );">';
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
        $this->formHtml = $out;
    }
    
    private function generateReviewsHtml() {
        $out = "";
        if($this->insertError!=null) {
            
            echo '<script type="text/javascript">';
            echo 'alert("Во время добавления отзыва произошла ошибка:\n'.$this->insertError.'");';
            echo '</script>';
//            $out .= "<center>Во время добавления отзыва произошла ошибка: <div class='error'>";
//            $out .= $this->insertError;
//            $out .= "</div></center>";
        }
        if($this->insertOk!=null) {    
            echo '<script type="text/javascript">';
            echo "alert('$this->insertOk');";
            echo '</script>';
//            $out .= "<center><div class='error'>";
//            $out .= $this->insertOk;
//            $out .= "</div></center>";
        }
        if(!$this->noData) {
            foreach ($this->reviews as $reviews) {
                $out .= "<div class='shop_review_element'>";

                $out .= "<div class='shop_review_element_fio'>";
                $out .= $reviews['fio'];
                $out .= "</div>";
                
                $out .= "<div class='shop_review_element_rating'>";
                $out .= "<span class='shop_review_element_text_title'>";
                $out .= "Оценка: ";
                $out .= "</span>";
                $out .= $reviews['rating'];
                $out .= "</div>";
                
                $out .= '<div class="clear"></div>';

                if($reviews['dignity']!=NULL && $reviews['dignity']!="") {
                    $out .= "<div class='shop_review_element_dignity'>";
                    $out .= "<span class='shop_review_element_text_title'>";
                    $out .= "Недостатки: ";
                    $out .= "</span>";
                    $out .= $reviews['dignity'];
                    $out .= "</div>";
                }

                if($reviews['limitations']!=NULL && $reviews['limitations']!="") {
                    $out .= "<div class='shop_review_element_limitations'>";
                    $out .= "<span class='shop_review_element_text_title'>";
                    $out .= "Достоинства: ";
                    $out .= "</span>";
                    $out .= $reviews['limitations'];
                    $out .= "</div>";
                }

                if($reviews['wishes']!=NULL && $reviews['wishes']!="") {
                    $out .= "<div class='shop_review_element_wishes'>";
                    $out .= "<span class='shop_review_element_text_title'>";
                    $out .= "Пожелания: ";
                    $out .= "</span>";
                    $out .= $reviews['wishes'];
                    $out .= "</div>";
                }

                $out .= "<div class='shop_review_element_comments'>";
                $out .= "<span class='shop_review_element_text_title'>";
                $out .= "Комментарий: ";
                $out .= "</span>";
                $out .= $reviews['comments'];
                $out .= "</div>";
                
                $out .= '<div class="clear"></div>';

                $out .= "<div class='shop_review_element_date'>";
                $date = new DateTime($reviews['date']);
                $out .= "<span class='date' title='Дата публикации'>".$date->format('d M Y')."</span> ";
                $out .= "<span class='date' title='Время публикации'>[".$date->format('H:i')."]</span>";
                $out .= "</div>";

                $out .= '<div class="clear"></div>';
                $out .= "</div>";
            }
        } else {
            $out .= "<center><div class='shop_review_first'>";
            $out .= "Ваш отзыв будет первым.";
            $out .= "</div></center>";
        }
        $this->reviewsHtml = $out;
    }
    
    private function generatePagePanel() {
        $urlHelper = new UrlHelper();
        $url = $urlHelper->pageUrl($this->thisPage, null);
        $onChange = 'onChange="reviewPageLacation(\'page_select\',\''.$url.'\')"';
//        $onClick = 'onClick="reviewPageLacation(\'page_select\',\''.$url.'\')"';
        $onClick = "";
        
        
        $out = "";
        $out .= "<div class='shop_review_page_panel'>";
        $out .= "Показать ";
        $out .= '<select class="reviews_table_select" name="page_select" id="page_select" '.$onChange.'>';
        for($i=0; $i<$this->allPages; $i++) {
            $start = $i * $this->reviewsOnPage;
            if($i+1==$this->allPages) {
                $stop = $this->count;
            } else {
                $stop = $start+$this->reviewsOnPage;
            }
            $str = ($start+1)." - ".$stop;
            if($this->page == $i) {
                $out .= '<option selected value="'.($i+1).'" '.$onClick.'>'.$str.'</option>';
            } else {
                $out .= '<option value="'.($i+1).'" '.$onClick.'>'.$str.'</option>';
            }
        }
        if($this->showAllPage) {
            $out .= '<option selected value="all" '.$onClick.'>Все</option>';
        } else {
            $out .= '<option value="all" '.$onClick.'>Все</option>';
        }
        $out .= '</select>';
        $out .= " отзывы из ";
        $out .= $this->count;
        $out .= "</div>";
        $this->pagePanel = $out;
    }
    
    private function generatePrintPagePanel() {
        $out = "";
        $out .= "<div class='shop_review_page_panel'>";
        if($this->showAllPage) {
            $out .= "Все отзывы";
        } else {
            $out .= "Отзывы ";
            
            $start = $this->page * $this->reviewsOnPage;
            if($this->page+1==$this->allPages) {
                $stop = $this->count;
            } else {
                $stop = $start+$this->reviewsOnPage;
            }
            $out .= ($start+1)." - ".$stop;
            $out .= " из ";
            $out .= $this->count;
        }
        $out .= "</div>";
        $this->printPagePanel = $out;
    }
    
    public function get(){
        echo $this->html;
    }
    
    public function getHTML(){
        return $this->html;
    }
    
    public function getPrint(){
        echo $this->printHtml;
    }
    
    public function getPrintHTML(){
        return $this->printHtml;
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
                    $this->insertOk = "Ваш отзыв успешно добавлен. Он будет опубликован на сайте после проверки модератором.";
                } else {
                    $this->insertError = "Заполнены не все обязательные поля";
                }
            } else {
                $this->insertError = "Введен неверный проверочный код";
            }
        }
    }
    
    private function getMysqlText($text) {
        $text = nl2br($text);
        $text = strip_tags($text, '<br>');
        $text = htmlspecialchars_decode($text);
        $text = @mysql_real_escape_string($text);
        return $text;
    }
}
?>
