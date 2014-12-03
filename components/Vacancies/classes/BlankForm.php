<?php
class BlankForm {
    private $thisLang;
    private $thisPage;
    
    private $localization;
    
    private $html;
    
    private $insertError;
    private $insertOk;
    private $validVacancies;
    private $javaArray;
    
    private $vacancies_yes;
    private $vacancies_no;
    private $vacancies_noselect;
    
    public function __construct() {
        $this->vacancies_yes = "Вакансия открыта.<br>Заполните и отправьте анкету.";
        $this->vacancies_no = "Вакансия закрыта.<br>Вы можете заполнить анкету и отправить ее нам.<br>При открытии вакансии Ваша анкета будет рассмотрена в первую очередь.";
        $this->vacancies_noselect = "Вы не выбрали ни одну вакансию.";
        $this->insertError = null;
        $this->insertOk = null;
        global $_URL_PARAMS;
        // Выставляем параметры поу молчанию
        $this->thisLang = $_URL_PARAMS['lang'];
        $this->thisPage = $_URL_PARAMS['page'];
        $this->localization = new Localization();
        $this->getValideVacanciesDatа();
        $this->generateForm();
    }
    
    private function insertVacSelect($name,$id,$array,$mandatory,$value) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        $JS = "vacanciesSelected(this.value,$this->javaArray)";
        $out = '<select class="selectBox" name="'.$name.'" value="" id="'.$id.'" '.$required.'  onchange="'.$JS.'">';
        $out .= '<option></option>';
        foreach ($array as $val) {
            if($value == $val['value']) {
                $selected = "selected";
            } else {
                $selected = "";
            }
            $out .= '<option class="selectBox" value="'.$val['value'].'" '.$selected.'>'.$val['text'].'</option>';
        }
        $out .= '</select>';
        return $out;
    }
    
    private function insertSelect($name,$id,$array,$mandatory,$value) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        $out = '<select class="selectBox" name="'.$name.'" value="" id="'.$id.'" '.$required.'>';
        $out .= '<option></option>';
        foreach ($array as $val) {
            if($value == $val['value']) {
                $selected = "selected";
            } else {
                $selected = "";
            }
            $out .= '<option class="selectBox" value="'.$val['value'].'" '.$selected.'>'.$val['text'].'</option>';
        }
        $out .= '</select>';
        return $out;
    }
    
    private function insertTextarea($name,$id,$maxlength,$mandatory,$value) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        $out = '<textarea  name="'.$name.'" value="" id="'.$id.'" maxlength="'.$maxlength.'" '.$required.'>'.$value.'</textarea>';
        return $out;
    }
    
    private function insertTextBox($name,$id,$maxlength,$mandatory,$value) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        $out = '<input type="text" name="'.$name.'" value="'.$value.'" id="'.$id.'" maxlength="'.$maxlength.'" '.$required.'/>';
        return $out;
    }
    
    private function insertPaternTextBox($name,$id,$maxlength,$mandatory,$placeholder,$pattern,$value) {
        if($mandatory) {
            $required = " required ";
        } else {
            $required = "";
        }
        $out = '<input type="text" name="'.$name.'" value="'.$value.'" id="'.$id.'" maxlength="'.
                $maxlength.'"  placeholder="'.$placeholder.'" title="'.$placeholder.'"  pattern="'.$pattern.'" '.$required.'/>';
        return $out;
    }
    
    private function insertBlock($text,$mandatory,$block) {
        $out = '<tr>';
            $out .= '<td class="reviews_table_label">';
            if($mandatory) {
                $out .= '* ';
            }
            $out .= $text.': ';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= $block;
            $out .= '</td>';
        $out .= '</tr>';
        return $out;
    }
    
    private function insertSelectBlock($text,$mandatory,$name,$id,$array,$value) {
        return $this->insertBlock($text,$mandatory,$this->insertSelect($name,$id,$array,$mandatory,$value));
    }
    
    private function insertVacSelectBlock($text,$mandatory,$name,$id,$array,$value) {
        return $this->insertBlock($text,$mandatory,$this->insertVacSelect($name,$id,$array,$mandatory,$value));
    }
    
    private function insertTextareaBlock($text,$mandatory,$name,$id,$maxlength,$value) {
        return $this->insertBlock($text,$mandatory,$this->insertTextarea($name,$id,$maxlength,$mandatory,$value));
    }
    
    private function insertTextBoxBlock($text,$mandatory,$name,$id,$maxlength,$value) {
        return $this->insertBlock($text,$mandatory,$this->insertTextBox($name,$id,$maxlength,$mandatory,$value));
    }
    
    private function insertPaternTextBoxBlock($text,$mandatory,$name,$id,$maxlength,$placeholder,$pattern,$value) {
        return $this->insertBlock($text,$mandatory,$this->insertPaternTextBox($name,$id,$maxlength,$mandatory,$placeholder,$pattern,$value));
    }

    private function getStep($prev,$id,$next,$display,$title,$inner) {
        if($display) {
            $dspStr = 'block';
        } else {
            $dspStr = 'none';
        }
        
        $out = "<div id='$id' style='display: $dspStr;'>";
        $out .= "<div class='form_step'>";
        $out .= "<h3>$title</h3>";
        $out .= '<table class="reviews_table" width="700px">';
        $out .= $inner;
        $out .= '</table>';
        $out .= '</div>';
        
        $out .= '<table class="nav_button_table" width="700px">';
        $out .= '<tr>';
        $out .= '<td class="nav_button_table_left">';
        if($prev!=null) {
            $out .= '<button type="button" class="apelsin_button left_button" onclick="nextStep(\''.$id.'\',\''.$prev.'\')">Назад</button>';
        }
        $out .= '</td>';
        $out .= '<td class="nav_button_table_center">';
        $out .= '<input class="apelsin_button center_button" type="submit" name="submit" value="Оставить анкету">';
        $out .= '</td>';
        $out .= '<td class="nav_button_table_right">';
        if($next!=null) {
            $out .= '<button type="button" class="apelsin_button right_button" onclick="nextStep(\''.$id.'\',\''.$next.'\')">Дальше</button>';
        }
        $out .= '</td>';
        $out .= '</tr>';
        $out .= '</table>';
        $out .= '</div>';
        return $out;
    }


    private function getDatа($table,$valueColumnName) {
        $query ="select * from `$table`";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getAllData();
        $result = null;
        $i=0;
        foreach ($listData as $value) {
            $result[$i]['value'] = $value['id'];
            $result[$i++]['text'] = $value[$valueColumnName];
        }
        return $result;
    }
    
    private function getDateById($table,$id,$getColumn) {
        $query ="select `$getColumn` from `$table` where `id`='$id';";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getDataRow(0);
        return $listData[$getColumn];
    }
    
