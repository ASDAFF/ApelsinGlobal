<?php
    include_once './components/Contacts_old/admin/classes/AP_ContactsDepartmentsDelete.php';
    include_once './components/Contacts_old/admin/classes/AP_ContactsDepartmentsEdit.php';
    include_once './components/Contacts_old/admin/classes/AP_ContactsDepartmentsAdd.php';
    include_once './components/Contacts_old/admin/classes/AP_ContactsDepartmentsMain.php';
    $ap_ContactsDepartmentsMain = new AP_ContactsDepartmentsMain();
    echo $ap_ContactsDepartmentsMain->getHtml();
?>

