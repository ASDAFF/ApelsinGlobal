<?php
    include_once './components/Contacts/admin/classes/AP_contactsUnitsDelete.php';
    include_once './components/Contacts/admin/classes/AP_contactsUnitsEdit.php';
    include_once './components/Contacts/admin/classes/AP_contactsUnitsAdd.php';
    include_once './components/Contacts/admin/classes/AP_contactsUnitsMain.php';
    $ap_contactsUnitsMain = new AP_contactsUnitsMain();
    echo $ap_contactsUnitsMain->getHtml();