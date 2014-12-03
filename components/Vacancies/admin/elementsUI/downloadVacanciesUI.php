<?php
    include_once './components/Vacancies/admin/classes/AP_VacanciesValidInserFromFile.php';
    include_once './components/Vacancies/admin/classes/AP_DownloadVacanciesMain.php';
    $ap_DownloadVacanciesMain = new AP_DownloadVacanciesMain();
    echo $ap_DownloadVacanciesMain->getHtml();
?>