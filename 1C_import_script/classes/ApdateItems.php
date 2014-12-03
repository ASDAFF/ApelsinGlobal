<?php
class ApdateItems {
    private $file = './ImportFiles/Item.xml';
    private $elements;
    private $mysqlElements;
    private $cellAlias;
    private $SQL_HELPER;
    
    public function __construct() {
        $this->SQL_HELPER = new MysqliHelper();
        $this->preset();
        $this->execute();
    }
    
    /**
     * Устанвока предварительных значений
     */
    private function preset() {
        $this->setCellsAliases();
        $this->getMysqlElementsData();
        $this->setAllDeleted();
        $this->getElementsData();
    }
    
    private function setAllDeleted() {
        $query = "UPDATE `Item` SET `deleted`='0';";
        $this->SQL_HELPER->insert($query);
    }


    /**
     * Получаем списко известных товаров
     */
    private function getMysqlElementsData() {
        $query = "SELECT `alias` FROM  `Item`;";
        $result = $this->SQL_HELPER->select($query);
        $this->mysqlElements = array();
        if($result!=null) {
            foreach ($result as $item) {
                $row = count($this->mysqlElements);
                $this->mysqlElements[$row] = $item['alias'];
            }
        }
    }
    
    /**
     * Получаем данные об элементах из выгрузки
     */
    private function getElementsData() {
        $xmlwebi = new XML();
        $items = $xmlwebi->xmlwebi($this->file);
        $this->elements = array();
        foreach ($items['Item'][0]['#']['Element'] as $element) {
            $row = count($this->elements);
            foreach ($this->cellAlias as $cell) {
                $this->elements[$row][$cell['mysql']] = $this->getElementCellValue($element,$cell['1c']);
            }
            if(in_array($this->getElementCellValue($element,$this->cellAlias[0]['1c']), $this->mysqlElements)) {
                $this->elements[$row]['isApdete'] = true;
            } else {
                $this->elements[$row]['isApdete'] = false;
                $this->setDefaultInsertValue($row);
            }
            $this->elements[$row]['deleted'] = '1';
        }
    }
    
    private function getElementCellValue($element,$key) {
        return $element['#'][$key][0]['#'];
    }
    
    private function execute() {
        foreach ($this->elements as $element) {
            if($element['isApdete']) {
                $this->SQL_HELPER->insert($this->generateUpdateSQL($element));
            } else {
                $this->SQL_HELPER->insert($this->generateAddSQL($element));
            }
        }
        echo 'Импорт товаров выполнен.';
    }
    
    private function generateUpdateSQL($element) {
        return "UPDATE `Item` SET "
                . "`alias`='".$element['alias']."',"
                . "`article`=".$this->getMayBeNullValue($element['article']).","
                . "`name`='".$element['name']."',"
                . "`siteName`='".$element['siteName']."',"
                . "`country`=".$this->getMayBeNullValue($element['country']).","
                . "`provider`=".$this->getMayBeNullValue($element['provider']).","
                . "`measure`=".$this->getMayBeNullValue($element['measure']).","
                . "`amount`='".$element['amount']."',"
                . "`price`='".$element['price']."',"
                . "`promotionalItem`='".$element['promotionalItem']."',"
                . "`deleted`='".$element['deleted']."' "
                . "WHERE `alias`='".$element['alias']."';";
    }
    private function generateAddSQL($element) {
        return "INSERT INTO `Item`(`alias`, `article`, `name`, `siteName`, 
            `description`, `group`, `country`, `provider`, `measure`, 
            `amount`, `price`, `promotionalItem`, `shown`, `deleted`) 
                VALUES ('".$element['alias']."', 
                 ".$this->getMayBeNullValue($element['article']).",
                '".$element['name']."', 
                '".$element['siteName']."',
                 ".$this->getMayBeNullValue($element['description']).", 
                '".$element['group']."', 
                 ".$this->getMayBeNullValue($element['country']).", 
                 ".$this->getMayBeNullValue($element['provider']).",
                 ".$this->getMayBeNullValue($element['measure']).", 
                '".$element['amount']."',
                '".$element['price']."', '".$element['promotionalItem']."',
                '".$element['shown']."', '".$element['deleted']."');";
    }
    
    private function getMayBeNullValue($value) {
        if(
            $value == '' || $value == 'NONE' || $value == 'none' || $value == 'None' || 
            $value == null || $value == 'NULL' || $value == 'null' || $value == 'Null'
        ) {
            return "NULL";
        } else {
            return "'".$value."'";
        }
    }

/******************************************************************************/
    /**
     * Устанавливает соотношение названий колонок mysql и 1c 
     */
    private function setCellsAliases() {
        $this->cellAlias = array();
        $this->addCellAlias ('alias', 'Alias');
        $this->addCellAlias ('article', 'Article');
        $this->addCellAlias ('name', 'Name');
        $this->addCellAlias ('siteName', 'SiteName');
        $this->addCellAlias ('country', 'Country');
        $this->addCellAlias ('provider', 'Provider');
        $this->addCellAlias ('amount', 'Amount');
        $this->addCellAlias ('measure', 'Measure');
        $this->addCellAlias ('price', 'Price');
        $this->addCellAlias ('promotionalItem', 'PromotionalItem');
    }
    
    /**
     * Добавляет соотношение названия колонки mysql и 1c
     * @param type $alias_mysql
     * @param type $alias_1c
     */
    private function addCellAlias ($alias_mysql, $alias_1c) {
        $row = count($this->cellAlias);
        $this->cellAlias[$row]['mysql'] = $alias_mysql;
        $this->cellAlias[$row]['1c'] = $alias_1c;
    }
    
    private function setDefaultInsertValue($row) {
        $this->elements[$row]['description'] = '';
        $this->elements[$row]['group'] = 'NONE';
        $this->elements[$row]['shown'] = '0';
    }
/******************************************************************************/
}
