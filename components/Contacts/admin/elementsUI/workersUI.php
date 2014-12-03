<?php
    include_once './components/Contacts/admin/classes/AP_ContactsWorkersDelete.php';
    include_once './components/Contacts/admin/classes/AP_ContactsWorkersEdit.php';
    include_once './components/Contacts/admin/classes/AP_ContactsWorkersAdd.php';
    include_once './components/Contacts/admin/classes/AP_ContactsWorkersMain.php';
    $ap_ContactsWorkersMain = new AP_ContactsWorkersMain();
    echo $ap_ContactsWorkersMain->getHtml();
?>
