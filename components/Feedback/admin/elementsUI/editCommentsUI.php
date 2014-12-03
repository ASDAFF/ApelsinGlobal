<?php
include_once './components/Feedback/admin/classes/AP_CommentsDelete.php';
include_once './components/Feedback/admin/classes/AP_CommentsEdit.php';
include_once './components/Feedback/admin/classes/AP_CommentsAdd.php';
include_once './components/Feedback/admin/classes/AP_CommentsMain.php';
$ap_editCommentsMain = new AP_CommentsMain();
echo $ap_editCommentsMain->getHtml();