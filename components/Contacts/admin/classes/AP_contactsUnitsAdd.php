<?php

class AP_contactsUnitsAdd  extends AdminPanel_ComponentPanelUI_Element_Add {
    
    private $dir = './resources/Components/Contacts/Units/';

    protected function getElementID() {
        return $this->insertValue['alias'];
    }
    
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('unit');
        $this->insertValue['type'] = parent::getPostValue('type');
        $this->insertValue['show'] = parent::getPostValue('show');
        $this->insertValue['showOnMain'] = parent::getPostValue('showOnMain');
        $this->insertValue['sequence'] = parent::getPostValue('sequence');
        $this->insertValue['email'] = parent::getPostValue('email');
        $this->insertValue['feedbackEmail'] = parent::getPostValue('feedbackEmail');
        $this->insertValue['phoneText1'] = parent::getPostValue('phoneText1');
        $this->insertValue['phone1'] = parent::getPostValue('phone1');
        $this->insertValue['additional1'] = parent::getPostValue('additional1');
        $this->insertValue['phoneText2'] = parent::getPostValue('phoneText2');
        $this->insertValue['phone2'] = parent::getPostValue('phone2');
        $this->insertValue['additional2'] = parent::getPostValue('additional2');
        $this->setDayTime('mon');
        $this->setDayTime('tue');
        $this->setDayTime('wed');
        $this->setDayTime('thu');
        $this->setDayTime('fri');
        $this->setDayTime('sat');
        $this->setDayTime('sun');
        $this->insertValue['map'] = parent::getPostValue('map');
        $this->insertValue['showMap'] = parent::getPostValue('showMap');
        //lang
        if(isset($_POST['name']) && $_POST['name']!=null && $_POST['name']!="") {
            foreach ($_POST['name'] as $key => $value) {
                $this->insertValue['name'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['adress']) && $_POST['adress']!=null && $_POST['adress']!="") {
            foreach ($_POST['adress'] as $key => $value) {
                $this->insertValue['adress'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['postAdress']) && $_POST['postAdress']!=null && $_POST['postAdress']!="") {
            foreach ($_POST['postAdress'] as $key => $value) {
                $this->insertValue['postAdress'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['text']) && $_POST['text']!=null && $_POST['text']!="") {
            foreach ($_POST['text'] as $key => $value) {
                $this->insertValue['text'][$key] = parent::getMysqlText($value);
            }
        }
    }
    
    protected function checkAllValue() {         
        parent::checkAllValue();
        $errorArray = array();
        $errorArray[0] = "Выберите значение";
        $error = false;
        if (!$this->checkValue('unit',"/^[A-Za-z0-9_-]{3,100}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены латинские буквы, цифры и щаник тире и нижнее подчеркивание";
        }
        if (!$this->checkAliasOrSequence('unit')) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        if (!$this->checkValue('type')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите тип";
        }
        if (!$this->checkValue('show',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = $errorArray[0];
        }
        if (!$this->checkValue('showOnMain',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = $errorArray[0];
        }
        if (!$this->checkValue('sequence',"/^[\d]+$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены только цифры";
        }
        if (!$this->checkAliasOrSequence('sequence')) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой приоритет уже используется";
        }
        // email
        if (!$this->checkValueEmail('email')) {
            $error = true;
        }
        if (!$this->checkValueEmail('feedbackEmail')) {
            $error = true;
        }
        // phone
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
        //additional
        if (!$this->checkValueAdditional('additional1')) {
            $error = true;
        }
        if(!$this->checkValueAdditional('additional2')) {
            $error = true;
        }
        //days
        if (!$this->checkValueDay('mon','Понедельник')) {
            $error = true;
        }
        if (!$this->checkValueDay('tue', 'Вторник')) {
            $error = true;
        }
        if (!$this->checkValueDay('wed', 'Среда')) {
            $error = true;
        }
        if(!$this->checkValueDay('thu', 'Четверг')) {
            $error = true;
        echo '<br>thu';
        }
        if (!$this->checkValueDay('fri', 'Пятница')) {
            $error = true;
        }
        if (!$this->checkValueDay('sat', 'Суббота')) {
            $error = true;
        }
        if(!$this->checkValueDay('sun', 'Воскресенье')) {
            $error = true;
        }
        if (isset($_POST['map']) && $_POST['map'] != '' && $_POST['map'] != null ) {
            if(!$this->checkValue('map')) {
                $error = true;
                $this->checkAllValueErrors[] = "Выберите карту";
            }
        }
        if (isset($_POST['showMap']) && $_POST['showMap'] != '' && $_POST['showMap'] != null ) {
            if(!$this->checkValue('showMap',"/^[0-1]{1}$/")) {
                $error = true;
                $this->checkAllValueErrors[] = $errorArray[0];
            }
        }
        $image = false;
            if (isset($_FILES['unitImage']) && $_FILES['unitImage']['name'] != null && $_FILES['unitImage']['name'] != "") {
                $image = true;
        }
        if (!$image) {
            $error = true;
            $this->checkAllValueErrors[] = "Загрузите изображение";
        }
        if(!$this->checkExtension()) {
            $error = true;
            $this->checkAllValueErrors[] = "Не поддерживаемый тип изображения. Допустимы jpg и png";
        }
        $local = false;
        foreach ($this->langArray as $langData) {
            if(isset($_POST['name'][$langData['lang']]) && $_POST['name'][$langData['lang']]!=null && $_POST['name'][$langData['lang']]!="") {
                $local = true;
            }
        }
        if (!$local) {
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должнo быть заполненo полe 'Название'";
        }
        return !$error;
    }
    
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = parent::getOriginalPostValue('unit');
        $this->insertValue['type'] = parent::getOriginalPostValue('type');
        $this->insertValue['show'] = "1";
        $this->insertValue['showOnMain'] = "0";
        $this->insertValue['sequence'] = parent::getOriginalPostValue('sequence');
        $this->insertValue['email'] = parent::getOriginalPostValue('email');
        $this->insertValue['feedbackEmail'] = parent::getOriginalPostValue('feedbackEmail');
        $this->insertValue['phoneText1'] = parent::getOriginalPostValue('phoneText1');
        $this->insertValue['phone1'] = parent::getOriginalPostValue('phone1');
        $this->insertValue['additional1'] = parent::getOriginalPostValue('additional1');
        $this->insertValue['phoneText2'] = parent::getOriginalPostValue('phoneText2');
        $this->insertValue['phone2'] = parent::getOriginalPostValue('phone2');
        $this->insertValue['additional2'] = parent::getOriginalPostValue('additional2');
        $this->insertValue['monH_s'] = parent::getOriginalPostValue('monH_s');
        $this->insertValue['monM_s'] = parent::getOriginalPostValue('monM_s');
        $this->insertValue['monH_e'] = parent::getOriginalPostValue('monH_e');
        $this->insertValue['monM_e'] = parent::getOriginalPostValue('monM_e');
        $this->setDefaltInputDays('mon');
        $this->setDefaltInputDays('tue');
        $this->setDefaltInputDays('wed');
        $this->setDefaltInputDays('thu');
        $this->setDefaltInputDays('fri');
        $this->setDefaltInputDays('sat');
        $this->setDefaltInputDays('sun');
        $this->insertValue['map'] = "noMap";
        $this->insertValue['showMap'] = "0";
        $this->insertValue['name']=array();
        $this->insertValue['adress']=array();
        $this->insertValue['postAdress']=array();
        $this->insertValue['text']=array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['name'][$langData['lang']] = "";
            $this->insertValue['adress'][$langData['lang']] = "";
            $this->insertValue['postAdress'][$langData['lang']] = "";
            $this->insertValue['text'][$langData['lang']] = "";
        }
        if(isset($_POST['name']) && $_POST['name']!=null && $_POST['name']!="") {
            foreach ($_POST['name'] as $key => $value) {
                $this->insertValue['name'][$key] = $value;
            }
        }
        if(isset($_POST['adress']) && $_POST['adress']!=null && $_POST['adress']!="") {
            foreach ($_POST['adress'] as $key => $value) {
                $this->insertValue['adress'][$key] = $value;
            }
        }
        if(isset($_POST['postAdress']) && $_POST['postAdress']!=null && $_POST['postAdress']!="") {
            foreach ($_POST['postAdress'] as $key => $value) {
                $this->insertValue['postAdress'][$key] = $value;
            }
        }
        if(isset($_POST['text']) && $_POST['text']!=null && $_POST['text']!="") {
            foreach ($_POST['text'] as $key => $value) {
                $this->insertValue['text'][$key] = $value;
            }
        }
        $this->originalInsertValue = $this->insertValue;
    }
    
    protected function insertExecute() {
        parent::insertExecute();
        $queryContactsUnits = "INSERT INTO `ContactsUnits` SET ";
        $queryContactsUnits .= "`unit` = '".$this->insertValue['alias']."', ";
        $queryContactsUnits .= "`show` = '".$this->insertValue['show']."', ";
        $queryContactsUnits .= "`showOnMain` = '".$this->insertValue['showOnMain']."', ";
        $queryContactsUnits .= "`type` = '".$this->insertValue['type']."', ";
        $queryContactsUnits .= "`sequence` = '".$this->insertValue['sequence']."', ";
        $queryContactsUnits .= "`email` = '".$this->insertValue['email']."', ";
        $queryContactsUnits .= "`feedbackEmail` = '".$this->insertValue['feedbackEmail']."', ";
        $queryContactsUnits .= "`phoneText1` = '".$this->insertValue['phoneText1']."', ";
        $queryContactsUnits .= "`phone1` = '".$this->insertValue['phone1']."', ";
        $queryContactsUnits .= "`phoneText2` = '".$this->insertValue['phoneText2']."', ";
        $queryContactsUnits .= "`phone2` = '".$this->insertValue['phone2']."', ";
        $queryContactsUnits .= "`additional1` = '".$this->insertValue['additional1']."', ";
        $queryContactsUnits .= "`additional2` = '".$this->insertValue['additional2']."', ";
        $queryContactsUnits .= $this->setQueryDays('mon');
        $queryContactsUnits .= $this->setQueryDays('tue');
        $queryContactsUnits .= $this->setQueryDays('wed');
        $queryContactsUnits .= $this->setQueryDays('thu');
        $queryContactsUnits .= $this->setQueryDays('fri');
        $queryContactsUnits .= $this->setQueryDays('sat');
        $queryContactsUnits .= $this->setQueryDays('sun',false);
        
        $queryContactsUnits_Lang = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['name'][$langData['lang']]) && $this->insertValue['name'][$langData['lang']]!=null && 
                    $this->insertValue['name'][$langData['lang']]!="") {
                $queryLang = "INSERT INTO `ContactsUnits_Lang` SET ";
                $queryLang .= "`unit` = '".$this->insertValue['alias']."', ";
                $queryLang .= "`lang` = '".$langData['lang']."', ";
                $queryLang .= "`name` = '".$this->insertValue['name'][$langData['lang']]."', ";
                $queryLang .= "`adress` = ".InputValueHelper::mayByNull($this->insertValue['adress'][$langData['lang']]).", ";
                $queryLang .= "`postAdress` = ".InputValueHelper::mayByNull($this->insertValue['postAdress'][$langData['lang']]).", ";
                $queryLang .= "`text` = ".InputValueHelper::mayByNull($this->insertValue['text'][$langData['lang']])."; ";
                $queryContactsUnits_Lang[] = $queryLang;
            }
        }
        
        $queryContactsUnitsMaps = "INSERT INTO `ContactsUnitsMaps` SET ";
        $queryContactsUnitsMaps .= "`unit` = '".$this->insertValue['alias']."', ";
        $queryContactsUnitsMaps .= "`map` = '".$this->insertValue['map']."', ";
        $queryContactsUnitsMaps .= "`show` = '".$this->insertValue['showMap']."'; ";
        
        if ($this->SQL_HELPER->insert($queryContactsUnits)) {
            foreach($queryContactsUnits_Lang as $queryContactsUnits_Lg) {
                $this->SQL_HELPER->insert($queryContactsUnits_Lg);
            }
            $this->uploadImage();
            if ($this->insertValue['map'] != 'noMap') {
            $this->SQL_HELPER->insert($queryContactsUnitsMaps);
            } 
        } else {
            echo 'Данные не были добавлены. Попробуйте позже.';
        }
    }
    
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // unit
        $unit = $this->inputHelper->paternTextBox('unit', 'unit', 'unit', 100, true, 'Латиница, цифры и знаки - и _', '[A-Za-z0-9_-]{3,100}', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($unit, true, 'Объект');
        // type
        $type = $this->inputHelper->select('type', 'type', $this->getContactsUnitsTypes(), true, $this->originalInsertValue['type']);
        $html .= $this->inputHelper->createFormRow($type, true, 'Тип');
        // show
        $show = $this->inputHelper->select('show', 'show', $this->yes_no, true, $this->originalInsertValue['show']);
        $html .= $this->inputHelper->createFormRow($show, true, 'Отображать ( объект )');
        // showOnMain
        $showOnMain = $this->inputHelper->select('showOnMain', 'showOnMain', $this->yes_no, true, $this->originalInsertValue['showOnMain']);
        $html .= $this->inputHelper->createFormRow($showOnMain, true, 'Отображать ( объект ) на главной странице');
        // sequence
        $sequence = $this->inputHelper->paternTextBox('sequence', 'sequence', 'sequence', 5, true, "", "^[\d]+$", $this->originalInsertValue['sequence']);
        $html .= $this->inputHelper->createFormRow($sequence, true, 'Последовательность показа');
        // email
        $email = $this->inputHelper->paternTextBox('email', 'email', 'email', 100, false, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['email']);
        $html .= $this->inputHelper->createFormRow($email, false, 'E-mail');
        // feedbackEmail
        $feedbackEmail = $this->inputHelper->paternTextBox('feedbackEmail', 'feedbackEmail', 'feedbackEmail', 100, false, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['feedbackEmail']);
        $html .= $this->inputHelper->createFormRow($feedbackEmail, false, 'E-mail для отзыва');
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
        // day
        $html .= $this->getInputBlocksDays('mon', 'Понедельник');
        $html .= $this->getInputBlocksDays('tue', 'Вторник');
        $html .= $this->getInputBlocksDays('wed', 'Среда');
        $html .= $this->getInputBlocksDays('thu', 'Четверг');
        $html .= $this->getInputBlocksDays('fri', 'Пятница');
        $html .= $this->getInputBlocksDays('sat', 'Суббота');
        $html .= $this->getInputBlocksDays('sun', 'Воскресенье');
        // map
        $map = $this->inputHelper->select('map', 'map', $this->getContactsUnitsMaps(), false, $this->originalInsertValue['map']);
        $html .= $this->inputHelper->createFormRow($map, false, 'Карта');
        // showMap
        $showMap = $this->inputHelper->select('showMap', 'showMap', $this->yes_no, false, $this->originalInsertValue['showMap']);
        $html .= $this->inputHelper->createFormRow($showMap, false, 'Отображать ( карту )');
        // image
        $image = '<input type="file" class="unitImage" name="unitImage" id="unitImage">';
        $html .= $this->inputHelper->createFormRow($image, true, 'Изображение');
        return $html;
    }
    
