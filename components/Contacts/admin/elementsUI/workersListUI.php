<?php
    include_once './components/Contacts/admin/classes/AP_ContactsWorkersListDelete.php';
    include_once './components/Contacts/admin/classes/AP_ContactsWorkersListEdit.php';
    include_once './components/Contacts/admin/classes/AP_ContactsWorkersListAdd.php';
    include_once './components/Contacts/admin/classes/AP_ContactsWorkersListMain.php';
    $ap_ContactsWorkersListMain = new AP_ContactsWorkersListMain();
    echo $ap_ContactsWorkersListMain->getHtml();
?>

