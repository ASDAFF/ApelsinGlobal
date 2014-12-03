<?php
include_once './components/Contacts/classes/ContactsWokrkersList.php';
include_once './components/Contacts/classes/ContactsShopBuilding.php';
include_once './components/Contacts/classes/ContactTimeTable.php';
include_once './components/Contacts/classes/ContactsShop.php';

$contactsShop = new ContactsShop();
$contactsShop->getPrintHead();
$contactsShop->getPrint();
?>
