//$('#ContactsAllUnitsList').ready(function () {
//    $('#ContactsUnitsTypesListSwitcher').show();
//    $('#ContactsAllUnitsList').show();
//});


var contactsUnitsMoreInfoElement = { 
    img: '#ContactsUnitsElementIMG_', 
    map: '#ContactsUnitsElementMap_', 
    text: '#ContactsUnitsElementText_', 
    feedback: '#ContactsUnitsElementFeedback_'};

//$(document).ready(function() {
//    ContactsUnitsTypesListSwitchElement('departament','Контакты отделов');
//});

$(document).mouseup(function (e) {
    var container = $('#ContactsUnitsTypesList');
    if (container.has(e.target).length === 0){
        container.hide();
    }
});

function switchContactsUnitsMoreInfoElement(id,key) {
    var imgID = contactsUnitsMoreInfoElement['img'] + id;
    var mapID = contactsUnitsMoreInfoElement['map'] + id;
    var textID = contactsUnitsMoreInfoElement['text'] + id;
    var feedbackID = contactsUnitsMoreInfoElement['feedback'] + id;
    var showID = contactsUnitsMoreInfoElement[key] + id;
    $(imgID).hide();
    $(mapID).hide();
    $(textID).hide();
    $(feedbackID).hide();
    $(showID).show();
}

function ContactsUnitsTypesListShow() {
    $('#ContactsUnitsTypesList').show();
}

function ContactsUnitsTypesListSwitchElement(type,text) {
    $('#ContactsUnitsTypesListSwitcher').show();
    $('#ContactsAllUnitsList').show();
    jQuery.each($('#ContactsAllUnitsList').children(), function() {
        $(this).hide();
    });
    $('#ContactsUnitsList_'+type).show();
    $('#ContactsUnitsTypesList').hide();
    $('#ContactsUnitsTypesListSwitcherElementTitle').html(text);
}