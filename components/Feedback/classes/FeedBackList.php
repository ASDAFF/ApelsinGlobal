<?php

/**
 * Description of FeedBackList
 *
 * @author olga
 */
class FeedBackList {
    
    private $SQL_HELPER;
    private $URL_PARAMS;
    private $formAddFeedbackComment;
    private $html;
    private $dataFeedbackKeyID;
    private $dataCommentsKeyFeedbackParentPure;
    private $dataCommentsKeyFeedbackParent;
    private $page;
    private $data;
    private $countFeedbackinPage = 1;
    private $countNumberLinkInPage = 5;
    private $classCSS = "feedbackSelectLike";
    
    private $pageBasically_next;
    private $pageBasically_prew;
    private $countFeedback;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        $this->urlHelper = new UrlHelper();
        
        $this->getDataCountFeedback();
        $params = array();  
        if (isset($this->URL_PARAMS[0]) && $this->URL_PARAMS[0] != '' && $this->URL_PARAMS[0] != null) {
            $params[0] = $this->URL_PARAMS[0];
        } else {
            $this->URL_PARAMS[0] = 1;
            $params[0] = $this->URL_PARAMS[0];
        }
        $this->page = $params[0];
    }

    private function getDataFeedbackKeyID() {
        $this->dataFeedbackKeyID = array();
        $query = "SELECT * FROM `Feedbacks` ORDER BY `date` DESC;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $this->dataFeedbackKeyID[$value['id']] = $value;
        }
    }

    private function getDataComments() {
        $this->dataCommentsKeyFeedbackParentPure = array();
        $this->dataCommentsKeyFeedbackParent = array();
        $query = "SELECT * FROM `FeedbacksIsComments` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $value) {
            $this->dataCommentsKeyFeedbackParentPure[] = $value['parentFeedback'];
            $this->dataCommentsKeyFeedbackParent[$value['parentFeedback']][$value['feedback']] = $value;
        }
    }    
    
    private function getDataCountFeedback() {
        $query = "SELECT count(`id`) as allRow FROM
                    (
                    SELECT 
                        Feed.`feedback`,
                        Feed.`status`,
                        Feed.`id`,
                        Feed.`fio`,
                        Feed.`title`,
                        Feed.`text`,
                        Feed.`email`,
                        Feed.`phone`,
                        Feed.`ip`,
                        Feed.`date`,
                        Feed.`rating`,
                        Feed.`like`,
                        Feed.`dislike`,
                        Feed.`show`,
                        FLIPS.`showReview`
                        FROM
                            (
                            SELECT   distinct  
                            Feed.`feedback`,
                            FLIP.`status`,
                            Feed.`id`,
                            Feed.`fio`,
                            Feed.`title`,
                            Feed.`text`,
                            Feed.`email`,
                            Feed.`phone`,
                            Feed.`ip`,
                            Feed.`date`,
                            Feed.`rating`,
                            Feed.`like`,
                            Feed.`dislike`,
                            Feed.`show`
                            FROM
                                (
                                SELECT *
                                FROM 
                                    (
                                    SELECT * FROM `Feedbacks` AS Feed 
                                    ) AS Feed 
                                left JOIN  `FeedbacksIsComments` AS FIC
                                ON  FIC.`feedback`= Feed.`id` 
                                )  AS Feed
                            LEFT JOIN  `FeedbacksListIP` AS FLIP
                            on  FLIP.`ip`= Feed.`ip` 
                            ) AS Feed
                    LEFT JOIN  `FeedbacksListIPStatus` AS FLIPS 
                    ON  Feed.`status`= FLIPS.`status` 
                    ) AS REZULT
                where REZULT.`feedback` IS NULL  AND REZULT.`show`= '1' AND REZULT.`showReview`= '1' ";
        $result = $this->SQL_HELPER->select($query,1);
        $this->countFeedback = $result['allRow'];
    }
    
    private function getDataFeedback($start, $number) {
        $query = "SELECT * FROM
                    (
                    SELECT 
                        Feed.`feedback`,
                        Feed.`status`,
                        Feed.`id`,
                        Feed.`fio`,
                        Feed.`title`,
                        Feed.`text`,
                        Feed.`email`,
                        Feed.`phone`,
                        Feed.`ip`,
                        Feed.`date`,
                        Feed.`rating`,
                        Feed.`like`,
                        Feed.`dislike`,
                        Feed.`show`,
                        FLIPS.`showReview`
                        FROM
                            (
                            SELECT   distinct  
                            Feed.`feedback`,
                            FLIP.`status`,
                            Feed.`id`,
                            Feed.`fio`,
                            Feed.`title`,
                            Feed.`text`,
                            Feed.`email`,
                            Feed.`phone`,
                            Feed.`ip`,
                            Feed.`date`,
                            Feed.`rating`,
                            Feed.`like`,
                            Feed.`dislike`,
                            Feed.`show`
                            FROM
                                (
                                SELECT *
                                FROM 
                                    (
                                    SELECT * FROM `Feedbacks` AS Feed 
                                    ) AS Feed 
                                left JOIN  `FeedbacksIsComments` AS FIC
                                ON  FIC.`feedback`= Feed.`id` 
                                )  AS Feed
                            LEFT JOIN  `FeedbacksListIP` AS FLIP
                            on  FLIP.`ip`= Feed.`ip`
                            ) AS Feed
                    LEFT JOIN  `FeedbacksListIPStatus` AS FLIPS 
                    ON  Feed.`status`= FLIPS.`status` 
                    ) AS REZULT
                where REZULT.`feedback` IS NULL  AND REZULT.`show`= '1' AND REZULT.`showReview`= '1' LIMIT ".$start.", ".$number.";";
        $this->data = $this->SQL_HELPER->select($query);
    }

    private function getPageFeedback() {
        //кол-во отзывов на одной странице
        $start = $this->page * $this->countFeedbackinPage - $this->countFeedbackinPage;
        if(($start+1) > $this->countFeedback) {
            $this->page = 1;
            $start = 0;
        }
        $this-> getDataFeedback($start, $this->countFeedbackinPage);
//        echo var_dump($this->data);
        if($this->data!=null) {
            foreach ($this->data as $key => $element) {
                $this->html .= '<div class="feedbackElement" >';
                $this->getElementFeedback($element);
                $this->getComments($element['id']);
                $this->getPanelButton($element);
                $this->getPanelDate($element['date']);
                $this->html .= '</div>';
            }
        } else {
            $this->html .= "Страница не найдена 404";
        }
    }
    
    private function getPagination() {
        // $this->countFeedback - кол-во записей
        
        // $totalPage - кол-во страниц общее 
        $totalPage = intval(($this->countFeedback - 1) / $this->countFeedbackinPage) + 1; 
        
        //всего после текущей 
        $nextPageNow = $totalPage - $this->page;
        // всего перед текущей
        $prewPageNow = $totalPage - $nextPageNow - 1;
        
        // кол-во страниц для показа до и после текущей
        $this->pageBasically_prew = $this->pageBasically_next = floor($this->countNumberLinkInPage / 2);
        
        if($prewPageNow < $this->pageBasically_prew && $nextPageNow < $this->pageBasically_next) {
            // оба меньше
            $this->pageBasically_prew = $prewPageNow;
            $this->pageBasically_next = $nextPageNow;
        } else if($prewPageNow < $this->pageBasically_prew) {
            // перед меньше
            $difference = $this->pageBasically_prew - $prewPageNow;
            if(($this->pageBasically_next + $difference) >= $nextPageNow) {
                $this->pageBasically_next = $nextPageNow;
            } else {
                $this->pageBasically_next += $difference;
            }
            $this->pageBasically_prew = $prewPageNow;
        } else if($nextPageNow < $this->pageBasically_next) {
            // после меньше
            $difference = $this->pageBasically_next - $nextPageNow;
            if(($this->pageBasically_prew + $difference) >= $prewPageNow) {
                $this->pageBasically_prew = $prewPageNow;
            } else {
                $this->pageBasically_prew += $difference;
            }
            $this->pageBasically_next = $nextPageNow;
        }
     
        $params = array();
        $this->html .= '<ul class="feedbackPagination">';
            //  стрелки назад 
            if ($this->page != 1) {
                $this->html .= '<li>';
                    $params[0] = 1;
                    $this->html .= '<a href="'.$this->urlHelper->chengeParams($params).'"><<</a>'; 
                $this->html .= '</li>';

                $this->html .= '<li>';
                    $params[0] = $this->page - 1;
                    $this->html .= ' <a href="'.$this->urlHelper->chengeParams($params).'"><</a> '; 
                $this->html .= '</li>';
            }
            
            for($i = $this->page-$this->pageBasically_prew; $i<=($this->page+$this->pageBasically_next); $i++) {
                if ($i != $this->page) {
                    $this->html .= '<li>';
                        $params[0] = $i;
                        $this->html .=  ' <a href="'.$this->urlHelper->chengeParams($params).'">'.$i.'</a>'; 
                    $this->html .= '</li>';  
                } else {
                    $this->html .= '<li>';
                        $this->html .=  '<span class="feedbackCurrentPagePagination">'.$this->page.'</span>  '; 
                    $this->html .= '</li>';
                }
            }
            // стрелки вперед 
            if ($this->page != $totalPage) {
                $this->html .= '<li>';
                    $params[0] = $this->page + 1;
                    $this->html .= ' <a href="'.$this->urlHelper->chengeParams($params).'">></a> ';
                $this->html .= '</li>'; 

                $this->html .= '<li>';
                    $params[0] = $totalPage;
                    $this->html .= '<a href="'.$this->urlHelper->chengeParams($params).'">>></a>';
                $this->html .= '</li>';
            } else {
                $this->html .= ''; 
            }
        $this->html .= '</ul>';
    }

    // генерирование списка отзывов
    private function generationListFeedback() {
        $this->getDataComments();
        $this->getDataFeedbackKeyID();
        $this->html = '';
        $this->html .= '<div class="feedbackListConteiner">';
            $this->getPageFeedback();
            $this->html .= '<div class="feedbackPaginationConteiner">';
                $this->getPagination();
            $this->html .= '</div>';
        $this->html .= '</div>';
    }

    // генерирование элемента коммента
    private function getComments($id) {
        $this->html .= '<ul  class="feedbackListComments">';
        $this->html .= '<li>';
        $this->html .= '<div id="feedbackShowComments'.$id.'" class="feedbackShowComments" >';
        foreach ($this->dataCommentsKeyFeedbackParent as $keyParent) {
            foreach ($keyParent as $keyFeedback){
                if ($id == $keyFeedback['parentFeedback']) {
                    $element = $this->dataFeedbackKeyID[$keyFeedback['feedback']];
                    $this->getElementFeedback($element);
                    $this->getPanelButton($element, false);
                    $this->getPanelDate($element['date']);
                    $this->getComments($keyFeedback['feedback']); 
                }else {
                    $this->html .= '';
                }   
            } 
        }
        $this->html .= '</div>';
        $this->html .= '</li>';
        $this->html .= '</ul>';
    }
        
    // вывод отзыва (комментария)
    private function getElementFeedback($element) {
        $this->html .= '<div class="feedbackElement">';
            $this->html .= '<div>';
            $this->html .= $element['fio'];
            $this->html .= '</div>';

            if ($element['title'] != '' && $element['title'] != null) {
                $this->html .= '<div>';
                $this->html .= $element['title'];
                $this->html .= '</div>';
            }

            $this->html .= '<div>';
            $this->html .= $element['text'];
            $this->html .= '</div>';
        $this->html .= '</div>';
    }

    // панель для всех кнопок
    private function getPanelButton($element, $rating = true) {
        $this->html .= '<div class="feedbackPanel">';
            if ($rating == true) {
                $this->html .= $this->getRating($element['rating']);
            }
            $this->html .= $this->getLike($element);
            $this->html .= '<div class="feedbackPanelShowComments">';
                if (in_array($element['id'], $this->dataCommentsKeyFeedbackParentPure)) {
                    $this->generationButtonShowHideComments('Смотреть комментарии',$element['id']);
                }
                $this->html .= $this->generationButtonAddComments($element['id']);
            $this->html .= '</div>';

            $this->html .= $this->addComments($element['id'], $element['fio']);
        $this->html .= '</div>';
    }
    
    // панель дата отзыва
    private function getPanelDate($date) {
        $this->html .= '<div class="feedbackDatePanel">';
            $showDate = $this->checkDifferenceBetweenVisits($date);
            if($showDate < 1/24) {
                $dateHour = floor($showDate*(60*60*24)/60);
                $this->html .= 'Опубликовано '.$dateHour.' м. назад';
            } elseif ($showDate <= 1) {
                $dateHour = floor($showDate*24);
                $this->html .= 'Опубликовано '.$dateHour.' ч. назад';
            } elseif ($showDate > 1 && $showDate < 7) {
                $dateWeek = floor($showDate);
                $this->html .= 'Опубликовано '.$dateWeek.' дн. назад';
            } else {
                $resultWeek = substr($date, 0, 10);
                $this->html .= 'Опубликовано '.$resultWeek;
            }
        $this->html .= '</div>';
    }

    // кол-во дней после последнего сообщения
    private function checkDifferenceBetweenVisits($date) {
        $last = strtotime($date);
        $current = strtotime(date("Y-m-d H:i:s"));
        $difference = ($current - $last)/(60*60*24);
        return $difference;
    }
    
    // панель Rating
    private function getRating($element) {
        $this->html .= '<div class="feedbackStarRatingConteiner">';
            $this->html .= '<dl class="feedbackStarRating" >';
                $this->html .= '<dt></dt>';
                $this->html .= '<dd>';
                    $this->html .= '<ol>';
                    $query = "SELECT  `value`  FROM `FeedbacksRating` WHERE `id`= '" . $element . "';";
                    $value = $this->SQL_HELPER->select($query, 1);
                    $w = $value['value'] * 20;
                    if ($value['value'] != '0') {
                        $this->html .= '<li class="feedbackCurrent  star' . $value['value'] . '" style="width:' . $w . 'px"  ></li>';
                    }
                    $this->html .= '</ol>';
                $this->html .= '</dd>';
            $this->html .= '</dl>';
        $this->html .= '</div>';
    }

    // наличие лайков к определенной статье
    private function getDataLike($id, $ip) {
        $query = "SELECT `like` FROM `FeedbacksLike`  WHERE `feedback`= '".$id."' AND `ip` = '".$ip."' ;";
        $initLike = $this->SQL_HELPER->select($query,1);
        return $initLike;
    }
    
    // кол-во лайков к определенной статье
    private function getDataCountLike($value, $id) {
        $query = "SELECT `like`, COUNT(*) FROM `FeedbacksLike`  WHERE `like` = '".$value."' AND `feedback` = '".$id."' GROUP BY `like` ;";
        $counts = $this->SQL_HELPER->select($query,1);
        return $counts['COUNT(*)'];
    }
    
    //панель Like
    private function getLike($element) {
        $ip = $_SERVER['REMOTE_ADDR'];
        // для отладки
//        $ip = '';
        
        $likePlus = $this->getDataCountLike('1', $element['id']);
        $likeMinus = $this->getDataCountLike('0', $element['id']);
        $colorDislik = '';
        $colorLike = '';
        $initLike = $this->getDataLike($element['id'], $ip);
        
        if ($initLike['like'] != null ) {
            if ($initLike['like'] == 1 ) {
                $colorLike = $this->classCSS;
            } else {
                $colorDislik = $this->classCSS;
            } 
        } 
       
        $this->html .= '<div class="feedbackPanelLike" id="feedbackPanelLike'.$element['id'].'">';

            $this->html .= '<div class="feedbackLikeButton" onclick="setLike( \''.$element['id'].'\', \''.$ip.'\', \'1\');">';
                $this->html .= 'Нравиться';
            $this->html .= '</div>';

            $this->html .= '<div class="feedbackCountLike '.$colorLike.'">';
                $this->html .= $element['like'] + $likePlus;
            $this->html .= '</div>';

            $this->html .= '<div class="feedbackLikeButton" onclick="setLike( \''.$element['id'].'\', \''.$ip.'\', \'0\');">';
                $this->html .= 'Не нравиться';
            $this->html .= '</div>';

            $this->html .= '<div class="feedbackCountLike '.$colorDislik.'">';
                $this->html .= $element['dislike'] + $likeMinus;
            $this->html .= '</div>';
//            $this->html .= $element['id'];

        $this->html .= '</div>';
    }

    //кнопка Комментировать
    private function generationButtonAddComments($id) {
        $this->html .= '<a id="formFeedbackFancybox" class="fancybox-doc" href="#formFeedbackComment'.$id.'">';
            $this->html .= '<div class="feedbackCommentButton">';
                $this->html .= 'Комментировать';
            $this->html .= '</div>';
        $this->html .= '</a>';
    }

    //кнопка ShowHideComments
    private function generationButtonShowHideComments($name,$value) {
        $this->html .= '<div class="feedback_hide_show'.$value.' feedbackShowButton" title="'.$name.'"  onclick="showComments('.$value.'); ">';
            $this->html .= $name;
        $this->html .= '</div>';
    }

    // форма добавления комментов
    private function addComments($id, $fio) {
        $this->formAddFeedbackComment = new FeedBackAddComment($id, $fio);
        $this->html .= '<div id="formFeedbackComment'.$id.'" class="formFeedbackComment">';
            $this->html .= $this->formAddFeedbackComment->getForm();
        $this->html .= '</div>';
    }
    
    public function getList() {
        $this->generationListFeedback();
        return $this->html;
    }
}


        
        
        
            // Проверяем нужны ли стрелки назад 
