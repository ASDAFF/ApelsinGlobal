<script type="text/javascript" src="./components/Contacts/js/ContactsUnitsShowHideElements.js"></script>
<script type="text/javascript" src="./components/Contacts/js/ContactsUnitFeedback.js"></script>
<?php
include_once './components/Contacts/classes/ContactsTimeTableUI.php';
include_once './components/Contacts/classes/ContactsUI.php';
include_once './components/Contacts/classes/ContactsWorkers.php';
include_once './components/Contacts/classes/Contacts.php';
global $CONTACTS;
$CONTACTS = new Contacts();
echo $CONTACTS->getJS();
?>