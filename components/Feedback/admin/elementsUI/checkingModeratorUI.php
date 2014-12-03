<?php
include_once './components/Feedback/admin/classes/AP_CheckingModertor.php';
$ap_CheckingModertor = new AP_CheckingModertor();
echo $ap_CheckingModertor->getHtml();