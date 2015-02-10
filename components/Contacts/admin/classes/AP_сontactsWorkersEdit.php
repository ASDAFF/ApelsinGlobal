<?php
class AP_сontactsWorkersEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
    private $workerLang;
    private $unitData;
    
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('worker',"/^[А-ЯЁ][а-яё]+\s[А-ЯЁ][а-яё]+(\s[А-ЯЁ][а-яё]+)?$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Имя указывается с большой буквы.";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        if (!$this->checkValueEmail('email1')) {
            $error = true;
        }
        if (!$this->checkValueEmail('email2')) {
            $error = true;
        }
        if (!$this->checkValuePhone('phoneText1')) {
            $error = true;
        }
        if (!$this->checkValuePhone('phoneText2')) {
            $error = true;
        }
        if (!$this->checkValuePhone('phone1')) {
            $error = true;
        }
        if (!$this->checkValuePhone('phone2')) {
            $error = true;
        }
        if (!$this->checkValueAdditional('additional1')) {
            $error = true;
        }
        if(!$this->checkValueAdditional('additional2')) {
            $error = true;
        }
        if(!$this->checkValue('post')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите должность";
        }
        $local = false;
        foreach ($this->langArray as $langData) {
            if(isset($_POST['fio'][$langData['lang']]) && $_POST['fio'][$langData['lang']]!=null && $_POST['fio'][$langData['lang']]!="") {
                $local = true;
            }
        }
        if(!$local){
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должны быть заполнены поля 'ФИО' и 'Информация'.";
        }
        return !$error;
    }
     
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('worker');
        $this->insertValue['email1'] = parent::getPostValue('email1');
        $this->insertValue['email2'] = parent::getPostValue('email2');
        $this->insertValue['phone1'] = parent::getPostValue('phone1');
        $this->insertValue['phone2'] = parent::getPostValue('phone2');
        $this->insertValue['phoneText1'] = parent::getPostValue('phoneText1');
        $this->insertValue['phoneText2'] = parent::getPostValue('phoneText2');
        $this->insertValue['additional1'] = parent::getPostValue('additional1');
        $this->insertValue['additional2'] = parent::getPostValue('additional2');
        if(isset($_POST['fio']) && $_POST['fio']!=null && $_POST['fio']!="") {
            foreach ($_POST['fio'] as $key => $value) {
                $this->insertValue['fio'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['info']) && $_POST['info']!=null && $_POST['info']!="") {
            foreach ($_POST['info'] as $key => $value) {
                $this->insertValue['info'][$key] = parent::getMysqlText($value);
            }
        }
        $this->insertValue['post'] = parent::getPostValue('post');
        if(isset($_POST['units']) && $_POST['units']!=null && $_POST['units']!="") {
            $this->insertValue['units'] = $_POST['units'];
        } else {
            $this->insertValue['units'] = array();
        }
    }
    
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // worker
        $worker = $this->inputHelper->paternTextBox('worker', 'worker', 'worker', 200, true, 'Кирилица', '^[А-ЯЁ][а-яё]+\s[А-ЯЁ][а-яё]+(\s[А-ЯЁ][а-яё]+)?$',  $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($worker, true, 'ФИО');
        // post
        $post = $this->inputHelper->select('post', 'post', $this->getPostSelectData(), true, $this->originalInsertValue['post']);
        $html .= $this->inputHelper->createFormRow($post, true, 'Занимаемая должность');
        // email1
        $email1 = $this->inputHelper->paternTextBox('email1', 'email1', 'email1', 200, true, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['email1']);
        $html .= $this->inputHelper->createFormRow($email1, true, 'Email1');
        // email2
        $email2 = $this->inputHelper->paternTextBox('email2', 'email2', 'email2', 200, false, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['email2']);
        $html .= $this->inputHelper->createFormRow($email2, false, 'Email2');
        // phoneText1 phone1  additional1 
        $phoneText1 = $this->inputHelper->paternTextBox('phoneText1', 'phoneText1', 'ContactsUnitsPhoneBox', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phoneText1']);
        $phone1 = $this->inputHelper->paternTextBox('phone1', 'phone1', 'ContactsUnitsPhoneBox', 100, false, "XXXXXXXXXXX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phone1']);
        $additional1 = $this->inputHelper->paternTextBox('additional1', 'additional1', ' ContactsUnitsPhoneBox', 11, false, 'добавочный', '^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$', $this->originalInsertValue['additional1']);
        $html .= $this->inputHelper->createFormRow("Текст.телефон: ".$phoneText1."Телефон: ".$phone1."Добавочный: ".$additional1, false, 'Phone1');
        // phoneText2 phone2  additional2 
        $phoneText2 = $this->inputHelper->paternTextBox('phoneText2', 'phoneText2', 'ContactsUnitsPhoneBox', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phoneText2']);
        $phone2 = $this->inputHelper->paternTextBox('phone2', 'phone2', 'ContactsUnitsPhoneBox', 100, false, "XXXXXXXXXXX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phone2']);
        $additional2 = $this->inputHelper->paternTextBox('additional2', 'additional2', ' ContactsUnitsPhoneBox', 11, false, 'добавочный', '^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$', $this->originalInsertValue['additional2']);
        $html .= $this->inputHelper->createFormRow("Текст.телефон: ".$phoneText2."Телефон: ".$phone2."Добавочный: ".$additional2, false, 'Phone2');
        // units
        $units = $this->inputHelper->getChekBoxGroup('units', 'units', $this->getContactsUnits(), false, $this->originalInsertValue['units'], '', '','contactsChekBoxGroup');
        $html .= $this->inputHelper->createFormRow($units, false, 'Юнит');
        return $html;
    }
    
    protected function getInputLangBlocks($lang) {
        $html = parent::getInputLangBlocks($lang);
        // fio
        $fio = $this->inputHelper->textBox('fio['.$lang.']', 'fio', 'fio', 200, false, $this->originalInsertValue['fio'][$lang]);
        $html .= $this->inputHelper->createFormRow($fio, false, 'ФИО');
        // info
        $info = $this->inputHelper->textarea('info['.$lang.']', 'info', 'info', 50000, false, $this->originalInsertValue['info'][$lang]);
        $html .= $this->inputHelper->createFormRow($info, false, 'Информация');
        return $html;
    }
    
    protected function getData() {
        parent::getData();
        $this->data = array();
        $this->workerLang = array();
        $this->unitData = array();
        $query = "SELECT * FROM `ContactsWorkers` WHERE `worker`='".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
        $query = "SELECT * FROM `ContactsWorkers_Lang` WHERE `worker`='".$this->editElement."';";
        $this->workerLang = $this->SQL_HELPER->select($query);
        $query = "SELECT * FROM `ContactsUnitsWokers` WHERE `worker`='".$this->editElement."';";
        $this->unitData = $this->SQL_HELPER->select($query);
    }
    
    protected function setDefaltInput() {
        parent::setDefaltInput();
        $this->insertValue['alias'] = $this->data['worker'];
        $this->insertValue['post'] = $this->data['post'];
        $this->insertValue['email1'] = $this->data['email1'];
        $this->insertValue['email2'] = $this->data['email2'];
        $this->insertValue['phoneText1'] = $this->data['phoneText1'];
        $this->insertValue['phone1'] = $this->data['phone1'];
        $this->insertValue['phoneText2'] = $this->data['phoneText2'];
        $this->insertValue['phone2'] = $this->data['phone2'];
        $this->insertValue['additional1'] = $this->data['additional1'];
        $this->insertValue['additional2'] = $this->data['additional2'];
        $this->insertValue['fio'] = array();
        $this->insertValue['info'] = array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['fio'][$langData['lang']] = "";
            $this->insertValue['info'][$langData['lang']] = "";
        }
        foreach ($this->workerLang as $langData) {
            $this->insertValue['fio'][$langData['lang']] = $langData['fio'];
            $this->insertValue['info'][$langData['lang']] = $langData['info'];
        }
        $this->insertValue['units'] = array();
        if($this->unitData != null) {
            foreach ($this->unitData as $key => $workerData) {
                $this->insertValue['units'][$key] = $workerData['unit'];
            }
        }
        $this->originalInsertValue = $this->insertValue;
    }

    protected function updateExecute() {
        parent::updateExecute();
        $queryContactsWorkers = "UPDATE `ContactsWorkers` SET ";
        $queryContactsWorkers .= "`worker` = '".$this->insertValue['alias']."', ";
        $queryContactsWorkers .= "`post` = '".$this->insertValue['post']."', ";
        $queryContactsWorkers .= "`email1` = '".$this->insertValue['email1']."', ";
        $queryContactsWorkers .= "`email2` = '".$this->insertValue['email2']."', ";
        $queryContactsWorkers .= "`phoneText1` = '".$this->insertValue['phoneText1']."', ";
        $queryContactsWorkers .= "`phone1` = '".$this->insertValue['phone1']."', ";
        $queryContactsWorkers .= "`phoneText2` = '".$this->insertValue['phoneText2']."', ";
        $queryContactsWorkers .= "`phone2` = '".$this->insertValue['phone2']."', ";
        $queryContactsWorkers .= "`additional1` = '".$this->insertValue['additional1']."', ";
        $queryContactsWorkers .= "`additional2` = '".$this->insertValue['additional2']."' ";
        $queryContactsWorkers .= " WHERE `worker`='".$this->editElement."';";
        
        $queryContactsWorkers_LangDel = "DELETE FROM  `ContactsWorkers_Lang` WHERE  `worker` = '".$this->editElement."';";
        
        $queryContactsWorkers_Lang = array();
        foreach ($this->langArray as $langData) {
            if (isset($this->insertValue['fio'][$langData['lang']]) && $this->insertValue['fio'][$langData['lang']]!=null && 
                    $this->insertValue['fio'][$langData['lang']]!="") {
                $queryLang = "INSERT INTO `ContactsWorkers_Lang` SET ";
                $queryLang .= "`worker`='".$this->insertValue['alias']."', ";
                $queryLang .= "`lang`='".$langData['lang']."', ";
                $queryLang .= "`fio`='".$this->insertValue['fio'][$langData['lang']]."', ";
                $queryLang .= "`info`='".$this->insertValue['info'][$langData['lang']]."';";
                $queryContactsWorkers_Lang[] = $queryLang;
            }
        }
        
        $queryContactsUnitsWokersDel = "DELETE FROM `ContactsUnitsWokers` WHERE `worker` = '".$this->editElement."';";
        
        $queryContactsUnitsWokers = array();
        if($this->insertValue['units'] != null) {
            foreach ($this->insertValue['units'] as $unit) {
                $query = "INSERT INTO `ContactsUnitsWokers` SET ";
                $query .= "`unit`='".$unit."', ";
                $query .= "`worker`='".$this->insertValue['alias']."';";
                $queryContactsUnitsWokers[] = $query;
            }
        }
        
        if ($this->SQL_HELPER->insert($queryContactsWorkers)) {
//        echo var_dump($queryContactsWorkers) .'<hr>';
            $this->SQL_HELPER->insert($queryContactsWorkers_LangDel);
//        echo var_dump($queryContactsWorkers_LangDel) .'<hr>';
            foreach($queryContactsWorkers_Lang as $queryContactsWorkers_Lg) {
//        echo var_dump($queryContactsWorkers_Lg) .'<hr>';
                $this->SQL_HELPER->insert($queryContactsWorkers_Lg);
            }
            $this->SQL_HELPER->insert($queryContactsUnitsWokersDel);
//        echo var_dump($queryContactsUnitsWokersDel) .'<hr>';
            foreach($queryContactsUnitsWokers as $queryContactsUnitsWoker) {
                $this->SQL_HELPER->insert($queryContactsUnitsWoker);
//        echo var_dump($queryContactsUnitsWoker) .'<hr>';
            } 
        } else {
            echo 'Данные не были добавлены. Попробуйте позже.';
        }
    }

    protected function checkEditElement() {
        $query = "SELECT * FROM `ContactsWorkers` WHERE `worker`='".$this->editElement."';";
        $result = $this->SQL_HELPER->select($query,1);
        return $result != null;
    }
    
    private function checkAlias() {
        if($this->editElement == $_POST['worker']) {
            return true;
        }
        $result = array();
        if(isset($_POST['worker']) && $_POST['worker']!=null && $_POST['worker']!="") {
            $query = "SELECT * FROM `ContactsWorkers` WHERE `worker`='".$_POST['worker']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
    
    private function checkValuePhone($phone) {
        $error = false;
        if (isset($_POST[$phone]) && $_POST[$phone] != '' && $_POST[$phone] != null) {
            if(!$this->checkValue($phone,"/^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Неверно указан номер телефона. Данные добавляются без пробелов";
            }
        }
        return !$error;
    }
    
    private function checkValueAdditional($additional) {
        $error = false;
        if (isset($_POST[$additional]) && $_POST[$additional] != '' && $_POST[$additional] != null) {
            if(!$this->checkValue($additional,"/^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Добавочный номер указывается в виде 3 или 4 цифр, в случае двух добавочных они перечисляются через знак / без пробелов";
            }
        }
        return !$error;
    }
    
    private function checkValueEmail($email) {
        $error = false;
        if (isset($_POST[$email]) && $_POST[$email] != '' && $_POST[$email] != null) {
            if(!$this->checkValue($email,"/^([A-Za-z0-9_\.-]+)@([A-Za-z0-9_\.-]+)\.([A-Za-z\.]{2,6})$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Указан не корректный E-mail.";
            }
        }
        return !$error;
    }
    
    private function getContactsUnits() {
        $unit = array();
        $query = "SELECT * FROM  `ContactsUnits`;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $unit[$key]['text']=$this->getContactsUnitsDataText($value['unit']);
            $unit[$key]['value']=$value['unit'];
            $unit[$key]['checked']="0";
        }
        return $unit;
    }
    
    private function getContactsUnitsDataText($unit) {
        $title = "";
        $this->langHelper = new LangHelper("ContactsUnits_Lang","lang","unit",$unit,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $title = $langData["name"];
        }
        return $title;
    } 

    private function getPostSelectData() {
        $post = array();
        $query = "SELECT * FROM `ContactsWorkersPosts` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $post[$key]['text'] = $value['post'];
            $post[$key]['value'] = $value['post'];
        }
        return $post;
    }
}
