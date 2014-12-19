<?php

class ContactsUI {
    private $contactsData;
    private $mainPageData;
    private $HTML;
    
    public function __construct($contactsData) {
        $this->contactsData = $contactsData['all'];
        $this->mainPageData = $contactsData['mainPage'];
        $this->HTML = '';
        $this->HTML .= ContactsUI_Elements::ContactsUnitsMainList($this->mainPageData);
        $this->HTML .= ContactsUI_Elements::ContactsUnitsTypesList($this->contactsData);
        $this->HTML .= ContactsUI_Elements::ContactsAllUnitsList($this->contactsData);
    }
    
    public function getHTML() {
        return $this->HTML;
    }
    
    public function getJS() {
        $html = '';
        $html .= "<script type='text/javascript'>";
        $html .= "$(document).ready(function() {";
        $html .= "ContactsUnitsTypesListSwitchElement('".$this->contactsData[0]['type']."','".$this->contactsData[0]['typeName']."');";
        $html .= "});";
        $html .= "</script>";
        return $html;
    }
}

class ContactsUI_Elements {
    private static $imagePathU = './resources/Components/Contacts/Units/';
    private static $imagePathUT = './resources/Components/Contacts/UnitsTypes/';
    
    public static function GetUnitsIMG($unit) {
        $IMG_URL = self::$imagePathU.$unit.".png";
        if(!file_exists($IMG_URL)) {
            $IMG_URL = self::$imagePathU.$unit.".jpg";
            if(!file_exists($IMG_URL)) {
                $IMG_URL = null;
            }
        }
        if($IMG_URL!=null) {
            $style = "style='background: url(".$IMG_URL.") no-repeat;'";
        } else {
            $style = '';
        }
        return $style;
    }
    
    public static function GetUnitsTypeIMG($unitType) {
        $IMG_URL = self::$imagePathUT.$unitType.".png";
        if(!file_exists($IMG_URL)) {
            $IMG_URL = self::$imagePathUT.$unitType.".jpg";
            if(!file_exists($IMG_URL)) {
                $IMG_URL = null;
            }
        }
        if($IMG_URL!=null) {
            $style = "style='background: url(".$IMG_URL.") no-repeat;'";
        } else {
            $style = '';
        }
        return $style;
    }


    /*~~~~~~~~ Списки ~~~~~~~~*/
    public static function ContactsUnitsMainList($mainPageData) {
        $html = '';
        if($mainPageData != null && count($mainPageData) > 0) {
            $html .= "<div id='ContactsUnitsMainList' class='ContactsUnitsMainList'>";
            foreach ($mainPageData as $elementData) {
                $html .= self::ContactsUnitsMainInfoElement($elementData);
            }
            $html .= "</div>";
        }
        return $html;
    }
    
    public static function ContactsUnitsTypesList($data) {
        $ContactsUnitsTypesListShowText = 'другие контакты';
//        $ContactsUnitsTypesListShowText = '';
        $html = '';
        if($data != null && count($data) > 0) {
//            $html .= "<script type='text/javascript'>";
//            $html .= "$(document).ready(function() {";
//            $html .= "ContactsUnitsTypesListSwitchElement('".$data[0]['type']."','".$data[0]['typeName']."');";
//            $html .= "});";
//            $html .= "</script>";
            $html .= "<div id='ContactsUnitsTypesListSwitcher' class='ContactsUnitsTypesListSwitcher'>";
                $html .= "<div id='ContactsUnitsTypesListSwitcherElementTitle' class='ContactsUnitsTypesListSwitcherElementTitle'></div>";
                $html .= "<div id='ContactsUnitsTypesListSwitcherButton' class='ContactsUnitsTypesListSwitcherButton' onclick='ContactsUnitsTypesListShow()'>".$ContactsUnitsTypesListShowText."</div>";
                $html .= "<div class='clear'></div>";
                $html .= "<div id='ContactsUnitsTypesList' class='ContactsUnitsTypesList'>";
                    $html .= "<div id='ContactsUnitsTypesListBlock' class='ContactsUnitsTypesListBlock'>";
                        foreach ($data as $elementData) {
                            $html .= self::contactsUnitsTypesElementForList($elementData);
                        }
                    $html .= "</div>";
                $html .= "</div>";
            $html .= "</div>";
        }
        return $html;
    }
    
    private static function ContactsUnitsList($data) {
//        if($data['units'] == null || count($data['units']) == 0) {
//            return '';
//        }
        $html = '';
        $html .= "<div id='ContactsUnitsList_".$data['type']."' class='ContactsUnitsList ".$data['type']."'>";
        if($data['topText'] != null && $data['topText'] != '') {
            $html .= "<div class='ContactsUnitsListTopText ".$data['type']."'>";
            $html .= $data['topText'];
            $html .= "</div>";
        }
        if($data['units'] != null && count($data['units']) > 0) {
            foreach ($data['units'] as $elementData) {
                $html .= self::ContactsUnitsElement($elementData);
            }
        }
        if($data['bottomText'] != null && $data['bottomText'] != '') {
            $html .= "<div class='ContactsUnitsListBottomText ".$data['type']."'>";
            $html .= $data['bottomText'];
            $html .= "</div>";
        }
        $html .= "</div>";
        return $html;
    }
    
