<?php
/**
 * Description of AP_ContactsWorkersAdd
 *
 * @author olga
 */
class AP_ContactsWorkersAdd extends AdminPanel_ComponentPanelUI_Element_Add {
    
    protected function getElementID() {
        return $this->insertValue['alias'];
    }
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // id
        $id = $this->inputHelper->paternTextBox('id', 'id', 'id', 200, true, 'Кирилица', '^[А-ЯЁ][а-яё]+\s[А-ЯЁ][а-яё]+(\s[А-ЯЁ][а-яё]+)?$',  $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($id, true, 'ФИО');
        // post
        $post = $this->inputHelper->select('post', 'post', $this->getPostSelectData(), true, $this->originalInsertValue['post']);
        $html .= $this->inputHelper->createFormRow($post, true, 'Занимаемая должность');
        // email1
        $email1 = $this->inputHelper->paternTextBox('email1', 'email1', 'email1', 200, true, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['email1']);
        $html .= $this->inputHelper->createFormRow($email1, true, 'Email1');
        // email2
        $email2 = $this->inputHelper->paternTextBox('email2', 'email2', 'email2', 200, false, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['email2']);
        $html .= $this->inputHelper->createFormRow($email2, false, 'Email2');
        // phone1  additional1
        $phone1 = $this->inputHelper->paternTextBox('phone1', 'phone1', 'phoneBox', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phone1']);
        $additional1 = $this->inputHelper->paternTextBox('additional1', 'additional1', ' phoneBox', 9, false, 'добавочный', '^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$', $this->originalInsertValue['additional1']);
        $html .= $this->inputHelper->createFormRow("Телефон: ".$phone1."Добавочный: ".$additional1, false, 'Phone1');
        // phone2  additional2
        $phone2 = $this->inputHelper->paternTextBox('phone2', 'phone2', 'phoneBox', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phone2']);
        $additional2 = $this->inputHelper->paternTextBox('additional2', 'additional2', 'phoneBox', 9, false, 'добавочный', '^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$', $this->originalInsertValue['additional2']);
        $html .= $this->inputHelper->createFormRow("Телефон: ".$phone2."Добавочный: ".$additional2, false, 'Phone2');
        // list
        $list = $this->inputHelper->select('list', 'list', $this->getListSelectData(), true, $this->originalInsertValue['list']);
        $html .= $this->inputHelper->createFormRow($list, true, 'Список');
        return $html;
    }
    
    /**
     * Генерация форм ввода зависимых от языка
     */
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
        
    /**
     * Проверка значений
     */
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('id',"/^[А-ЯЁ][а-яё]+\s[А-ЯЁ][а-яё]+(\s[А-ЯЁ][а-яё]+)?$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Имя указывается с большой буквы.";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        // email
        if(!$this->checkValue('email1',"/^([A-Za-z0-9_\.-]+)@([A-Za-z0-9_\.-]+)\.([A-Za-z\.]{2,6})$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Указан некорректный Email.";
        }
        if (isset($_POST['email2']) && $_POST['email2'] != '' && $_POST['email2'] != null) {
            if(!$this->checkValue('email2',"/^([A-Za-z0-9_\.-]+)@([A-Za-z0-9_\.-]+)\.([A-Za-z\.]{2,6})$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Указан некорректный Email.";
            }
        }
        //phone
        if (isset($_POST['phone1']) && $_POST['phone1'] != '' && $_POST['phone1'] != null) {
        if(!$this->checkValue('phone1',"/^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$/")) {
            $error = true;
                $this->checkAllValueErrors[] = "Неверно указан номер телефона1. Данные добавляются без пробелов";
            }
        }
        if (isset($_POST['phone2']) && $_POST['phone2'] != '' && $_POST['phone2'] != null) {
            if(!$this->checkValue('phone2',"/^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Неверно указан номер телефона2. Данные добавляются без пробелов";
            }
        }
        //additional
        if (isset($_POST['additional1']) && $_POST['additional1'] != '' && $_POST['additional1'] != null) {
            if(!$this->checkValue('additional1',"/^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Добавочный номер указывается в виде 3 или 4 цифр, в случае двух добавочных они перечисляются через знак / без пробелов";
            }
        }
        if (isset($_POST['additional2']) && $_POST['additional2'] != '' && $_POST['additional2'] != null) {
            if(!$this->checkValue('additional2',"/^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Добавочный номер указывается в виде 3 или 4 цифр, в случае двух добавочных они перечисляются через знак / без пробелов";
            } 
        }
        //post
        if(!$this->checkValue('post')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите должность";
        }
        //list
        if(!$this->checkValue('list')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите список";
        }
        //lang
        $local = false;
        foreach ($this->langArray as $langData) {
            if(isset($_POST['fio'][$langData['lang']]) && $_POST['fio'][$langData['lang']]!=null && $_POST['fio'][$langData['lang']]!="") {
                $local = true;
            }
        }
        if(!$local){
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должны быть заполнено полу 'ФИО'";
        }
        return !$error;
    }
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = parent::getOriginalPostValue('id');
        $this->insertValue['post'] = parent::getOriginalPostValue('post');
        $this->insertValue['email1'] = parent::getOriginalPostValue('email1');
        $this->insertValue['email2'] = parent::getOriginalPostValue('email2');
        $this->insertValue['phone1'] = parent::getOriginalPostValue('phone1');
        $this->insertValue['additional1'] = parent::getOriginalPostValue('additional1');
        $this->insertValue['phone2'] = parent::getOriginalPostValue('phone2');
        $this->insertValue['additional2'] = parent::getOriginalPostValue('additional2');
        
        $this->insertValue['fio']=array();
        $this->insertValue['info']=array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['fio'][$langData['lang']] = "";
            $this->insertValue['info'][$langData['lang']] = "";
        }
        if(isset($_POST['fio']) && $_POST['fio']!=null && $_POST['fio']!="") {
            foreach ($_POST['fio'] as $key => $value) {
                $this->insertValue['fio'][$key] = $value;
            }
        }
        if(isset($_POST['info']) && $_POST['info']!=null && $_POST['info']!="") {
            foreach ($_POST['info'] as $key => $value) {
                $this->insertValue['info'][$key] = $value;
            }
        }
        //list
        $this->insertValue['list'] = parent::getPostValue('list');
        $this->originalInsertValue = $this->insertValue;
    }
     
    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('id');
        //email
        $this->insertValue['email1'] = parent::getPostValue('email1');
        $this->insertValue['email2'] = parent::getPostValue('email2');
        //phone
        $this->insertValue['phone1'] = parent::getPostValue('phone1');
        $this->insertValue['phone2'] = parent::getPostValue('phone2');
        //additional
        $this->insertValue['additional1'] = parent::getPostValue('additional1');
        $this->insertValue['additional2'] = parent::getPostValue('additional2');
        //lang
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
        //post
        $this->insertValue['post'] = parent::getPostValue('post');
        //list
        $this->insertValue['list'] = parent::getPostValue('list');
    }
    
    /**
     * Выполнение вставки в таблицы
     */
    protected function insertExecute() {
        parent::insertExecute();
        $queryContactsWorkers = "INSERT INTO `ContactsWorkers` SET ";
        $queryContactsWorkers .= "`id`='".$this->insertValue['alias']."', ";
        $queryContactsWorkers .= "`post`='".$this->insertValue['post']."', ";
        $queryContactsWorkers .= "`email1`=".InputValueHelper::mayByNull($this->insertValue['email1']).", ";
        $queryContactsWorkers .= "`email2`=".InputValueHelper::mayByNull($this->insertValue['email2']).", ";
        $queryContactsWorkers .= "`phone1`=".InputValueHelper::mayByNull($this->insertValue['phone1']).", ";
        $queryContactsWorkers .= "`phone2`=".InputValueHelper::mayByNull($this->insertValue['phone2']).", ";
        $queryContactsWorkers .= "`additional1`=".InputValueHelper::mayByNull($this->insertValue['additional1']).", ";
        $queryContactsWorkers .= "`additional2`=".InputValueHelper::mayByNull($this->insertValue['additional2'])."; ";
        
        $queryContactsWorkers_Lang = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['fio'][$langData['lang']]) && $this->insertValue['fio'][$langData['lang']]!=null && 
                    $this->insertValue['fio'][$langData['lang']]!="") {
                $queryLang = "INSERT INTO `ContactsWorkers_Lang` SET ";
                $queryLang .= "`worker`='".$this->insertValue['alias']."', ";
                $queryLang .= "`lang`='".$langData['lang']."', ";
                $queryLang .= "`fio`='".$this->insertValue['fio'][$langData['lang']]."', ";
                $queryLang .= "`info`='".$this->insertValue['info'][$langData['lang']]."';";
                $queryContactsWorkers_Lang[] = $queryLang;
            }
        }
        
        $this->SQL_HELPER->insert($queryContactsWorkers);
        
        foreach($queryContactsWorkers_Lang as $queryContactsWorkers_Lg) {
            $this->SQL_HELPER->insert($queryContactsWorkers_Lg);
        }
        
        if (isset($this->insertValue['list']) && $this->insertValue['list'] == "0" || $this->insertValue['list'] == null) {
            $queryContactsWorkers_has_ContactsWorkersList = "";
        } else {
            $queryContactsWorkers_has_ContactsWorkersList = "INSERT INTO `ContactsWorkers_has_ContactsWorkersList` SET ";
            $queryContactsWorkers_has_ContactsWorkersList .= "`contact`='".$this->insertValue['alias']."', ";
            $queryContactsWorkers_has_ContactsWorkersList .= "`list`='".$this->insertValue['list']."' ";
            $queryContactsWorkers_has_ContactsWorkersList .= ";";
            $this->SQL_HELPER->insert($queryContactsWorkers_has_ContactsWorkersList);
        }
    }
    
    /* Новые функции */

    private function getListSelectData() {
        $list = array();
        $query = "SELECT * FROM `ContactsWorkersList` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $list[$key]['text'] = $value['alias'];
            $list[$key]['value'] = $value['alias'];
        }
//            $list[$key]['text'] = "Без списка контактов";
//            $list[$key]['value'] = "0";
        return $list;
    }

    private function getPostSelectData() {
        $post = array();
        $query = "SELECT * FROM `ContactsWorkersPosts` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $post[$key]['text'] = $value['alias'];
            $post[$key]['value'] = $value['alias'];
        }
        return $post;
    }
    
    private function checkAlias() {
        $result = array();
        if(isset($_POST['id']) && $_POST['id']!=null && $_POST['id']!="") {
            $query = "SELECT * FROM `ContactsWorkers` WHERE `id`='".$_POST['id']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }

}