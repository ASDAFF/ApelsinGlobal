<?php
/** 
* @version      1.0 
* @package      Apelsin.template.apelsin
* @copyright    Copyright (C) 2012 - 2013 apelsin.ru - All Rights Reserved. 
* @license      GNU General Public License version 3 or later;
*/
global $ROOT;
?>
<!DOCTYPE HTML>
<html>
<head>
    <?php $ROOT->head();?>
    <link rel="shortcut icon" href="<?php $ROOT->templatePath();?>favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/main.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/blocks.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/modules.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/content.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/doc_div.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/account.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/user.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/AdminPanel.css" type="text/css" />
    <!--<link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/ng.css" type="text/css" />-->
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/futerSiteMap.css" type="text/css" />
    <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/ContactsUI.css" type="text/css" />
    <script type="text/javascript" src="<?php $ROOT->templatePath();?>js/back-top.js"></script>
    <!--[if IE]>
        <link rel="stylesheet" href="<?php $ROOT->templatePath();?>css/main_ie.css" type="text/css" />
    <![endif]-->

</head>
<body>
<?php $ROOT->bodyStart();?>
<div class="rootWrapper">
    <div class='topFloatWrapper'>
        <div class='topFloatBlock mainBlockArea'>
            <?php $ROOT->block('topFloatBlock');?><!-- 1 -->
        </div>
    </div>
    <div class="topWrapper">
        <div class='topBlock mainBlockArea'>
            <div class='topLeftBlock'>
                <?php $ROOT->block('topLeftBlock');?><!-- 2 -->
            </div>
            <div class='topRightBlockArea'>
                <div class='topRightBlock'>
                    <?php $ROOT->block('topRightBlock');?><!-- 3 -->
                </div>
            </div>
<!--            <div class="pageTitleWrapper">
                <div class="pageTitleBlock">
                    <?php $ROOT->title();?>
                </div>
            </div>-->
        </div>
    </div>
    <div class="middleWrapper">
        <div class="pageTitleWrapper">
            <div class="pageTitleBlock">
                <?php $ROOT->title();?>
            </div>
        </div>
        <div class='mainSiteWrapper mainBlockArea'>
            <div class='middleTopBlock mainBlockArea'>
                <?php $ROOT->block('middleTopBlock');?><!-- 4 -->
                <div class="clear"></div>
            </div>
            <div class='middleCase mainBlockArea'>
                <div class='middleLeftBlock'>
                    <?php $ROOT->block('middleLeftBlock');?><!-- 5 -->
                    <div class="clear"></div>
                </div>
                <div class='contentBlock'>
                    <div class='contentTopBlock'>
                        <?php $ROOT->block('contentTopBlock');?><!-- 6 -->
                        <div class="clear"></div>
                    </div>
                    <div class='mainContentBlock'>
                        <?php $ROOT->content();?>
                        <div class="clear"></div>
                    </div>
                    <div class='contentBottomBlock'>
                        <?php $ROOT->block('contentBottomBlock');?><!-- 7 -->
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class='middleBottomBlock mainBlockArea'>
                <?php $ROOT->block('middleBottomBlock');?><!-- 8 -->
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="bottomWrapper">
        <div class="bottomBlock mainBlockArea">
            <div class="bottomTopBlock">
                <?php $ROOT->block('bottomTopBlock');?><!-- 9 -->
                <div class="clear"></div>
            </div>
        </div>
        <div class="bottomBottomWrapper">
            <div class="bottomBlock mainBlockArea">
                <div class="bottomBottomBlock">
                    <?php $ROOT->block('bottomBottomBlock');?><!-- 10 -->
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $ROOT->bodyEnd();?>
<div id="back-top"><a href="#top"></a></div>
</body>
</html>