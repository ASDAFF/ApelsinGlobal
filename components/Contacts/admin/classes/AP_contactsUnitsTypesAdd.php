<?php

class AP_contactsUnitsTypesAdd  extends AdminPanel_ComponentPanelUI_Element_Add {
    
    private $dir = './resources/Components/Contacts/UnitsTypes/';

    protected function getElementID() {
        return $this->insertValue['alias'];
    }
   
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('type');
        $this->insertValue['show'] = parent::getPostValue('show');
        $this->insertValue['sequence'] = parent::getPostValue('sequence');
        if(isset($_POST['typeName']) && $_POST['typeName']!=null && $_POST['typeName']!="") {
            foreach ($_POST['typeName'] as $key => $value) {
                $this->insertValue['typeName'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['topText']) && $_POST['topText']!=null && $_POST['topText']!="") {
            foreach ($_POST['topText'] as $key => $value) {
                $this->insertValue['topText'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['bottomText']) && $_POST['bottomText']!=null && $_POST['bottomText']!="") {
            foreach ($_POST['bottomText'] as $key => $value) {
                $this->insertValue['bottomText'][$key] = parent::getMysqlText($value);
            }
        }
    }
    
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('type',"/^[A-Za-z0-9_-]{3,100}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены латинские буквы, цифры и щаник тире и нижнее подчеркивание";
        }
        if(!$this->checkAliasOrSequence('type')) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        if(!$this->checkValue('show',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkValue('sequence',"/^[\d]+$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены только цифры";
        }
        if(!$this->checkAliasOrSequence('sequence')) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой приоритет уже используется";
        }
        $image = false;
            if (isset($_FILES['unitImage']) && $_FILES['unitImage']['name'] != null && $_FILES['unitImage']['name'] != "") {
                $image = true;
        }
        if (!$image) {
            $error = true;
            $this->checkAllValueErrors[] = "Загрузите изображение";
        }
        if(!$this->checkExtension()) {
            $error = true;
            $this->checkAllValueErrors[] = "Не поддерживаемый тип изображения. Допустимы jpeg и png";
        }
        $local = false;
        foreach ($this->langArray as $langData) {
            if(isset($_POST['typeName'][$langData['lang']]) && $_POST['typeName'][$langData['lang']]!=null && $_POST['typeName'][$langData['lang']]!="") {
                $local = true;
            }
        }
        if (!$local) {
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должны быть заполнено поле 'Название типа'";
        }
        return !$error;
    }
    
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = parent::getOriginalPostValue('type');
        $this->insertValue['show'] = "1";
        $this->insertValue['sequence'] = parent::getOriginalPostValue('sequence');
        $this->insertValue['typeName'] = array();
        $this->insertValue['topText'] = array();
        $this->insertValue['bottomText'] = array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['typeName'][$langData['lang']] = "";
            $this->insertValue['topText'][$langData['lang']] = "";
            $this->insertValue['bottomText'][$langData['lang']] = "";
        }
        if(isset($_POST['typeName']) && $_POST['typeName']!=null && $_POST['typeName']!= "") {
            foreach ($_POST['typeName'] as $key => $value) {
                $this->insertValue['typeName'][$key] = $value;
            }
        }
        if(isset($_POST['topText']) && $_POST['topText']!=null && $_POST['topText']!= "") {
            foreach ($_POST['topText'] as $key => $value) {
                $this->insertValue['topText'][$key] = $value;
            }
        }
        if(isset($_POST['bottomText']) && $_POST['bottomText']!=null && $_POST['bottomText']!= "") {
            foreach ($_POST['bottomText'] as $key => $value) {
                $this->insertValue['bottomText'][$key] = $value;
            }
        }
        $this->originalInsertValue = $this->insertValue;
    }
    
    protected function insertExecute() {
        parent::insertExecute();
        $queryContactsUnitsTypes = "INSERT INTO `ContactsUnitsTypes` SET ";
        $queryContactsUnitsTypes .= "`type` = '".$this->insertValue['alias']."', ";
        $queryContactsUnitsTypes .= "`sequence` = '".$this->insertValue['sequence']."', ";
        $queryContactsUnitsTypes .= "`show` = '".$this->insertValue['show']."';";
        $queryContactsUnitsTypes_Lang = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['typeName'][$langData['lang']]) && $this->insertValue['typeName'][$langData['lang']]!=null && 
                    $this->insertValue['typeName'][$langData['lang']]!="") {
                $query = "INSERT INTO `ContactsUnitsTypes_Lang` SET ";
                $query .= "`type` = '".$this->insertValue['alias']."', ";
                $query .= "`lang` = '".$langData['lang']."', ";
                $query .= "`typeName` = '".$this->insertValue['typeName'][$langData['lang']]."', ";
                $query .= "`topText` = ".InputValueHelper::mayByNull($this->insertValue['topText'][$langData['lang']]).", ";
                $query .= "`bottomText` = ".InputValueHelper::mayByNull($this->insertValue['bottomText'][$langData['lang']])."; ";
                $queryContactsUnitsTypes_Lang[] = $query;
            }
        }
        if ($this->SQL_HELPER->insert($queryContactsUnitsTypes)) {
            foreach($queryContactsUnitsTypes_Lang as $queryContactsUnitsTypes_Lg) {
                $this->SQL_HELPER->insert($queryContactsUnitsTypes_Lg);
            }
            $this->uploadImage();
        } else {
            echo 'Данные не были добавлены. Попробуйте позже.';
        }
    }
    
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // type
        $type = $this->inputHelper->paternTextBox('type', 'type', 'type', 100, true, 'Латиница, цифры и знаки - и _', '[A-Za-z0-9_-]{3,100}', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($type, true, 'Type');
        // show
        $show = $this->inputHelper->select('show', 'show', $this->yes_no, true, $this->originalInsertValue['show']);
        $html .= $this->inputHelper->createFormRow($show, true, 'Показывать');
        // sequence
        $sequence = $this->inputHelper->paternTextBox('sequence', 'sequence', 'sequence', 1, true, "", "^[\d]+$", $this->originalInsertValue['sequence']);
        $html .= $this->inputHelper->createFormRow($sequence, true, 'Последовательность показа');
        // image
        $image = '<input type="file" class="unitImage" name="unitImage" id="unitImage">';
        $html .= $this->inputHelper->createFormRow($image, true, 'Изображение');
        return $html;
    }
    
    protected function getInputLangBlocks($lang) {
        $html = parent::getInputLangBlocks($lang);
        // typeName
        $typeName = $this->inputHelper->textBox('typeName['.$lang.']', 'typeName', 'typeName', 200, false, $this->originalInsertValue['typeName'][$lang]);
        $html .= $this->inputHelper->createFormRow($typeName, false, 'Название');
        // topText
        $topText = $this->inputHelper->textarea('topText['.$lang.']', 'topText', 'topText', 50000, false, $this->originalInsertValue['topText'][$lang]);
        $html .= $this->inputHelper->createFormRow($topText, false, 'Верхний текст');
        // bottomText
        $bottomText = $this->inputHelper->textarea('bottomText['.$lang.']', 'bottomText', 'bottomText', 50000, false, $this->originalInsertValue['bottomText'][$lang]);
        $html .= $this->inputHelper->createFormRow($bottomText, false, 'Нижний текст');
        return $html;
    }
    
    private function uploadImage() {
        if (isset($_POST['AP_Submit']) && $_POST['AP_Submit'] != '' && $_POST['AP_Submit'] != null) {
            // Проверяем загружен ли файл
            if(is_uploaded_file($_FILES["unitImage"]["tmp_name"])) {
                if (file_exists($this->dir)) { 
                    $this->dir; 
                } else {
                    mkdir($this->dir, 0777, true);
                    chmod($this->dir, 0777);
                    $this->dir; 
                }
                $extension = $this->getExtension();
                // Если файл загружен успешно, перемещаем его из временной директории в конечную
                move_uploaded_file($_FILES["unitImage"]["tmp_name"], $this->dir.$this->insertValue['alias'].".".$extension);
            } else {
                echo "Ошибка загрузки файла";
            }
        } else {
            echo "Выберите файл";
        }
    }
    
    private function getExtension() {
        $type = $_FILES["unitImage"]["type"];
        $extension = explode('/', $type);
        if ($extension[1] == 'jpeg') {
            $extension[1] = 'jpg';
        }
        return $extension[1];
    }
    
    private function checkExtension() {
        $type = $_FILES["unitImage"]["type"];
        $accepts = "image/jpeg,image/png";
        $acceptMas = explode(",", $accepts);
        foreach ($acceptMas as $accept) {
            if ($type === $accept) {
                return true;
            }
        }
    }
    
    private function checkAliasOrSequence($key) {
        $result = array();
        if(isset($_POST[$key]) && $_POST[$key]!=null && $_POST[$key]!="") {
            $query = "SELECT * FROM `ContactsUnitsTypes` WHERE `".$key."`='".$_POST[$key]."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}