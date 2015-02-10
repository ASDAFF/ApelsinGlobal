<?php
class ContactsUI_ElementsBlocks_OnlyWokers {
    
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
    
    public static function ContactsUnitsMainList($mainPageData) {
        $html = '';
        if($mainPageData != null && count($mainPageData) > 0) {
            $html .= "<div id='ContactsUnitsMainList' class='ContactsUnitsMainList'>";
            foreach ($mainPageData as $elementData) {
                $html .= self::ContactsUnitsMainInfoElement($elementData);
            }
            $html .= "</div>";
            $html .= "<div class='clear'></div>";
        }
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
            $html .= ContactsUI_ElementsHelpert::ContactsContactsString($data,'adress');
            $html .= ContactsUI_ElementsHelpert::ContactsContactsString($data,'postAdress');
            $html .= ContactsUI_ElementsHelpert::ContactsEmailString($data['email']);
            $html .= ContactsUI_ElementsHelpert::ContactsPhoneString($data,'1');
            $html .= ContactsUI_ElementsHelpert::ContactsPhoneString($data,'2');
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
    
    public static function ContactsUnitsBlocks($data) {
        $html = '';
        $html .= "<div class='ContactsUnitsBlocks'>";
        $html .= "<div class='ContactsUnitsBlocksMenu' id='ContactsUnitsBlocksMenu_".$data['type']."'>";
        $html .= self::ContactsUnitsBlocksMenu($data);
        $html .= "</div>";
        $html .= "<div class='ContactsUnitsBlocksContent' id='ContactsUnitsBlocksContent_".$data['type']."'>";
        $html .= self::ContactsUnitsBlocksContent($data);
        $html .= "</div>";
        $html .= "</div>";
        return $html;
    }
    
    public static function ContactsUnitsBlocksMenu($data) {
        $html = '';
        $showBlock = 'ShowBlock';
        foreach ($data['units'] as $elementData) {            
            $js2 = "ContactsUnitsTypes_OpenBlock('".$data['type']."','".$elementData['unit']."')";
            $html .= "<div class='ContactsUnitsBlocksMenuItem $showBlock' id='ContactsUnitsBlocksMenuItem_".$data['type']."_".$elementData['unit']."' onclick=\"".$js2."\">";
            $html .= $elementData['name'];
            $html .= "</div>";
            $showBlock = '';
        }
        return $html;
    }
    public static function ContactsUnitsBlocksContent($data) {
        $html = '';
        $display = true;
        foreach ($data['units'] as $elementData) {
            $html .= self::ContactsUnitsBlocksContentElement($elementData,$data['type'],$display);
            $display = false;
        }
        return $html;
    }
    public static function ContactsUnitsBlocksContentElement($data,$type,$display) {
        if($display) {
            $style = "style='display: block;'";
        } else {
            $style = '';
        }
        $html = '';
        $html .= "<div class='ContactsUnitsBlocksContentItem' id='ContactsUnitsBlocksContentItem_".$type."_".$data['unit']."' ".$style.">";
            if($data['text'] != null && $data['text'] != '') {
                $html .= $data['text'];
            }
            if(is_array($data['contactsWorkers']) && count($data['contactsWorkers']) > 0) {
                $html .= "<div class='ContactsUnitsElementWokersBlock ".$data['unit']."'>";
                foreach ($data['contactsWorkers'] as $worker) {
                    $html .= self::getContactsUnitsElementWokersElement($worker);
                }
                $html .= "<div class='clear'></div>";
                $html .= "</div>";
            }
        $html .= "</div>";
        
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
