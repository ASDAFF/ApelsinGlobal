<?php
class ContactsShopBuilding {
    private $thisLang;
    private $noData;
    private $html;
    private $printHtml;
    private $localization;
    private $bilding;
    private $name;
    private $adress;
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
    private $map;
    private $shopName;
    
    public function __construct($bilding,$map,$shopName) {
        $this->noData = false;
        global $_URL_PARAMS;
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->bilding = $bilding;
        $this->name=null;
        $this->adress=null;
        $this->description=null;
        $this->info=null;
        $this->email1=null;
        $this->email2=null;
        $this->phone1=null;
        $this->phone2=null;
        $this->phone3=null;
        $this->phone4=null;
        $this->time=null;
        $this->map=$map;
        $this->localization = new Localization();
        $this->shopName = $shopName;
        $this->getData();
        $this->generateHTML();
        $this->generatePrintHTML();
    }
    
    private function getData() {
        $query ="select * from `ContactsShopBuilding` where `alias`='$this->bilding'";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getDataRow(0);
        $lang = $this->getLang();
        $this->name=$lang['name'];
        $this->adress=$lang['adress'];
        $this->description=$lang['description'];
        $this->info=$lang['info'];
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
    
    private function getLang() {
        $langHelper = new LangHelper("ContactsShopBuilding_Lang","lang","shopBuilding",$this->bilding,$this->thisLang);
        $langType = $langHelper->getLangType();
        if($langType != -1){
           $data['name'] = $langHelper->getLangValue("name");
           $data['adress'] = $langHelper->getLangValue("adress");
           $data['description'] = $langHelper->getLangValue("description");
           $data['info'] = $langHelper->getLangValue("info");
        } else {
           $data['name'] = "";
           $data['adress'] = "";
           $data['description'] = "";
           $data['info'] = "";
        }
        $data['noLocal'] = "";
        return $data;
    }
    
    private function getContacts() {
        $out = "";
        $out .= "<dir class='Contacts_adress'>";
        $out .= $this->adress;
        $out .= "</dir>";
        if($this->email1!=null) {
            $out .= "<dir class='Contacts_email'>";
//            $out .= '<img src="./images/icons/contacts/mail.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon12x12 EmailIcon'></dir>";
            $out .= '<a href="mailto:'.$this->email1.'">';
            $out .= $this->email1;
            $out .= '</a>';
            $out .= "</dir>";
        }
        if($this->email2!=null) {
            $out .= "<dir class='Contacts_email'>";
//            $out .= '<img src="./images/icons/contacts/mail.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon12x12 EmailIcon'></dir>";
            $out .= '<a href="mailto:'.$this->email2.'">';
            $out .= $this->email2;
            $out .= '</a>';
            $out .= "</dir>";
        }
        if($this->phone1!=null) {
            $out .= "<dir class='Contacts_phone'>";
//            $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon12x12 PhoneIcon'></dir>";
            $out .= $this->phone1;
            $out .= "</dir>";
        }
        if($this->phone2!=null) {
            $out .= "<dir class='Contacts_phone'>";
//            $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon12x12 PhoneIcon'></dir>";
            $out .= $this->phone2;
            $out .= "</dir>";
        }
        if($this->phone3!=null) {
            $out .= "<dir class='Contacts_phone'>";
//            $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon12x12 PhoneIcon'></dir>";
            $out .= $this->phone3;
            $out .= "</dir>";
        }
        if($this->phone4!=null) {
            $out .= "<dir class='Contacts_phone'>";
//            $out .= '<img src="./images/icons/contacts/phone.png" alt="телефон" width="20" height="20" align="absmiddle">';
            $out .= "<dir class='Icon12x12 PhoneIcon'></dir>";
            $out .= $this->phone4;
            $out .= "</dir>";
        }
        return $out;
    }


    private function generateHTML() {
        $out = "";
        $out .= "<div class='ContactsShopBuilding cb_".$this->bilding."'>";
//            $out .= "<h2>";
//            $out .= $this->name;
//            $out .= "</h2>";
            $out .= "<div class='ContactsShopBuilding_contacts'>";
            $out .= $this->getContacts();
            $out .= "</div>";
            $out .= "<div class='ContactsShopBuilding_timeTable'>";
            $out .= $this->timeTable;
            $out .= "</div>";
        $out .= "</div>";
        $this->html = $out;
    }
    private function generatePrintHTML() {
        $out = "";
        $out .= "<div class='ContactsShopBuilding cb_".$this->bilding."'>";
            $out .= "<h2>";
            $out .= $this->name;
            $out .= "</h2>";
            $out .= "<div class='ContactsShopBuilding_contacts'>";
            $out .= "<div class='ContactsShopBuilding_contacts_text'>";
            $out .= $this->getContacts();
            $out .= "</div>";
            $out .= "</div>";
            $out .= "<div class='ContactsShopBuilding_tableTime'>";
            $out .= "<div class='ContactsShopBuilding_tableTime_text'>";
            $out .= $this->timeTable;
            $out .= "</div>";
            $out .= "</div>";
        $out .= "</div>";
        $this->printHtml = $out;
    }
    
    public function get(){
        echo $this->html;
    }
    
    public function getHTML(){
        return $this->html;
    }
    
    public function getPrint(){
        echo $this->printHtml;
    }
    
    public function getPrintHTML(){
        return $this->printHtml;
    }
}
?>
