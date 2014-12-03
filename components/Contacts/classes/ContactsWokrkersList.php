<?php
class ContactsWorkersList {
    private $thisLang;
    private $noData;
    private $workersList;
    private $workersListColumn;
    private $workersListData;
    private $html;
    
    public function __construct($workersList) {
        $this->noData = false;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->workersList = $workersList;
        $this->workersListData = array();
        $this->getListData();
        $this->generateHTML();
    }
    
    private function getListData() {
        $query ="select * from `ContactsWorkersList` where `alias`='$this->workersList'";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getDataRow(0);
        if(count($listData) != 0) {
            $this->noData = false;
            $this->workersListColumn = $listData['column'];
            $this->getWorkersListData();
            return;
        } else {
            $this->noData = true;
        }
    }
    
    private function getWorkersListLang($worker) {
        $langHelper = new LangHelper("ContactsWorkers_Lang","lang","worker",$worker,$this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
           $data['fio'] = $langHelper->getLangValue("fio");
           $data['info'] = $langHelper->getLangValue("info");
        } else {
           $data['fio'] = "";
           $data['info'] = "";
        }
//        $data['noLocal'] = $langHelper->getNoLocal();
        return $data;
    }

    private function getWorkersPost($post) {
        $langHelper = new LangHelper("ContactsWorkersPosts_Lang","lang","post",$post,$this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
           $data['name'] = $langHelper->getLangValue("name");
           $data['description'] = $langHelper->getLangValue("description");
           $data['info'] = $langHelper->getLangValue("info");
        } else {
           $data['name'] = "";
           $data['description'] = "";
           $data['info'] = "";
        }
//        $data['noLocal'] = $langHelper->getNoLocal();
        return $data;
    }

    private function getWorkersListData() {
        /*
        $query ="select
            CW.`id`, CW.`post`, CW.`email1`, CW.`email2`, CW.`phone1`, 
            CW.`additional1`, CW.`phone2`, CW.`additional2`
            from `ContactsWorkers` as CW left join 
            `ContactsWorkers_has_ContactsWorkersList` as CWhasCWL
            on CW.`id`=CWhasCWL.`contact`
            where CWhasCWL.`list`='".$this->workersList."'
            order by CWhasCWL.`sequence` asc;";
        */    
        $query ="select
            CW.`id`, 
            CW.`post`, 
            CW.`email1`, 
            CW.`email2`, 
            CW.`phone1`, 
            CW.`additional1`, 
            CW.`phone2`, 
            CW.`additional2`, 
            CW.`importance`
            from (select
            CW.`id`, 
            CW.`post`, 
            CW.`email1`, 
            CW.`email2`, 
            CW.`phone1`, 
            CW.`additional1`, 
            CW.`phone2`, 
            CW.`additional2`, 
            CWP.`importance`
            from `ContactsWorkers` as CW 
            left join `ContactsWorkersPosts` as CWP
            on CW.`post`=CWP.`alias`) as CW
            left join `ContactsWorkers_has_ContactsWorkersList` as CWhasCWL
            on CW.`id`=CWhasCWL.`contact`
            where CWhasCWL.`list`='".$this->workersList."'
            order by CW.`importance` asc;";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getAllData();
        $count = 0;
        if($listData != null) {
            foreach ($listData as $value) {
                $temp=$this->getWorkersListLang($value['id']);
                $this->workersListData[$count]['fio']=$temp['fio'];
                $this->workersListData[$count]['info']=$temp['info'];
                $temp=$this->getWorkersPost($value['post']);
                $this->workersListData[$count]['post']=$temp['name'];
                $this->workersListData[$count]['post_description']=$temp['description'];
                $this->workersListData[$count]['post_info']=$temp['info'];
                $this->workersListData[$count]['email1']=$value['email1'];
                $this->workersListData[$count]['email2']=$value['email2'];
                $localization = new Localization();
                $additional=$localization->getText("additional_short");
                if($value['additional1']!=null && $value['additional1']!=0) {
                    $this->workersListData[$count]['phone1']=$value['phone1']." ".$additional." ".$value['additional1'];
                } else {
                    $this->workersListData[$count]['phone1']=$value['phone1'];
                }
                if($value['additional2']!=null && $value['additional2']!=0) {
                    $this->workersListData[$count]['phone2']=$value['phone2']." ".$additional." ".$value['additional2'];
                } else {
                    $this->workersListData[$count]['phone2']=$value['phone2'];
                }
                $count++;
            }
        }
    }
    
