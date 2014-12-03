<?php
include_once './components/Contacts/classes/ContactsWokrkersList.php';
include_once './components/Contacts/classes/ContactTimeTable.php';
include_once './components/Contacts/classes/ContactDepartments.php';

global $_PARAM;

$contactsDepartments = new ContactDepartments($_PARAM['name'],null);
$contactsDepartments->get();
?>
