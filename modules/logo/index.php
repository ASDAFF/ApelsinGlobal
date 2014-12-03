<?php
$urlHelper = new UrlHelper();
$url = $urlHelper->homePageUrl();
global $_URL_PARAMS;
$query = "select * from `Logo` where `lang`='".$_URL_PARAMS['lang']."'";
$mySqlHelper = new MySqlHelper($query);
$logoData = $mySqlHelper->getDataRow(0);

?>
<a href="<?php echo $url;?>" title="<?php echo $logoData['urlTitle'];?>"><div class="logoImg"></div></a>
<a href="<?php echo $url;?>" title="<?php echo $logoData['urlTitle'];?>"><div class="logoText"><?php echo $logoData['text'];?></div></a>