<?php
include_once './components/Feedback/admin/classes/AP_ListIPDelete.php';
include_once './components/Feedback/admin/classes/AP_ListIPEdit.php';
include_once './components/Feedback/admin/classes/AP_ListIPAdd.php';
include_once './components/Feedback/admin/classes/AP_ListIPMain.php';
$ap_listIPMain = new AP_ListIPMain();
echo $ap_listIPMain->getHtml();