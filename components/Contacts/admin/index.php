<?php
$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('contactsBildings', 'Редактирование контактов зданий', 'contactsBildingsUI.php');
$mainPanelUI->addElement('contactsShop', 'Редактирование контактов магазинов', 'contactsShopUI.php');
$mainPanelUI->addElement('contactsDepartments', 'Редактирование контактов отделов', 'contactsDepartmentsUI.php');
$mainPanelUI->addElement('listsDepartments', 'Редактирование списков отделов', 'listDepartmentUI.php');
$mainPanelUI->addElement('departmentInListDepartment', 'Редактирование отделов в списках отделов', 'departmentInListDepartmentUI.php');
$mainPanelUI->addElement('workers', 'Редактирование данных сотрудников', 'workersUI.php');
$mainPanelUI->addElement('workersList', 'Редактирование списков сотрудников', 'workersListUI.php');
$mainPanelUI->addElement('workersPosts', 'Редактирование должностей сотрудников', 'workersPostsUI.php');
$mainPanelUI->getUI();
?>