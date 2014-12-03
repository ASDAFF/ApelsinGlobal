<?php
/**
 * Description of AP_ContactsWorkersListAdd
 *
 * @author olga
 */
class AP_ContactsWorkersListAdd extends AdminPanel_ComponentPanelUI_Element_Add {
    
    protected function getElementID() {
        return $this->insertValue['alias'];
    }
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // alias
        $alias = $this->inputHelper->paternTextBox('alias', 'alias', 'alias', 100, true, 'Кирилица', '[А-Яа-яЁёЙйЦц]{2,100}', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($alias, true, 'Alias');
        // column
        $column = $this->inputHelper->paternTextBox('column', 'column', 'column', 2, true, "", "^[\d]+$", $this->originalInsertValue['column']);
        $html .= $this->inputHelper->createFormRow($column, true, 'Количество колонок');
        // contact
        $contact = $this->inputHelper->select('contact', 'contact', $this->getContactSelectData(), true, $this->originalInsertValue['contact']);
        $html .= $this->inputHelper->createFormRow($contact, true, 'Контакт');
        return $html;
    }
    
    /**
     * Проверка значений
     */
    protected function checkAllValue() {          
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('alias',"/[^А-ЯA-Z]{1}[а-яa-z]{1,99}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешена кирилица, название списка указывается с большой буквы";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        if(!$this->checkValue('column',"/^[\d]+$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены только цифры";
        }
        //contact
        if(!$this->checkValue('contact')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите контакт";
        }
        return !$error;
    }
     
    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('alias');
        //column
        $this->insertValue['column'] = parent::getPostValue('column');
        //contact
        $this->insertValue['contact'] = parent::getPostValue('contact');
    }
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = parent::getOriginalPostValue('alias');
        $this->insertValue['column'] = parent::getOriginalPostValue('column');
        $this->insertValue['contact'] = parent::getOriginalPostValue('contact');
        $this->originalInsertValue = $this->insertValue;
    }
    
    /**
     * Выполнение вставки в таблицы
     */
    protected function insertExecute() {
        parent::insertExecute();
        $queryWorkersList = "INSERT INTO `ContactsWorkersList` SET ";
        $queryWorkersList .= "`alias`='".$this->insertValue['alias']."', ";
        $queryWorkersList .= "`column`='".$this->insertValue['column']."'; ";
        
        $this->SQL_HELPER->insert($queryWorkersList);
        
        if (isset($this->insertValue['contact']) && $this->insertValue['contact'] == "0" || $this->insertValue['contact'] == null) {
            $queryContactsWorkers_has_ContactsWorkersList = "";
        } else {
            $queryContactsWorkers_has_ContactsWorkersList = "INSERT INTO `ContactsWorkers_has_ContactsWorkersList` SET ";
            $queryContactsWorkers_has_ContactsWorkersList .= "`contact`='".$this->insertValue['contact']."', ";
            $queryContactsWorkers_has_ContactsWorkersList .= "`list`='".$this->insertValue['alias']."' ";
            $queryContactsWorkers_has_ContactsWorkersList .= ";";
            $this->SQL_HELPER->insert($queryContactsWorkers_has_ContactsWorkersList);
        }
    }

    /* Новые функции */

    private function getContactSelectData() {
        $list = array();
        $query = "SELECT * FROM `ContactsWorkers` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $list[$key]['text'] = $value['id'];
            $list[$key]['value'] = $value['id'];
        }
            $list[$key]['text'] = "Без списка контактов";
            $list[$key]['value'] = "0";
        return $list;
    }
    
    private function checkAlias() {
        $result = array();
        if(isset($_POST['alias']) && $_POST['alias']!=null && $_POST['alias']!="") {
            $query = "SELECT * FROM `ContactsWorkersList` WHERE `alias`='".$_POST['alias']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}