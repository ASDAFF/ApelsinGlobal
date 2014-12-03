<?php
    include_once './components/Contacts/admin/classes/AP_ContactsBildingsDelete.php';
    include_once './components/Contacts/admin/classes/AP_ContactsBildingsEdit.php';
    include_once './components/Contacts/admin/classes/AP_ContactsBildingsAdd.php';
    include_once './components/Contacts/admin/classes/AP_ContactsBildingsMain.php';
    $ap_ContactsBildingsMain = new AP_ContactsBildingsMain();
    echo $ap_ContactsBildingsMain->getHtml();
?>
