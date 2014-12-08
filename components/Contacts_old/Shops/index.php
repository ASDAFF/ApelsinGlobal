<?php
include_once './components/Contacts_old/classes/ReviewsForm.php';
include_once './components/Contacts_old/classes/ContactsWokrkersList.php';
include_once './components/Contacts_old/classes/ContactsShopBuilding.php';
include_once './components/Contacts_old/classes/ContactTimeTable.php';
include_once './components/Contacts_old/classes/ContactsShop.php';

$contactsShop = new ContactsShop();
$contactsShop->getHead();
$contactsShop->get();

?>
