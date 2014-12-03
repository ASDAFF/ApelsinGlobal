<?php
/**
 * Description of AP_ContactDepartmentsListAdd
 *
 * @author olga
 */
class AP_ContactDepartmentsListAdd extends AdminPanel_ComponentPanelUI_Element_Add {
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // alias
        $alias = $this->inputHelper->paternTextBox('alias', 'alias', 'alias', 100, true, 'Латиница', '[A-Za-z]{3,100}', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($alias, true, 'Alias');
        return $html;
    }
    
    protected function getElementID() {
        return $this->insertValue['alias'];
    }
    
    /**
     * Проверка значений
     */
    protected function checkAllValue() {          
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('alias',"/^[A-Za-z]{3,100}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены латинские буквы";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        return !$error;
    }
     
    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('alias');
    }
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = parent::getOriginalPostValue('alias');
        $this->originalInsertValue = $this->insertValue;
    }
    
    /**
     * Выполнение вставки в таблицы
     */
    protected function insertExecute() {
        parent::insertExecute();
        $queryDepartmentsList = "INSERT INTO `ContactDepartmentsList` SET ";
        $queryDepartmentsList .= "`alias`='".$this->insertValue['alias']."'; ";
        
        $this->SQL_HELPER->insert($queryDepartmentsList);
    }
    
    private function checkAlias() {
        $result = array();
        if(isset($_POST['alias']) && $_POST['alias']!=null && $_POST['alias']!="") {
            $query = "SELECT * FROM `ContactDepartmentsList` WHERE `alias`='".$_POST['alias']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}