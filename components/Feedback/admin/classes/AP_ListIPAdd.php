<?php
/**
 * Description of AP_ListIPAdd
 *
 * @author olga
 */
class AP_ListIPAdd extends AdminPanel_ComponentPanelUI_Element_Add {
    
    protected function getInputBlocks() { 
        $html = parent::getInputBlocks();
        $currentIPUser = $_SERVER['REMOTE_ADDR'];
        echo '<script language="JavaScript">';
        echo '$(document).ready(function(){
                var ip = "'.$currentIPUser.'";
                $(\'#currentIpAdminButton\').click(function(){
                    $(\'#currentIpAdmin\').val(ip);
                });
            });';
        echo '</script>';
        // ip
        $ip = $this->inputHelper->paternTextBox('ip', 'currentIpAdmin', 'currentIpAdmin', 100, true, 'Четыре группы цифр, разделённых точкой. Группа цифр может включать от одной до трёх цифр в диапазоне от 0 до 9.', '^[0-9]{1,3}+[\.]+[0-9]{1,3}+[\.]+[0-9]{1,3}+[\.][0-9]{1,3}$', $this->originalInsertValue['alias']);
        $currentIP = '<div class="currentIpAdminButton" id="currentIpAdminButton">Текущий IP</div>';
        $html .= $this->inputHelper->createFormRow($ip.$currentIP, true, 'IP');
        // status
        $status = $this->inputHelper->select('status', 'status', $this->getDataStatus(), true, $this->originalInsertValue['status']);
        $html .= $this->inputHelper->createFormRow($status, true, 'Статус IP');
        // comment
        $comment = $this->inputHelper->textarea('comment', 'comment', 'comment', 50000, false,$this->originalInsertValue['comment']);
        $html .= $this->inputHelper->createFormRow($comment, false, 'Комментарий');
        return $html;
    }
    
    protected function setDefaltInput() { 
        parent::setDefaltInput();
        $this->insertValue['alias'] = $_SERVER['REMOTE_ADDR'];
        $this->insertValue['status'] = parent::getOriginalPostValue('status');
        $this->insertValue['comment'] = parent::getOriginalPostValue('comment');
        $this->originalInsertValue = $this->insertValue;
    }

    protected function getAllValue() {
        parent::getAllValue();
        $this->insertValue = array();
        $this->insertValue['alias'] = parent::getPostValue('ip');
        $this->insertValue['status'] = parent::getPostValue('status');
        if(isset($_POST['comment']) && $_POST['comment']!=null && $_POST['comment']!="") {
            $this->insertValue['comment'] = parent::getPostValue('comment');
        } 
    }
    
    protected function checkAllValue() {         
        parent::checkAllValue();
        $error = false;
        if(!$this->checkValue('ip',"/^[0-9]{1,3}+[\.]+[0-9]{1,3}+[\.]+[0-9]{1,3}+[\.][0-9]{1,3}$/")) {
            $error = true;
            $this->checkAllValueErrors[] = "Разрешено четыре группы цифр, разделённых точкой. Группа цифр может включать от одной до трёх цифр в диапазоне от 0 до 9.";
        }
        if(!$this->checkAlias()) {
            $error = true;
            $this->checkAllValueErrors[] = "Такой IP уже используется";
        }
        if(!$this->checkValue('status')) {
            $error = true;
            $this->checkAllValueErrors[] = "Выберите cтатус";
        }
        $this->insertValue['comment'] = parent::getPostValue('comment');
        return !$error;
    }

//    protected function getElementID() {
//        parent::getElementID();
//        return $this->insertValue['ip'];
//    }
    
    protected function insertExecute() {
        parent::insertExecute();
        $queryListIP = "INSERT INTO `FeedbacksListIP` SET ";
        $queryListIP .= "`ip` = '".$this->insertValue['alias']."', ";
        $queryListIP .= "`status` = '".$this->insertValue['status']."', ";
        $queryListIP .= "`comment` = ".InputValueHelper::mayByNull($this->insertValue['comment'])."; ";

        $this->SQL_HELPER->insert($queryListIP);
//        echo var_dump($queryListIP). '<hr>';
    }
    
    private function getDataStatus() {
        $status = array();
        $query = "SELECT  *  FROM `FeedbacksListIPStatus`;";
        $result = $this->SQL_HELPER->select($query);
        foreach ($result as $key => $value) {
            $status[$key]['text'] = $value['status'];
            $status[$key]['value'] = $value['status'];
        }
        return $status;
    }
    
    private function checkAlias() {
        $result = array();
        if(isset($_POST['ip']) && $_POST['ip']!=null && $_POST['ip']!="") {
            $query = "SELECT * FROM `FeedbacksListIP` WHERE `ip`='".$_POST['ip']."';";
            $result = $this->SQL_HELPER->select($query,1);
        }
        return $result == null;
    }
}