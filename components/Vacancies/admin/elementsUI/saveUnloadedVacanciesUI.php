<?php
    include_once './components/Vacancies/admin/classes/AP_VacanciesValidInserFromFile.php';
    include_once './components/Vacancies/admin/classes/AP_SaveUnloadedVacanciesMain.php';
    $ap_SaveUnloadedVacanciesMain = new AP_SaveUnloadedVacanciesMain();
    echo $ap_SaveUnloadedVacanciesMain->getHtml();
?>