    public static function ContactsAllUnitsList($data) {
        $html = '';
        if($data != null && count($data) > 0) {
            $html .= "<div id='ContactsAllUnitsList' class='ContactsAllUnitsList'>";
            foreach ($data as $elementData) {
                $html .= self::ContactsUnitsList($elementData);
            }
            $html .= "</div>";
        }
        return $html;
    }
    
    /*~~~~~~~~ Информация по элементу ~~~~~~~~*/
    public static function ContactsUnitsElement($data) {
        $html = '';
        $html .= "<div class='ContactsUnitsElement ".$data['unit']."'>";
        $html .= "<div class='ContactsUnitsElementInfo'>";
            $html .= "<div class='ContactsUnitsElementTitle'>";
            $html .= $data['name'];
            $html .= "</div>";
            $html .= "<div class='ContactsUnitsElementContacts'>";
            $html .= self::ContactsContactsString($data,'adress');
            $html .= self::ContactsContactsString($data,'postAdress');
            $html .= self::ContactsEmailString($data['email']);
            $html .= self::ContactsPhoneString($data,'1');
            $html .= self::ContactsPhoneString($data,'2');
            $imgText = self::GetUnitsIMG($data['unit']);
            $img = $imgText != null && $imgText != '';
            $map = $data['mapShow'] > 0 && $data['sid'] != null && $data['sid'] != '';
            $text = $data['text'] != null && $data['text'] != '';
            $html .= self::switchContactsUnitsMoreInfoElementPanel($data['unit'],$img,$map,$text);
            $html .= "</div>";
            $html .= "<div class='ContactsUnitsElementTable'>";
            $html .= $data['timeTableHTML'];
            $html .= "</div>";
        $html .= "</div>";
        $html .= "<div class='ContactsUnitsElementMoreInfo'>";
            $html .= "<div id='ContactsUnitsElementIMG_".$data['unit']."' class='ContactsUnitsElementIMG ".$data['unit']."' ".$imgText."></div>";
            if($data['mapShow'] > 0 && $data['sid'] != null && $data['sid'] != '') {
                $html .= "<div id='ContactsUnitsElementMap_".$data['unit']."' class='ContactsUnitsElementMap ".$data['unit']."'>";
                $html .= self::ContactsMap($data['sid'],$data['width'],$data['height']);
                $html .= "</div>";
            }
//            if($data['mapShow'] > 0 && $data['sid'] != null && $data['sid'] != '') {
            $html .= "<div id='ContactsUnitsElementFeedback_".$data['unit']."' class='ContactsUnitsElementFeedback ".$data['unit']."'>";
            $html .= self::ContactsFeedback($data['sid'],$data['width'],$data['height']);
            $html .= "</div>";
//            }
            if($data['text'] != null && $data['text'] != '') {
                $html .= "<div id='ContactsUnitsElementText_".$data['unit']."' class='ContactsUnitsElementText'>";
                $html .= $data['text'];
                $html .= "</div>";
            }
        $html .= "</div>";
        $html .= "</div>";
        if(is_array($data['contactsWorkers']) && count($data['contactsWorkers']) > 0) {
            $html .= "<div class='ContactsUnitsElementWokersBlock ".$data['unit']."'>";
            foreach ($data['contactsWorkers'] as $worker) {
                $html .= self::getContactsUnitsElementWokersElement($worker);
            }
            $html .= "<div class='clear'></div>";
            $html .= "</div>";
        }
        return $html;
    }
    
    private static function getContactsUnitsElementWokersElement($worker) {
        $html = '';
        $html .= "<div class='ContactsUnitsElementWokersElement'>";
            $html .= "<div class='ContactsUnitsElementWokersElementFIO'>";
            $html .= $worker['fio'];
            $html .= "</div>";
            $html .= "<div class='ContactsUnitsElementWokersElementPost'>";
            $html .= $worker['post'];
            $html .= "</div>";
            $html .= "<div class='ContactsUnitsElementWokersElementInfo'>";
            $html .= $worker['info'];
            $html .= "</div>";
            $html .= "<div class='ContactsUnitsElementWokersElementContacts'>";
            $html .= self::ContactsEmailString($worker['email1']);
            $html .= self::ContactsEmailString($worker['email2']);
            $html .= self::ContactsPhoneString($worker,'1');
            $html .= self::ContactsPhoneString($worker,'2');
            $html .= "</div>";
        $html .= "</div>";
        return $html;
    }
    
