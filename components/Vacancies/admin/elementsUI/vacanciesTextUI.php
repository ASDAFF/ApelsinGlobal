<?php
    include_once './components/Vacancies/admin/classes/AP_VacanciesTextEdit.php';
    $ap_VacanciesTextEdit = new AP_VacanciesTextEdit();
    echo $ap_VacanciesTextEdit->getHtml();
?>