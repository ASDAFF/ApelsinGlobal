<?php
include_once './components/Contacts_old/classes/ContactsWokrkersList.php';
include_once './components/Contacts_old/classes/ContactTimeTable.php';
include_once './components/Contacts_old/classes/ContactDepartments.php';

global $_PARAM;

$contactsDepartments = new ContactDepartments($_PARAM['name'],null);
$contactsDepartments->get();
?>
