<?php

class ContactsUI_ElementsList {
    private static $imagePathU = './resources/Components/Contacts/Units/';
    
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
    
    public static function ContactsUnitsList($data) {
        $html = '';
        $html .= "<div id='ContactsUnitsList_".$data['type']."' class='ContactsUnitsList ".$data['type']."'>";
        if($data['units'] != null && count($data['units']) > 0) {
            foreach ($data['units'] as $elementData) {
                $html .= self::ContactsUnitsElement($elementData);
            }
        }
        if($data['topText'] != null && $data['topText'] != '') {
            $html .= "<div class='ContactsUnitsListTopText ".$data['type']."'>";
            $html .= $data['topText'];
            $html .= "</div>";
        }
        if($data['bottomText'] != null && $data['bottomText'] != '') {
            $html .= "<div class='ContactsUnitsListBottomText ".$data['type']."'>";
            $html .= $data['bottomText'];
            $html .= "</div>";
        }
        $html .= "</div>";
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
            $html .= ContactsUI_ElementsHelpert::ContactsContactsString($data,'adress');
            $html .= ContactsUI_ElementsHelpert::ContactsContactsString($data,'postAdress');
            $html .= ContactsUI_ElementsHelpert::ContactsEmailString($data['email']);
            $html .= ContactsUI_ElementsHelpert::ContactsPhoneString($data,'1');
            $html .= ContactsUI_ElementsHelpert::ContactsPhoneString($data,'2');
            $imgText = self::GetUnitsIMG($data['unit']);
            $img = $imgText != null && $imgText != '';
            $map = $data['mapShow'] > 0 && $data['sid'] != null && $data['sid'] != '';
            $text = $data['text'] != null && $data['text'] != '';
            $html .= ContactsUI_ElementsHelpert::switchContactsUnitsMoreInfoElementPanel($data['unit'],$img,$map,$text);
            $html .= "</div>";
            $html .= "<div class='ContactsUnitsElementTable'>";
            $html .= $data['timeTableHTML'];
            $html .= "</div>";
        $html .= "</div>";
        $html .= "<div class='ContactsUnitsElementMoreInfo'>";
            $html .= "<div id='ContactsUnitsElementIMG_".$data['unit']."' class='ContactsUnitsElementIMG ".$data['unit']."' ".$imgText."></div>";
            if($data['mapShow'] > 0 && $data['sid'] != null && $data['sid'] != '') {
                $html .= "<div id='ContactsUnitsElementMap_".$data['unit']."' class='ContactsUnitsElementMap ".$data['unit']."'>";
                $html .= ContactsUI_ElementsHelpert::ContactsMap($data['sid'],$data['width'],$data['height']);
                $html .= "</div>";
            }
            $html .= "<div id='ContactsUnitsElementFeedback_".$data['unit']."' class='ContactsUnitsElementFeedback ".$data['unit']."'>";
            $html .= ContactsUI_ElementsHelpert::ContactsFeedback($data['unit']);
            $html .= "</div>";
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
            $html .= ContactsUI_ElementsHelpert::ContactsEmailString($worker['email1']);
            $html .= ContactsUI_ElementsHelpert::ContactsEmailString($worker['email2']);
            $html .= ContactsUI_ElementsHelpert::ContactsPhoneString($worker,'1');
            $html .= ContactsUI_ElementsHelpert::ContactsPhoneString($worker,'2');
            $html .= "</div>";
        $html .= "</div>";
        return $html;
    }
}
