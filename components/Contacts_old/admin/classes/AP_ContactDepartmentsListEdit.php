<?php
/**
 * Description of AP_ContactDepartmentsListEdit
 *
 * @author olga
 */
class AP_ContactDepartmentsListEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
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
    
    protected function getData() {
        parent::getData();
        $this->data = array();
        $query = "SELECT * FROM `ContactDepartmentsList` WHERE `alias`='".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
    }  
    
    /**
     * Выполнение изменения в таблице
     */
    protected function updateExecute() {
        parent::updateExecute();
        $queryDepartmentsList = "UPDATE `ContactDepartmentsList` SET ";
        $queryDepartmentsList .= "`alias`='".$this->insertValue['alias']."' ";
        $queryDepartmentsList .= " WHERE `alias`='".$this->editElement."';";
        
        $this->SQL_HELPER->insert($queryDepartmentsList);
    }   
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() {
        parent::setDefaltInput();
        $this->insertValue['alias'] = $this->data['alias'];
        $this->originalInsertValue = $this->insertValue;
    } 
    
    protected function checkEditElement() {
        $query = "SELECT * FROM `ContactDepartmentsList` WHERE `alias`='".$this->editElement."';";
        $result = $this->SQL_HELPER->select($query,1);
        return $result != null;
    }
    
    protected function getNewEditElementID() {
        return $this->insertValue['alias'];
    }  
    
    private function checkAlias() {
        if($this->editElement == $_POST['alias']) {
            return true;
        }
        $result = array();
        if(isset($_POST['alias']) && $_POST['alias']!=null && $_POST['alias']!="") {
            $query = "SELECT * FROM `ContactDepartmentsList` WHERE `alias`='".$_POST['alias']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}