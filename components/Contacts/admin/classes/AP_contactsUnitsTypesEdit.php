<?php

class AP_contactsUnitsTypesEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
    private $dir = './resources/Components/Contacts/UnitsTypes/';
    private $typeLang;

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
        // imageOld
        $imageOld = '<img src="'.$this->getImageData().'?rel='.rand(1,999).'" style="max-height:300px; max-width:300px;" />';
        $html .= $this->inputHelper->createFormRow($imageOld, false, 'Загруженное изображение');
        // image
        $image = '<input type="file" class="unitImage" name="unitImage" id="unitImage">';
        $html .= $this->inputHelper->createFormRow($image, false, 'Сменить изображение');
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
     
    protected function checkAllValue() {         
        parent::checkAllValue(); 
        $error = false;
        if(!$this->checkValue('type',"/^[A-Za-z0-9_-]{3,100}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены латинские буквы, цифры и щаник тире и нижнее подчеркивание";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        if(!$this->checkValue('show',"/^[0-1]{1}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите значение";
        }
        if(!$this->checkSequence()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой приоритет уже используется";
        }
        if(!$this->checkValue('sequence',"/^[\d]+$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены только цифры";
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
        if(!$local){
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должны быть заполнено поле 'Название типа'";
        }
        return !$error;
    }
    
    protected function getData() {
        parent::getData();
        $this->data = array();
        $this->typeLang = array();
        $query = "SELECT * FROM `ContactsUnitsTypes` WHERE `type`='".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
        $query = "SELECT * FROM `ContactsUnitsTypes_Lang` WHERE `type`='".$this->editElement."';";
        $this->typeLang = $this->SQL_HELPER->select($query);
    } 
    
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = $this->data['type'];
        $this->insertValue['show'] = $this->data['show'];
        $this->insertValue['sequence'] = $this->data['sequence'];
        $this->insertValue['typeName'] = array();
        $this->insertValue['topText'] = array();
        $this->insertValue['bottomText'] = array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['typeName'][$langData['lang']] = "";
            $this->insertValue['topText'][$langData['lang']] = "";
            $this->insertValue['bottomText'][$langData['lang']] = "";
        }
        foreach ($this->typeLang as $langData) {
            $this->insertValue['typeName'][$langData['lang']] = $langData['typeName'];
            $this->insertValue['topText'][$langData['lang']] = $langData['topText'];
            $this->insertValue['bottomText'][$langData['lang']] = $langData['bottomText'];
        }
        $this->originalInsertValue = $this->insertValue;
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
    
    protected function updateExecute() {
        parent::updateExecute();
        $queryContactsUnitsTypes = "UPDATE `ContactsUnitsTypes` SET ";
        $queryContactsUnitsTypes .= "`type` = '".$this->insertValue['alias']."', ";
        $queryContactsUnitsTypes .= "`sequence` = '".$this->insertValue['sequence']."', ";
        $queryContactsUnitsTypes .= "`show` = '".$this->insertValue['show']."'";
        $queryContactsUnitsTypes .= " WHERE `type`='".$this->editElement."';";
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
        
        $queryContactsUnitsTypes_LangDel = "DELETE FROM  `ContactsUnitsTypes_Lang` WHERE  `type` = '".$this->editElement."';";
        
        if ($this->SQL_HELPER->insert($queryContactsUnitsTypes)) {
            $this->SQL_HELPER->insert($queryContactsUnitsTypes_LangDel);
            foreach($queryContactsUnitsTypes_Lang as $queryContactsUnitsTypes_Lg) {
                $this->SQL_HELPER->insert($queryContactsUnitsTypes_Lg);
            }
            $this->uploadImage();
        } else {
            echo 'Данные не были добавлены. Попробуйте позже.';
        }
    }
    
    protected function checkEditElement() {
        $query = "SELECT * FROM `ContactsUnitsTypes` WHERE `type`= '". $this->editElement."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result) > 1;
    }
    
    private function checkAlias() {
        if($this->editElement == $_POST['type']) {
            return true;
        }
        $result = array();
        if(isset($_POST['type']) && $_POST['type']!=null && $_POST['type']!="") {
            $query = "SELECT * FROM `ContactsUnitsTypes` WHERE `type`='".$_POST['type']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
    
    private function checkSequence() {
        $result = array();
        if(isset($_POST['sequence']) && $_POST['sequence']!=null && $_POST['sequence']!="") {
            $query = "SELECT * FROM `ContactsUnitsTypes` WHERE `sequence`='".$_POST['sequence']."' AND `type`!='".$this->editElement."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
    
    private function getImageData() {
        if(file_exists($this->dir.$this->data['type'].".png")) {
            $desiredValue = $this->dir.$this->data['type'].".png";
            if ($desiredValue != null && $desiredValue != '') { 
                return $desiredValue; 
            }
        } elseif (file_exists($this->dir.$this->data['type'].".jpg")) {
            $desiredValue = $this->dir.$this->data['type'].".jpg";
            if ($desiredValue != null && $desiredValue != '') { 
                return $desiredValue; 
            }
        } else {
            echo "Файла с таким названием не существует";
        }
    }
    
    private function uploadImage() {
        $oldImage = $this->getImageData();
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
                unlink($oldImage);
                $extension = $this->getExtension();
                // Если файл загружен успешно, перемещаем его из временной директории в конечную
                move_uploaded_file($_FILES["unitImage"]["tmp_name"], $this->dir.$this->insertValue['alias'].".".$extension);
            } else {
                $extension = strrchr($oldImage, "." ) ;
                rename($oldImage, $this->dir.$this->insertValue['alias'].$extension);
            }
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
}