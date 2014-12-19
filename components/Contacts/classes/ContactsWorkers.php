<?php

class ContactsWorkers {
    private $SQL_HELPER;
    private $thisLang;
    private $unit;
    private $contactsWorkersData;
    private $contactsWorkersPostsData;
    
    public function __construct($unit) {
        global $_SQL_HELPER;
        global $_URL_PARAMS;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->unit = $unit;
        $this->getContactsWorkersData();
    }
    
    
    private function getContactsWorkersPostsData() {
        $this->contactsWorkersPostsData = array();
        $query = "SELECT `post` FROM `ContactsWorkersPosts`;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $value) {
            $this->contactsWorkersPostsData[$value['post']] = $this->getContactsWorkersPostsData_Lang($value['post']);
        }
    }
    private function getContactsWorkersPostsData_Lang($post) {
        $langHelper = new LangHelper("ContactsWorkersPosts_Lang", "lang", "post", $post, $this->thisLang);
        if($langHelper->getLangType() != -1){
            return $langHelper->getLangValue("postName");
        } else {
            return "";
        }
    }
    
    
    private function getContactsWorkersData() {
        $this->getContactsWorkersPostsData();
        $this->contactsWorkersData = array();
        $query = "SELECT
            CW.`worker`, CW.`post`, 
            CW.`email1`, CW.`email2`, 
            CW.`phoneText1`, CW.`phone1`, CW.`additional1`, 
            CW.`phoneText2`, CW.`phone2`, CW.`additional2`
            FROM (SELECT
            CW.`worker`, CW.`post`, 
            CW.`email1`, CW.`email2`, 
            CW.`phoneText1`, CW.`phone1`, CW.`additional1`, 
            CW.`phoneText2`, CW.`phone2`, CW.`additional2`
            FROM `ContactsWorkers` as CW left join `ContactsUnitsWokers` as CUW
            on CW.`worker` = CUW.`worker`
            where CUW.`unit`='".$this->unit."') as CW
            left join `ContactsWorkersPosts` as CWP
            on CW.`post` = CWP.`post`
            order by CWP.`sequence` asc;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $workerLeng = $this->getContactsWorkersData_Lang($value['worker']);
            $this->contactsWorkersData[$key]['fio'] = $workerLeng['fio'];
            $this->contactsWorkersData[$key]['info'] = $workerLeng['info'];
            $this->contactsWorkersData[$key]['post'] = $this->contactsWorkersPostsData[$value['post']];
            $this->contactsWorkersData[$key]['email1'] = $value['email1'];
            $this->contactsWorkersData[$key]['email2'] = $value['email2'];
            if($value['additional1'] == null || $value['additional1'] == '') {
                $this->contactsWorkersData[$key]['phoneText1'] = $value['phoneText1'];
                $this->contactsWorkersData[$key]['phone1'] = $value['phone1'];
            } else {
                $this->contactsWorkersData[$key]['phoneText1'] = $value['phoneText1']." доб. ".$value['additional1'];
                $this->contactsWorkersData[$key]['phone1'] = $value['phone1'].'#'.$value['additional1'];
            }
            if($value['additional2'] == null || $value['additional2'] == '') {
                $this->contactsWorkersData[$key]['phoneText2'] = $value['phoneText2'];
                $this->contactsWorkersData[$key]['phone2'] = $value['phone2'];
            } else {
                $this->contactsWorkersData[$key]['phoneText2'] = $value['phoneText2']." доб. ".$value['additional2'];
                $this->contactsWorkersData[$key]['phone2'] = $value['phone2'].'#'.$value['additional2'];
            }
        }
    }
    
    private function getContactsWorkersData_Lang($worker) {
        $workerLeng = array();
        $langHelper = new LangHelper("ContactsWorkers_Lang", "lang", "worker", $worker, $this->thisLang);
        if($langHelper->getLangType() != -1){
            $workerLeng['fio'] = $langHelper->getLangValue("fio");
            $workerLeng['info'] = $langHelper->getLangValue("info");
        } else {
            $workerLeng['fio'] = "";
            $workerLeng['info'] = "";
        }
        return $workerLeng;
    }
    
    public function getData() {
        return $this->contactsWorkersData;
    }
}
