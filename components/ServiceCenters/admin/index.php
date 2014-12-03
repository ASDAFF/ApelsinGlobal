<?php
$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('downloadFile', 'Импортировать выгрузку', 'downloadFileUI.php');
$mainPanelUI->addElement('saveUnloadedFile', 'Восстановить выгрузкку', 'saveUnloadedFileUI.php');
$mainPanelUI->addElement('deleteFileBackUp', 'Удалить файлы "BackUp"', 'deleteFileBackUpUI.php');
$mainPanelUI->getUI();
?>