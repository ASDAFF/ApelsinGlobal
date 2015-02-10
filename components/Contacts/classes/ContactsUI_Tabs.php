<?php

class ContactsUI_Tabs {
    
    private static $showMainContacts = true;
    private static $tabsType = array(
        'default'=>'list',
        'shop'=>'block',
        'studio_furniture'=>'list',
        'suppliers'=>'list',
        'wholesale_department'=>'blockOnlyWokers',
        'procurement'=>'list'
    );
    
    public static function ContactsTabsUI($data,$mainPageData) {
        $html = '';
        if($data != null && count($data) > 0) {
            if(self::$showMainContacts) {
                $html .= ContactsUI_ElementsBlocks::ContactsUnitsMainList($mainPageData);
            }
            $html .= "<div id='ContactsTabsHead' class='ContactsTabsHead'>";
            $html .= self::ContactsTabsHead($data);
            $html .= "</div>";
            $html .= "<div id='ContactsTabsContent' class='ContactsTabsContent'>";
            $html .= self::ContactsTabsContent($data);
            $html .= "</div>";
        }
        return $html;
    }

    public static function ContactsTabsHead($data) {
        $html = '';
        foreach ($data as $elementData) {
            $js = "ContactsUnitsTypes_OpenTab('".$elementData['type']."')";
            $html .= "<div class='ContactsTabsHeadElement'  id='ContactsTabHead_".$elementData['type']."' onclick=\"".$js."\">";
            $html .= $elementData['typeName'];
            $html .= "</div>";
        }
        return $html;
    }
    public static function ContactsTabsContent($data) {
        $html = '';
        foreach ($data as $elementData) {
            $html .= "<div class='ContactsTabsContentElement' id='ContactsTabContent_".$elementData['type']."' >";
            if(isset(self::$tabsType[$elementData['type']])) {
                $UI_TYPE = self::$tabsType[$elementData['type']];
            } else {
                $UI_TYPE = self::$tabsType['default'];
            }
            switch ($UI_TYPE) {
                case 'list': 
                    $html .= ContactsUI_ElementsList::ContactsUnitsList($elementData);
                    break;
                case 'block':
                    $html .= ContactsUI_ElementsBlocks::ContactsUnitsBlocks($elementData);
                    break; 
                case 'blockOnlyWokers':
                    $html .= ContactsUI_ElementsBlocks_OnlyWokers::ContactsUnitsBlocks($elementData);
                    break; 
                default:
                    $html .= ContactsUI_ElementsList::ContactsUnitsList($elementData);
                    break;
            }
            $html .= "</div>";
        }
        return $html;
    }
}