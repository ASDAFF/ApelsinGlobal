<?php
/**
 * Description of ListFeedBack
 *
 * @author olga
 */
class FeedBackList {
    
    private $html;
    private $SQL_HELPER;
    private $elementData;
    private $formAddFeedbackComment;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->formAddFeedbackComment = new FeedBackAddComment();
    } 
    
//    private function generationListFeedback() {
//        $this->html = '';
//        $element = '';
//        $this->html .= '<div class="ListFeedbackConteiner">';
//        $query = "SELECT * FROM `Feedbacks` WHERE `rating` != 'noRating';";
//        $result = $this->SQL_HELPER->select($query);
//        foreach ($result as $key => $value) {
//            $element = $this->getElementFeedbackData($value['id']);
//            $this->html .= $this->getElementInList($element);
//        }
//        $this->html .= '</div>'; //class="ListFeedbackConteiner"
//    }
//    
    private function getElementInList($element) {
        foreach ($this->elementData as $element) {
        
            $this->html .= '<div class="elementFeedback" >';

                $this->html .= '<div class="feedbackConteiner" >';
                    $this->html .= $this->getElementFeedback($element['id']);
                $this->html .= '</div>';
                
                $this->html .= '<div id="showComments'.$element['id'].'" class="showComments" style="display:none;">';
                    $this->html .= $this->showComments($element['id']);
                $this->html .= '</div>';
                
                $this->html .= '<div class="feedbackPanel">';
//                    $this->html .= $this->getRating($element['rating']);
                    $this->html .= $this->getLike($this->elementData);
                    $this->html .= $this->addComments($element['id']);
                $this->html .= '</div>'; 
                
            $this->html .= '</div>'; //class="elementFeedback"
        }
    }
    
    private function getCommentData($feedback){
        $query = "SELECT * FROM `FeedbacksIsComments` WHERE `parentFeedback`= '".$feedback."';";
        $result = $this->SQL_HELPER->select($query);
        $showComments = '';
        if ($result > 0 ) {
            foreach ($result as $key => $value) {
                $this->html .= '<div class="showCommentConteiner">';
                    $this->html .= $this->getElementFeedback($value['feedback']);
                $this->html .= '</div>';

                $this->html .= '<div class="feedbackPanel">';
                    $this->html .= $this->getLike($this->elementData);
                        $this->html .= '<div class="feedbackPanelShowComments">';
                        $this->generationButtonShowHideComments('Смотреть комментарии',$value['feedback']);
                        $this->html .= $showComments;
                        $this->html .= $this->generationButtonAddComments();
                    $this->html .= '</div>'; 
                $this->html .= '</div>'; 
                    //onclick="showComments('.$value['parentFeedback'].');"
            } 
        } else {
            $showComments = ''; 
        }
    }
    
    private function showComments($element) {
        $query = "SELECT * FROM `FeedbacksIsComments` WHERE `parentFeedback`= '".$element."';";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $this->html .= '<ul class="listComments">';
            
                $this->html .= '<li>';
                    $this->getCommentData($value['feedback']);
                $this->html .= '</li>';
                
//                $this->html .= '<li>';
//                    $this->html .= '<ul>';
//                        $this->html .= '<li>'; 
//                            $this->getCommentData($value['feedback']);
//                        $this->html .= '</li>';
//                        $this->html .= '</ul>';
                $this->html .= '</li>';
                
            $this->html .= '</ul>';
        }
    }

    private function addComments($id) {
        $this->html .= '<div class="feedbackPanelShowComments">';
            $this->html .= '<div id="formFeedbackComment">';
                $this->html .= $this->formAddFeedbackComment->getForm();
            $this->html .= '</div>';
            $this->html .= $this->generationButtonShowHideComments('Смотреть комментарии',$id);
            $this->html .= $this->generationButtonAddComments();
        $this->html .= '</div>';
    }

    private function getLike($element) {
        $this->html .= '<div class="feedbackPanelLike">';
        
            $this->html .= '<div class="likeButton">';
                $this->html .= 'Нравиться';
            $this->html .= '</div>';
            
            $this->html .= '<div class="countLike"  >';
                $this->html .= $element['like'];
            $this->html .= '</div>';

            $this->html .= '<div class="likeButton">';
                $this->html .= 'Не нравиться';
            $this->html .= '</div>';
            
            $this->html .= '<div class="countLike">';
                $this->html .= $element['dislike'];
            $this->html .= '</div>';
            
        $this->html .= '</div>';
    }
    
    private function getRating($element) {
        $this->html .= '<div class="starRatingConteiner">';
        
            $this->html .= '<dl class="starRating" id="starRating">';
                $this->html .= '<dt></dt>';
                $this->html .= '<dd>';
                    $this->html .= '<ol>';
                    
                        $query = "SELECT  `value`  FROM `FeedbacksRating` WHERE `id`= '".$element."';";
                        $value = $this->SQL_HELPER->select($query,1);
                        $w = $value['value']*20;
                        if ($value['value'] != '0') {
                            $this->html .= '<li class="current" style="width:'.$w.'px"  ><a  href="javascript:0" class=" star'.$value['value'].'" ></a></li>';
                        }
                    $this->html .= '</ol>';
                $this->html .= '</dd>';
            $this->html .= '</dl>';
            
        $this->html .= '</div>';
    }


    private function getElementFeedback($element) {
        $this->html .= '<div class="elementFeedback">';
        $query = "SELECT * FROM `Feedbacks` WHERE `id`= '".$element."';";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $value) {

            $this->html .= '<div>';
                $this->html .= $value['fio'];
            $this->html .= '</div>';
            
            if ($value['title'] != '' && $value['title'] != null) {
                $this->html .= '<div>';
                    $this->html .= $value['title'];
                $this->html .= '</div>';
            }

            $this->html .= '<div>';
                $this->html .= $value['text'];
            $this->html .= '</div>';
        }
        $this->html .= '</div>';
    }

    private function getElementFeedbackData($id) {
        $this->elementData = array();
        $query = "SELECT * FROM `Feedbacks`  WHERE `id`= '".$id."';";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $this->elementData[] = $value;
        }
    }
    
    private function generationButtonAddComments() {
        $this->html .= '<a  class="fancybox-doc" href="#formFeedbackComment">';
            $this->html .= '<div class="likeButton">';
                $this->html .= 'Комментировать';
            $this->html .= '</div>';
        $this->html .= '</a>';
    }
    
    private function generationButtonShowHideComments($name,$value) {
        $this->html .= '<div class="hide_show likeButton" onclick="showComments('.$value.');">';
            $this->html .= $name;
        $this->html .= '</div>';
    }

    public function getList() {
        $this->generationListFeedback();
        return $this->html;
    }
}