<?php
    include_once './components/Contacts_old/admin/classes/AP_ContactDepartmentsListDelete.php';
    include_once './components/Contacts_old/admin/classes/AP_ContactDepartmentsListEdit.php';
    include_once './components/Contacts_old/admin/classes/AP_ContactDepartmentsListAdd.php';
    include_once './components/Contacts_old/admin/classes/AP_ContactDepartmentsListMain.php';
    $ap_ContactDepartmentsListMain = new AP_ContactDepartmentsListMain();
    echo $ap_ContactDepartmentsListMain->getHtml();
?>

