<?php
class ContactDepartments {
    private $thisLang;
    private $noData;
    private $html;
    private $localization;
    private $departament;
    
    private $name;
    private $adress;
    private $postAdress;
    private $description;
    private $info;
    private $email1;
    private $email2;
    private $phone1;
    private $phone2;
    private $phone3;
    private $phone4;
    private $time;
    private $timeTable;
    private $workersListHTML;
    
    private $showWorkersContacts;
    private $showDescription;
    private $showInfo;
    private $showTimeTable;
    
    private $imagePath = './resources/Components/Contacts/Departments/';
    
    public function __construct($departament,$showParams) {
        $this->noData = false;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->departament = $departament;
        
        $this->name=null;
        $this->adress=null;
        $this->postAdress=null;
        $this->description=null;
        $this->info=null;
        $this->email1=null;
        $this->email2=null;
        $this->phone1=null;
        $this->phone2=null;
        $this->phone3=null;
        $this->phone4=null;
        $this->time=null;
        $this->localization = new Localization();
        
        if($showParams!=null) {
            $this->showWorkersContacts=$showParams['showWorkersContacts'];
            $this->showDescription=$showParams['showDescription'];
            $this->showInfo=$showParams['showInfo'];
            $this->showTimeTable=$showParams['showTimeTable'];
        } else {
            $this->showWorkersContacts=true;
            $this->showDescription=true;
            $this->showInfo=true;
            $this->showTimeTable=true;
        }
        
        $this->getData();
        $this->getWorkersHTML();
        $this->generateHTML();
    }
    
    private function getData() {
        $query ="select * from `ContactDepartments` where `alias`='$this->departament'";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getDataRow(0);
        $lang = $this->getLang();
        $this->name=$lang['name'];
        $this->description=$lang['description'];
        $this->info=$lang['info'];
        if(isset($lang['adress']) && $lang['adress']!=null && $lang['adress']!="") {
            $this->adress=$lang['adress'];
        }
        if(isset($lang['postAdress']) && $lang['postAdress']!=null && $lang['postAdress']!="") {
            $this->postAdress=$lang['postAdress'];
        }
        if(isset($listData['email1']) && $listData['email1']!=null && $listData['email1']!="") {
            $this->email1=$listData['email1'];
        }
        if(isset($listData['email2']) && $listData['email2']!=null && $listData['email2']!="") {
            $this->email2=$listData['email2'];
        }
        $additional=$this->localization->getText("additional_short");
        if(isset($listData['phone1']) && $listData['phone1']!=null && $listData['phone1']!="") {
            $this->phone1=$listData['phone1'];
            if(isset($listData['additional1']) && $listData['additional1']!=null && $listData['additional1']!="" && $listData['additional1']!=0){
                $this->phone1 .= " ".$additional." ".$listData['additional1'];
            }
        }
        if(isset($listData['phone2']) && $listData['phone2']!=null && $listData['phone2']!="") {
            $this->phone2=$listData['phone2'];
            if(isset($listData['additional2']) && $listData['additional2']!=null && $listData['additional2']!="" && $listData['additional2']!=0){
                $this->phone2 .= " ".$additional." ".$listData['additional2'];
            }
        }
        if(isset($listData['phone3']) && $listData['phone3']!=null && $listData['phone3']!="") {
            $this->phone3=$listData['phone3'];
            if(isset($listData['additional3']) && $listData['additional3']!=null && $listData['additional3']!="" && $listData['additional3']!=0){
                $this->phone3 .= " ".$additional." ".$listData['additional3'];
            }
        }
        if(isset($listData['phone4']) && $listData['phone4']!=null && $listData['phone4']!="") {
            $this->phone4=$listData['phone4'];
            if(isset($listData['additional4']) && $listData['additional4']!=null && $listData['additional4']!="" && $listData['additional4']!=0){
                $this->phone4 .= " ".$additional." ".$listData['additional4'];
            }
        }
        $this->setTimeString($listData,0,"mon");
        $this->setTimeString($listData,1,"tue");
        $this->setTimeString($listData,2,"wed");
        $this->setTimeString($listData,3,"thu");
        $this->setTimeString($listData,4,"fri");
        $this->setTimeString($listData,5,"sat");
        $this->setTimeString($listData,6,"sun");
        $contactTimeTable = new ContactTimeTable($this->time);
        $this->timeTable = $contactTimeTable->getTimeTableHTML();
    }
    
    private function getLang() {
        $langHelper = new LangHelper("ContactDepartments_Lang","lang","department",$this->departament,$this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
           $data['name'] = $langHelper->getLangValue("name");
           $data['adress'] = $langHelper->getLangValue("adress");
           $data['postAdress'] = $langHelper->getLangValue("postAdress");
           $data['description'] = $langHelper->getLangValue("description");
           $data['info'] = $langHelper->getLangValue("info");
        } else {
           $data['name'] = "";
           $data['adress'] = "";
           $data['postAdress'] = "";
           $data['description'] = "";
           $data['info'] = "";
        }
        $data['noLocal'] = "";
        return $data;
    }
    