    protected function getInputLangBlocks($lang) {
        $html = parent::getInputLangBlocks($lang);
        // name
        $name = $this->inputHelper->textBox('name['.$lang.']', 'name', 'name', 100, false, $this->originalInsertValue['name'][$lang]);
        $html .= $this->inputHelper->createFormRow($name, false, 'Название');
        // adress
        $adress = $this->inputHelper->textarea('adress['.$lang.']', 'adress', 'adress', 200, false, $this->originalInsertValue['adress'][$lang]);
        $html .= $this->inputHelper->createFormRow($adress, false, 'Адрес');
        // postAdress
        $postAdress = $this->inputHelper->textarea('postAdress['.$lang.']', 'postAdress', 'postAdress', 50000, false, $this->originalInsertValue['postAdress'][$lang]);
        $html .= $this->inputHelper->createFormRow($postAdress, false, 'Описание');
        // text
        $text = $this->inputHelper->textarea('text['.$lang.']', 'text', 'text', 50000, false, $this->originalInsertValue['text'][$lang]);
        $html .= $this->inputHelper->createFormRow($text, false, 'Информация');
        return $html;
    }
    
    private function setDefaltInputDays($day) {
        $keyHS = $day.'H_s';
        $keyMS = $day.'M_s';
        $keyHE = $day.'H_e';
        $keyME = $day.'M_e';
        $this->insertValue[$keyHS] = parent::getOriginalPostValue($keyHS);
        $this->insertValue[$keyMS] = parent::getOriginalPostValue($keyMS);
        $this->insertValue[$keyHE] = parent::getOriginalPostValue($keyHE);
        $this->insertValue[$keyME] = parent::getOriginalPostValue($keyME);
    }
    
