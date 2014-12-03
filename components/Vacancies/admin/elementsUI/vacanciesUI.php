<?php
    include_once './components/Vacancies/admin/classes/AP_VacanciesDelete.php';
    include_once './components/Vacancies/admin/classes/AP_VacanciesEdit.php';
    include_once './components/Vacancies/admin/classes/AP_VacanciesAdd.php';
    include_once './components/Vacancies/admin/classes/AP_VacanciesMain.php';
    $ap_VacanciesMain = new AP_VacanciesMain();
    echo $ap_VacanciesMain->getHtml();