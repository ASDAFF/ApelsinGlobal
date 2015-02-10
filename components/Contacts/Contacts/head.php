<script type="text/javascript" src="./components/Contacts/js/ContactsUnitsShowHideElements.js"></script>
<script type="text/javascript" src="./components/Contacts/js/ContactsTabs.js"></script>
<script type="text/javascript" src="./components/Contacts/js/ContactsUnitFeedback.js"></script>
<?php
include_once './components/Contacts/classes/ContactsTimeTableUI.php';
include_once './components/Contacts/classes/ContactsUI.php';
include_once './components/Contacts/classes/ContactsUI_Tabs.php';
include_once './components/Contacts/classes/ContactsUI_ElementsBlocks.php';
include_once './components/Contacts/classes/ContactsUI_ElementsBlocks_OnlyWokers.php';
include_once './components/Contacts/classes/ContactsUI_ElementsList.php';
include_once './components/Contacts/classes/ContactsUI_ElementsHelpert.php';
include_once './components/Contacts/classes/ContactsWorkers.php';
include_once './components/Contacts/classes/Contacts.php';
global $CONTACTS;
$CONTACTS = new Contacts();
echo $CONTACTS->getJS();
?>