    private function generateHTML() {
        if($this->noData) {
            $this->html = "<br />Список контактов отсутствует<br />";
            return;
        }
        if(count($this->workersListData) < $this->workersListColumn) {
            $tableWidth = floor(100/$this->workersListColumn)*count($this->workersListData)."%";
            $this->workersListColumn = count($this->workersListData);
        } else {
            $tableWidth = '100%';
        }
        $out = "<table class='ContactsWorkersListTable' width='".$tableWidth."'>";
        $count=0;
        foreach ($this->workersListData as $value) {
            if($count==0) {
                $out .= "<tr>";
            }
            $out .= "<td width='".floor(100/$this->workersListColumn)."%'>";
            $out .= "<dir class='ContactsWorkersText'>";
            $out .= "<dir class='ContactsWorkersFIO'>";
            $out .= $value['fio'];
            $out .= "</dir>";
            $out .= "<dir class='ContactsWorkersPost'>";
            $out .= $value['post'];
            $out .= "</dir>";
            if(isset($value['post_description']) && $value['post_description']!=null && $value['post_description']!="") {
                $out .= "<dir class='ContactsWorkersPostDescription'>";
                $out .= $value['post_description'];
                $out .= "</dir>";    
            }
            if(isset($value['post_info']) && $value['post_info']!=null && $value['post_info']!="") {
                $out .= "<dir class='ContactsWorkersPostInfo'>";
                $out .= $value['post_info'];
                $out .= "</dir>";
            }
            if(isset($value['info']) && $value['info']!=null && $value['info']!="") {
                $out .= "<dir class='ContactsWorkersInfo'>";
                $out .= $value['info'];
                $out .= "</dir>";
            }
            $out .= "<dir class='ContactsWorkersContacts'>";
                if(isset($value['phone1']) && $value['phone1']!=null && $value['phone1']!="") {
                    $out .= "<dir class='ContactsWorkersContacts_phone'>";
//                    $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" align="absmiddle">';
                    $out .= "<dir class='Icon12x12 PhoneIcon'></dir>";
                    $out .= $value['phone1'];
                    $out .= "</dir>";
                }
                if(isset($value['phone2']) && $value['phone2']!=null && $value['phone2']!="") {
                    $out .= "<dir class='ContactsWorkersContacts_phone'>";
//                    $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" align="absmiddle">';
                    $out .= "<dir class='Icon12x12 PhoneIcon'></dir>";
                    $out .= $value['phone2'];
                    $out .= "</dir>";
                }
                if(isset($value['email1']) && $value['email1']!=null && $value['email1']!="") {
                    $out .= "<dir class='ContactsWorkersContacts_email'>";
//                    $out .= '<img src="./images/icons/contacts/mail.png" alt="телефон" walign="absmiddle">';
                    $out .= "<dir class='Icon12x12 EmailIcon'></dir>";
                    $out .= '<a href="mailto:'.$value['email1'].'">'.$value['email1'].'</a>';
                    $out .= "</dir>";
                }
                if(isset($value['email2']) && $value['email2']!=null && $value['email2']!="") {
                    $out .= "<dir class='ContactsWorkersContacts_email'>";
//                    $out .= '<img src="./images/icons/contacts/mail.png" alt="телефон" align="absmiddle">';
                    $out .= "<dir class='Icon12x12 EmailIcon'></dir>";
                    $out .= '<a href="mailto:'.$value['email2'].'">'.$value['email2'].'</a>';
                    $out .= "</dir>";
                }
            $out .= "</dir>";
            $out .= "</dir>";
            $out .= "</td>";
            $count++;
            if($count==$this->workersListColumn) {
                $out .= "</tr>";
                $count=0;
            }
        }
        $out .= "</table>";
        $this->html = $out;
    }
    
    public function getList() {
        echo $this->html;
    }
    
    public function getListHtml() {
        return $this->html;
    }
}
?>
