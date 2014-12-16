<?php
    include_once './components/Contacts/admin/classes/AP_contactsUnitsTypesDelete.php';
    include_once './components/Contacts/admin/classes/AP_contactsUnitsTypesEdit.php';
    include_once './components/Contacts/admin/classes/AP_contactsUnitsTypesAdd.php';
    include_once './components/Contacts/admin/classes/AP_contactsUnitsTypesMain.php';
    $ap_ContactsUnitsTypesMain = new AP_contactsUnitsTypesMain();
    echo $ap_ContactsUnitsTypesMain->getHtml();