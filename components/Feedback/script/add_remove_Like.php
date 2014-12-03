<?php
header("Content-type: text/html; charset=UTF-8");
if(isset($_POST['feedback']) && $_POST['feedback'] != "" && $_POST['feedback'] != null &&
        isset($_POST['ip']) && $_POST['ip'] != "" && $_POST['ip'] != null &&
        isset($_POST['like']) && $_POST['like'] != "" && $_POST['like'] != null) {
    include_once '../classes/FeedbackToggleLike.php';  
    $like = new FeedbackToggleLike($_POST['feedback'], $_POST['ip'] ,$_POST['like']);
    echo $like->getLike(); 
}