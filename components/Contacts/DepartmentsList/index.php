<?php
include_once './components/Contacts/classes/ContactsWokrkersList.php';
include_once './components/Contacts/classes/ContactTimeTable.php';
include_once './components/Contacts/classes/ContactDepartments.php';
include_once './components/Contacts/classes/ContactDepartmentsList.php';

$contactDepartmentsList = new ContactDepartmentsList();
$contactDepartmentsList->get();
?>
