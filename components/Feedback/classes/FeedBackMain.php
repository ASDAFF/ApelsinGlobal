<?php
/**
 * Description of FeedBackMain
 *
 * @author olga
 */
class FeedBackMain {
    
    private $html;
    private $SQL_HELPER;
    private $inputHelper;
    private $formAddFeedback;
    private $listFeedback;

    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->inputHelper = new InputHelper();
        $this->listFeedback = new FeedBackList();
        $this->formAddFeedback = new FeedBackAdd();
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
        $this->html .= '<a id="formFeedbackFancybox" class="fancybox-doc" href="#formFeedback">';
            $this->html .= '<input type="button" value="Оставить отзыв">';
        $this->html .= '</a>';
    }

    public function getUI() {
        $this->generationPage();
        return $this->html;
    }
}