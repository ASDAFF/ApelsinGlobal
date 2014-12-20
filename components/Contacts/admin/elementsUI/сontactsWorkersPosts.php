<?php
include_once './components/Contacts/admin/classes/AP_сontactsWorkersPostsDelete.php';
include_once './components/Contacts/admin/classes/AP_сontactsWorkersPostsEdit.php';
include_once './components/Contacts/admin/classes/AP_сontactsWorkersPostsAdd.php';
include_once './components/Contacts/admin/classes/AP_сontactsWorkersPostsMain.php';
$ap_сontactsWorkersPostsMain = new AP_сontactsWorkersPostsMain();
echo $ap_сontactsWorkersPostsMain->getHtml();