<?php
include_once './components/Contacts/admin/classes/AP_сontactsWorkersDelete.php';
include_once './components/Contacts/admin/classes/AP_сontactsWorkersEdit.php';
include_once './components/Contacts/admin/classes/AP_сontactsWorkersAdd.php';
include_once './components/Contacts/admin/classes/AP_сontactsWorkersMain.php';
$ap_сontactsWorkersMain = new AP_сontactsWorkersMain();
echo $ap_сontactsWorkersMain->getHtml();