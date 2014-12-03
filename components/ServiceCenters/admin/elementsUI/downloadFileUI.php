<?php
    include_once './components/ServiceCenters/admin/classes/AP_DownloadFileMain.php';
    $ap_DownloadFileMain = new AP_DownloadFileMain();
    echo $ap_DownloadFileMain->getHtml();
?>