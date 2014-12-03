<?php
$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('editFeedback', 'Редактирование отзывов', 'editFeedbackUI.php');
$mainPanelUI->addElement('editComments', 'Редактирование коментариев', 'editCommentsUI.php');
$mainPanelUI->addElement('editListIP', 'Редактирование списка IP', 'editListIPUI.php');
$mainPanelUI->addElement('checkingModerator', 'Редактирование отзывов модератором', 'checkingModeratorUI.php');
$mainPanelUI->getUI();