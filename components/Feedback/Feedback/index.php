<?php
include_once './components/Feedback/classes/FeedBackAdd.php';
include_once './components/Feedback/classes/FeedBackList.php';
include_once './components/Feedback/classes/FeedBackAddComment.php';
include_once './components/Feedback/classes/FeedBackMain.php';
$feedBackMain = new FeedBackMain();
echo $feedBackMain->getUI();
?>