    private function getInputBlocksDays($day, $dayName) {
        $keyHS = $day.'H_s';
        $keyMS = $day.'M_s';
        $keyHE = $day.'H_e';
        $keyME = $day.'M_e';
        $dayH_s = $this->inputHelper->paternTextBox($keyHS, $keyHS, 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue[$keyHS]);
        $dayM_s = $this->inputHelper->paternTextBox($keyMS, $keyMS, 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue[$keyMS]);
        $dayH_e = $this->inputHelper->paternTextBox($keyHE, $keyHE, 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue[$keyHE]);
        $dayM_e = $this->inputHelper->paternTextBox($keyME, $keyME, 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue[$keyME]);
        $dayoff = '<input type="checkbox" name="ContactsUnitsDayoff'.$day.'" id="ContactsUnitsDayoffSun" class="ContactsUnitsDayoff" value="sun" onclick="changeContactsUnitsDayoff(\''.$day.'\')">';
        $days = '<div class="ContactsUnitsWrapper" id="'.$day.'">Начало работы '.$dayH_s.':'.$dayM_s.' Окончание работы '.$dayH_e.':'.$dayM_e.'</div>';
        $dayoffWrapper = '<div class="ContactsUnitsDayoffWrapper" id="ContactsUnitsDayoffWrapper">Выходной '.$dayoff.'</div>';
        $html = $this->inputHelper->createFormRow($days.$dayoffWrapper, false, $dayName);
        return $html;
    }
    
