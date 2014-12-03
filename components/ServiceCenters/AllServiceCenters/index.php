<?php
global $COMPONENT_ALL_SERVICE_CENTERS;
echo $COMPONENT_ALL_SERVICE_CENTERS->getHtml();

//$file = './resources/Components/ServiceCenters/service_centers.xml';
//$xmlwebi = new XML();
//$arr = $xmlwebi->xmlwebi($file);
//
//function getServiceCenterGroupSelectBox($array,$id) {
//    $out = '';
//    $out .= '<select id="'.$id.'" onchange="showServiceCenterGroup('.count($array).');" class="ServiceCenterSelectBox">';
//    $out .= '<option>Показать все</option>';
//    foreach ($array as $value) {
//        $out .= '<option>';
//        $out .= $value;
//        $out .= '</option>';
//    }
//    $out .= '</select><br>';
//    return $out;
//}
//function getServiceCenterSelectBox($array,$id) {
//    $out = '';
//    $out .= '<select id="'.$id.'" style="display: none;" onchange="showServiceCenter('.count($array).');" class="ServiceCenterSelectBox">';
//    $out .= '<option>Показать все</option>';
//    foreach ($array as $value) {
//        $out .= '<option value="#">';
//        $out .= $value['Title'];
//        $out .= '</option>';
//    }
//    $out .= '</select>';
//    return $out;
//}
//
//
//$massServiceCenter = array();
//$massServiceCenterGroup = array();
//$j=0;
//foreach ($arr['ServiceCenter'][0]['#']['Group'] as $group) {
//    $i=0;
//    $massServiceCenterGroup[$j] = $group['@']['name'];
//    foreach ($group['#']['Item'] as $item) {
//	$Adress = str_replace("---// ","",$item['#']['Adress'][0]['#']);
//	$Adress = str_replace("--- // ","",$Adress);
//	$Adress = str_replace("// ","<br />",$Adress);
//        $massServiceCenter[$j][$i]['Adress'] = nl2br($Adress);
//        $massServiceCenter[$j][$i++]['Title'] = $item['#']['Title'][0]['#'];
//    }
//    $j++;
//}
//
//$out = '';
//$out .= '<h1>Сервисные центры</h1>';
//$out .= '<center>';
//$out .= getServiceCenterGroupSelectBox($massServiceCenterGroup,'serviceCenterGroups');
//for ($i=0; $i<count($massServiceCenterGroup); $i++) {
//    $out .= getServiceCenterSelectBox($massServiceCenter[$i],'serviceCenterGroup_'.$i);
//}
//$out .= '</center>';
//
//$j=0;
//foreach ($massServiceCenter as $serviceCenterGroup) {
//    $serviceCentersGroupId = 'ServiceCentersGroupBlock_'.$j;
//    $out .= "<div class='ServiceCentersGroup' id='$serviceCentersGroupId' style='display: ;'>";
//        $out .= "<h2 class='ServiceCentersSection'>".$massServiceCenterGroup[$j]."</h2>";
//        $i=0;
//        $out .= "<div class='ServiceCentersGroup_Arcive' id='".$serviceCentersGroupId."_Arcive' style='display: none;'>";
//            foreach ($serviceCenterGroup as $serviceCenter) {
//                $elementId = 'ServiceCenterBlock_'.$j.'_'.$i++;
//                $out .= "<div class='ServiceCentersElement' id='$elementId' style='display: ;'>";
//                $out .= "<div class='element'>".$serviceCenter['Title']."</div>";
//                $out .= "<div class='inf'>".$serviceCenter['Adress']."</div>";
//                $out .= "</div>";
//            }
//        $out .= "</div>";
//        $out .= "<div class='ServiceCentersGroup_Column1' id='".$serviceCentersGroupId."_Column1'></div>";
//        $out .= "<div class='ServiceCentersGroup_Column2' id='".$serviceCentersGroupId."_Column2'></div>";
//    
//    $out .= "</div>";
//    $out .= "<div class='clear'></div>";
//    $j++;
//}
//echo $out;
?>

<!--<script type="text/javascript">
$(document).ready(function() {
    ContentToColumns('#ServiceCentersGroupBlock_0_Arcive',['#ServiceCentersGroupBlock_0_Column1','#ServiceCentersGroupBlock_0_Column2']);
});
</script>-->