<link href="./modules/ApelsinContactsNavigationPanel/css/ApelsinContactsNavigationPanel.css" type="text/css" media="all" rel="stylesheet" />
<script src="./modules/ApelsinContactsNavigationPanel/js/ApelsinContactsNavigationPanel.js"></script>
<?php
include_once './modules/ApelsinContactsNavigationPanel/classes/ApelsinContactsNavigationPanel_SiteMapTab.php';
include_once './modules/ApelsinContactsNavigationPanel/classes/ApelsinContactsNavigationPanel.php';
global $apelsinContactsNavigationPanel;
$apelsinContactsNavigationPanel = new ApelsinContactsNavigationPanel();
echo $apelsinContactsNavigationPanel->getJS();
?>
<!--<script>
$(document).ready(function() {
    ApelsinContactsNavigationPanel_GetTab(1);
});
</script>-->