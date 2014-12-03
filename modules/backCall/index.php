<?php
include_once './modules/backCall/classes/BackCall.php';
$backCall = new BackCall();
echo $backCall->get();
?>