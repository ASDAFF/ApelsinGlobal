<?php

class ContactsUI {
    private $contactsData;
    private $mainPageData;
    private $HTML;
    
    public function __construct($contactsData) {
        $this->contactsData = $contactsData['all'];
        $this->mainPageData = $contactsData['mainPage'];
        $this->HTML = '';
//        $this->HTML .= ContactsUI_ElementsBlocks::ContactsUnitsMainList($this->mainPageData);
        $this->HTML .= ContactsUI_Tabs::ContactsTabsUI($this->contactsData,$this->mainPageData);
//        $this->HTML .= ContactsUI_ElementsList::ContactsAllUnitsList($this->contactsData);
    }
    
    public function getHTML() {
        return $this->HTML;
    }
    
    public function getJS() {
        $html = '';
        $html .= "<script type='text/javascript'>";
        $html .= "$(document).ready(function() {";
        $html .= "ContactsUnitsTypes_OpenTab('".$this->contactsData[0]['type']."');";
        $html .= "});";
        $html .= "</script>";
        return $html;
    }
}

class ContactsUI_Tabs {
    
    public static function ContactsTabsUI($data,$mainPageData) {
        $html = '';
        if($data != null && count($data) > 0) {
            $html .= "<div id='ContactsTabsHead' class='ContactsTabsHead'>";
            $html .= self::ContactsTabsHead($data);
            $html .= "</div>";
            $html .= "<div id='ContactsTabsContent' class='ContactsTabsContent'>";
            $html .= self::ContactsTabsContent($data,$mainPageData);
            $html .= "</div>";
        }
        return $html;
    }
    
    public static function ContactsTabsHead($data) {
        $html = '';
        foreach ($data as $elementData) {
            $js = "ContactsUnitsTypes_OpenTab('".$elementData['type']."')";
            $html .= "<div class='ContactsTabsHeadElement'  id='ContactsTabHead_".$elementData['type']."' onclick=\"".$js."\">";
            $html .= $elementData['typeName'];
            $html .= "</div>";
        }
        return $html;
    }
    public static function ContactsTabsContent($data,$mainPageData) {
        $html = '';
        foreach ($data as $elementData) {
            $html .= "<div class='ContactsTabsContentElement' id='ContactsTabContent_".$elementData['type']."' >";
            if($elementData['type'] == 'shop') {
                $html .= ContactsUI_ElementsBlocks::ContactsUnitsBlocks($elementData,$mainPageData);
            } else {
                $html .= ContactsUI_ElementsList::ContactsUnitsList($elementData);
            }
            $html .= "</div>";
        }
        return $html;
    }
}

class ContactsUI_ElementsBlocks {
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
    
    public static function ContactsUnitsBlocks($data,$mainPageData) {
        $html = '';
        $html .= "<div class='ContactsUnitsBlocks'>";
        $html .= "<div class='ContactsUnitsBlocksMenu' id='ContactsUnitsBlocksMenu_".$data['type']."'>";
        $html .= self::ContactsUnitsBlocksMenu($data);
        $html .= "</div>";
        $html .= "<div class='ContactsUnitsBlocksContent' id='ContactsUnitsBlocksContent_".$data['type']."'>";
        $html .= self::ContactsUnitsBlocksContent($data,$mainPageData);
        $html .= "</div>";
        $html .= "</div>";
        return $html;
    }
    
