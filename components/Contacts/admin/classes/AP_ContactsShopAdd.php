<?php
/**
 * Description of AP_ContactsShopAdd
 *
 * @author olga
 */
class AP_ContactsShopAdd extends AdminPanel_ComponentPanelUI_Element_Add {   
    
    protected function getElementID() {
        return $this->insertValue['alias'];
    }  
    
    /**
     * Проверка значений
     */
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('alias',"/^[A-Za-z0-9_-]{3,100}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены латинские буквы, цифры и щаник тире и нижнее подчеркивание";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        //map
        if(!$this->checkValue('map')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите карту";
        }
        //workers
        if(!$this->checkValue('workers')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите список";
        }
        // reviewsEmail
        if(!$this->checkValue('reviewsEmail',"/^([A-Za-z0-9_\.-]+)@([A-Za-z0-9_\.-]+)\.([A-Za-z\.]{2,6})$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Указан некорректный E-mail.";
        }
        //lang
        $local = false;
        foreach ($this->langArray as $langData) {
            if(isset($_POST['name'][$langData['lang']]) && $_POST['name'][$langData['lang']]!=null && $_POST['name'][$langData['lang']]!="" ) {
                $local = true;
            }
        }
        if(!$local){
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должнo быть заполненo полe 'Название' ";
        }
        return !$error;
    }
     
    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('alias');
        //map
        $this->insertValue['map'] = parent::getPostValue('map');
        //workers
        $this->insertValue['workers'] = parent::getPostValue('workers');
        //reviewsEmail
        $this->insertValue['reviewsEmail'] = parent::getPostValue('reviewsEmail');
        //lang
        if(isset($_POST['name']) && $_POST['name']!=null && $_POST['name']!="") {
            foreach ($_POST['name'] as $key => $value) {
                $this->insertValue['name'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['description']) && $_POST['description']!=null && $_POST['description']!="") {
            foreach ($_POST['description'] as $key => $value) {
                $this->insertValue['description'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['info']) && $_POST['info']!=null && $_POST['info']!="") {
            foreach ($_POST['info'] as $key => $value) {
                $this->insertValue['info'][$key] = parent::getMysqlText($value);
            }
        }
    }
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // alias
        $alias = $this->inputHelper->paternTextBox('alias', 'alias', 'alias', 100, true, 'Латиница, цифры и знаки - и _', '[A-Za-z0-9_-]{3,100}', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($alias, true, 'Alias');
        // map
        $map = $this->inputHelper->select('map', 'map', $this->getMapSelectData(), true, $this->originalInsertValue['map']);
        $html .= $this->inputHelper->createFormRow($map, true, 'Карта');
        // workers
        $workers = $this->inputHelper->select('workers', 'workers', $this->getWorkersSelectData(), true, $this->originalInsertValue['workers']);
        $html .= $this->inputHelper->createFormRow($workers, true, 'Список работников');
        // reviewsEmail
        $email1 = $this->inputHelper->paternTextBox('reviewsEmail', 'reviewsEmail', 'reviewsEmail', 200, true, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['reviewsEmail']);
        $html .= $this->inputHelper->createFormRow($email1, true, 'Адрес E-mail для отзывов');
        return $html;
    }
    
    /**
     * Генерация форм ввода зависимых от языка
     */
    protected function getInputLangBlocks($lang) {
        $html = parent::getInputLangBlocks($lang);
        // name
        $name = $this->inputHelper->textBox('name['.$lang.']', 'name', 'name', 100, false, $this->originalInsertValue['name'][$lang]);
        $html .= $this->inputHelper->createFormRow($name, false, 'Название');
        // description
        $description = $this->inputHelper->textarea('description['.$lang.']', 'description', 'description', 50000, false, $this->originalInsertValue['description'][$lang]);
        $html .= $this->inputHelper->createFormRow($description, false, 'Описание');
        // info
        $info = $this->inputHelper->textarea('info['.$lang.']', 'info', 'info', 50000, false, $this->originalInsertValue['info'][$lang]);
        $html .= $this->inputHelper->createFormRow($info, false, 'Информация');
        return $html;
    }
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = parent::getOriginalPostValue('alias');
        $this->insertValue['map'] = parent::getOriginalPostValue('map');
        $this->insertValue['workers'] = parent::getOriginalPostValue('workers');
        $this->insertValue['reviewsEmail'] = parent::getOriginalPostValue('reviewsEmail');
        $this->insertValue['name'] = array();
        $this->insertValue['description'] = array();
        $this->insertValue['info'] = array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['name'][$langData['lang']] = "";
            $this->insertValue['description'][$langData['lang']] = "";
            $this->insertValue['info'][$langData['lang']] = "";
        }
        if(isset($_POST['name']) && $_POST['name']!=null && $_POST['name']!="") {
            foreach ($_POST['name'] as $key => $value) {
                $this->insertValue['name'][$key] = $value;
            }
        }
        if(isset($_POST['description']) && $_POST['description']!=null && $_POST['description']!="") {
            foreach ($_POST['description'] as $key => $value) {
                $this->insertValue['description'][$key] = $value;
            }
        }
        if(isset($_POST['info']) && $_POST['info']!=null && $_POST['info']!="") {
            foreach ($_POST['info'] as $key => $value) {
                $this->insertValue['info'][$key] = $value;
            }
        }
        $this->originalInsertValue = $this->insertValue;
    }
    
