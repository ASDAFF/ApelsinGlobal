<?php
include_once '../../../ROOT/classes/MysqliHelper.php'; 
include_once '../../../ROOT/configure.php';
ini_set("display_errors",1);
error_reporting(E_ALL); 
/**
 * Description of FeedbackToggleLike
 *
 * @author olga
 */
class FeedbackToggleLike {
    
    private $feedback;
    private $ip;
    private $like;
    private $sqlHelper;
    private $dataFeedbacks;
    private $dataLikes;
    private $html;
    private $newResalt;
    private $classCSS;

    public function __construct($feedback, $ip, $like) {
        $this->sqlHelper = new MysqliHelper();
        $this->feedback = $feedback;
        $this->ip = $ip;
        $this->like = $like;
        $this->classCSS = "feedbackSelectLike";
    }
    
    private function getDataFeedback() {
        $query = "SELECT * FROM `Feedbacks`  WHERE `id`= '".$this->feedback."' ;"; 
        $this->dataFeedbacks = $this->sqlHelper->select($query,1);
        return $this->dataFeedbacks;
    }

    private function getDataFixedLike() {
        $query = "SELECT `like` FROM `FeedbacksLike`  WHERE `feedback`= '".$this->feedback."' AND `ip` = '".$this->ip."' ;";
        $this->dataLikes = $this->sqlHelper->select($query,1);
        return $this->dataLikes['like'];
    }
    
    private function getDataCountLike($value) {
        $query = "SELECT `like`, COUNT(*) FROM `FeedbacksLike`  WHERE `like` = '".$value."' AND `feedback` = '".$this->feedback."' GROUP BY `like` ;";
        $counts = $this->sqlHelper->select($query,1);
        return $counts['COUNT(*)'];
    }

    private function insertLike() {
        $query = "INSERT INTO `FeedbacksLike` SET ";
        $query .= "`feedback` = '".$this->feedback."', ";
        $query .= "`ip` = '".$this->ip."', ";
        $query .= "`like` = '".$this->like."'; ";
        $this->sqlHelper->insert($query);
    }
    
    private function deleteLike() {
        $query = "DELETE FROM `FeedbacksLike` WHERE `feedback`= '".$this->feedback."' AND `ip` = '".$this->ip."' ;";
        $this->sqlHelper->insert($query);
    }
    
    private function updateLike() {
        $query = "UPDATE `FeedbacksLike` SET ";
        $query .= "`feedback` = '".$this->feedback."', ";
        $query .= "`ip` = '".$this->ip."', ";
        $query .= "`like` = '".$this->like."' ";
        $query .= "WHERE `feedback`= '".$this->feedback."' AND `ip` = '".$this->ip."' ;";
        $this->sqlHelper->insert($query);
    }
    
    private function geherationLike() {
        $this->getCountLike();
        $this->getDataFixedLike();
        $colorDislik = '';
        $colorLike = '';
        if ($this->dataLikes['like'] != null ) {
            if ($this->dataLikes['like'] == 1 ) {
                $colorLike = $this->classCSS;
            } else {
                $colorDislik = $this->classCSS;
            } 
        }
        
        $this->html = '';
        $this->html .= '<div class="feedbackLikeButton" onclick="setLike(\''.$this->feedback.'\', \''.$this->ip.'\', \'1\');">';
            $this->html .= 'Нравиться';
        $this->html .= '</div>';

        $this->html .= '<div class="feedbackCountLike '.$colorLike.'" id="countLike" >';
            $this->html .=  $this->newResalt['countLike'];
        $this->html .= '</div>';

        $this->html .= '<div class="feedbackLikeButton"  onclick="setLike( \''.$this->feedback.'\', \''.$this->ip.'\', \'0\');">';
            $this->html .= 'Не нравиться';
        $this->html .= '</div>';

        $this->html .= '<div class="feedbackCountLike '.$colorDislik.'" id="countDislike" >'; 
            $this->html .= $this->newResalt['countDislik'];
        $this->html .= '</div>';
    }
    
    private function getCountLike() {  
        $this->getDataFeedback();
        $this->getDataFixedLike();
        $likePlus = $this->getDataCountLike('1');
        $likeMinus = $this->getDataCountLike('0');
        $this->newResalt = array();
        
        if ($this->dataLikes != null ) {
            if ($this->dataLikes['like'] == $this->like ) {
                $this->deleteLike();
                if ($this->like == 1 ) {
                    $this->newResalt['countLike'] = $this->dataFeedbacks['like'] + $likePlus - 1;
                    $this->newResalt['countDislik'] = $this->dataFeedbacks['dislike'] + $likeMinus; 
                } else {
                    $this->newResalt['countLike'] = $this->dataFeedbacks['like'] + $likePlus;
                    $this->newResalt['countDislik'] = $this->dataFeedbacks['dislike'] + $likeMinus - 1; 
                }
            } else {
                $this->updateLike();
                if ($this->like == 1 ) {
                    $this->newResalt['countLike'] = $this->dataFeedbacks['like'] + 1 + $likePlus;
                    $this->newResalt['countDislik'] = $this->dataFeedbacks['dislike'] + $likeMinus - 1; 
                } else {
                    $this->newResalt['countLike'] = $this->dataFeedbacks['like'] + $likePlus - 1;
                    $this->newResalt['countDislik'] = $this->dataFeedbacks['dislike'] + 1 + $likeMinus; 
                }
            }
        } else {
            $this->insertLike();
            if ($this->like != 0 ) {
                $this->newResalt['countLike'] = $this->dataFeedbacks['like'] + 1 + $likePlus;
                $this->newResalt['countDislik'] = $this->dataFeedbacks['dislike'] + $likeMinus; 
            } else {
                $this->newResalt['countLike'] = $this->dataFeedbacks['like'] + $likePlus;
                $this->newResalt['countDislik'] = $this->dataFeedbacks['dislike'] + 1 + $likeMinus; 
            }
        }
        return $this->newResalt;
    }
    
    public function getLike() {
        $this->geherationLike();
        return $this->html;
    }
}