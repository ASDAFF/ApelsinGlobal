function ContactsUnitsTypes_OpenTab(type) {
    jQuery.each($('#ContactsTabsContent').children(), function() {
        $(this).hide();
    });
    jQuery.each($('#ContactsTabsHead').children(), function() {
        $(this).removeClass('OpenTab');
    });
    $('#ContactsTabContent_'+type).show();
    $('#ContactsTabHead_'+type).addClass('OpenTab');
}

function ContactsUnitsTypes_OpenBlock(type,unit) {
    jQuery.each($('#ContactsUnitsBlocksContent_'+type).children(), function() {
        $(this).hide();
    });
    jQuery.each($('#ContactsUnitsBlocksMenu_'+type).children(), function() {
        $(this).removeClass('ShowBlock');
    });
    $('#ContactsUnitsBlocksContentItem_'+type+'_'+unit).show();
    $('#ContactsUnitsBlocksMenuItem_'+type+'_'+unit).addClass('ShowBlock');
}

function ContactsUnitsTypes_ShowMain(type) {
    jQuery.each($('#ContactsUnitsBlocksContent_'+type).children(), function() {
        $(this).hide();
    });
    jQuery.each($('#ContactsUnitsBlocksMenu_'+type).children(), function() {
        $(this).removeClass('ShowBlock');
    });
    $('#ContactsUnitsBlocksContent_'+type).children().first().show();
    $('#ContactsUnitsBlocksMenu_'+type).children().first().addClass('ShowBlock');
}