    public static function switchContactsUnitsMoreInfoElementPanel($inut,$img,$map,$text) {
        $html = '';
//        if(!(!$img && !$map && !$text) && !(!$img && !$map && $text) && !(!$img && $map && !$text) && !($img && !$map && !$text)) {
            $html .= "<div class='ContactsUnitsElementShowHide'>";
            if($img) {
                $html .= '<div class="ContactsUnitsElementButton ContactsUnitsElementButton_img" onclick="switchContactsUnitsMoreInfoElement(\''.$inut.'\',\'img\')"></div>';
            }
            if($map) {
                $html .= '<div class="ContactsUnitsElementButton ContactsUnitsElementButton_map" onclick="switchContactsUnitsMoreInfoElement(\''.$inut.'\',\'map\')"></div>';
            }
            if($text) {
                $html .= '<div class="ContactsUnitsElementButton ContactsUnitsElementButton_text" onclick="switchContactsUnitsMoreInfoElement(\''.$inut.'\',\'text\')"></div>';
            }
            $html .= '<div class="ContactsUnitsElementButton ContactsUnitsElementButton_feedback" onclick="switchContactsUnitsMoreInfoElement(\''.$inut.'\',\'feedback\')"></div>';
            $html .= "</div>";
//        }
        return $html;
    }
    
    /*~~~~~~~~ Информация на главной ~~~~~~~~*/
    public static function ContactsUnitsMainInfoElement($data) {
        $html = '';
        $html .= "<div class='ContactsUnitsMainInfoElement ".$data['unit']."'>";
        $html .= "<div class='ContactsUnitsTypesElementInfo'>";
            $html .= "<div class='ContactsUnitsMainInfoElementTitle'>";
            $html .= $data['name'];
            $html .= "</div>";
            $html .= "<div class='ContactsUnitsTypesElementContacts'>";
            $html .= self::ContactsContactsString($data,'adress');
            $html .= self::ContactsContactsString($data,'postAdress');
            $html .= self::ContactsEmailString($data['email']);
            $html .= self::ContactsPhoneString($data,'1');
            $html .= self::ContactsPhoneString($data,'2');
            $html .= "</div>";
            $html .= "<div class='ContactsUnitsTypesElementtimeTable'>";
            $html .= $data['timeTableHTML'];
            $html .= "</div>";
        $html .= "</div>";
        if($data['text'] != null && $data['text'] != '') {
            $html .= "<div class='ContactsUnitsMainInfoElementText'>";
            $html .= $data['text'];
            $html .= "</div>";
        }
        $html .= "<div class='clear'></div>";
        $html .= "</div>";
        return $html;
    }
    
    /*~~~~~~~~ Типы ~~~~~~~~*/
    public static function contactsUnitsTypesElementForList($data) {
        $js = "ContactsUnitsTypesListSwitchElement('".$data['type']."','".$data['typeName']."')";
        $html = '';
        $html .= "<div class='ContactsUnitsTypesElement ".$data['type']." ".self::GetUnitsTypeIMG($data['type'])."' onclick=\"".$js."\">";
        $html .= "<div class='ContactsUnitsTypesElementTitle'>";
        $html .= $data['typeName'];
        $html .= "</div>";
        $html .= "</div>";
        return $html;
    }
    
    
    /*~~~~~~~~ Вспомогательное ~~~~~~~~*/
    private static function ContactsContactsString($data,$key) {
        $html = '';
        if($data[$key] != null && $data[$key] != '') {
            $html .= "<div class='ContactsElement ".$key."'>";
            $html .= $data[$key];
            $html .= "</div>";
        }
        return $html;
    }
    
    private static function ContactsEmailString($email) {
        $html = '';
        if($email != null && $email != '') {
            $html .= "<div class='ContactsElement email'>";
            $html .= "<a href='mailto:".$email."'>";
            $html .= $email;
            $html .= "</a>";
            $html .= "</div>";
        }
        return $html;
    }
    
    private static function ContactsPhoneString($data,$phoneNumber) {
        $html = '';
        if($data['phone'.$phoneNumber] != null && $data['phone'.$phoneNumber] != '' && 
                $data['phoneText'.$phoneNumber] != null && $data['phoneText'.$phoneNumber] != '') {
            $html .= "<div class='ContactsElement phoneText'>";
            $html .= "<a href='tel:".$data['phone'.$phoneNumber]."'>";
            $html .= $data['phoneText'.$phoneNumber];
            $html .= "</a>";
            $html .= "</div>";
        }
        return $html;
    }
    
    private static function ContactsMap($sid,$width,$height) {
        return '<script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid='.$sid.'&width='.$width.'&height='.$height.'"></script>';
    }
    
    private static function ContactsFeedback() {
        return 'Извините, данный функционал на стадии разработки';
    }
}