    private function setQueryDays($day, $flag=true) {
        $keyHS = $day.'H_s';
        $keyMS = $day.'M_s';
        $keyHE = $day.'H_e';
        $keyME = $day.'M_e';
        $query = "`".$keyHS."` = ".InputValueHelper::mayByNull($this->insertValue[$keyHS]).", ";
        $query .= "`".$keyMS."` = ".InputValueHelper::mayByNull($this->insertValue[$keyMS]).", ";
        $query .= "`".$keyHE."` = ".InputValueHelper::mayByNull($this->insertValue[$keyHE]).", ";
        if ($flag == false) {
            $query .= "`".$keyME."` = ".InputValueHelper::mayByNull($this->insertValue[$keyME]).";";
        } else {
            $query .= "`".$keyME."` = ".InputValueHelper::mayByNull($this->insertValue[$keyME]).", ";
        }
        return $query;
    }
    
    private function uploadImage() {
        if (isset($_POST['AP_Submit']) && $_POST['AP_Submit'] != '' && $_POST['AP_Submit'] != null) {
            // Проверяем загружен ли файл
            if(is_uploaded_file($_FILES["unitImage"]["tmp_name"])) {
                if (file_exists($this->dir)) { 
                    $this->dir; 
                } else {
                    mkdir($this->dir, 0777, true);
                    chmod($this->dir, 0777);
                    $this->dir; 
                }
                $extension = $this->getExtension();
                // Если файл загружен успешно, перемещаем его из временной директории в конечную
                move_uploaded_file($_FILES["unitImage"]["tmp_name"], $this->dir.$this->insertValue['alias'].".".$extension);
            } else {
                echo "Ошибка загрузки файла";
            }
        } else {
            echo "Выберите файл";
        }
    }
    
