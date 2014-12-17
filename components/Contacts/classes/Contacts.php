<?php

class Contacts {
    private $SQL_HELPER;
    private $thisLang;
    private $UI;
    
    private $contactsData;
    
    public function __construct() {
        global $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->getContactsData();
    }
    
    private function getContactsData() {
        $this->contactsData = array();
        $this->contactsData['all'] = array();
        $this->contactsData['mainPage'] = array();
        $this->getContactsUnitsTypesData();
        $this->getContactsUnitsMainData();
        $this->UI = new ContactsUI($this->contactsData);
    }
    
    /**
     * Получаем список типов
     */
    private function getContactsUnitsTypesData() {
        $query = "SELECT `type` FROM `ContactsUnitsTypes` WHERE `show` = '1' order by `sequence` asc;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $this->contactsData['all'][$key]['type'] = $value['type'];
            $typeText = $this->getContactsUnitsTypesData_Lang($value['type']);
            $this->contactsData['all'][$key]['typeName'] = $typeText['typeName'];
            $this->contactsData['all'][$key]['topText'] = $typeText['topText'];
            $this->contactsData['all'][$key]['bottomText'] = $typeText['bottomText'];
            $this->contactsData['all'][$key]['units'] = $this->getContactsUnitsData($value['type']);
        }
    }
    
    /**
     * Получаем локализацию типа
     * @param type $type - тип
     * @return array - локализация
     */
    private function getContactsUnitsTypesData_Lang($type) {
        $text = array();
        $langHelper = new LangHelper("ContactsUnitsTypes_Lang", "lang", "type", $type, $this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
            $text['typeName'] = $langHelper->getLangValue("typeName");
            $text['topText'] = $langHelper->getLangValue("topText");
            $text['bottomText'] = $langHelper->getLangValue("bottomText");
        } else {
            $text['typeName'] = "";
            $text['topText'] = "";
            $text['bottomText'] = "";
        }
        return $text;
    }
    
    /**
     * Получаем список элементов конкретного типа
     * @param type $type
     */
    private function getContactsUnitsData($type) {
        $query = "SELECT 
            CU.`unit`, CU.`email`, CU.`feedbackEmail`, 
            CU.`phoneText1`, CU.`phone1`, CU.`additional1`, 
            CU.`phoneText2`, CU.`phone2`, CU.`additional2`, 
            CU.`monH_s`, CU.`monM_s`, CU.`monH_e`, CU.`monM_e`, 
            CU.`tueH_s`, CU.`tueM_s`, CU.`tueH_e`, CU.`tueM_e`, 
            CU.`wedH_s`, CU.`wedM_s`, CU.`wedH_e`, CU.`wedM_e`, 
            CU.`thuH_s`, CU.`thuM_s`, CU.`thuH_e`, CU.`thuM_e`, 
            CU.`friH_s`, CU.`friM_s`, CU.`friH_e`, CU.`friM_e`, 
            CU.`satH_s`, CU.`satM_s`, CU.`satH_e`, CU.`satM_e`, 
            CU.`sunH_s`, CU.`sunM_s`, CU.`sunH_e`, CU.`sunM_e`, 
            Ma.`sid`, CU.`mapShow`, Ma.`width`, Ma.`height`
            FROM (
                SELECT 
                CU.`unit`, CU.`email`, CU.`feedbackEmail`, 
                CU.`phoneText1`, CU.`phone1`, CU.`additional1`, 
                CU.`phoneText2`, CU.`phone2`, CU.`additional2`, 
                CU.`monH_s`, CU.`monM_s`, CU.`monH_e`, CU.`monM_e`, 
                CU.`tueH_s`, CU.`tueM_s`, CU.`tueH_e`, CU.`tueM_e`, 
                CU.`wedH_s`, CU.`wedM_s`, CU.`wedH_e`, CU.`wedM_e`, 
                CU.`thuH_s`, CU.`thuM_s`, CU.`thuH_e`, CU.`thuM_e`, 
                CU.`friH_s`, CU.`friM_s`, CU.`friH_e`, CU.`friM_e`, 
                CU.`satH_s`, CU.`satM_s`, CU.`satH_e`, CU.`satM_e`, 
                CU.`sunH_s`, CU.`sunM_s`, CU.`sunH_e`, CU.`sunM_e`, 
                CUM.`map`, CUM.`show` as mapShow
                FROM `ContactsUnits` as CU
                left join `ContactsUnitsMaps` as CUM
                on CU.`unit` = CUM.`unit`
                WHERE CU.`show` = '1' AND CU.`type` = '".$type."'
                order by `sequence` asc
            ) as CU left join `Maps` as Ma
            on CU.`map` = Ma.`alias`;";
        $rezult = $this->SQL_HELPER->select($query);
        $units = array();
        foreach ($rezult as $key => $value) {
            $unitText = $this->getContactsUnitsData_Lang($value['unit']);
            $units[$key]['unit'] = $value['unit'];
            $units[$key]['name'] = $unitText['name'];
            $units[$key]['adress'] = $unitText['adress'];
            $units[$key]['postAdress'] = $unitText['postAdress'];
            $units[$key]['text'] = $unitText['text'];
            $units[$key]['email'] = $value['email'];
            $units[$key]['feedbackEmail'] = $value['feedbackEmail'];
            if($value['additional1'] == null || $value['additional1'] == '') {
                $units[$key]['phoneText1'] = $value['phoneText1'];
                $units[$key]['phone1'] = $value['phone1'];
            } else {
                $units[$key]['phoneText1'] = $value['phoneText1']." доб. ".$value['additional1'];
                $units[$key]['phone1'] = $value['phone1'].'#'.$value['additional1'];
            }
            if($value['additional2'] == null || $value['additional2'] == '') {
                $units[$key]['phoneText2'] = $value['phoneText2'];
                $units[$key]['phone2'] = $value['phone2'];
            } else {
                $units[$key]['phoneText2'] = $value['phoneText2']." доб. ".$value['additional2'];
                $units[$key]['phone2'] = $value['phone2'].'#'.$value['additional2'];
            }
            $units[$key]['timeTable'] = $this->timeTableData($value);
            $contactsTimeTableUI = new ContactsTimeTableUI($units[$key]['timeTable']);
            $units[$key]['timeTableHTML'] = $contactsTimeTableUI->getTimeTableHTML();
            $units[$key]['sid'] = $value['sid'];
            $units[$key]['mapShow'] = $value['mapShow'];
            $units[$key]['width'] = $value['width'];
            $units[$key]['height'] = $value['height'];
        }
        return $units;
    }
    /**
     * получение данных для основной страницы
     */
    private function getContactsUnitsMainData() {
        $query = "SELECT 
            CU.`unit`,
            CU.`type`, CU.`email`, CU.`feedbackEmail`, 
            CU.`phoneText1`, CU.`phone1`, CU.`additional1`, 
            CU.`phoneText2`, CU.`phone2`, CU.`additional2`, 
            CU.`monH_s`, CU.`monM_s`, CU.`monH_e`, CU.`monM_e`, 
            CU.`tueH_s`, CU.`tueM_s`, CU.`tueH_e`, CU.`tueM_e`, 
            CU.`wedH_s`, CU.`wedM_s`, CU.`wedH_e`, CU.`wedM_e`, 
            CU.`thuH_s`, CU.`thuM_s`, CU.`thuH_e`, CU.`thuM_e`, 
            CU.`friH_s`, CU.`friM_s`, CU.`friH_e`, CU.`friM_e`, 
            CU.`satH_s`, CU.`satM_s`, CU.`satH_e`, CU.`satM_e`, 
            CU.`sunH_s`, CU.`sunM_s`, CU.`sunH_e`, CU.`sunM_e`, 
            Ma.`sid`, CU.`mapShow`, Ma.`width`, Ma.`height`
            FROM (
                SELECT 
                CU.`unit`,
                CU.`type`, CU.`email`, CU.`feedbackEmail`, 
                CU.`phoneText1`, CU.`phone1`, CU.`additional1`, 
                CU.`phoneText2`, CU.`phone2`, CU.`additional2`, 
                CU.`monH_s`, CU.`monM_s`, CU.`monH_e`, CU.`monM_e`, 
                CU.`tueH_s`, CU.`tueM_s`, CU.`tueH_e`, CU.`tueM_e`, 
                CU.`wedH_s`, CU.`wedM_s`, CU.`wedH_e`, CU.`wedM_e`, 
                CU.`thuH_s`, CU.`thuM_s`, CU.`thuH_e`, CU.`thuM_e`, 
                CU.`friH_s`, CU.`friM_s`, CU.`friH_e`, CU.`friM_e`, 
                CU.`satH_s`, CU.`satM_s`, CU.`satH_e`, CU.`satM_e`, 
                CU.`sunH_s`, CU.`sunM_s`, CU.`sunH_e`, CU.`sunM_e`, 
                CUM.`map`, CUM.`show` as mapShow
                FROM `ContactsUnits` as CU
                left join `ContactsUnitsMaps` as CUM
                on CU.`unit` = CUM.`unit`
                WHERE CU.`showOnMain` = '1'
                order by `sequence` asc
            ) as CU left join `Maps` as Ma
            on CU.`map` = Ma.`alias`;";
        $rezult = $this->SQL_HELPER->select($query);
        foreach ($rezult as $key => $value) {
            $unitText = $this->getContactsUnitsData_Lang($value['unit']);
            $typeText = $this->getContactsUnitsTypesData_Lang($value['type']);
            $this->contactsData['mainPage'][$key]['unit'] = $value['unit'];
            $this->contactsData['mainPage'][$key]['name'] = $unitText['name'];
            $this->contactsData['mainPage'][$key]['adress'] = $unitText['adress'];
            $this->contactsData['mainPage'][$key]['postAdress'] = $unitText['postAdress'];
            $this->contactsData['mainPage'][$key]['text'] = $unitText['text'];
            $this->contactsData['mainPage'][$key]['email'] = $value['email'];
            $this->contactsData['mainPage'][$key]['feedbackEmail'] = $value['feedbackEmail'];
            if($value['additional1'] == null || $value['additional1'] == '') {
                $this->contactsData['mainPage'][$key]['phoneText1'] = $value['phoneText1'];
                $this->contactsData['mainPage'][$key]['phone1'] = $value['phone1'];
            } else {
                $this->contactsData['mainPage'][$key]['phoneText1'] = $value['phoneText1']." доб. ".$value['additional1'];
                $this->contactsData['mainPage'][$key]['phone1'] = $value['phone1'].'#'.$value['additional1'];
            }
            if($value['additional2'] == null || $value['additional2'] == '') {
                $this->contactsData['mainPage'][$key]['phoneText2'] = $value['phoneText2'];
                $this->contactsData['mainPage'][$key]['phone2'] = $value['phone2'];
            } else {
                $this->contactsData['mainPage'][$key]['phoneText2'] = $value['phoneText2']." доб. ".$value['additional2'];
                $this->contactsData['mainPage'][$key]['phone2'] = $value['phone2'].'#'.$value['additional2'];
            }            
            $this->contactsData['mainPage'][$key]['type'] = $value['type'];
            $this->contactsData['mainPage'][$key]['typeName'] = $typeText['typeName'];
            $this->contactsData['mainPage'][$key]['topText'] = $typeText['topText'];
            $this->contactsData['mainPage'][$key]['bottomText'] = $typeText['bottomText'];
            $this->contactsData['mainPage'][$key]['timeTable'] = $this->timeTableData($value);
            $contactsTimeTableUI = new ContactsTimeTableUI($this->contactsData['mainPage'][$key]['timeTable']);
            $this->contactsData['mainPage'][$key]['timeTableHTML'] = $contactsTimeTableUI->getTimeTableHTML();
            $this->contactsData['mainPage'][$key]['sid'] = $value['sid'];
            $this->contactsData['mainPage'][$key]['mapShow'] = $value['mapShow'];
            $this->contactsData['mainPage'][$key]['width'] = $value['width'];
            $this->contactsData['mainPage'][$key]['height'] = $value['height'];
        }
    }
    /**
     * Получение локализации элемента
     * @param type $unit элемент
     * @return array локализация
     */
    private function getContactsUnitsData_Lang($unit) {
        $text = array();
        $langHelper = new LangHelper("ContactsUnits_Lang", "lang", "unit", $unit, $this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
            $text['name'] = $langHelper->getLangValue("name");
            $text['adress'] = $langHelper->getLangValue("adress");
            $text['postAdress'] = $langHelper->getLangValue("postAdress");
            $text['text'] = $langHelper->getLangValue("text");
        } else {
            $text['name'] = "";
            $text['adress'] = "";
            $text['postAdress'] = "";
            $text['text'] = "";
        }
        return $text;
    }
    /**
     * Получаем данные по рпсписанию
     * @param array $data данные по объекту
     * @return array массив расписания
     */
    private function timeTableData($data) {
        $timeData = array();
//        $timeData['Mon'] = $this->timeTableDayData($data, 'mon');
//        $timeData['tue'] = $this->timeTableDayData($data, 'tue');
//        $timeData['wed'] = $this->timeTableDayData($data, 'wed');
//        $timeData['thu'] = $this->timeTableDayData($data, 'thu');
//        $timeData['fri'] = $this->timeTableDayData($data, 'fri');
//        $timeData['sat'] = $this->timeTableDayData($data, 'sat');
//        $timeData['sun'] = $this->timeTableDayData($data, 'sun');
        $timeData[0] = $this->timeTableDayData($data, 'mon');
        $timeData[1] = $this->timeTableDayData($data, 'tue');
        $timeData[2] = $this->timeTableDayData($data, 'wed');
        $timeData[3] = $this->timeTableDayData($data, 'thu');
        $timeData[4] = $this->timeTableDayData($data, 'fri');
        $timeData[5] = $this->timeTableDayData($data, 'sat');
        $timeData[6] = $this->timeTableDayData($data, 'sun');
        return $timeData;
    }
    
    /**
     * Собираем строку расписания за один день
     * @param array $data данные по объекту
     * @param string $key ключ дня
     * @return string стркоа расписания
     */
    private function timeTableDayData($data, $key) {
        $time = null;
        if($this->checkData($data[$key.'H_s']) && $this->checkData($data[$key.'H_e'])) {
            $time = $data[$key.'H_s'].":".$this->timeTableMinutesData ($data[$key.'M_s'])." - ".$data[$key.'H_e'].":".$this->timeTableMinutesData($data[$key.'M_e']);
        }
        return $time;
    }
    
    /**
     * Преобразование минут
     * @param string $minute изначальаня
     * @return string преобразованная
     */
    private function timeTableMinutesData ($minute) {
        if($minute == null || $minute == "") {
            $minute = '00';
        } else if(strlen($minute) == 1) {
            $minute = '0'.$minute;
        }
        return $minute;
    }
    
    /**
     * Проверка данных
     * @param string $data
     * @return string
     */
    private function checkData($data) {
        return $data != null && $data != '';
    }
    
    public function getHTML() {
        return $this->UI->getHTML();
    }
}