    private function setTimeString($listData,$i,$id) {
        if(isset($listData[$id.'H_s']) && $listData[$id.'H_s']!=null && $listData[$id.'H_s']!="" && $listData[$id.'H_s']<25 &&
                isset($listData[$id.'H_e']) && $listData[$id.'H_e']!=null && $listData[$id.'H_e']!="" && $listData[$id.'H_e']<25 &&
                isset($listData[$id.'M_s']) && $listData[$id.'M_s']!=null && $listData[$id.'M_s']!="" && $listData[$id.'M_s']<61 &&
                isset($listData[$id.'M_e']) && $listData[$id.'M_e']!=null && $listData[$id.'M_e']!="" && $listData[$id.'M_e']<61)  {
            if($listData[$id.'H_s']<10) {
                $sh="0".$listData[$id.'H_s'];
            } else {
                $sh=$listData[$id.'H_s'];
            }
            if($listData[$id.'M_s']<10) {
                $sm="0".$listData[$id.'M_s'];
            } else {
                $sm=$listData[$id.'M_s'];
            }
            if($listData[$id.'H_e']<10) {
                $eh="0".$listData[$id.'H_e'];
            } else {
                $eh=$listData[$id.'H_e'];
            }
            if($listData[$id.'M_e']<10) {
                $em="0".$listData[$id.'M_e'];
            } else {
                $em=$listData[$id.'M_e'];
            }
            
             $this->time[$i]=$sh.":".$sm." - ".$eh.":".$em;
        } else {
            $this->time[$i]=$this->localization->getText("day");
        }
    }
    
    private function getContacts() {
        $out = "";
        if($this->adress!=null) {
            $out .= "<dir class='Contacts_adress'>";
            $out .= $this->adress;
            $out .= "</dir>";
        }
        if($this->postAdress!=null) {
            $out .= "<dir class='Contacts_adress'>";
//            $out .= '<img src="./images/icons/contacts/mail.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon20x20 EmailIcon'></dir>";
            $out .= $this->postAdress;
            $out .= "</dir>";
        }
        if($this->email1!=null) {
            $out .= "<dir class='Contacts_email'>";
//            $out .= '<img src="./images/icons/contacts/mail.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon20x20 EmailIcon'></dir>";
            $out .= '<a href="mailto:'.$this->email1.'">';
            $out .= $this->email1;
            $out .= '</a>';
            $out .= "</dir>";
        }
        if($this->email2!=null) {
            $out .= "<dir class='Contacts_email'>";
//            $out .= '<img src="./images/icons/contacts/mail.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon20x20 EmailIcon'></dir>";
            $out .= '<a href="mailto:'.$this->email2.'">';
            $out .= $this->email2;
            $out .= '</a>';
            $out .= "</dir>";
        }
        if($this->phone1!=null) {
            $out .= "<dir class='Contacts_phone'>";
//            $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon20x20 PhoneIcon'></dir>";
            $out .= $this->phone1;
            $out .= "</dir>";
        }
        if($this->phone2!=null) {
            $out .= "<dir class='Contacts_phone'>";
//            $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon20x20 PhoneIcon'></dir>";
            $out .= $this->phone2;
            $out .= "</dir>";
        }
        if($this->phone3!=null) {
            $out .= "<dir class='Contacts_phone'>";
//            $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon20x20 PhoneIcon'></dir>";
            $out .= $this->phone3;
            $out .= "</dir>";
        }
        if($this->phone4!=null) {
            $out .= "<dir class='Contacts_phone'>";
//            $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon20x20 PhoneIcon'></dir>";
            $out .= $this->phone4;
            $out .= "</dir>";
        }
        return $out;
    }

    private function getWorkersHTML() {
        $this->workersListHTML = "";
        $query ="select `list` from `ContactDepartments_has_ContactsWorkersList` where `department`='$this->departament'";
        $mySqlHelper = new MySqlHelper($query);
        $rezult = $mySqlHelper->getAllData();
        if(count($rezult)>0) {
            foreach ($rezult as $value) {
                $contactsWorkersList = new ContactsWorkersList($value['list']);
                $this->workersListHTML .= $contactsWorkersList->getListHtml();
            }
        }
    }

    private function generateHTML() {
        $out = "";
        $IMG_URL = $this->imagePath.$this->departament.".png";
        if(!file_exists($IMG_URL)) {
            $IMG_URL = $this->imagePath.$this->departament.".jpg";
            if(!file_exists($IMG_URL)) {
                $IMG_URL = null;
            }
        }
        if($IMG_URL!=null) {
            $style = "style='background: url(".$IMG_URL.") no-repeat;'";
        } else {
            $style = '';
        }
        $out .= "<div class='ContactsDepartments cd_".$this->departament."' ".$style.">";
            $out .= "<h2>";
            $out .= $this->name;
            $out .= "</h2>";
            $contacts = $this->getContacts();
            if($contacts!= null && $contacts!=""){
                $out .= "<div class='ContactsDepartments_contacts'>";
                    $out .= "<div class='ContactsDepartments_contacts_text'>";
                    $out .= $contacts;
                    $out .= "</div>";
                $out .= "</div>";
            }
            if($this->showTimeTable && $this->timeTable!="") {
                $out .= "<div class='ContactsDepartments_tableTime'>";
                    $out .= "<div class='ContactsDepartments_tableTime_text'>";
                    $out .= $this->timeTable;
                    $out .= "</div>";
                $out .= "</div>";
            }
        $out .= "</div>";
        if($this->showWorkersContacts && $this->workersListHTML!=null && $this->workersListHTML!="") {
            $out .= "<div class='ContactsDepartments_workersList'>";
            $out .= $this->workersListHTML;
            $out .= "</div>";
        }
        if($this->showDescription && $this->description!=null && $this->description!="") {
            $out .= "<div class='ContactsDepartments_description'>";
            $out .= $this->description;
            $out .= "</div>";
        }
        if($this->showInfo && $this->info!=null && $this->info!="") {
            $out .= "<div class='inf'>";
            $out .= $this->info;
            $out .= "</div>";
        }
        $this->html = $out;
    }
    
    public function get(){
        echo $this->html;
    }
    
    public function getHTML(){
        return $this->html;
    }
}
?>
