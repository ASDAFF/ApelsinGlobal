<?php
/**
 * Description of AP_ContactsWorkersPostsAdd
 *
 * @author olga
 */
class AP_ContactsWorkersPostsAdd extends AdminPanel_ComponentPanelUI_Element_Add {
    
    protected function getElementID() {
        return $this->insertValue['alias'];
    }
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // alias
        $alias = $this->inputHelper->paternTextBox('alias', 'alias', 'alias', 100, true, 'Кирилица', '^А-ЯA-Z]{1}[А-ЯA-Zа-яa-z-\.]{1,99}+',  $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($alias, true, 'Название должности');
        // importance
        $importance = $this->inputHelper->paternTextBox('importance', 'importance', 'importance', 2, false, "", "^[\d]+$", $this->originalInsertValue['importance']);
        $html .= $this->inputHelper->createFormRow($importance, false, 'Степень важности занимаемой должности');
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
     * Проверка значений
     */
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('alias',"/[^А-ЯA-Z]{1}[А-ЯA-Zа-яa-z-\.]{1,99}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешена кирилица, название должности указывается с большой буквы";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        // importance
        if(isset($_POST['importance']) && $_POST['importance']!=null && $_POST['importance']!="") {
            if(!$this->checkValue('importance',"/^[\d]+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры";
            }
        }
        if(!$this->checkImportance()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такая cтепень уже существует";
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
        $this->insertValue['importance'] = parent::getPostValue('importance');
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
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = parent::getOriginalPostValue('alias');
        $this->insertValue['importance'] = parent::getOriginalPostValue('importance');
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
        $queryWorkersPosts = "INSERT INTO `ContactsWorkersPosts` SET ";
        $queryWorkersPosts .= "`alias`='".$this->insertValue['alias']."', ";
        $queryWorkersPosts .= "`importance`=".InputValueHelper::mayByNull($this->insertValue['importance']).";";
        $queryWorkersPosts_Lang = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['name'][$langData['lang']]) && $this->insertValue['name'][$langData['lang']]!=null && 
                    $this->insertValue['name'][$langData['lang']]!="") {
                $queryLang = "INSERT INTO `ContactsWorkersPosts_Lang` SET ";
                $queryLang .= "`post`='".$this->insertValue['alias']."', ";
                $queryLang .= "`lang`='".$langData['lang']."', ";
                $queryLang .= "`name`='".$this->insertValue['name'][$langData['lang']]."', ";
                $queryLang .= "`description`='".$this->insertValue['description'][$langData['lang']]."', ";
                $queryLang .= "`info`='".$this->insertValue['info'][$langData['lang']]."';";
                $queryWorkersPosts_Lang[] = $queryLang;
            }
        }
        
        $this->SQL_HELPER->insert($queryWorkersPosts);
        
        foreach($queryWorkersPosts_Lang as $queryWorkersPosts_Lg) {
            $this->SQL_HELPER->insert($queryWorkersPosts_Lg);
        }
    }

    /* Новые функции */
    
    private function checkAlias() {
        $result = array();
        if(isset($_POST['alias']) && $_POST['alias']!=null && $_POST['alias']!="") {
            $query = "SELECT * FROM `ContactsWorkersPosts` WHERE `alias`='".$_POST['alias']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }

    private function checkImportance() {
        $result = array();
        if(isset($_POST['importance']) && $_POST['importance']!=null && $_POST['importance']!="") {
            $query = "SELECT * FROM `ContactsWorkersPosts` WHERE `importance`='".$_POST['importance']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}