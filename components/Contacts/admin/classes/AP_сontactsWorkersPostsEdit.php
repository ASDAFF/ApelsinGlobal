<?php
class AP_сontactsWorkersPostsEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
    private $postLang;
    
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // post
        $post = $this->inputHelper->paternTextBox('post', 'post', 'post', 100, true, 'Кирилица', '^А-ЯA-Z]{1}[А-ЯA-Zа-яa-z-\.]{1,99}+',  $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($post, true, 'Название должности');
        // sequence
        $sequence = $this->inputHelper->paternTextBox('sequence', 'sequence', 'sequence', 2, true, "", "^[\d]+$", $this->originalInsertValue['sequence']);
        $html .= $this->inputHelper->createFormRow($sequence, true, 'Степень важности занимаемой должности');
        return $html;
    }
    
    protected function getInputLangBlocks($lang) {
        $html = parent::getInputLangBlocks($lang);
        // postName
        $postName = $this->inputHelper->textarea('postName['.$lang.']', 'postName', 'postName', 50000, false, $this->originalInsertValue['postName'][$lang]);
        $html .= $this->inputHelper->createFormRow($postName, false, 'Информация');
        return $html;
    }
    
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if (!$this->checkValue('post',"/[^А-ЯA-Z]{1}[А-ЯA-Zа-яa-z-\.]{1,99}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешена кирилица, название должности указывается с большой буквы";
        }
        if (!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        // importance
        if (isset($_POST['sequence']) && $_POST['sequence']!=null && $_POST['sequence']!="") {
            if(!$this->checkValue('sequence',"/^[\d]+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры";
            }
        }
        if (!$this->checkSequence()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такая cтепень уже существует";
        }
        //lang
        $local = false;
        foreach ($this->langArray as $langData) {
            if (isset($_POST['postName'][$langData['lang']]) && $_POST['postName'][$langData['lang']]!=null && $_POST['postName'][$langData['lang']]!="" ) {
                $local = true;
            }
        }
        if (!$local){
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должнo быть заполненo полe 'Название' ";
        }
        return !$error;
    }
     
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('post');
        $this->insertValue['sequence'] = parent::getPostValue('sequence');
        //lang
        if (isset($_POST['postName']) && $_POST['postName']!=null && $_POST['postName']!="") {
            foreach ($_POST['postName'] as $key => $value) {
                $this->insertValue['postName'][$key] = parent::getMysqlText($value);
            }
        }
    }
    
    protected function getData() {
        parent::getData();
        $this->data = array();
        $this->typeLang = array();
        $query = "SELECT * FROM `ContactsWorkersPosts` WHERE `post`='".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
        $query = "SELECT * FROM `ContactsWorkersPosts_Lang` WHERE `post`='".$this->editElement."';";
        $this->postLang = $this->SQL_HELPER->select($query);
    } 
    
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        
        $this->insertValue['alias'] = $this->data['post'];
        $this->insertValue['sequence'] = $this->data['sequence'];
        $this->insertValue['postName'] = array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['postName'][$langData['lang']] = "";
        }
        $this->insertValue['postName'] = array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['postName'][$langData['lang']] = "";
        }
        foreach ($this->postLang as $langData) {
            $this->insertValue['postName'][$langData['lang']] = $langData['postName'];
        }
        $this->originalInsertValue = $this->insertValue;
    }
    
    protected function updateExecute() {
        parent::updateExecute();
        $queryWorkersPosts = "UPDATE `ContactsWorkersPosts` SET ";
        $queryWorkersPosts .= "`post`='".$this->insertValue['alias']."', ";
        $queryWorkersPosts .= "`sequence`=".InputValueHelper::mayByNull($this->insertValue['sequence'])."";
        $queryWorkersPosts .= " WHERE `post`='".$this->editElement."';";
        $queryWorkersPosts_Lang = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['postName'][$langData['lang']]) && $this->insertValue['postName'][$langData['lang']]!=null && 
                    $this->insertValue['postName'][$langData['lang']]!="") {
                $queryLang = "INSERT INTO `ContactsWorkersPosts_Lang` SET ";
                $queryLang .= "`post`='".$this->insertValue['alias']."',";
                $queryLang .= "`lang`='".$langData['lang']."',";
                $queryLang .= "`postName`='".$this->insertValue['postName'][$langData['lang']]."';";
                $queryWorkersPosts_Lang[] = $queryLang;
            }
        }
        
        $queryContactsUnitsTypes_LangDel = "DELETE FROM  `ContactsWorkersPosts_Lang` WHERE  `post` = '".$this->editElement."';";
        
        if ($this->SQL_HELPER->insert($queryWorkersPosts)) {
            $this->SQL_HELPER->insert($queryContactsUnitsTypes_LangDel);
            foreach($queryWorkersPosts_Lang as $queryWorkersPosts_Lg) {
                $this->SQL_HELPER->insert($queryWorkersPosts_Lg);
            }
        } else {
            echo 'Данные не были добавлены. Попробуйте позже.';
        }
    }
    
    protected function checkEditElement() {
        $query = "SELECT * FROM `ContactsWorkersPosts` WHERE `post`= '". $this->editElement."';";
        $result = $this->SQL_HELPER->select($query,1);
        return count($result) > 1;
    }
    
    private function checkAlias() {
        if($this->editElement == $_POST['post']) {
            return true;
        }
        $result = array();
        if(isset($_POST['post']) && $_POST['post']!=null && $_POST['post']!="") {
            $query = "SELECT * FROM `ContactsWorkersPosts` WHERE `post`='".$_POST['post']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
    
    private function checkSequence() {
        $result = array();
        if(isset($_POST['sequence']) && $_POST['sequence']!=null && $_POST['sequence']!="") {
            $query = "SELECT * FROM `ContactsWorkersPosts` WHERE `sequence`='".$_POST['sequence']."' AND `post`!='".$this->editElement."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}