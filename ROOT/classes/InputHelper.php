<?php
class InputHelper {

    public static function checkbox($name,$id,$class,$mandatory,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<input type="checkbox" class="'.$class.'" name="'.$name.'" value="'.
                $value.'" id="'.$id.'" '.
                $required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }

    public static function passwordBox($name,$id,$class,$maxlength,$mandatory,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<input type="password" class="'.$class.'" name="'.$name.'" value="'.
                $value.'" id="'.$id.'" maxlength="'.$maxlength.'" '.
                $required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }

    public static function paternPasswordBox($name,$id,$class,$maxlength,$mandatory,$placeholder,$pattern,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<input type="password" class="'.$class.'" name="'.$name.'" value="'.$value.'" id="'.
                $id.'" maxlength="'.$maxlength.'"  placeholder="'.
                $placeholder.'" title="'.$placeholder.'"  pattern="'.
                $pattern.'" '.$required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }
    
    /**
     * 
     * @param type $name
     * @param type $id 
     * @param type $class
     * @param type $maxlength
     * @param type $mandatory - true если поле обязательное
     * @param type $value
     * @return string
     */
    public static function textBox($name,$id,$class,$maxlength,$mandatory,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<input type="text" class="'.$class.'" name="'.$name.'" value="'.
                $value.'" id="'.$id.'" maxlength="'.$maxlength.'" '.
                $required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }
    
    /**
     * 
     * @param type $name
     * @param type $id
     * @param type $maxlength
     * @param type $mandatory - true если поле обязательное
     * @param type $placeholder - пример
     * @param type $pattern - регулярное выражение
     * @param type $value
     * @return string
     */
    public static function paternTextBox($name,$id,$class,$maxlength,$mandatory,$placeholder,$pattern,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<input type="text" class="'.$class.'" name="'.$name.'" value="'.$value.'" id="'.
                $id.'" maxlength="'.$maxlength.'"  placeholder="'.
                $placeholder.'" title="'.$placeholder.'"  pattern="'.
                $pattern.'" '.$required.' '.$JSevents.' autocomplete="off" />';
        return $out;
    }
    
    /**
     * 
     * @param type $name
     * @param type $id
     * @param type $maxlength
     * @param type $mandatory - true если поле обязательное
     * @param type $value
     * @return string
     */
    public static function textarea($name,$id,$class,$maxlength,$mandatory,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<textarea  class="'.$class.'" name="'.$name.'" value="" id="'.$id.'" maxlength="'.
                $maxlength.'" '.$required.' '.$JSevents.' autocomplete="off" >'.$value.
                '</textarea>';
        return $out;
    }
    
    /**
     * 
     * @param type $name
     * @param type $id
     * @param type $array
     * @param type $mandatory
     * @param type $value
     * @return string
     */
    public static function select($name,$id,$array,$mandatory,$value,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = '<select class="selectBox" name="'.$name.'" value="" id="'.$id.'" '.$required.' '.$JSevents.' >';
//        $out .= '<option></option>';
        foreach ($array as $val) {
            if($value == $val['value']) {
                $selected = "selected";
            } else {
                $selected = "";
            }
            $out .= '<option class="selectBox" value="'.$val['value'].'" '.$selected.'>'.$val['text'].'</option>';
        }
        $out .= '</select>';
        return $out;
    }
    
    public static function createFormRow($input,$mandatory,$text,$info=null) {
        $mandatoryText = "";
        if($mandatory) {
            $mandatoryText = '* ';
        }
        $out =  '<tr>';
        $out .=  '<td class="FormTable_Text">';
        $out .=  '<div class="text">'.$mandatoryText.$text.'</div>';
        if($info != null && $info != "") {
            $out .=  '<div class="info">'.$info.'</div>';
        }
        $out .=  '</td>';
        $out .=  '<td class="FormTable_Input">'.$input.'</td>';
        $out .=  '</tr>';
        return $out;
    }
    
    public static function createFormRow_RowText($text) {
        return '<tr><td class="FormTable_RowText" colspan="2">'.$text.'</td></tr>';;
    }
    
    public static function getLengSelect($name,$id,$mandatory,$value=null,$JSevents=null) {
        global $_SQL_HELPER;
        $array = array();
        $query = "SELECT * FROM  `Lang`;";
        $result = $_SQL_HELPER->select($query);
        $i=0;
        foreach ($result as $lang) {
            $array[$i]['value'] = $lang['lang'];
            $array[$i++]['text'] = $lang['langName'];
            if(($value==null || $value=="") && $lang['default']=='1') {
                $value = $lang['lang'];
            }
        }
        return self::select($name,$id,$array,$mandatory,$value,$JSevents=null);
    }
    
    public static function getChekBoxGroup($name,$id,$array,$mandatory,$value=null,$allCheck=false,$JSevents=null) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        if($JSevents==null) {
            $JSevents="";
        }
        $out = "";
        $out .= '<div class="checkboxGroup">';
        foreach ($array as $key => $element) {
            if($allCheck || ($value!=null && in_array($element['value'],$value))) {
                $checked = 'checked';
            } else {
                $checked = '';
            }
            $out .= '<label class="checkboxElement"><input type="checkbox" name="'.$name.'[]" value="'.
                $element['value'].'" id="'.$id.'" '.
                $required.' '.$checked.' '.$JSevents.' autocomplete="off" />'.$element['text'].'</label>';
        }
        $out .= '</div>';
        return $out;
    }
}
?>
