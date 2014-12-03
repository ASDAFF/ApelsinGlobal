<?php
/**
 * Description of AP_VacanciesEdit
 *
 * @author olga
 */
class AP_VacanciesEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // name
        $name = $this->inputHelper->paternTextBox('name', 'name', 'name', 100, true, 'Кирилица, латиница и тире', '[А-Яа-яЁёЙйЦцA-Za-z0-9-_\)\(\s]{2,100}',  $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($name, true, 'Название');
        // responsibility
        $responsibility = $this->inputHelper->textarea('responsibility', 'responsibility', 'responsibility', 50000, false, $this->originalInsertValue['responsibility']);
        $html .= $this->inputHelper->createFormRow($responsibility, false, 'Обязанности');
        // terms
        $terms = $this->inputHelper->textarea('terms', 'terms', 'terms', 50000, false, $this->originalInsertValue['terms']);
        $html .= $this->inputHelper->createFormRow($terms, false, 'Условия');
        // requirements
        $requirements = $this->inputHelper->textarea('requirements', 'requirements', 'requirements', 50000, false, $this->originalInsertValue['requirements']);
        $html .= $this->inputHelper->createFormRow($requirements, false, 'Требования');
        // importance
        $importance = $this->inputHelper->paternTextBox('importance', 'importance', 'importance', 2, true, "", "^[\d]+$", $this->originalInsertValue['importance']);
        $html .= $this->inputHelper->createFormRow($importance, true, 'Степень востребованности должности');
        return $html;
    }
        
    /**
     * Проверка значений
     */
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('name',"/[^А-ЯA-Z]{1}[А-ЯA-Zа-яa-z0-9-_\)\(\s]{1,99}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Название указывается с большой буквы.";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такое название уже используется";
        }
        // importance
        if(!$this->checkValue('importance',"/^[\d]+$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены только цифры";
        }
        if(!$this->checkImportance()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такая cтепень уже существует";
        }
        return !$error;
    }
    
    protected function getData() {
        parent::getData();
        $this->editElement = urldecode($this->editElement);
        $this->data = array();
        $query = "SELECT * FROM `Vacancies` WHERE `name`='".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
    } 
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = $this->data['name'];
        $this->insertValue['responsibility'] = $this->data['responsibility'];
        $this->insertValue['terms'] = $this->data['terms'];
        $this->insertValue['requirements'] = $this->data['requirements'];
        $this->insertValue['importance'] = $this->data['importance'];
        $this->originalInsertValue = $this->insertValue;
    }
     
    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('name');
        $this->insertValue['responsibility'] = parent::getPostValue('responsibility');
        $this->insertValue['terms'] = parent::getPostValue('terms');
        $this->insertValue['requirements'] = parent::getPostValue('requirements');
        $this->insertValue['importance'] = parent::getPostValue('importance');
    }
    
    /**
     * Выполнение изменения в таблице
     */
    protected function updateExecute() {
        parent::updateExecute();
        $queryVacancies = "UPDATE `Vacancies` SET ";
        $queryVacancies .= "`name`='".$this->insertValue['alias']."', ";
        $queryVacancies .= "`responsibility`='".$this->insertValue['responsibility']."', ";
        $queryVacancies .= "`terms`=".InputValueHelper::mayByNull($this->insertValue['terms']).", ";
        $queryVacancies .= "`requirements`=".InputValueHelper::mayByNull($this->insertValue['requirements']).", ";
        $queryVacancies .= "`importance`=".InputValueHelper::mayByNull($this->insertValue['importance'])." ";
        $queryVacancies .= " WHERE `name`='".$this->editElement."';";
        
        $this->SQL_HELPER->insert($queryVacancies);
    }
    
    /* Новые функции */
    
    
    protected function checkEditElement() {
        $query = "SELECT * FROM `Vacancies` WHERE `name`= '". urldecode($this->editElement)."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result)>1;
    }
    
    protected function getNewEditElementID() {
        parent::getNewEditElementID();
        return urldecode($this->insertValue['alias']);
    }   
    
    private function checkAlias() {
        if($this->editElement == $_POST['name']) {
            return true;
        }
        $result = array();
        if(isset($_POST['name']) && $_POST['name']!=null && $_POST['name']!="") {
            $query = "SELECT * FROM `Vacancies` WHERE `name`='".$_POST['name']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
    
    private function checkImportance() {
        $result = array();
        if(isset($_POST['importance']) && $_POST['importance']!=null && $_POST['importance']!="") {
            $query = "SELECT * FROM `Vacancies` WHERE `importance`='".$_POST['importance']."' AND `name`!='".$this->editElement."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}