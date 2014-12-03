<?php
/**
 * Description of AP_VacanciesAdressEdit
 *
 * @author olga
 */
class AP_VacanciesAdressEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
    private $pageData;

    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // adress
        $adress = $this->inputHelper->paternTextBox('adress', 'adress', 'adress', 100, true, 'Кирилица', '[А-Яа-яЁёЙйЦцA-Za-z0-9-_\)\(\s]{2,100}', $this->originalInsertValue['adress']);
        $html .= $this->inputHelper->createFormRow($adress, true, 'Адрес');
        // page
        $page = $this->inputHelper->select('page', 'page', $this->getVacanciesAdressPagesData(), true, $this->originalInsertValue['page']);
        $html .= $this->inputHelper->createFormRow($page, true, 'Страница');
        return $html;
    }
        
    /**
     * Проверка значений
     */
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('adress',"/[^А-ЯA-Z]{1}[А-ЯA-Zа-яa-z0-9-_\)\(\s]{1,99}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Адрес указывается с большой буквы.";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такое название уже используется";
        }
        //page
        if(!$this->checkValue('page')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите страницу";
        }
        return !$error;
    }
     
    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['adress'] = parent::getPostValue('adress');
        $this->insertValue['page'] = parent::getPostValue('page');
    }
    
    
    protected function getData() {
        parent::getData();
        $this->editElement = urldecode($this->editElement);
        $this->data = array();
        $query = "SELECT * FROM `VacanciesAdress` WHERE `adress`='".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
        $query = "SELECT `page` FROM `VacanciesAdressPages` WHERE `adress`='".$this->editElement."';";
        $this->pageData = $this->SQL_HELPER->select($query,1);
    } 
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['adress'] = $this->data['adress'];
        
        if ($this->pageData < 0 || $this->pageData == null) {
            $this->insertValue['page'] = "0";
        } else {
            $this->insertValue['page'] = $this->pageData['page'];
        }
        $this->originalInsertValue = $this->insertValue;
    }
    
    /**
     * Выполнение вставки в таблицы
     */
    protected function updateExecute() {
        parent::updateExecute();
        $queryVacanciesAdress = "UPDATE `VacanciesAdress` SET ";
        $queryVacanciesAdress .= "`adress`='".$this->insertValue['adress']."' ";
        $queryVacanciesAdress .= " WHERE `adress`='".$this->editElement."';";
        
        $this->SQL_HELPER->insert($queryVacanciesAdress);
        
        $queryVacanciesAdressPagesDel = "DELETE FROM `VacanciesAdressPages` WHERE `adress` =  '".$this->editElement."';";
        $this->SQL_HELPER->insert($queryVacanciesAdressPagesDel);
        
        if (isset($this->insertValue['page']) && $this->insertValue['page'] == "0" || $this->insertValue['page'] == null) {
            $queryVacanciesAdressPages = "";
        } else {
            $queryVacanciesAdressPages = "INSERT INTO `VacanciesAdressPages` SET ";
            $queryVacanciesAdressPages .= "`adress`='".$this->insertValue['adress']."', ";
            $queryVacanciesAdressPages .= "`page`='".$this->insertValue['page']."' ";
            $queryVacanciesAdressPages .= ";";
            $this->SQL_HELPER->insert($queryVacanciesAdressPages);
        }
    }
    

    /* Новые функции */

    private function getVacanciesAdressPagesData() {
        $list = array();
        $query = "SELECT DISTINCT `page` FROM `VacanciesAdressPages` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $list[$key]['text'] = $value['page'];
            $list[$key]['value'] = $value['page'];
        }
            $list[$key]['text'] = "Без страницы";
            $list[$key]['value'] = "0";
        return $list;
    }
    
    protected function checkEditElement() {
        $query = "SELECT * FROM `VacanciesAdress` WHERE `adress`= '". urldecode($this->editElement)."';";
        $result = $this->SQL_HELPER->select($query,1);
        return $result != null;
    }
    
    protected function getNewEditElementID() {
        return urldecode($this->insertValue['adress']);
    }   
    
    private function checkAlias() {
        if($this->editElement == urldecode($_POST['adress'])) {
            return true;
        }
        $result = array();
        if(isset($_POST['adress']) && $_POST['adress']!=null && $_POST['adress']!="") {
            $query = "SELECT * FROM `VacanciesAdress` WHERE `adress`='".$_POST['adress']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}