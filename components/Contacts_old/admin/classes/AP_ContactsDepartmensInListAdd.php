<?php
/**
 * Description of AP_ContactsListDepartmensAdd
 *
 * @author olga
 */
class AP_ContactsDepartmensInListAdd extends AdminPanel_ComponentPanelUI_Element_Add {
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
//     * Установка значений ввода по умолчанию
//     */
//    protected function setDefaltInput() { 
//        parent::setDefaltInput();
//        $this->insertValue['department'] = parent::getOriginalPostValue('department');
//        $this->insertValue['list'] = parent::getOriginalPostValue('list');
//        $this->insertValue['sequence'] = parent::getOriginalPostValue('sequence');
//        $this->insertValue['showWorkersContacts'] = parent::getOriginalPostValue('showWorkersContacts');
//        $this->insertValue['showDescription'] = parent::getOriginalPostValue('showDescription');
//        $this->insertValue['showInfo'] = parent::getOriginalPostValue('showInfo');
//        $this->insertValue['showTimeTable'] = parent::getOriginalPostValue('showInfo');
//        $this->originalInsertValue = $this->insertValue;
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
//        if(!$this->checkAlias()) {
//            $error = true;
//            $this->checkAllValueErrors[] = "Такой отдел уже находится в этом списке";
//        }
//        if(!$this->checkValue('sequence',"/^\d{1,3}$/")) {
//            $error = true;
//            $this->checkAllValueErrors[] = "Выберите значение";
//        }
//        
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
//    /**
//     * Выполнение вставки в таблицы
//     */
//    protected function insertExecute() {
//        parent::insertExecute();
//        $queryContactDepartments_has_ContactDepartmentsList = "INSERT INTO `ContactDepartments_has_ContactDepartmentsList` SET ";
//        $queryContactDepartments_has_ContactDepartmentsList .= "`department`='".$this->insertValue['department']."', ";
//        $queryContactDepartments_has_ContactDepartmentsList .= "`list`='".$this->insertValue['list']."', ";
//        $queryContactDepartments_has_ContactDepartmentsList .= "`sequence`='".$this->insertValue['sequence']."', ";
//        $queryContactDepartments_has_ContactDepartmentsList .= "`showWorkersContacts`='".$this->insertValue['showWorkersContacts']."', ";
//        $queryContactDepartments_has_ContactDepartmentsList .= "`showDescription`='".$this->insertValue['showDescription']."', ";
//        $queryContactDepartments_has_ContactDepartmentsList .= "`showInfo`='".$this->insertValue['showInfo']."', ";
//        $queryContactDepartments_has_ContactDepartmentsList .= "`showTimeTable`='".$this->insertValue['showTimeTable']."';";
//        
//        $this->SQL_HELPER->insert($queryContactDepartments_has_ContactDepartmentsList);
//    }
//    
//    /* Новые функции */
//    
//    private function checkAlias() {
//        $result = array();
//        if(isset($_POST['department']) && $_POST['department']!=null && $_POST['department']!="" && isset($_POST['list']) && $_POST['list']!=null && $_POST['list']!="") {
//            $query = "SELECT * FROM `ContactDepartments_has_ContactDepartmentsList` WHERE `department`='".$_POST['department']."' AND `list`='".$_POST['list']."';";
//            $result = $this->SQL_HELPER->select($query,1);
//        }
//        return $result == null;
//    }
//    
//    private function getListSelectData() {
//        $lists = array();
//        $query = "SELECT * FROM `ContactDepartmentsList` ;";
//        $result = $this->SQL_HELPER->select($query);
//        foreach ($result as $key => $value) {
//            $lists[$key]['text'] = $value['alias'];
//            $lists[$key]['value'] = $value['alias'];
//            $lists[$key]['checked'] = "0";
//        }
//        return $lists;
//    }    
//    
//    private function getDepartmentSelectData() {
//        $departments = array();
//        $query = "SELECT * FROM `ContactDepartments` ;";
//        $result = $this->SQL_HELPER->select($query);
//        foreach ($result as $key => $value) {
//            $departments[$key]['text'] = $this->getDepartmensDataText($value['alias']);
//            $departments[$key]['value'] = $value['alias'];
//            $departments[$key]['checked'] = "0";
//        }
//        return $departments;
//    }
//    
//    private function getDepartmensDataText($department) {
//        $departments = "";
//        $this->langHelper = new LangHelper("ContactDepartments_Lang","lang","department",$department,$this->thisLang);
//        $this->langType = $this->langHelper->getLangType();
//        if($this->langType != -1){
//            $langData = $this->langHelper->getLangData();
//            $departments = $langData["name"];
//        }
//        return $departments;
//    }
}