//            if ($this->page != 1) {
//                $params[0] = 1;
//                $pervpage = '<a href="'.$this->urlHelper->chengeParams($params).'"><<</a>'; 
//                
//                $params[0] = $this->page - 1;
//                $pervpage .= ' <a href="'.$this->urlHelper->chengeParams($params).'"><</a> '; 
//            } 
//            
            // Находим две ближайшие станицы с обоих краев, если они есть 
//            if($this->page - 2 > 0) {
//                $params[0] = $this->page - 2;
//                $page2left = ' <a href="'.$this->urlHelper->chengeParams($params).'">'. ($this->page - 2) .'</a> | '; 
//            }
//            if($this->page - 1 > 0) {
//                $params[0] = $this->page - 1;
//                $page1left = '<a href="'.$this->urlHelper->chengeParams($params).'">'. ($this->page - 1) .'</a> | '; 
//            }
//            
//            $this->html .=  '<a href="'.$this->urlHelper->chengeParams($params).'">'. $this->page .'</a> | '; 
//            
//            if($this->page + 2 <= $totalPage) {
//                $params[0] = $this->page + 2;
//                $page2right = ' | <a href="'.$this->urlHelper->chengeParams($params).'">'. ($this->page + 2) .'</a>'; 
//            }
//            if($this->page + 1 <= $totalPage) {
//                $params[0] = $this->page + 1;
//                $page1right = ' | <a href="'.$this->urlHelper->chengeParams($params).'">'. ($this->page + 1) .'</a>'; 
//            }
            
//            // Проверяем нужны ли стрелки вперед 
//            if ($this->page != $totalPage) {
//                $params[0] = $this->page + 1;
//                $nextpage = ' <a href="'.$this->urlHelper->chengeParams($params).'">></a> ';
//                
//                $params[0] = $totalPage;
//                $nextpage .= '<a href="'.$this->urlHelper->chengeParams($params).'">>></a>';
//                
//            } 
            // Вывод меню 
//            $this->html .=  $pervpage.$page2left.$page1left.'<b>'.$this->page.'</b>'.$page1right.$page2right.$nextpage; 