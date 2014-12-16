<?php
$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('contactsUnitsTypes', 'Редактирование типов контактов', 'contactsUnitsTypesUI.php');
$mainPanelUI->addElement('contactsUnits', 'Редактирование контактов', 'contactsUnitsUI.php');
$mainPanelUI->getUI();