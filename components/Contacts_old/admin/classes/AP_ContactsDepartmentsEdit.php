<?php
/**
 * Description of AP_ContactsDepartmentsEdit
 *
 * @author olga
 */
class AP_ContactsDepartmentsEdit extends AdminPanel_ComponentPanelUI_Element_Edit {
    
    private $departmentLangData; 
    private $listDepartmentData;  
    private $dir = './resources/Components/Contacts/Departments/'; 
    
    /**
     * Проверка значений
     */
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('alias',"/^[A-Za-z0-9_-]{3,100}+$/u")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешены латинские буквы, цифры и щаник тире и нижнее подчеркивание";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой псевдоним уже используется";
        }
        // email
        if (isset($_POST['email2']) && $_POST['email2'] != '' && $_POST['email2'] != null) {
            if(!$this->checkValue('email2',"/^([A-Za-z0-9_\.-]+)@([A-Za-z0-9_\.-]+)\.([A-Za-z\.]{2,6})$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Указан некорректный Email.";
            }
        }
        if (isset($_POST['email2']) && $_POST['email2'] != '' && $_POST['email2'] != null) {
            if(!$this->checkValue('email2',"/^([A-Za-z0-9_\.-]+)@([A-Za-z0-9_\.-]+)\.([A-Za-z\.]{2,6})$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Указан некорректный Email.";
            }
        }
        //phone
        if (isset($_POST['phone1']) && $_POST['phone1'] != '' && $_POST['phone1'] != null) {
            if(!$this->checkValue('phone1',"/^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Неверно указан номер телефона. Данные добавляются без пробелов";
            }
        }
        if (isset($_POST['phone2']) && $_POST['phone2'] != '' && $_POST['phone2'] != null) {
            if(!$this->checkValue('phone2',"/^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Неверно указан номер телефона. Данные добавляются без пробелов";
            }
        }
        if (isset($_POST['phone3']) && $_POST['phone3'] != '' && $_POST['phone2'] != null) {
            if(!$this->checkValue('phone3',"/^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Неверно указан номер телефона. Данные добавляются без пробелов";
            }
        }
        if (isset($_POST['phone4']) && $_POST['phone4'] != '' && $_POST['phone2'] != null) {
            if(!$this->checkValue('phone4',"/^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Неверно указан номер телефона. Данные добавляются без пробелов";
            }
        }
        //additional
        if (isset($_POST['additional1']) && $_POST['additional1'] != '' && $_POST['additional1'] != null) {
            if(!$this->checkValue('additional1',"/^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Добавочный номер указывается в виде 3 или 4 цифр, в случае двух добавочных они перечисляются через знак / без пробелов";
            }
        }
        if (isset($_POST['additional2']) && $_POST['additional2'] != '' && $_POST['additional2'] != null) {
            if(!$this->checkValue('additional2',"/^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Добавочный номер указывается в виде 3 или 4 цифр, в случае двух добавочных они перечисляются через знак / без пробелов";
            } 
        }
        if (isset($_POST['additional3']) && $_POST['additional3'] != '' && $_POST['additional3'] != null) {
            if(!$this->checkValue('additional3',"/^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Добавочный номер указывается в виде 3 или 4 цифр, в случае двух добавочных они перечисляются через знак / без пробелов";
            }   
        }
        if (isset($_POST['additional4']) && $_POST['additional4'] != '' && $_POST['additional4'] != null) {
            if(!$this->checkValue('additional4',"/^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Добавочный номер указывается в виде 3 или 4 цифр, в случае двух добавочных они перечисляются через знак / без пробелов";
            }   
        }
        //days
        if (isset($_POST['monH_s']) && $_POST['monH_s'] != '' && $_POST['monH_s'] != null && 
                isset($_POST['monH_e']) && $_POST['monH_e'] != '' && $_POST['monH_e'] != null ) {
            if(!$this->checkValue('monH_s',"/(^[0-1]?\d{1}$)|(^[2][0-3]$)/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if(!$this->checkValue('monH_e',"/(^[0-1]?\d{1}$)|(^[2][0-3]$)/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if (isset($_POST['monM_s']) && $_POST['monM_s'] != '' && $_POST['monM_s'] != null && 
                    isset($_POST['monM_e']) && $_POST['monM_e'] != '' && $_POST['monM_e'] != null ) {
                if(!$this->checkValue('monM_s',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
                if(!$this->checkValue('monM_e',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
            }
            if (!$this->checkTimeStartAndEndH('monH_s', 'monH_e', 'monM_s', 'monM_e')) {
                $error = true;
                $this->checkAllValueErrors[] = "Время начала работы не может быть больше, чем время окончания работы";
            } 
        }
        
        if (isset($_POST['tueH_s']) && $_POST['tueH_s'] != '' && $_POST['tueH_s'] != null && 
                isset($_POST['tueH_e']) && $_POST['tueH_e'] != '' && $_POST['tueH_e'] != null ) {
            if(!$this->checkValue('tueH_s',"/(^[0-1]?\d{1}$)|(^[2][0-3]$)/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if(!$this->checkValue('tueH_e',"/(^[0-1]?\d{1}$)|(^[2][0-3]$)/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if (isset($_POST['tueM_s']) && $_POST['tueM_s'] != '' && $_POST['tueM_s'] != null && 
                    isset($_POST['tueM_e']) && $_POST['tueM_e'] != '' && $_POST['tueM_e'] != null ) {
                if(!$this->checkValue('tueM_s',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
                if(!$this->checkValue('tueM_e',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
            }
            if (!$this->checkTimeStartAndEndH('tueH_s', 'tueH_e', 'tueM_s', 'tueM_e')) {
                $error = true;
                $this->checkAllValueErrors[] = "Время начала работы не может быть больше, чем время окончания работы";
            } 
        }
        
        if (isset($_POST['wedH_s']) && $_POST['wedH_s'] != '' && $_POST['wedH_s'] != null && 
                isset($_POST['wedH_e']) && $_POST['wedH_e'] != '' && $_POST['wedH_e'] != null ) {
            if(!$this->checkValue('wedH_s',"/(^[0-1]?\d{1}$)|(^[2][0-3]$)/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if(!$this->checkValue('wedH_e',"/(^[0-1]?\d{1}$)|(^[2][0-3]$)/u")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if (isset($_POST['wedM_s']) && $_POST['wedM_s'] != '' && $_POST['wedM_s'] != null && 
                    isset($_POST['wedM_e']) && $_POST['wedM_e'] != '' && $_POST['wedM_e'] != null ) {
                if(!$this->checkValue('wedM_s',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
                if(!$this->checkValue('wedM_e',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
            }
            if (!$this->checkTimeStartAndEndH('wedH_s', 'wedH_e', 'wedM_s', 'wedM_e')) {
                $error = true;
                $this->checkAllValueErrors[] = "Время начала работы не может быть больше, чем время окончания работы";
            } 
        }
        
        if (isset($_POST['thuH_s']) && $_POST['thuH_s'] != '' && $_POST['thuH_s'] != null && 
                isset($_POST['thuH_e']) && $_POST['thuH_e'] != '' && $_POST['thuH_e'] != null ) {
            if(!$this->checkValue('thuH_s',"/^[0-5]?\d{1}+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if(!$this->checkValue('thuH_e',"/^[0-5]?\d{1}+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if (isset($_POST['thuM_s']) && $_POST['thuM_s'] != '' && $_POST['thuM_s'] != null && 
                    isset($_POST['thuM_e']) && $_POST['thuM_e'] != '' && $_POST['thuM_e'] != null ) {
                if(!$this->checkValue('thuM_s',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
                if(!$this->checkValue('thuM_e',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
            }
            if (!$this->checkTimeStartAndEndH('thuH_s', 'thuH_e', 'thuM_s', 'thuM_e')) {
                $error = true;
                $this->checkAllValueErrors[] = "Время начала работы не может быть больше, чем время окончания работы";
            } 
        }
        
        if (isset($_POST['friH_s']) && $_POST['friH_s'] != '' && $_POST['friH_s'] != null && 
                isset($_POST['friH_e']) && $_POST['friH_e'] != '' && $_POST['friH_e'] != null ) {
            if(!$this->checkValue('friH_s',"/^[0-5]?\d{1}+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if(!$this->checkValue('friH_e',"/^[0-5]?\d{1}+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if (isset($_POST['friM_s']) && $_POST['friM_s'] != '' && $_POST['friM_s'] != null && 
                    isset($_POST['friM_e']) && $_POST['friM_e'] != '' && $_POST['friM_e'] != null ) {
                if(!$this->checkValue('friM_s',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
                if(!$this->checkValue('friM_e',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
            }
            if (!$this->checkTimeStartAndEndH('friH_s', 'friH_e', 'friM_s', 'friM_e')) {
                $error = true;
                $this->checkAllValueErrors[] = "Время начала работы не может быть больше, чем время окончания работы";
            } 
        }
        
        if (isset($_POST['satH_s']) && $_POST['satH_s'] != '' && $_POST['satH_s'] != null && 
                isset($_POST['satH_e']) && $_POST['satH_e'] != '' && $_POST['satH_e'] != null ) {
            if(!$this->checkValue('satH_s',"/^[0-5]?\d{1}+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if(!$this->checkValue('satH_e',"/^[0-5]?\d{1}+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if (isset($_POST['satM_s']) && $_POST['satM_s'] != '' && $_POST['satM_s'] != null && 
                    isset($_POST['satM_e']) && $_POST['satM_e'] != '' && $_POST['satM_e'] != null ) {
                if(!$this->checkValue('satM_s',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
                if(!$this->checkValue('satM_e',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
            }
            if (!$this->checkTimeStartAndEndH('satH_s', 'satH_e', 'satM_s', 'satM_e')) {
                $error = true;
                $this->checkAllValueErrors[] = "Время начала работы не может быть больше, чем время окончания работы";
            } 
        }
       
        if (isset($_POST['sunH_s']) && $_POST['sunH_s'] != '' && $_POST['sunH_s'] != null && 
                isset($_POST['sunH_e']) && $_POST['sunH_e'] != '' && $_POST['sunH_e'] != null ) {
            if(!$this->checkValue('sunH_s',"/^[0-5]?\d{1}+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if(!$this->checkValue('sunH_e',"/^[0-5]?\d{1}+$/")) {
                $error = true;
                $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
            }
            if (isset($_POST['sunM_s']) && $_POST['sunM_s'] != '' && $_POST['sunM_s'] != null && 
                    isset($_POST['sunM_e']) && $_POST['sunM_e'] != '' && $_POST['sunM_e'] != null ) {
                if(!$this->checkValue('sunM_s',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
                if(!$this->checkValue('sunM_e',"/^[0-5]?\d{1}+$/")) {
                    $error = true;
                    $this->checkAllValueErrors[] = "Разрешены только цифры, но не более 2 символов";
                }
            }
            if (!$this->checkTimeStartAndEndH('sunH_s', 'sunH_e', 'sunM_s', 'sunM_e')) {
                $error = true;
                $this->checkAllValueErrors[] = "Время начала работы не может быть больше, чем время окончания работы";
            } 
        }
        //list
        if(!$this->checkValue('list')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите список работников";
        }
        if (!isset($_FILES['fileImage'])) {
            $error = true;
            $this->checkAllValueErrors[] = "Загрузите изображение";
        }
        //lang
        $local = false;
        foreach ($this->langArray as $langData) {
            if(isset($_POST['name'][$langData['lang']]) && $_POST['name'][$langData['lang']]!=null && $_POST['name'][$langData['lang']]!="" ) {
                $local = true;
            }
        }
        if(!$local){
            $error = true;
            $this->checkAllValueErrors[] = "Хотя бы для одного языка должны быть заполнены поля 'Название'";
        }
        return !$error;
    }
     
    /**
     * Получение значений
     */
    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue['alias'] = parent::getPostValue('alias');
        //email
        $this->insertValue['email1'] = parent::getPostValue('email1');
        $this->insertValue['email2'] = parent::getPostValue('email2');
        //phone
        $this->insertValue['phone1'] = parent::getPostValue('phone1');
        $this->insertValue['phone2'] = parent::getPostValue('phone2');
        $this->insertValue['phone3'] = parent::getPostValue('phone3');
        $this->insertValue['phone4'] = parent::getPostValue('phone4');
        //additional
        $this->insertValue['additional1'] = parent::getPostValue('additional1');
        $this->insertValue['additional2'] = parent::getPostValue('additional2');
        $this->insertValue['additional3'] = parent::getPostValue('additional3');
        $this->insertValue['additional4'] = parent::getPostValue('additional4');
        //days
        $this->setDayTime('mon');
        $this->setDayTime('tue');
        $this->setDayTime('wed');
        $this->setDayTime('thu');
        $this->setDayTime('fri');
        $this->setDayTime('sat');
        $this->setDayTime('sun');
        //lang
        if(isset($_POST['name']) && $_POST['name']!=null && $_POST['name']!="") {
            foreach ($_POST['name'] as $key => $value) {
                $this->insertValue['name'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['adress']) && $_POST['adress']!=null && $_POST['adress']!="") {
            foreach ($_POST['adress'] as $key => $value) {
                $this->insertValue['adress'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['postAdress']) && $_POST['postAdress']!=null && $_POST['postAdress']!="") {
            foreach ($_POST['postAdress'] as $key => $value) {
                $this->insertValue['postAdress'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['description']) && $_POST['description']!=null && $_POST['description']!="") {
            foreach ($_POST['description'] as $key => $value) {
                $this->insertValue['description'][$key] = parent::getMysqlText($value);
            }
        }
        if(isset($_POST['info']) && $_POST['info']!=null && $_POST['info']!="") {
            foreach ($_POST['info'] as $key => $value) {
                $this->insertValue['info'][$key] = parent::getMysqlText($value);
            }
        }
        $this->insertValue['imageOld'] = parent::getPostValue('imageOld');
        //list
        $this->insertValue['list'] = parent::getPostValue('list');
    }   
    
    private function setDayTime($day) {
        $keyHS = $day.'H_s';
        $keyMS = $day.'M_s';
        $keyHE = $day.'H_e';
        $keyME = $day.'M_e';
        if (isset($_POST[$keyHS]) && $_POST[$keyHS] != '' && $_POST[$keyHS] != null && 
                isset($_POST[$keyHE]) && $_POST[$keyHE] != '' && $_POST[$keyHS] != null  && 
                isset($_POST[$keyMS]) && $_POST[$keyMS] != '' && $_POST[$keyMS] != null && 
                isset($_POST[$keyME]) && $_POST[$keyME] != '' && $_POST[$keyME] != null ) { 
            $this->insertValue[$keyHS] = parent::getPostValue($keyHS);
            $this->insertValue[$keyMS] = parent::getPostValue($keyMS);
            $this->insertValue[$keyHE] = parent::getPostValue($keyHE);
            $this->insertValue[$keyME] = parent::getPostValue($keyME); 
        } elseif (isset($_POST[$keyHS]) && $_POST[$keyHS] != '' && $_POST[$keyHS] != null && 
                isset($_POST[$keyHE]) && $_POST[$keyHE] != '' && $_POST[$keyHS] != null  ) {
            if ($_POST[$keyHS] < $_POST[$keyHE]) {
                $this->insertValue[$keyHS] = parent::getPostValue($keyHS);
                $this->insertValue[$keyHE] = parent::getPostValue($keyHE);
                $this->insertValue[$keyMS] = "0";
                $this->insertValue[$keyME] = "0";
            } 
        } else {
            $this->insertValue[$keyHS] = null;
            $this->insertValue[$keyMS] = null;
            $this->insertValue[$keyHE] = null;
            $this->insertValue[$keyME] = null;
            $this->originalInsertValue[$keyHS] = '';
            $this->originalInsertValue[$keyMS] = '';
            $this->originalInsertValue[$keyHE] = '';
            $this->originalInsertValue[$keyME] = '';
        }
    }
    
    /**
     * Генерация форм ввода не зависимых от языка
     */
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        // alias
        $alias = $this->inputHelper->paternTextBox('alias', 'alias', 'alias', 100, true, 'Латиница, цифры и знаки - и _', '[A-Za-z0-9_-]{3,100}', $this->originalInsertValue['alias']);
        $html .= $this->inputHelper->createFormRow($alias, true, 'Alias');
        // email1
        $email1 = $this->inputHelper->paternTextBox('email1', 'email1', 'email1', 200, false, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['email1']);
        $html .= $this->inputHelper->createFormRow($email1, false, 'Email1');
        // email2
        $email2 = $this->inputHelper->paternTextBox('email2', 'email2', 'email2', 200, false, "user@domen.zone", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$", $this->originalInsertValue['email2']);
        $html .= $this->inputHelper->createFormRow($email2, false, 'Email2');
        // phone1  additional1
        $phone1 = $this->inputHelper->paternTextBox('phone1', 'phone1', 'phoneBox', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phone1']);
        $additional1 = $this->inputHelper->paternTextBox('additional1', 'additional1', ' phoneBox', 11, false, 'добавочный', '^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$', $this->originalInsertValue['additional1']);
        $html .= $this->inputHelper->createFormRow("Телефон: ".$phone1."Добавочный: ".$additional1, false, 'Phone1');
        // phone2  additional2
        $phone2 = $this->inputHelper->paternTextBox('phone2', 'phone2', 'phoneBox', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phone2']);
        $additional2 = $this->inputHelper->paternTextBox('additional2', 'additional2', 'phoneBox', 11, false, 'добавочный', '^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$', $this->originalInsertValue['additional2']);
        $html .= $this->inputHelper->createFormRow("Телефон: ".$phone2."Добавочный: ".$additional2, false, 'Phone2');
        // phone3  additional3
        $phone3 = $this->inputHelper->paternTextBox('phone3', 'phone3', 'phoneBox', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phone3']);
        $additional3 = $this->inputHelper->paternTextBox('additional3', 'additional3', 'phoneBox', 11, false, 'добавочный', '^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$', $this->originalInsertValue['additional3']);
        $html .= $this->inputHelper->createFormRow("Телефон: ".$phone3."Добавочный: ".$additional3, false, 'Phone3');
        // phone4  additional4
        $phone4 = $this->inputHelper->paternTextBox('phone4', 'phone4', 'phoneBox', 100, false, "+7(XXX)XXX-XX-XX", "^((8|\+7)-?)?\(?\d{3,5}\)?-?\d{1}-?\d{1}-?\d{1}-?\d{1}-?\d{1}((-?\d{1})?-?\d{1})?$", $this->originalInsertValue['phone4']);
        $additional4 = $this->inputHelper->paternTextBox('additional4', 'additional4', 'phoneBox', 11, false, 'добавочный', '^((\d{3,4})|(\d{3,4}\/\d{3,4}))+$', $this->originalInsertValue['additional4']);
        $html .= $this->inputHelper->createFormRow("Телефон: ".$phone4."Добавочный: ".$additional4, false, 'Phone4');
        // monday
        //monH_s
        $monH_s = $this->inputHelper->paternTextBox('monH_s', 'monH_s', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['monH_s']);
        //monM_s
        $monM_s = $this->inputHelper->paternTextBox('monM_s', 'monM_s', 'dayBox', 2, false, 'Минуты от 0 до 59', '(^[0-5]?\d{1}+$)', $this->originalInsertValue['monM_s']);
        //monH_e
        $monH_e = $this->inputHelper->paternTextBox('monH_e', 'monH_e', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['monH_e']);
        //monM_e
        $monM_e = $this->inputHelper->paternTextBox('monM_e', 'monM_e', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['monM_e']);
        $html .= $this->inputHelper->createFormRow("Начало работы ".$monH_s.$monM_s."Окончание работы ".$monH_e.$monM_e, false, 'Понедельник');
        // tuesday
        //tueH_s
        $tueH_s = $this->inputHelper->paternTextBox('tueH_s', 'tueH_s', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['tueH_s']);
        //monM_s
        $tueM_s = $this->inputHelper->paternTextBox('tueM_s', 'tueM_s', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['tueM_s']);
        //monH_e
        $tueH_e = $this->inputHelper->paternTextBox('tueH_e', 'tueH_e', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['tueH_e']);
        //tueM_e
        $tueM_e = $this->inputHelper->paternTextBox('tueM_e', 'tueM_e', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['tueM_e']);
        $html .= $this->inputHelper->createFormRow("Начало работы ".$tueH_s.$tueM_s."Окончание работы ".$tueH_e.$tueM_e,  false, 'Вторник');
        // wednesday
        //wedH_s
        $wedH_s = $this->inputHelper->paternTextBox('wedH_s', 'wedH_s', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['wedH_s']);
        //wedM_s
        $wedM_s = $this->inputHelper->paternTextBox('wedM_s', 'wedM_s', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['wedM_s']);
        //wedH_e
        $wedH_e = $this->inputHelper->paternTextBox('wedH_e', 'wedH_e', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['wedH_e']);
        //wedM_e
        $wedM_e = $this->inputHelper->paternTextBox('wedM_e', 'wedM_e', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['wedM_e']);
        $html .= $this->inputHelper->createFormRow("Начало работы ".$wedH_s.$wedM_s."Окончание работы ".$wedH_e.$wedM_e, false, 'Среда');
       // thursday
        //thuH_s
        $thuH_s = $this->inputHelper->paternTextBox('thuH_s', 'thuH_s', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['thuH_s']);
        //thuM_s
        $thuM_s = $this->inputHelper->paternTextBox('thuM_s', 'thuM_s', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['thuM_s']);
        //thuH_e
        $thuH_e = $this->inputHelper->paternTextBox('thuH_e', 'thuH_e', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['thuH_e']);
        //thuM_e
        $thuM_e = $this->inputHelper->paternTextBox('thuM_e', 'thuM_e', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['thuM_e']);
        $html .= $this->inputHelper->createFormRow("Начало работы ".$thuH_s.$thuM_s."Окончание работы ".$thuH_e.$thuM_e, false, 'Четверг');
        // friday
        //friH_s
        $friH_s = $this->inputHelper->paternTextBox('friH_s', 'friH_s', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['friH_s']);
        //friM_s
        $friM_s = $this->inputHelper->paternTextBox('friM_s', 'friM_s', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['friM_s']);
        //friH_e
        $friH_e = $this->inputHelper->paternTextBox('friH_e', 'friH_e', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['friH_e']);
        //friM_e
        $friM_e = $this->inputHelper->paternTextBox('friM_e', 'friM_e', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['friM_e']);
        $html .= $this->inputHelper->createFormRow("Начало работы ".$friH_s.$friM_s."Окончание работы ".$friH_e.$friM_e, false, 'Пятница');
        // saturday
        //satH_s
        $satH_s = $this->inputHelper->paternTextBox('satH_s', 'satH_s', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['satH_s']);
        //satM_s
        $satM_s = $this->inputHelper->paternTextBox('satM_s', 'satM_s', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['satM_s']);
        //satH_e
        $satH_e = $this->inputHelper->paternTextBox('satH_e', 'satH_e', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['satH_e']);
        //satM_e
        $satM_e = $this->inputHelper->paternTextBox('satM_e', 'satM_e', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['satM_e']);
        $html .= $this->inputHelper->createFormRow("Начало работы ".$satH_s.$satM_s."Окончание работы ".$satH_e.$satM_e, false, 'Суббота');
        // sunday
        //sunH_s
        $sunH_s = $this->inputHelper->paternTextBox('sunH_s', 'sunH_s', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['sunH_s']);
        //sunM_s
        $sunM_s = $this->inputHelper->paternTextBox('sunM_s', 'sunM_s', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['sunM_s']);
        //sunH_e
        $sunH_e = $this->inputHelper->paternTextBox('sunH_e', 'sunH_e', 'dayBox', 2, false, 'Часы от 0 до 23', '(^[0-1]?\d{1}$)|(^[2][0-3]$)', $this->originalInsertValue['sunH_e']);
        //sunM_e
        $sunM_e = $this->inputHelper->paternTextBox('sunM_e', 'sunM_e', 'dayBox', 2, false, 'Минуты от 0 до 59', '^[0-5]?\d{1}+$', $this->originalInsertValue['sunM_e']);
        $html .= $this->inputHelper->createFormRow("Начало работы ".$sunH_s.$sunM_s."Окончание работы ".$sunH_e.$sunM_e, false, 'Воскресенье');
        // imageOld
        $imageOld = '<img src="'.$this->getImageData().'?rel='.rand(1,999).'" style="max-height:300px; max-width:300px;" />';
        $html .= $this->inputHelper->createFormRow($imageOld, false, 'Загруженное изображение');
        // image
        $image = '<input type="file" class="fileImage" name="fileImage" id="fileImage">';
        $html .= $this->inputHelper->createFormRow($image, false, 'Изменить изображение');
        // list
        $list = $this->inputHelper->select('list', 'list', $this->getListSelectData(), true, $this->originalInsertValue['list']);
        $html .= $this->inputHelper->createFormRow($list, true, 'Список');
        return $html;
    }
    
    /**
     * Генерация форм ввода зависимых от языка
     */
    protected function getInputLangBlocks($lang) {
        $html = parent::getInputLangBlocks($lang);
        // name
        $name = $this->inputHelper->textBox('name['.$lang.']', 'name', 'name', 100, false, $this->originalInsertValue['name'][$lang]);
        $html .= $this->inputHelper->createFormRow($name, false, 'Название');
        // adress
        $adress = $this->inputHelper->textarea('adress['.$lang.']', 'adress', 'adress', 200, false, $this->originalInsertValue['adress'][$lang]);
        $html .= $this->inputHelper->createFormRow($adress, false, 'Адрес');
        // postAdress
        $postAdress = $this->inputHelper->textarea('postAdress['.$lang.']', 'postAdress', 'postAdress', 200, false, $this->originalInsertValue['postAdress'][$lang]);
        $html .= $this->inputHelper->createFormRow($postAdress, false, 'Почтовый адрес');
        // description
        $description = $this->inputHelper->textarea('description['.$lang.']', 'description', 'description', 50000, false, $this->originalInsertValue['description'][$lang]);
        $html .= $this->inputHelper->createFormRow($description, false, 'Описание');
        // info
        $info = $this->inputHelper->textarea('info['.$lang.']', 'info', 'info', 50000, false, $this->originalInsertValue['info'][$lang]);
        $html .= $this->inputHelper->createFormRow($info, false, 'Информация');
        return $html;
    } 
    
    protected function getData() {
        parent::getData();
        $this->editElement = urldecode($this->editElement);
        $this->data = array();
        $query = "SELECT * FROM `ContactDepartments` WHERE `alias`='".$this->editElement."';";
        $this->data = $this->SQL_HELPER->select($query,1);
        $query = "SELECT * FROM `ContactDepartments_Lang` WHERE `department`='".$this->editElement."';";
        $this->departmentLangData = $this->SQL_HELPER->select($query);
        $query = "SELECT `list` FROM `ContactDepartments_has_ContactsWorkersList` WHERE `department`='".$this->editElement."';";
        $this->listDepartmentData = $this->SQL_HELPER->select($query,1);
    } 
    
    /**
     * Установка значений ввода по умолчанию
     */
    protected function setDefaltInput() {
        parent::setDefaltInput();
        $this->insertValue['alias'] = $this->data['alias'];
        $this->insertValue['email1'] = $this->data['email1'];
        $this->insertValue['email2'] = $this->data['email2'];
        $this->insertValue['phone1'] = $this->data['phone1'];
        $this->insertValue['phone2'] = $this->data['phone2'];
        $this->insertValue['phone3'] = $this->data['phone3'];
        $this->insertValue['phone4'] = $this->data['phone4'];
        
        $this->insertValue['additional1'] = $this->data['additional1'];
        $this->insertValue['additional2'] = $this->data['additional2'];
        $this->insertValue['additional3'] = $this->data['additional3'];
        $this->insertValue['additional4'] = $this->data['additional4'];
        
        $this->insertValue['monH_s'] = $this->data['monH_s'];
        $this->insertValue['monM_s'] = $this->data['monM_s'];
        $this->insertValue['monH_e'] = $this->data['monH_e'];
        $this->insertValue['monM_e'] = $this->data['monM_e'];
        
        $this->insertValue['tueH_s'] = $this->data['tueH_s'];
        $this->insertValue['tueM_s'] = $this->data['tueM_s'];
        $this->insertValue['tueH_e'] = $this->data['tueH_e'];
        $this->insertValue['tueM_e'] = $this->data['tueM_e'];
        
        $this->insertValue['wedH_s'] = $this->data['wedH_s'];
        $this->insertValue['wedM_s'] = $this->data['wedM_s'];
        $this->insertValue['wedH_e'] = $this->data['wedH_e'];
        $this->insertValue['wedM_e'] = $this->data['wedM_e'];
        
        $this->insertValue['thuH_s'] = $this->data['thuH_s'];
        $this->insertValue['thuM_s'] = $this->data['thuM_s'];
        $this->insertValue['thuH_e'] = $this->data['thuH_e'];
        $this->insertValue['thuM_e'] = $this->data['thuM_e'];
        
        $this->insertValue['friH_s'] = $this->data['friH_s'];
        $this->insertValue['friM_s'] = $this->data['friM_s'];
        $this->insertValue['friH_e'] = $this->data['friH_e'];
        $this->insertValue['friM_e'] = $this->data['friM_e'];
        
        $this->insertValue['satH_s'] = $this->data['satH_s'];
        $this->insertValue['satM_s'] = $this->data['satM_s'];
        $this->insertValue['satH_e'] = $this->data['satH_e'];
        $this->insertValue['satM_e'] = $this->data['satM_e'];
        
        $this->insertValue['sunH_s'] = $this->data['sunH_s'];
        $this->insertValue['sunM_s'] = $this->data['sunM_s'];
        $this->insertValue['sunH_e'] = $this->data['sunH_e'];
        $this->insertValue['sunM_e'] = $this->data['sunM_e'];
        
        $this->insertValue['name'] = array();
        $this->insertValue['adress'] = array();
        $this->insertValue['postAdress'] = array();
        $this->insertValue['description'] = array();
        $this->insertValue['info'] = array();
        foreach ($this->langArray as $langData) {
            $this->insertValue['name'][$langData['lang']] = "";
            $this->insertValue['adress'][$langData['lang']] = "";
            $this->insertValue['postAdress'][$langData['lang']] = "";
            $this->insertValue['description'][$langData['lang']] = "";
            $this->insertValue['info'][$langData['lang']] = "";
        }
        foreach ($this->departmentLangData as $langData) {
            $this->insertValue['name'][$langData['lang']] = $langData['name'];
            $this->insertValue['adress'][$langData['lang']] = $langData['adress'];
            $this->insertValue['postAdress'][$langData['lang']] = $langData['postAdress'];
            $this->insertValue['description'][$langData['lang']] = $langData['description'];
            $this->insertValue['info'][$langData['lang']] = $langData['info'];
        }
        
        if ($this->listDepartmentData < 0 || $this->listDepartmentData == null) {
            $this->insertValue['list'] = "0";
        } else {
            $this->insertValue['list'] = $this->listDepartmentData['list'];
        }
        
        $this->originalInsertValue = $this->insertValue;
    }

    /**
     * Выполнение изменения в таблице
     */
    protected function updateExecute() {
        parent::updateExecute();
        $queryDepartment = "UPDATE `ContactDepartments` SET ";
        $queryDepartment .= "`alias`='".$this->insertValue['alias']."', ";
        $queryDepartment .= "`email1`=".InputValueHelper::mayByNull($this->insertValue['email1']).", ";
        $queryDepartment .= "`email2`=".InputValueHelper::mayByNull($this->insertValue['email2']).", ";
        $queryDepartment .= "`phone1`=".InputValueHelper::mayByNull($this->insertValue['phone1']).", ";
        $queryDepartment .= "`phone2`=".InputValueHelper::mayByNull($this->insertValue['phone2']).", ";
        $queryDepartment .= "`phone3`=".InputValueHelper::mayByNull($this->insertValue['phone3']).", ";
        $queryDepartment .= "`phone4`=".InputValueHelper::mayByNull($this->insertValue['phone4']).", ";
        $queryDepartment .= "`additional1`=".InputValueHelper::mayByNull($this->insertValue['additional1']).", ";
        $queryDepartment .= "`additional2`=".InputValueHelper::mayByNull($this->insertValue['additional2']).", ";
        $queryDepartment .= "`additional3`=".InputValueHelper::mayByNull($this->insertValue['additional3']).", ";
        $queryDepartment .= "`additional4`=".InputValueHelper::mayByNull($this->insertValue['additional4']).", ";
        $queryDepartment .= "`monH_s`=".InputValueHelper::mayByNull($this->insertValue['monH_s']).", ";
        $queryDepartment .= "`monM_s`=".InputValueHelper::mayByNull($this->insertValue['monM_s']).", ";
        $queryDepartment .= "`monH_e`=".InputValueHelper::mayByNull($this->insertValue['monH_e']).", ";
        $queryDepartment .= "`monM_e`=".InputValueHelper::mayByNull($this->insertValue['monM_e']).", ";
        $queryDepartment .= "`tueH_s`=".InputValueHelper::mayByNull($this->insertValue['tueH_s']).", ";
        $queryDepartment .= "`tueM_s`=".InputValueHelper::mayByNull($this->insertValue['tueM_s']).", ";
        $queryDepartment .= "`tueH_e`=".InputValueHelper::mayByNull($this->insertValue['tueH_e']).", ";
        $queryDepartment .= "`tueM_e`=".InputValueHelper::mayByNull($this->insertValue['tueM_e']).", ";
        $queryDepartment .= "`wedH_s`=".InputValueHelper::mayByNull($this->insertValue['wedH_s']).", ";
        $queryDepartment .= "`wedM_s`=".InputValueHelper::mayByNull($this->insertValue['wedM_s']).", ";
        $queryDepartment .= "`wedH_e`=".InputValueHelper::mayByNull($this->insertValue['wedH_e']).", ";
        $queryDepartment .= "`wedM_e`=".InputValueHelper::mayByNull($this->insertValue['wedM_e']).", ";
        $queryDepartment .= "`thuH_s`=".InputValueHelper::mayByNull($this->insertValue['thuH_s']).", ";
        $queryDepartment .= "`thuM_s`=".InputValueHelper::mayByNull($this->insertValue['thuM_s']).", ";
        $queryDepartment .= "`thuH_e`=".InputValueHelper::mayByNull($this->insertValue['thuH_e']).", ";
        $queryDepartment .= "`thuM_e`=".InputValueHelper::mayByNull($this->insertValue['thuM_e']).", ";
        $queryDepartment .= "`friH_s`=".InputValueHelper::mayByNull($this->insertValue['friH_s']).", ";
        $queryDepartment .= "`friM_s`=".InputValueHelper::mayByNull($this->insertValue['friM_s']).", ";
        $queryDepartment .= "`friH_e`=".InputValueHelper::mayByNull($this->insertValue['friH_e']).", ";
        $queryDepartment .= "`friM_e`=".InputValueHelper::mayByNull($this->insertValue['friM_e']).", ";
        $queryDepartment .= "`satH_s`=".InputValueHelper::mayByNull($this->insertValue['satH_s']).", ";
        $queryDepartment .= "`satM_s`=".InputValueHelper::mayByNull($this->insertValue['satM_s']).", ";
        $queryDepartment .= "`satH_e`=".InputValueHelper::mayByNull($this->insertValue['satH_e']).", ";
        $queryDepartment .= "`satM_e`=".InputValueHelper::mayByNull($this->insertValue['satM_e']).", ";
        $queryDepartment .= "`sunH_s`=".InputValueHelper::mayByNull($this->insertValue['sunH_s']).", ";
        $queryDepartment .= "`sunM_s`=".InputValueHelper::mayByNull($this->insertValue['sunM_s']).", ";
        $queryDepartment .= "`sunH_e`=".InputValueHelper::mayByNull($this->insertValue['sunH_e']).", ";
        $queryDepartment .= "`sunM_e`=".InputValueHelper::mayByNull($this->insertValue['sunM_e'])." ";
        $queryDepartment .= " WHERE `alias`='".$this->editElement."';";
        
        $queryDepartment_Lang = array();
        foreach ($this->langArray as $langData) {
            if(isset($this->insertValue['name'][$langData['lang']]) && $this->insertValue['name'][$langData['lang']]!=null && 
                    $this->insertValue['name'][$langData['lang']]!="") {
                $queryLang = "INSERT INTO `ContactDepartments_Lang` SET ";
                $queryLang .= "`department`='".$this->insertValue['alias']."', ";
                $queryLang .= "`lang`='".$langData['lang']."', ";
                $queryLang .= "`name`='".$this->insertValue['name'][$langData['lang']]."', ";
                $queryLang .= "`adress`=".InputValueHelper::mayByNull($this->insertValue['adress'][$langData['lang']]).", ";
                $queryLang .= "`postAdress`=".InputValueHelper::mayByNull($this->insertValue['postAdress'][$langData['lang']]).", ";
                $queryLang .= "`description`=".InputValueHelper::mayByNull($this->insertValue['description'][$langData['lang']]).", ";
                $queryLang .= "`info`=".InputValueHelper::mayByNull($this->insertValue['info'][$langData['lang']])."; ";
                $queryDepartment_Lang[] = $queryLang;
            }
        }
        
        $this->SQL_HELPER->insert($queryDepartment);
        
        $queryContactDepartments_LangDel = "DELETE FROM  `ContactDepartments_Lang` WHERE  `department` =  '".$this->editElement."';";
        $this->SQL_HELPER->insert($queryContactDepartments_LangDel);
        
        $queryContactDepartments_has_ContactsWorkersListDel = "DELETE FROM `ContactDepartments_has_ContactsWorkersList` WHERE `department` =  '".$this->editElement."';";
        $this->SQL_HELPER->insert($queryContactDepartments_has_ContactsWorkersListDel);
        
        foreach($queryDepartment_Lang as $queryDepartment_Lg) {
            $this->SQL_HELPER->insert($queryDepartment_Lg);
        }
        
        if (isset($this->insertValue['list']) && $this->insertValue['list'] == "0" || $this->insertValue['list'] == null) {
            $queryContactDepartments_has_ContactsWorkersList = "";
        } else {
            $queryContactDepartments_has_ContactsWorkersList = "INSERT INTO `ContactDepartments_has_ContactsWorkersList` SET ";
            $queryContactDepartments_has_ContactsWorkersList .= "`department`='".$this->insertValue['alias']."', ";
            $queryContactDepartments_has_ContactsWorkersList .= "`list`='".$this->insertValue['list']."' ";
            $queryContactDepartments_has_ContactsWorkersList .= ";";
            $this->SQL_HELPER->insert($queryContactDepartments_has_ContactsWorkersList);
        }
        $this->uploadFile();
    }
    
    /* Новые функции */
    
    private function getImageData() {
        $desiredValue = $this->dir.$this->data['alias'].".png";
        if(file_exists($desiredValue)) {
            if ($desiredValue != null && $desiredValue != '') { 
                return $desiredValue; 
            }
        } else {
            echo 'Файла с таким названием не существует';
        }
    }

    private function uploadFile() {
        if (isset($_POST['AP_Submit']) && $_POST['AP_Submit'] != '' && $_POST['AP_Submit'] != null) {
            // Проверяем загружен ли файл
            if(is_uploaded_file($_FILES["fileImage"]["tmp_name"])) {
              // Если файл загружен успешно, перемещаем его из временной директории в конечную
                move_uploaded_file($_FILES["fileImage"]["tmp_name"], $this->dir.$this->insertValue['alias'].".png");
            } else {
                rename($this->dir.$this->data['alias'].".png", $this->dir.$this->insertValue['alias'].".png");
            }
        } else {
            echo "Выберите файл";
        }
    }

    private function getListSelectData() {
        $list = array();
        $query = "SELECT * FROM `ContactsWorkersList` ;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $list[$key]['text'] = $value['alias'];
            $list[$key]['value'] = $value['alias'];
        }
            $list[$key]['text'] = "Без списка контактов";
            $list[$key]['value'] = "0";
        return $list;
    }
    
    private function checkTimeStartAndEndH($start, $end, $startM, $endM) {
        if ($_POST[$start] == $_POST[$end]) {
            return $_POST[$startM] < $_POST[$endM];
        } else {
            return $_POST[$start] < $_POST[$end];
        }
    }
    
    protected function checkEditElement() {
        $query = "SELECT * FROM `ContactDepartments` WHERE `alias`='".$this->editElement."';";
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
            $query = "SELECT * FROM `ContactDepartments` WHERE `alias`='".$_POST['alias']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}