<?php
include_once './components/Vacancies/classes/BlankForm.php';
include_once './components/Vacancies/classes/Vacancies.php';

global $vacancies;
$vacancies = new Vacancies();
$vacancies->get();
//$vacancies->insert();
?>
