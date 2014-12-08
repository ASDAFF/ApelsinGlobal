<?php
    include_once './components/Contacts_old/admin/classes/AP_ContactsWorkersPostsDelete.php';
    include_once './components/Contacts_old/admin/classes/AP_ContactsWorkersPostsEdit.php';
    include_once './components/Contacts_old/admin/classes/AP_ContactsWorkersPostsAdd.php';
    include_once './components/Contacts_old/admin/classes/AP_ContactsWorkersPostsMain.php';
    $ap_ContactsWorkersPostsMain = new AP_ContactsWorkersPostsMain();
    echo $ap_ContactsWorkersPostsMain->getHtml();
?>
