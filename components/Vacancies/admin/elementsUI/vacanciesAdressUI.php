<?php
    include_once './components/Vacancies/admin/classes/AP_VacanciesAdressDelete.php';
    include_once './components/Vacancies/admin/classes/AP_VacanciesAdressEdit.php';
    include_once './components/Vacancies/admin/classes/AP_VacanciesAdressAdd.php';
    include_once './components/Vacancies/admin/classes/AP_VacanciesAdressMain.php';
    $ap_VacanciesAdressMain = new AP_VacanciesAdressMain();
    echo $ap_VacanciesAdressMain->getHtml();