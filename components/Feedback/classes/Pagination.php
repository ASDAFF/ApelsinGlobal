<?php
/**
 * Description of Pagination
 *
 * @author olga
 */
class Pagination {
    private $html;
    private $URL_PARAMS;
    private $countPost; // кол-во сообщений для показа всего
    private $page; // текущая страница
    private $indexParam; // индекс параметра для формирования ссылки
    private $countFeedbackinPage = 1; //  кол-во сообщений показывать на одной странице 
    private $countNumberLinkInPage = 6; // кол-во отображаемых ссылок
    
    public function __construct($page, $countPost, $indexParam) {
        $this->page = $page;
        $this->countPost = $countPost; 
        $this->indexParam = $indexParam;
        global $_URL_PARAMS;
        $this->URL_PARAMS = $_URL_PARAMS['params'];
        if (isset($this->URL_PARAMS[$this->indexParam]) && $this->URL_PARAMS[$this->indexParam] != '' && $this->URL_PARAMS[$this->indexParam] != null) {
            $params[$this->indexParam] = $this->URL_PARAMS[$this->indexParam];
        } else {
            $this->URL_PARAMS[$this->indexParam] = 1;
            $params[$this->indexParam] = $this->URL_PARAMS[$this->indexParam];
        }
    }
    
    public function getPagination() {
        // $totalPage - кол-во страниц общее 
        $totalPage = intval(($this->countPost - 1) / $this->countFeedbackinPage) + 1; 
        
         //всего после текущей можем показать
        $nextPageNow = $totalPage - $this->page;
        // всего перед текущей можем показать
        $prewPageNow = $totalPage - $nextPageNow - 1;
        
        // кол-во ссылок для показа до и после текущей
        $pageBasically = floor($this->countNumberLinkInPage / 2);
        
        if ($prewPageNow < $pageBasically) {
            $nextPageTotal = $this->page + $pageBasically + $pageBasically - $prewPageNow;
            $prewPageTotal = $this->page - $prewPageNow;
        } elseif ($nextPageNow < $pageBasically) {
            $nextPageTotal = $this->page + $nextPageNow;
            $prewPageTotal = $this->page  - $pageBasically - $pageBasically + $nextPageNow;
        } elseif ($nextPageNow >= $pageBasically || $prewPageNow >= $pageBasically) {
            $nextPageTotal = $this->page + $pageBasically;
            $prewPageTotal = $this->page - $pageBasically;
        } 
        
        echo $this->page.' текущей<br>';
        echo $prewPageNow.' всего перед текущей <br>';
        echo $nextPageNow.' всего после текущей <br>';
        echo $totalPage.' кол-во страниц общее <br>';
        echo $pageBasically.' сколько в основном<br>';
        echo $prewPageTotal.' от <br>';
        echo $nextPageTotal.' до <br>';
        $this->html = '';
        $this->html .= '<ul class="feedbackPagination">';
            //  стрелки назад 
//            $this->goBack();
            if ($this->page != 1) {
                $this->html .= '<li>';
                    $params[$this->indexParam] = 1;
                    $this->html .= '<a href="'.$this->urlHelper->chengeParams($params).'"><<</a>'; 
                $this->html .= '</li>';

                $this->html .= '<li>';
                    $params[$this->indexParam] = $this->page - 1;
                    $this->html .= ' <a href="'.$this->urlHelper->chengeParams($params).'"><</a> '; 
                $this->html .= '</li>';
            }

            
            // отображаемые ссылки
//            $this->mainPage($prewPageTotal, $nextPageTotal);
            for ($i = $prewPageTotal; $i <= $nextPageTotal; $i ++) {
                if ($i != $this->page) {
                    $this->html .= '<li>';
                        $page = $i;
                        echo $page.' в цикле <br>';
                        $params[$this->indexParam] = $page;
                        $this->html .=  ' <a href="'.$this->urlHelper->chengeParams($params).'">'.$page.'</a>'; 
                    $this->html .= '</li>';  
                } else {
                    $this->html .= '<li>';
                        $this->html .=  '<b  class="feedbackCurrentPagePagination">'.$this->page.'</b>  '; 
                    $this->html .= '</li>';
                }
            }
            // стрелки вперед 
//            $this->goForward($totalPage);
            if ($this->page != $totalPage) {
                $this->html .= '<li>';
                    $params[$this->indexParam] = $this->page + 1;
                    $this->html .= ' <a href="'.$this->urlHelper->chengeParams($params).'">></a> ';
                $this->html .= '</li>'; 

                $this->html .= '<li>';
                    $params[$this->indexParam] = $totalPage;
                    $this->html .= '<a href="'.$this->urlHelper->chengeParams($params).'">>></a>';
                $this->html .= '</li>';
            } else {
                $this->html .= ''; 
            }
        $this->html .= '</ul>';
        return $this->html;
    }
    
//    private function goForward($totalPage) {
//        // стрелки вперед 
//        if ($this->page != $totalPage) {
//            $this->html .= '<li>';
//                $params[$this->indexParam] = $this->page + 1;
//                $this->html .= ' <a href="'.$this->urlHelper->chengeParams($params).'">></a> ';
//            $this->html .= '</li>'; 
//
//            $this->html .= '<li>';
//                $params[$this->indexParam] = $totalPage;
//                $this->html .= '<a href="'.$this->urlHelper->chengeParams($params).'">>></a>';
//            $this->html .= '</li>';
//        } else {
//            $this->html .= ''; 
//        }
//    }
    
//    private function goBack() {
//        //  стрелки назад 
//        if ($this->page != 1) {
//            $this->html .= '<li>';
//                $params[$this->indexParam] = 1;
//                $this->html .= '<a href="'.$this->urlHelper->chengeParams($params).'"><<</a>'; 
//            $this->html .= '</li>';
//
//            $this->html .= '<li>';
//                $params[$this->indexParam] = $this->page - 1;
//                $this->html .= ' <a href="'.$this->urlHelper->chengeParams($params).'"><</a> '; 
//            $this->html .= '</li>';
//        }
//    }
    
//    private function mainPage($prewPageTotal, $nextPageTotal) {
//        for ($i = $prewPageTotal; $i <= $nextPageTotal; $i ++) {
//            if ($i != $this->page) {
//                $this->html .= '<li>';
//                    $page = $i;
//                    echo $page.' в цикле <br>';
//                    $params[$this->indexParam] = $page;
//                    $this->html .=  ' <a href="'.$this->urlHelper->chengeParams($params).'">'.$page.'</a>'; 
//                $this->html .= '</li>';  
//            } else {
//                $this->html .= '<li>';
//                    $this->html .=  '<b  class="feedbackCurrentPagePagination">'.$this->page.'</b>  '; 
//                $this->html .= '</li>';
//            }
//        }
//    }
    public function getUI() {
        $this->getPagination();
        return $this->html;
    }
}