    public static function ContactsUnitsBlocksMenu($data) {
        $html = '';
        $js1 = "ContactsUnitsTypes_ShowMain('".$data['type']."')";
        $html .= "<div class='ContactsUnitsBlocksMenuItem ShowMainBlock ShowBlock' id='ContactsUnitsBlocksMenuItem_".$data['type']."_ShowMainBlock' onclick=\"".$js1."\">";
        $html .= 'Наши контакты';
        $html .= "</div>";
        foreach ($data['units'] as $elementData) {            
            $js2 = "ContactsUnitsTypes_OpenBlock('".$data['type']."','".$elementData['unit']."')";
            $html .= "<div class='ContactsUnitsBlocksMenuItem' id='ContactsUnitsBlocksMenuItem_".$data['type']."_".$elementData['unit']."' onclick=\"".$js2."\">";
            $html .= $elementData['name'];
            $html .= "</div>";
        }
        return $html;
    }
    public static function ContactsUnitsBlocksContent($data,$mainPageData) {
        $html = '';
        $html .= self::ContactsUnitsMainList($mainPageData);
        foreach ($data['units'] as $elementData) {
            $html .= self::ContactsUnitsBlocksContentElement($elementData,$data['type']);
        }
        return $html;
    }
    public static function ContactsUnitsBlocksContentElement($data,$type) {
        $imgText = self::GetUnitsIMG($data['unit']);
        $img = $imgText != null && $imgText != '';
        $map = $data['mapShow'] > 0 && $data['sid'] != null && $data['sid'] != '';
        $text = $data['text'] != null && $data['text'] != '';
        $html = '';
        $html .= "<div class='ContactsUnitsBlocksContentItem' id='ContactsUnitsBlocksContentItem_".$type."_".$data['unit']."'>";
            $html .= "<div class='ContactsUnitsBlocksContentItemLeft'>";
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
            $html .= "<div class='ContactsUnitsBlocksContentItemRight'>";
                $html .= "<div class='ContactsUnitsBlocksContentItemInfo'>";
//                    $html .= $data['name'];
                    $html .= ContactsUI_ElementsHelpert::ContactsContactsString($data,'adress');
                    $html .= ContactsUI_ElementsHelpert::ContactsContactsString($data,'postAdress');
                    $html .= ContactsUI_ElementsHelpert::ContactsEmailString($data['email']);
                    $html .= ContactsUI_ElementsHelpert::ContactsPhoneString($data,'1');
                    $html .= ContactsUI_ElementsHelpert::ContactsPhoneString($data,'2');
                $html .= "</div>";
                $html .= "<div class='ContactsUnitsElementTable'>";
                $html .= $data['timeTableHTML'];
                $html .= "</div>";
                $html .= ContactsUI_ElementsHelpert::switchContactsUnitsMoreInfoElementPanel($data['unit'],$img,$map,$text);
            $html .= "</div>";
            $html .= "<div class='clear'></div>";
        $html .= "</div>";
        return $html;
    }
}


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


class ContactsUI_ElementsHelpert {
    /*~~~~~~~~ Вспомогательное ~~~~~~~~*/
    public static function ContactsContactsString($data,$key) {
        $html = '';
        if($data[$key] != null && $data[$key] != '') {
            $html .= "<div class='ContactsElement ".$key."'>";
            $html .= $data[$key];
            $html .= "</div>";
        }
        return $html;
    }
    
    public static function ContactsEmailString($email) {
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
    
    public static function ContactsPhoneString($data,$phoneNumber) {
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
    
    public static function ContactsMap($sid,$width,$height) {
        return '<script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid='.$sid.'&width='.$width.'&height='.$height.'"></script>';
    }
    
    public static function ContactsFeedback($unit) {
//        return 'Извините, данный функционал на стадии разработки';
        $out = '';
        $out .= '<form class="reviewsContactsFeedback" name="shop_reviews'.$unit.'" action="javascript:void(0);" onsubmit="ajaxContactsUnitFeedback(\''.$unit.'\')" 
            id="ajaxContactsUnitFeedback'.$unit.'"  method="post" accept-charset="UTF-8" autocomplete="on" >';
        $out .= '<input type="hidden" name="shop" value="'.$unit.'" id="shop" />';
        $out .= '<table class="reviews_tableContactsFeedback">';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_labelContactsFeedback">';
            $out .= '* ФИО: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_inputContactsFeedback">';
            $out .= '<input type="text" name="fio" value="" id="fio" maxlength="100" required placeholder="Ваше имя"/>';
            $out .= '</td>';
            $out .= '</td>';
            $out .= '<td class="reviews_table_inputContactsFeedback text" rowspan="4">';
            $out .= '<textarea  name="comments" value="" id="comments" class="textareaContactsFeedback" required placeholder="Сообщение.."  ></textarea>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_labelContactsFeedback">';
            $out .= '* E-mail: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_inputContactsFeedback">';
            $out .= '<input type="text" name="mail" value="" id="mail" maxlength="100" required placeholder="Ваш e-mail" />';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_labelContactsFeedback">';
            $out .= '* Оценка: ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_inputContactsFeedback">';
            $out .= '<select class="reviews_table_select selectBox" name="rating" id="rating">';
            $out .= '<option selected value="5">5</option>';
            $out .= '<option value="4">4</option>';
            $out .= '<option value="3">3</option>';
            $out .= '<option value="2">2</option>';
            $out .= '<option value="1">1</option>';
            $out .= '</select>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '<tr>';
            $out .= '<td class="reviews_table_labelContactsFeedback">';
            $out .= '<td>';
            $out .= '<input class="apelsin_buttonContactsFeedback" type="submit" name ="submit'.$unit.'" value="Оставить отзыв"/>';
            $out .= '</td>';
        $out .= '</tr>';
        $out .= '</table>';
        $out .= '</form>';
        $out .= '<div class="inf infContactsFeedback">';
        $out .= 'Символом * отмечены обязательные для заполнения поля.';
        $out .= '</div>';
        $out .= '<div id="resultsContactsFeedback'.$unit.'" class="resultsContactsFeedback">';
        $out .= '</div>';
        return $out;
    }
    
    public static function switchContactsUnitsMoreInfoElementPanel($inut,$img,$map,$text) {
        $html = '';
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
        return $html;
    }
}