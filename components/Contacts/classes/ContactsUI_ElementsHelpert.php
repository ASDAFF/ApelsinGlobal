<?php

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
            $active = 'active';
            if($img) {
                $html .= "<div class='ContactsUnitsElementButtonBlock'>";
                $html .= '<div id="ContactsUnitsElementButton_img_'.$inut.'" class="ContactsUnitsElementButton ContactsUnitsElementButton_img '.$active.'" onclick="switchContactsUnitsMoreInfoElement(\''.$inut.'\',\'img\')"></div>';
                $html .= "Фасад";
                $html .= "</div>";
                $active = '';
            }
            if($map) {
                $html .= "<div class='ContactsUnitsElementButtonBlock'>";
                $html .= '<div id="ContactsUnitsElementButton_map_'.$inut.'" class="ContactsUnitsElementButton ContactsUnitsElementButton_map '.$active.'" onclick="switchContactsUnitsMoreInfoElement(\''.$inut.'\',\'map\')"></div>';
                $html .= "Схема проезда";
                $html .= "</div>";
                $active = '';
            }
            if($text) {
                $html .= "<div class='ContactsUnitsElementButtonBlock'>";
                $html .= '<div id="ContactsUnitsElementButton_text_'.$inut.'" class="ContactsUnitsElementButton ContactsUnitsElementButton_text '.$active.'" onclick="switchContactsUnitsMoreInfoElement(\''.$inut.'\',\'text\')"></div>';
                $html .= "Информация";
                $html .= "</div>";
                $active = '';
            }
            $html .= "<div class='ContactsUnitsElementButtonBlock'>";
            $html .= '<div id="ContactsUnitsElementButton_feedback_'.$inut.'" class="ContactsUnitsElementButton ContactsUnitsElementButton_feedback '.$active.'" onclick="switchContactsUnitsMoreInfoElement(\''.$inut.'\',\'feedback\')"></div>';
            $html .= "Оставить отзыв";
            $html .= "</div>";
            $active = '';
            $html .= "</div>";
        return $html;
    }
}
