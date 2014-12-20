<?php
$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('contactsUnitsTypes', 'Редактирование типов контактов', 'contactsUnitsTypesUI.php');
$mainPanelUI->addElement('contactsUnits', 'Редактирование контактов юнитов', 'contactsUnitsUI.php');
$mainPanelUI->addElement('сontactsWorkers', 'Редактирование контактов сотрудников', 'сontactsWorkersUI.php');
$mainPanelUI->addElement('сontactsWorkersPosts', 'Редактирование должностей сотрудников', 'сontactsWorkersPosts.php');
$mainPanelUI->getUI();