//    private function getVacancies($id) {
//        $query ="select `name` from `Vacancies` where `id`='name';";
//        $mySqlHelper = new MySqlHelper($query);
//        $listData = $mySqlHelper->getDataRow(0);
//        return $listData['name'];
//    }

    private function getVacanciesDatа() {
        $query ="select `name` from `Vacancies`";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getAllData();
        $result = null;
        $i=0;
        foreach ($listData as $value) {
            $result[$i]['value'] = $value['name'];
            $result[$i++]['text'] = $value['name'];
        }
        return $result;
    }

    private function getValideVacanciesDatа() {
        $query ="select `vacancies` from `VacanciesValid` group by `vacancies`";
        $mySqlHelper = new MySqlHelper($query);
        $listData = $mySqlHelper->getAllData();
        $this->validVacancies = null;
        $i=0;
        $this->javaArray = "new Array(";
        foreach ($listData as $value) {
            $this->validVacancies[$i++]= $value['vacancies'];
            $this->javaArray .= "'".$value['vacancies']."',";
        }
        $this->javaArray = substr($this->javaArray, 0, strlen($this->javaArray)-1);
        $this->javaArray .= ")";
    }
    
    private function getCaptcha() {
        $out = '<tr>';
            $out .= '<td class="reviews_table_label">';
            $out .= '<img class="captcha_img" src="./plugins/captcha/captcha.php" width="120" height="20" />';
            $out .= '</td>';
            $out .= '<td class="reviews_table_input">';
            $out .= '<input type="text" name="captcha" value="" id="captcha" required/>';
            $out .= '</td>';
        $out .= '</tr>';
        return $out;
    }


    private function generateForm() {
        $urlHelper = new UrlHelper();
        $this->insert();
        $out = "";
        $out .= '<a class="fancybox" href="#send_resume"><button type="button" class="apelsin_button">оставить свое резюме</button></a>';
        
        $out .= "<div id='send_resume' style='display: none;'>";
        $out .= "<h2>";
        $out .= "Анкета соискателя.";
        $out .= "</h2>";
        $out .= '<br><center>Благодарим за обращение в компанию "Апельсин".<br>
            Мы рады что Вас заинтересовала одна из вакансий.<br>
            Осталось 10 шагов на пути к успешной карьере!<br></center><br>';
        $out .= '<span class="inf">Поля отмеченные * обязательные для заполнения.</span><br>';
        $out .= '<form class="resume" name="resume" action="'.$urlHelper->getThisPage().'" 
            method="post" accept-charset="UTF-8" autocomplete="on">';
        
        $inner = $this->insertVacSelectBlock("Вакансия",true,"vacancies","vacancies",$this->getVacanciesDatа(),$this->getPostValue('vacancies'));
        $inner .= '<tr><td class="reviews_table_label" colspan="2">';
        $inner .= '<center>';
        $inner .= "<div class='noselect_vacancies_text' id='noselect_vacancies_text' style='display: block;'>$this->vacancies_noselect</div>";
        $inner .= "<div class='no_vacancies_text' id='no_vacancies_text' style='display: none;'>$this->vacancies_no</div>";
        $inner .= "<div class='yes_vacancies_text' id='yes_vacancies_text' style='display: none;'>$this->vacancies_yes</div>";
        $inner .= '</center>';
        $inner .= '</td></tr>';
        $inner .= $this->insertTextBoxBlock("Фамилия", true, "surname", "surname", 50,$this->getPostValue('surname'));
        $inner .= $this->insertTextBoxBlock("Имя", true, "name", "name", 50,$this->getPostValue('name'));
        $inner .= $this->insertTextBoxBlock("Отчество", true, "patronymic", "patronymic", 50,$this->getPostValue('patronymic'));
        $out .= $this->getStep(null,"step1","step2",true,"Шаг 1",$inner);
        
        
        $inner = $this->insertPaternTextBoxBlock("Дата рождения", true, "dob", "dob", 10, "ГГГГ-ММ-ДД", "[0-9]{4}-[0-9]{2}-[0-9]{2}",$this->getPostValue('dob'));
        $inner .= $this->insertTextBoxBlock("Место рождения", true, "bpl", "bpl", 100,$this->getPostValue('bpl'));
        $inner .= $this->insertTextBoxBlock("Гражданство", true, "citizenship", "citizenship", 100,$this->getPostValue('citizenship'));
        $out .= $this->getStep("step1","step2","step3",false,"Шаг 2",$inner);
        
        
        $inner = $this->insertTextareaBlock("Место жительства", true, "placeOfResidence", "placeOfResidence", 400,$this->getPostValue('placeOfResidence'));
        $inner .= $this->insertTextBoxBlock("Телефон", true, "phone", "phone", 50,$this->getPostValue('phone'));
        $inner .= $this->insertPaternTextBoxBlock("Email", true, "email", "email", 50, "your@mail.ru", "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$",$this->getPostValue('email'));
        $out .= $this->getStep("step2","step3","step4",false,"Шаг 3",$inner);
        
        
        
        $inner = $this->insertSelectBlock("Семейное положение",true,"marriage","marriage",$this->getDatа("VacanciesFormMarriage","marriage"),$this->getPostValue('marriage'));
        $inner .= $this->insertTextareaBlock("Наличие детей, возраст", true, "children", "children", 200,$this->getPostValue('children'));
        $inner .= $this->insertSelectBlock("Воинская обязанность",true,"military","military",$this->getDatа("VacanciesFormMilitary","military"),$this->getPostValue('military'));
        $inner .= $this->insertSelectBlock("Судимость",true,"conviction","conviction",$this->getDatа("VacanciesFormConviction","conviction"),$this->getPostValue('conviction'));
        $out .= $this->getStep("step3","step4","step5",false,"Шаг 4",$inner);
        
        $inner = $this->insertSelectBlock("Личный автомобиль",true,"car","car",$this->getDatа("VacanciesFormCar","car"),$this->getPostValue('car'));
        $inner .= $this->insertTextBoxBlock("Категория прав", true, "carCategory", "carCategory", 10,$this->getPostValue('carCategory'));
        $inner .= $this->insertTextBoxBlock("Стаж", true, "carExperience", "carExperience", 10,$this->getPostValue('carExperience'));
        $out .= $this->getStep("step4","step5","step6",false,"Шаг 5",$inner);
        
        
        $inner = $this->insertTextareaBlock("Образование:<br/><span class='inf'>Учебное заведение,<br>
            время обучения,<br>специальность/квалификация</span>", true, "education", "education", 800,$this->getPostValue('education'));
        $out .= $this->getStep("step5","step6","step7",false,"Шаг 6",$inner);
        
        
        $inner = '<tr><td class="reviews_table_label" colspan="2">Три последних места работы: место работы 1</td></tr>';
        $inner .= $this->insertTextBoxBlock("Организация", false, "organization1", "organization1", 200,$this->getPostValue('organization1'));
        $inner .= $this->insertPaternTextBoxBlock("Дата приема на работу", false, "workPeriodStart1", "workPeriodStart1", 
                10, "ГГГГ-ММ-ДД", "[0-9]{4}-[0-9]{2}-[0-9]{2}",$this->getPostValue('workPeriodStart1'));
        $inner .= $this->insertPaternTextBoxBlock("Дата увольнения", false, "workPeriodStop1", "workPeriodStop1", 
                10, "ГГГГ-ММ-ДД", "[0-9]{4}-[0-9]{2}-[0-9]{2}",$this->getPostValue('workPeriodStop1'));
        $inner .= $this->insertTextBoxBlock("Занимаемая должность", false, "positions1", "positions1", 100,$this->getPostValue('positions1'));
        $inner .= $this->insertTextBoxBlock("Регион", false, "region1", "region1", 100,$this->getPostValue('region1'));
        $inner .= $this->insertTextBoxBlock("Выполняемые обязанности", false, "responsibility1", "responsibility1", 100,$this->getPostValue('responsibility1'));
        $inner .= $this->insertTextBoxBlock("Средний доход", false, "income1", "income1", 100,$this->getPostValue('income1'));
        $inner .= $this->insertTextBoxBlock("Причины увольнения", false, "reasonsForDismissal1", "reasonsForDismissal1", 100,$this->getPostValue('reasonsForDismissal1'));
        $out .= $this->getStep("step6","step7","step8",false,"Шаг 7",$inner);
        
        
        $inner = '<tr><td class="reviews_table_label" colspan="2">Три последних места работы: место работы 2</td></tr>';
        $inner .= $this->insertTextBoxBlock("Организация", false, "organization2", "organization2", 200,$this->getPostValue('organization2'));
        $inner .= $this->insertPaternTextBoxBlock("Дата приема на работу", false, "workPeriodStart2", "workPeriodStart2", 
                10, "ГГГГ-ММ-ДД", "[0-9]{4}-[0-9]{2}-[0-9]{2}",$this->getPostValue('workPeriodStart2'));
        $inner .= $this->insertPaternTextBoxBlock("Дата увольнения", false, "workPeriodStop2", "workPeriodStop2", 
                10, "ГГГГ-ММ-ДД", "[0-9]{4}-[0-9]{2}-[0-9]{2}",$this->getPostValue('workPeriodStop2'));
        $inner .= $this->insertTextBoxBlock("Занимаемая должность", false, "positions2", "positions2", 100,$this->getPostValue('positions2'));
        $inner .= $this->insertTextBoxBlock("Регион", false, "region2", "region2", 100,$this->getPostValue('region2'));
        $inner .= $this->insertTextBoxBlock("Выполняемые обязанности", false, "responsibility2", "responsibility2", 100,$this->getPostValue('responsibility2'));
        $inner .= $this->insertTextBoxBlock("Средний доход", false, "income2", "income2", 100,$this->getPostValue('income2'));
        $inner .= $this->insertTextBoxBlock("Причины увольнения", false, "reasonsForDismissal2", "reasonsForDismissal2", 100,$this->getPostValue('reasonsForDismissal2'));
        $out .= $this->getStep("step7","step8","step9",false,"Шаг 8",$inner);
        
        
        $inner = '<tr><td class="reviews_table_label" colspan="2">Три последних места работы: место работы 3</td></tr>';
        $inner .= $this->insertTextBoxBlock("Организация", false, "organization3", "organization3", 200,$this->getPostValue('organization3'));
        $inner .= $this->insertPaternTextBoxBlock("Дата приема на работу", false, "workPeriodStart3", "workPeriodStart3", 
                10, "ГГГГ-ММ-ДД", "[0-9]{4}-[0-9]{2}-[0-9]{2}",$this->getPostValue('workPeriodStart3'));
        $inner .= $this->insertPaternTextBoxBlock("Дата увольнения", false, "workPeriodStop3", "workPeriodStop3", 
                10, "ГГГГ-ММ-ДД", "[0-9]{4}-[0-9]{2}-[0-9]{2}",$this->getPostValue('workPeriodStop3'));
        $inner .= $this->insertTextBoxBlock("Занимаемая должность", false, "positions3", "positions3", 100,$this->getPostValue('positions3'));
        $inner .= $this->insertTextBoxBlock("Регион", false, "region3", "region3", 100,$this->getPostValue('region3'));
        $inner .= $this->insertTextBoxBlock("Выполняемые обязанности", false, "responsibility3", "responsibility3", 100,$this->getPostValue('responsibility3'));
        $inner .= $this->insertTextBoxBlock("Средний доход", false, "income3", "income3", 100,$this->getPostValue('income3'));
        $inner .= $this->insertTextBoxBlock("Причины увольнения", false, "reasonsForDismissal3", "reasonsForDismissal3", 100,$this->getPostValue('reasonsForDismissal3'));
        $out .= $this->getStep("step8","step9","step10",false,"Шаг 9",$inner);
        
        
        $inner = $this->insertTextBoxBlock("Какой предположительный доход Вы хотели бы иметь", true, "income", "income", 100,$this->getPostValue('income'));
        $inner .= $this->insertTextBoxBlock("Из каких источников Вы узнали о вакансиях в нашей компании", true, "sources", "sources", 100,$this->getPostValue('sources'));
        $inner .= $this->getCaptcha();
        $out .= $this->getStep("step9","step10",null,false,"Шаг 10",$inner);

        $out .= '</form>';
        $out .= '</div>';
        
        $this->html = $out;
    }
    
    public function get(){
        echo $this->html;
    }
    
    public function getHTML(){
        return $this->html;
    }
    
    public function getButonHTML(){
        return '<a class="fancybox" href="#send_resume"><button type="button" class="apelsin_button">оставить свое резюме</button></a>';
    }
    
    private function checkCaptcha() {
        @session_start();
        return (isset($_SESSION['captcha']) && strtoupper($_SESSION['captcha']) == strtoupper($_POST['captcha']));
    }
    
    private function checkValue($key) {
        return (isset($_POST[$key]) && $_POST[$key]!=null && $_POST[$key]!="");
    }
    
    private function checkAllValue() {
        return (
                $this->checkValue('vacancies') && $this->checkValue('surname') && $this->checkValue('name') &&
                $this->checkValue('patronymic') && $this->checkValue('dob') && $this->checkValue('bpl') &&
                $this->checkValue('citizenship') && $this->checkValue('placeOfResidence') && $this->checkValue('phone') &&
                $this->checkValue('email') && $this->checkValue('marriage') && $this->checkValue('children') &&
                $this->checkValue('military') && $this->checkValue('conviction') && $this->checkValue('car') &&
                $this->checkValue('carCategory') && $this->checkValue('carExperience') && $this->checkValue('education') &&
                $this->checkValue('sources') && $this->checkValue('income')
        );
    }
    
    private function getMysqlText($text) {
        global $_DBSETTINGS;
        $link = mysql_connect($_DBSETTINGS['host'], $_DBSETTINGS['user'], $_DBSETTINGS['password']) OR die(mysql_error());
        $text = $text;
        $text = strip_tags($text, '<br>');
        $text = htmlspecialchars_decode($text);
        $text = mysql_real_escape_string($text);
        if($text=="") {
            $text = null;
        }
        return $text;
    }
    
    private function getEmailText($text) {
        $text = strip_tags($text);
        $text = htmlspecialchars_decode($text);
        if($text==null) {
            $text = "----------";
        }
        return $text;
    }
    
    private function getQuery($mass) {
        $query = "INSERT INTO `VacanciesForm` SET ";
        foreach ($mass as $key => $value ) {
            $query .= "`$key`='".$value."',";
        }
        $query = substr($query, 0, strlen($query)-1);
        $query .= ";";
        return $query;
    }
    
    private function getPostValue($key) {
        return $this->checkValue($key) ? $_POST[$key] : null;
    }
    
    private function checkData($data) {
        return preg_match("/(\d{4})-(\d{2})-(\d{2})/", $data);
    }
    
    private function checkData2($key) {
        return ($this->checkData($_POST[$key]) || !isset($_POST[$key]) || $_POST[$key]==null || $_POST[$key]=="");
    }

    public function insert() {
        if(isset($_POST['submit'])) {
            if($this->checkCaptcha()) {
                if($this->checkAllValue()) {
                    if (preg_match("|^[-0-9a-z_\.]+@[-0-9a-z_^\.]+\.[a-z]{2,6}$|i", $_POST['email'])) {
                        if ($this->checkData($_POST['dob']) && $this->checkData2('workPeriodStart1') && 
                                $this->checkData2('workPeriodStart2') && $this->checkData2('workPeriodStart2') && 
                                $this->checkData2('workPeriodStop1')&& $this->checkData2('workPeriodStop2')&& 
                                $this->checkData2('workPeriodStop3')) {
//                        if ($this->checkData2('workPeriodStart1')) {
                            $value = null;
                            $value['vacancies'] = $this->getMysqlText($_POST['vacancies']);
                            $value['surname'] = $this->getMysqlText($_POST['surname']);
                            $value['name'] = $this->getMysqlText($_POST['name']);
                            $value['patronymic'] = $this->getMysqlText($_POST['patronymic']);
                            $value['dob'] = $this->getMysqlText($_POST['dob']);
                            $value['bpl'] = $this->getMysqlText($_POST['bpl']);
                            $value['citizenship'] = $this->getMysqlText($_POST['citizenship']);
                            $value['placeOfResidence'] = $this->getMysqlText($_POST['placeOfResidence']);
                            $value['phone'] = $this->getMysqlText($_POST['phone']);
                            $value['email'] = $this->getMysqlText($_POST['email']);
                            $value['marriage'] = $this->getMysqlText($_POST['marriage']);
                            $value['children'] = $this->getMysqlText($_POST['children']);
                            $value['military'] = $this->getMysqlText($_POST['military']);
                            $value['conviction'] = $this->getMysqlText($_POST['conviction']);
                            $value['car'] = $this->getMysqlText($_POST['car']);
                            $value['carCategory'] = $this->getMysqlText($_POST['carCategory']);
                            $value['carExperience'] = $this->getMysqlText($_POST['carExperience']);
                            $value['education'] = $this->getMysqlText($_POST['education']);
                            $value['workPeriodStart1'] = $this->getMysqlText($_POST['workPeriodStart1']);
                            $value['workPeriodStart2'] = $this->getMysqlText($_POST['workPeriodStart2']);
                            $value['workPeriodStart3'] = $this->getMysqlText($_POST['workPeriodStart3']);
                            $value['workPeriodStop1'] = $this->getMysqlText($_POST['workPeriodStop1']);
                            $value['workPeriodStop2'] = $this->getMysqlText($_POST['workPeriodStop2']);
                            $value['workPeriodStop3'] = $this->getMysqlText($_POST['workPeriodStop3']);
                            $value['positions1'] = $this->getMysqlText($_POST['positions1']);
                            $value['positions2'] = $this->getMysqlText($_POST['positions2']);
                            $value['positions3'] = $this->getMysqlText($_POST['positions3']);
                            $value['organization1'] = $this->getMysqlText($_POST['organization1']);
                            $value['organization2'] = $this->getMysqlText($_POST['organization2']);
                            $value['organization3'] = $this->getMysqlText($_POST['organization3']);
                            $value['region1'] = $this->getMysqlText($_POST['region1']);
                            $value['region2'] = $this->getMysqlText($_POST['region2']);
                            $value['region3'] = $this->getMysqlText($_POST['region3']);
                            $value['responsibility1'] = $this->getMysqlText($_POST['responsibility1']);
                            $value['responsibility2'] = $this->getMysqlText($_POST['responsibility2']);
                            $value['responsibility3'] = $this->getMysqlText($_POST['responsibility3']);
                            $value['income1'] = $this->getMysqlText($_POST['income1']);
                            $value['income2'] = $this->getMysqlText($_POST['income2']);
                            $value['income3'] = $this->getMysqlText($_POST['income3']);
                            $value['reasonsForDismissal1'] = $this->getMysqlText($_POST['reasonsForDismissal1']);
                            $value['reasonsForDismissal2'] = $this->getMysqlText($_POST['reasonsForDismissal2']);
                            $value['reasonsForDismissal3'] = $this->getMysqlText($_POST['reasonsForDismissal3']);
                            $value['sources'] = $this->getMysqlText($_POST['sources']);
                            $value['income'] = $this->getMysqlText($_POST['income']);
                            $value['date'] = date("Y-m-d h:i:s");
                            $value['status'] = "1";
                            $mySqlInserHelper = new MySqlInserHelper($this->getQuery($value));
                            $mySqlInserHelper->insert();
                            
                            # Заголовки (дополнительно укажете ещё)
                            $headers = "Content-Type: text/plain; charset=UTF-8\r\n";
                            $headers .= "From: {$_POST['email']}\r\n";
                            
                            $message = "Анкета соискателя на вакансию ".$this->getEmailText($_POST['vacancies'])."\r\n\r\n";
                            $message .= "ФИО соискателя: ".$this->getEmailText($_POST['surname'])." ".
                                    $this->getEmailText($_POST['name'])." ".
                                    $this->getEmailText($_POST['patronymic'])."\r\n\r\n";
                            
                            
                            $date = new DateTime($_POST['dob']);
                            $message .= "Дата рождения: ".$date->format('d.m.Y')."\r\n";
                            $message .= "Место рождения: ".$this->getEmailText($_POST['bpl'])."\r\n";
                            $message .= "Гражданство: ".$this->getEmailText($_POST['citizenship'])."\r\n\r\n";
                            
                            $message .= "Адрес проживания: ".$this->getEmailText($_POST['placeOfResidence'])."\r\n";
                            $message .= "Номер телефона: ".$this->getEmailText($_POST['phone'])."\r\n";
                            $message .= "Email: ".$this->getEmailText($_POST['email'])."\r\n\r\n";
                            
                            $message .= "Семейное положение: ".$this->getDateById("VacanciesFormMarriage",$_POST['marriage'],"marriage")."\r\n";
                            $message .= "Наличие детей, возраст: ".$this->getEmailText($_POST['children'])."\r\n";
                            $message .= "Воинская обязанность: ".$this->getDateById("VacanciesFormMilitary",$_POST['military'],"military")."\r\n";
                            $message .= "Судимость: ".$this->getDateById("VacanciesFormConviction",$_POST['conviction'],"conviction")."\r\n\r\n";
                            
                            $message .= "Личный автомобиль: ".$this->getDateById("VacanciesFormCar",$_POST['car'],"car")."\r\n";
                            $message .= "Категория прав: ".$this->getEmailText($_POST['carCategory'])."\r\n";
                            $message .= "Стаж: ".$this->getEmailText($_POST['carExperience'])."\r\n\r\n";
                            
                            $message .= "Образование.\r\nУчебное заведение, время обучения, специальность/квалификация:\r\n".
                                    $this->getEmailText($_POST['education'])."\r\n\r\n";
                            
                            $message .= "Три последних места работы.\r\n\r\n";
                            $message .= "1) ".$this->getEmailText($_POST['organization1'])."\r\n";
                            $message .= "Период работы: ".$this->getEmailText($_POST['workPeriodStart1'])." - ".
                                    $this->getEmailText($_POST['workPeriodStop1'])."\r\n";
                            $message .= "Занимаемая должность: ".$this->getEmailText($_POST['positions1'])."\r\n";
                            $message .= "Регион: ".$this->getEmailText($_POST['region1'])."\r\n";
                            $message .= "Выполняемые обязанности: ".$this->getEmailText($_POST['responsibility1'])."\r\n";
                            $message .= "Средний доход: ".$this->getEmailText($_POST['income1'])."\r\n";
                            $message .= "Причины увольнения: ".$this->getEmailText($_POST['reasonsForDismissal1'])."\r\n\r\n";
                            
                            $message .= "2) ".$this->getEmailText($_POST['organization2'])."\r\n";
                            $message .= "Период работы: ".$this->getEmailText($_POST['workPeriodStart2'])." - ".
                                    $this->getEmailText($_POST['workPeriodStop2'])."\r\n";
                            $message .= "Занимаемая должность: ".$this->getEmailText($_POST['positions2'])."\r\n";
                            $message .= "Регион: ".$this->getEmailText($_POST['region2'])."\r\n";
                            $message .= "Выполняемые обязанности: ".$this->getEmailText($_POST['responsibility2'])."\r\n";
                            $message .= "Средний доход: ".$this->getEmailText($_POST['income2'])."\r\n";
                            $message .= "Причины увольнения: ".$this->getEmailText($_POST['reasonsForDismissal2'])."\r\n\r\n";
                            
                            $message .= "3) ".$this->getEmailText($_POST['organization3'])."\r\n";
                            $message .= "Период работы: ".$this->getEmailText($_POST['workPeriodStart3'])." - ".
                                    $this->getEmailText($_POST['workPeriodStop3'])."\r\n";
                            $message .= "Занимаемая должность: ".$this->getEmailText($_POST['positions3'])."\r\n";
                            $message .= "Регион: ".$this->getEmailText($_POST['region3'])."\r\n";
                            $message .= "Выполняемые обязанности: ".$this->getEmailText($_POST['responsibility3'])."\r\n";
                            $message .= "Средний доход: ".$this->getEmailText($_POST['income3'])."\r\n";
                            $message .= "Причины увольнения: ".$this->getEmailText($_POST['reasonsForDismissal3'])."\r\n\r\n";
                            
                            
                            $message .= "Ожидаемый доход: ".$this->getEmailText($_POST['income'])."\r\n";
                            $message .= "Источник вакансии: ".$this->getEmailText($_POST['sources'])."\r\n";
                            $message .= "Дата: ".date("Y-m-d h:i:s")."\r\n\r\n";
                            
                            $message .= "Текущий статус анкеты: ".$this->getDateById("VacanciesFormStatus",1,"status")."\r\n";
                            
                            # Отправляем
                            if(mail('vacancy@apelsin.ru', $this->getEmailText($_POST['vacancies']), $message, $headers )){
                                $this->insertOk = "Ваша анкета успешно отправлена и будет рассмотрена в течении недели. При положительном решении мы свяжемся с Вами для согласования времени собеседования. Если в течении указанного времени с Вами никто не связался, значит Ваша кандидатура на Данный момент не соответствует нашим требованиям.";
                                unset($_POST);
                            } else {
                                $this->insertError = 'Ошибка при отправке сообщения';
                            }
                        }else {
                            $this->insertError = "Неправильный формат даты. Дата должна быть в формате ГГГГ-ММ-ДД";
                        }
                    } else {
                        $this->insertError = "Неправильно задан Email.";
                    }
                } else {
                    $this->insertError = "Не заполнены обязательные поля";
                }
            } else {
                $this->insertError = "Введен неверный проверочный код";
            }
            if($this->insertError!=null) {
                echo '<script type="text/javascript">';
                echo 'alert("Во время добавления анкеты произошла ошибка:\n'.$this->insertError.'");';
                echo '</script>';
            }
            if($this->insertOk!=null) {   
                echo '<script type="text/javascript">';
                echo 'alert("'.$this->insertOk.'");';
                echo '</script>';
                $_POST = null;
            }
        }
    }
}
?>