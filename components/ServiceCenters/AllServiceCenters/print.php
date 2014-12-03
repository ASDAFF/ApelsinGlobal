<?php
$file = './xml_db/service_centers.xml';
$xmlwebi = new XML();
$arr = $xmlwebi->xmlwebi($file);


$out = '<h1>Сервисные центры</h1>';
foreach ($arr['ServiceCenter'][0]['#']['Group'] as $group) {
    $out .= "<h2 class='ServiceCentersSection'>".$group['@']['name']."</h2>";
    foreach ($group['#']['Item'] as $item) {
	$Adress = str_replace("---// ","",$item['#']['Adress'][0]['#']);
	$Adress = str_replace("--- // ","",$Adress);
	$Adress = str_replace("// ","<br />",$Adress);
        $out .= "<div class='ServiceCentersElement'>";
        $out .= "<div class='element'>".$item['#']['Title'][0]['#']."</div>";
        $out .= "<div class='inf'>".nl2br($Adress)."</div>";
        $out .= "</div>";
    }
}

echo $out;

?>
