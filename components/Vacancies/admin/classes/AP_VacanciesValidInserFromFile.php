<?php

class AP_VacanciesValidInserFromFile {
    
    private $dir;
    private $fileName;
    private $arrayVacancies;
    private $arrayAdress;
    private $list;


    public function __construct($dir,$fileName) {
        $this->dir = $dir;
        $this->fileName = $fileName;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->setElementsCells();
    }
    
    private function setElementsCells() {
        $this->elementsCells = array();
        $this->elementsCells[0]['1c'] = 'Unit';
        $this->elementsCells[0]['mysql'] = 'adress';
        $this->elementsCells[1]['1c'] = 'Author';
        $this->elementsCells[1]['mysql'] = 'contactUser';
        $this->elementsCells[2]['1c'] = 'Job';
        $this->elementsCells[2]['mysql'] = 'vacancies';
        $this->elementsCells[3]['1c'] = 'Telefon';
        $this->elementsCells[3]['mysql'] = 'contactInfo';
    }

    private function getFileDate() {
        $xmlwebi = new XML();
        $items = $xmlwebi->xmlwebi($this->dir.$this->fileName);
        $this->elements = array();
        $i = 0;
        if(isset($items['BodyJobFile'][0]['#']['Item'])) {
            foreach ($items['BodyJobFile'][0]['#']['Item'] as $element) {
                foreach ($this->elementsCells as $elementsCell) {
                    $this->elements[$i][$elementsCell['mysql']] = $this->getElementCellValue($element, $elementsCell['1c']);
                }
                $i++;
            }
        }
    }

    private function getElementCellValue($element, $key) {
        if(isset($element['#'][$key][0]['#'])) {
            return $element['#'][$key][0]['#'];
        } else {
            return "";
        }
    }
    
    public function insertToMysql() {
        $this->getFileDate();
        $this->getVacanciesData();
        $this->getAdressData();
        
        $query = "TRUNCATE TABLE  `VacanciesValid`;";
        $this->SQL_HELPER->insert($query);
        $i = 0;
        $queryVacanciesValid = array();
        $this->list = array();
        foreach ($this->elements as $element) {
            if (!in_array($element['vacancies'], $this->arrayVacancies) || (!in_array($element['adress'], $this->arrayAdress))) {
                $this->list[$i]['error'] = $element;
            } else {
                $this->list[$i]['value'] = $element;
                $queryVacanciesValid[] = $this->getQuery($element);
            }
            $i++;
        }
        foreach ($queryVacanciesValid as $queryVacanciesVal) {
            $this->SQL_HELPER->insert($queryVacanciesVal);
        }
    }
    
    public function getList() {
        $out = '';
        if ($this->list != null) {
            foreach ($this->list as $column ) {
                foreach (array_keys($column) as $key ) {
                    if ($column[$key] != null) {
                        if ($key == 'error') {
                            $color = 'red';
                            $message = "Вакансия, содержащая не корректные данные, не была добавлена :";
                        } else {
                            $color = 'green';
                            $message = "Добавленно :";
                        }
                        $out .= '<h3><p>'.$message.'</p></h3>';
                        $out .= '<div style="color: '.$color.';">';
                        $out .= '<p>Адрес: '.$column[$key]['adress'].'</p>';
                        $out .= '<p>ФИО: '.$column[$key]['contactUser'].'</p>';
                        $out .= '<p>Вакансия: '.$column[$key]['vacancies'].'</p>';
                        $out .= '</div>';
                    }
                }
            } 
        }
        return $out;
    }

    private function getQuery($mass) {
        $query = "INSERT INTO `VacanciesValid` SET ";
        foreach ($mass as $key => $value ) {
            $query .= "`$key`='".$value."',";
        }
        $query = substr($query, 0, strlen($query)-1);
        $query .= ";";
        return $query;
    }
    
    private function getVacanciesData() {
        $this->arrayVacancies = array();
        $query = "SELECT `name` FROM `Vacancies` ";
        $result = $this->SQL_HELPER->select($query);
        foreach (array_values($result) as $vacancies) {
            $this->arrayVacancies[] .= $vacancies['name'];
        }
        return $this->arrayVacancies;
    }
    
    private function getAdressData() {
        $this->arrayAdress = array();
        $query = "SELECT `adress` FROM `VacanciesAdress` ";
        $result = $this->SQL_HELPER->select($query);
        foreach (array_values($result) as $vacancies) {
            $this->arrayAdress[] .= $vacancies['adress'];
        }
        return $this->arrayAdress;
    }
}