<?php
$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('vacancies', 'Редактирование вакансий', 'vacanciesUI.php');
$mainPanelUI->addElement('vacanciesAdress', 'Редактирование адреса вакансии', 'vacanciesAdressUI.php');
$mainPanelUI->addElement('vacanciesText', 'Редактирование текста на странице вакансий', 'vacanciesTextUI.php');
$mainPanelUI->addElement('downloadVacancies', 'Импортировать выгрузку', 'downloadVacanciesUI.php');
$mainPanelUI->addElement('saveUnloadedVacancies', 'Восстановить выгрузкку', 'saveUnloadedVacanciesUI.php');
$mainPanelUI->addElement('deleteVacanciesBackUp', 'Удалить файлы "BackUp"', 'deleteVacanciesBackUpUI.php');
$mainPanelUI->getUI();
?>