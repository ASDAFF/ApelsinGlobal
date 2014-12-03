<?php
include_once './components/Feedback/admin/classes/AP_FeedbacksDelete.php';
include_once './components/Feedback/admin/classes/AP_FeedbacksEdit.php';
include_once './components/Feedback/admin/classes/AP_FeedbacksAdd.php';
include_once './components/Feedback/admin/classes/AP_FeedbacksMain.php';
$ap_FeedbacksMain = new AP_FeedbacksMain();
echo $ap_FeedbacksMain->getHtml();