    /**
     * Выполнение вставки в таблицы
     */
    protected function insertExecute() {
        parent::insertExecute();
        $queryShop = "INSERT INTO `ContactsShop` SET ";
        $queryShop .= "`alias`='".$this->insertValue['alias']."', ";
        $queryShop .= "`map`='".$this->insertValue['map']."', ";
        $queryShop .= "`workers`='".$this->insertValue['workers']."', ";
        $queryShop .= "`reviewsEmail`='".$this->insertValue['reviewsEmail']."'; ";
        
        $queryShopBuilding_Lang = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['name'][$langData['lang']]) && $this->insertValue['name'][$langData['lang']]!=null && 
                    $this->insertValue['name'][$langData['lang']]!="") {
                $queryLang = "INSERT INTO `ContactsShop_Lang` SET ";
                $queryLang .= "`shop`='".$this->insertValue['alias']."', ";
                $queryLang .= "`lang`='".$langData['lang']."', ";
                $queryLang .= "`name`='".$this->insertValue['name'][$langData['lang']]."', ";
                $queryLang .= "`description`='".$this->insertValue['description'][$langData['lang']]."', ";
                $queryLang .= "`info`='".$this->insertValue['info'][$langData['lang']]."';";
                $queryShopBuilding_Lang[] = $queryLang;
            }
        }
        
        $this->SQL_HELPER->insert($queryShop);
        
        foreach($queryShopBuilding_Lang as $queryShopBuilding_Lg) {
            $this->SQL_HELPER->insert($queryShopBuilding_Lg);
        }
    }

    /* Новые функции */
    
    private function checkAlias() {
        $result = array();
        if(isset($_POST['alias']) && $_POST['alias']!=null && $_POST['alias']!="") {
            $query = "SELECT * FROM `ContactsShop` WHERE `alias`='".$_POST['alias']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
    
    private function getWorkersSelectData() {
        $workers = array();
        $query = "SELECT * FROM `ContactsWorkersList` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $workers[$key]['text']=$value['alias'];
            $workers[$key]['value']=$value['alias'];
            $workers[$key]['checked']="0";
        }
        return $workers;
    }
    
    private function getMapSelectData() {
        $map = array();
        $query = "SELECT * FROM `Maps` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $map[$key]['text']=$value['alias'];
            $map[$key]['value']=$value['alias'];
            $map[$key]['checked']="0";
        }
        return $map;
    }
}