    private function getExtension() {
        $type = $_FILES["unitImage"]["type"];
        $extension = explode('/', $type);
        if ($extension[1] == 'jpeg') {
            $extension[1] = 'jpg';
        }
        return $extension[1];
    }
    
    private function checkExtension() {
        $type = $_FILES["unitImage"]["type"];
        $accepts = "image/jpeg,image/png";
        $acceptMas = explode(",", $accepts);
        foreach ($acceptMas as $accept) {
            if ($type == $accept) {
                return true;
            }
        }
    }

    private function checkAliasOrSequence($key) {
        $result = array();
        if(isset($_POST[$key]) && $_POST[$key]!=null && $_POST[$key]!="") {
            $query = "SELECT * FROM `ContactsUnits` WHERE `".$key."`='".$_POST[$key]."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
    
    private function getContactsUnitsTypes() {
        $type = array();
        $query = "SELECT * FROM `ContactsUnitsTypes` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $type[$key]['text'] = $this->getContactsUnitsTypesText($value['type']);
            $type[$key]['value'] = $value['type'];
        }
        return $type;
    }  

    private function getContactsUnitsTypesText($type) {
        $typeName = "";
        $this->langHelper = new LangHelper("ContactsUnitsTypes_Lang","lang","type",$type,$this->thisLang);
        $this->langType = $this->langHelper->getLangType();
        if($this->langType != -1){
            $langData = $this->langHelper->getLangData();
            $typeName = $langData["typeName"];
        }
        return $typeName;
    }
    
    private function getContactsUnitsMaps() {
        $map = array();
        $query = "SELECT * FROM `Maps` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $map[$key]['text'] = $value['alias'];
            $map[$key]['value'] = $value['alias'];
        }
        $map[$key+1]['text'] = 'Карты нет';
        $map[$key+1]['value'] = 'noMap';
        return $map;
    }
    
