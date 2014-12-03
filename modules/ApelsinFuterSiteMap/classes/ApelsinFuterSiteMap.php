<?php
/**
 * Description of ApelsinFuterSiteMap
 *
 * @author olga
 */
class ApelsinFuterSiteMap {
    
    private $html;
    private $siteMap;
    private $contact = array();
    private $email = 'mail@apelsin.ru';

    public function __construct() {
        global $SITE_MAP;
        $this->siteMap = $SITE_MAP;
        $this->contact[0]['href'] = '84912240220';
        $this->contact[0]['phone'] = '+7 (4912) 240-220';
        $this->contact[1]['href'] = '84912502020';
        $this->contact[1]['phone'] = '+7 (4912) 502-020';
    }
    
    public function getUI() {
        $this->generationPage();
        return $this->html;
    }
    
    private function generationPage() {
        $this->html = '';
        $this->html .= '<div class="futerSiteMapWrapper" >';
            $this->html .= $this->siteMap->getHtml(6,null,true);
        $this->html .= '</div>';
        $this->html .= $this->getBlockMoreInfo() ;
        $this->html .= '<div class="clear"></div>';
    }
    
    // генерация последнего блока ( контакты, соцсети, кнопка "наверх")
    private function getBlockMoreInfo() {
        $this->html .= '<div class="futerSiteMapMoreInfo" >';
            $this->html .= $this->getDataContacts();
        $this->html .= '</div>';
    }
    
    private function getDataContacts() {
        $html = '';
        $html .= '<div class="SiteMapContacts">';
            for ($i = 0; $i < count($this->contact); $i++) {
                $html .= '<div class="futerPhone">';
                    $html .= '<a href="tel:'.$this->contact[$i]['href'].'">'.$this->contact[$i]['phone'].'</a>';
                $html .= '</div>';
            }
            $html .= '<div class="futerMail">';
            $html .= '<a href="mailto:'.$this->email.'">'.$this->email.'</a>';
            $html .= '</div>';
        $html .= '</div>';
        return $html;
    }
}