<?php
/**
 * Description of AP_ContactsListDepartmensEdit
 *
 * @author olga
 */
class AP_ContactsDepartmensInListEdit extends AdminPanel_ComponentPanelUI_Element_Edit {  
//    
//    /**
//     * Генерация форм ввода не зависимых от языка
//     */
//    protected function getInputBlocks() { 
//        $html = parent::getInputBlocks();
//        // department
//        $department = $this->inputHelper->select('department', 'department', $this->getDepartmentSelectData(), true, $this->originalInsertValue['department']);
//        $html .= $this->inputHelper->createFormRow($department, true, 'Отдел');
//        // list
//        $list = $this->inputHelper->select('list', 'list', $this->getListSelectData(), true, $this->originalInsertValue['list']);
//        $html .= $this->inputHelper->createFormRow($list, true, 'Список отделов');
//        // sequence
//        $sequence = $this->inputHelper->paternTextBox('sequence', 'sequence', 'sequence', 3, true, "", "^\d{1,3}$", $this->originalInsertValue['sequence']);
//        $html .= $this->inputHelper->createFormRow($sequence, true, 'Приоритет показа');
//        // showWorkersContacts
//        $showWorkersContacts = $this->inputHelper->select('showWorkersContacts', 'showWorkersContacts', $this->yes_no, true, $this->originalInsertValue['showWorkersContacts']);
//        $html .= $this->inputHelper->createFormRow($showWorkersContacts, true, 'Показывать контакты работников');
//        // showDescription
//        $showDescription = $this->inputHelper->select('showDescription', 'showDescription', $this->yes_no, true, $this->originalInsertValue['showDescription']);
//        $html .= $this->inputHelper->createFormRow($showDescription, true, 'Показывать описание');
//        // showInfo
//        $showInfo = $this->inputHelper->select('showInfo', 'showInfo', $this->yes_no, true, $this->originalInsertValue['showInfo']);
//        $html .= $this->inputHelper->createFormRow($showInfo, true, 'Показывать информацию');
//        // showTimeTable
//        $showTimeTable = $this->inputHelper->select('showTimeTable', 'showTimeTable', $this->yes_no, true, $this->originalInsertValue['showTimeTable']);
//        $html .= $this->inputHelper->createFormRow($showTimeTable, true, 'Показывать рaсписание');
//        return $html;
//    }    
//    
//    /**
//     * Проверка значений
//     */
//    protected function checkAllValue() {         
//        parent::checkAllValue();
//        $error = false;
//        //department
//        if(!$this->checkValue('department')) {
//            $error = true;
//            $this->checkAllValueErrors[] = "Выберите отдел";
//        }
//        //list
//        if(!$this->checkValue('list')) {
//            $error = true;
//            $this->checkAllValueErrors[] = "Выберите список отделов";
//        }
//        if(!$this->checkValue('sequence',"/^\d{1,3}$/")) {
//            $error = true;
//            $this->checkAllValueErrors[] = "Выберите значение";
//        }
//        if(!$this->checkValue('showWorkersContacts',"/^[0-1]{1}$/")) {
//            $error = true;
//            $this->checkAllValueErrors[] = "Выберите значение";
//        }
//        if(!$this->checkValue('showDescription',"/^[0-1]{1}$/")) {
//            $error = true;
//            $this->checkAllValueErrors[] = "Выберите значение";
//        }
//        if(!$this->checkValue('showInfo',"/^[0-1]{1}$/")) {
//            $error = true;
//            $this->checkAllValueErrors[] = "Выберите значение";
//        }
//        if(!$this->checkValue('showTimeTable',"/^[0-1]{1}$/")) {
//            $error = true;
//            $this->checkAllValueErrors[] = "Выберите значение";
//        }
//        return !$error;
//    }    
//    
//    /**
//     * Получение значений
//     */
//    protected function getAllValue() {
//        parent::getAllValue();
//        $this->insertValue['department'] = parent::getPostValue('department');
//        $this->insertValue['list'] = parent::getPostValue('list');
//        $this->insertValue['sequence'] = parent::getPostValue('sequence');
//        $this->insertValue['showWorkersContacts'] = parent::getPostValue('showWorkersContacts');
//        $this->insertValue['showDescription'] = parent::getPostValue('showDescription');
//        $this->insertValue['showInfo'] = parent::getPostValue('showInfo');
//        $this->insertValue['showTimeTable'] = parent::getPostValue('showTimeTable');
//    }
//    
//    protected function getData() {
//        //???????????????????
//        parent::getData();
//        $this->data = array();
//        $query = "SELECT * FROM `ContactDepartments_has_ContactDepartmentsList` WHERE `list`='".$this->editElement."';";
//        $this->data = $this->SQL_HELPER->select($query,1);
//    }
}