    private function setDayTime($day) {
        $keyHS = $day.'H_s';
        $keyMS = $day.'M_s';
        $keyHE = $day.'H_e';
        $keyME = $day.'M_e';
        $this->insertValue[$keyHS] = parent::getPostValue($keyHS);
        $this->insertValue[$keyMS] = parent::getPostValue($keyMS);
        $this->insertValue[$keyHE] = parent::getPostValue($keyHE);
        $this->insertValue[$keyME] = parent::getPostValue($keyME); 
        if ($this->insertValue[$keyHS] != null && 
            $this->insertValue[$keyHE] != null  ) {
            $this->insertValue[$keyMS] = "0";
            $this->insertValue[$keyME] = "0";
        }
    }
    
    private function checkTimeStartAndEndH($start, $startM, $end, $endM) {
        if ($_POST[$start] == $_POST[$end]) {
            return $_POST[$startM] < $_POST[$endM];
        } else {
            return $_POST[$start] < $_POST[$end];
        }
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
    
    private function checkValueDay($day, $dayName) {
        $error = false;
        $keyHS = $day.'H_s';
        $keyMS = $day.'M_s';
        $keyHE = $day.'H_e';
        $keyME = $day.'M_e';
        if (!isset($_POST['ContactsUnitsDayoff'.$day]) ) {
            if ($_POST[$keyHS] == null || $_POST[$keyHE] == null) {
            $error = true;
            $this->checkAllValueErrors[] = "Вы не заполнили '".$dayName."' ";
            }
        } 
        if (isset($_POST[$keyHS]) && $_POST[$keyHS] != '' && $_POST[$keyHS] != null && 
                isset($_POST[$keyHE]) && $_POST[$keyHE] != '' && $_POST[$keyHE] != null ) {
            if(!$this->checkValue($keyHS,"/(^[0-1]?\d{1}$)|(^[2][0-3]$)/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if(!$this->checkValue($keyHE,"/(^[0-1]?\d{1}$)|(^[2][0-3]$)/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if (isset($_POST[$keyMS]) && $_POST[$keyMS] != '' && $_POST[$keyMS] != null && 
                    isset($_POST[$keyME]) && $_POST[$keyME] != '' && $_POST[$keyME] != null ) {
                if(!$this->checkValue($keyMS,"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
                if(!$this->checkValue($keyME,"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
            }
            if (!$this->checkTimeStartAndEndH($keyHS, $keyMS, $keyHE, $keyME)) {
                $error = true;
                $this->checkAllValueErrors[] = "Время начала работы не может быть больше, чем время окончания работы";
            } 
        }
        return !$error;
    }
}