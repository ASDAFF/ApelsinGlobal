<?php
include_once './components/Contacts_old/classes/ContactsWokrkersList.php';
include_once './components/Contacts_old/classes/ContactTimeTable.php';
include_once './components/Contacts_old/classes/ContactDepartments.php';
include_once './components/Contacts_old/classes/ContactDepartmentsList.php';

$contactDepartmentsList = new ContactDepartmentsList();
$contactDepartmentsList->get();
?>
