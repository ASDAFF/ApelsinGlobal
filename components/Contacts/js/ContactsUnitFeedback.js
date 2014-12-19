function ajaxContactsUnitFeedback(id) {  
    var msg = $("#ajaxContactsUnitFeedback"+id).serialize();
    $.ajax({
        type: "POST",
        url: "./components/Contacts/script/contactsUnitsFeedback.php",
        data: msg,
        cache: false,
        success: function(data) {
            $("#resultsContactsFeedback"+id).html(data);
            ContactsFeedbackClearMessage("#resultsContactsFeedback"+id);
        }
    });
    return false;	
};

var ContactsFeedbackClearMessageTimer; // Таймер на очистку сообщения;
var ContactsFeedbackClearMessageTime = 10000; // время на очистку сообщения;

function ContactsFeedbackClearMessage(messageBlockID) {
	clearTimeout(ContactsFeedbackClearMessageTimer);
	ContactsFeedbackClearMessageTimer = setTimeout(function(){$(messageBlockID).html('');}, ContactsFeedbackClearMessageTime);
}