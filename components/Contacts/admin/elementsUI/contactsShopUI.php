<?php
    include_once './components/Contacts/admin/classes/AP_ContactsShopDelete.php';
    include_once './components/Contacts/admin/classes/AP_ContactsShopEdit.php';
    include_once './components/Contacts/admin/classes/AP_ContactsShopAdd.php';
    include_once './components/Contacts/admin/classes/AP_ContactsShopMain.php';
    $ap_ContactsShopMain = new AP_ContactsShopMain();
    echo $ap_ContactsShopMain->getHtml();
?>
