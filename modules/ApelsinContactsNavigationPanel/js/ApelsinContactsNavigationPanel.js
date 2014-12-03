function ApelsinContactsNavigationPanel_GetTab(number) {
    var counter = 1;
    var amount = $('.ApelsinContactsNavigationPanel_menu').children().length;
    jQuery.each($('.ApelsinContactsNavigationPanel_menu').children(), function() {
        if(counter !== number) {
            $(this).removeClass('ApelsinContactsNavigationPanel_ThisTab');
            $(this).addClass('ApelsinContactsNavigationPanel_Tab');
        } else {
            $(this).addClass('ApelsinContactsNavigationPanel_ThisTab');
            for (var i = 1; i <= amount; i++) {
                $('.ApelsinContactsNavigationPanel_RightWrapper').removeClass('set'+i);
                $('#ACNPCW_'+i).removeClass('ApelsinContactsNavigationPanel_ContentWrapper_ThisContent');
            }
            $('#ACNPCW_'+number).addClass('ApelsinContactsNavigationPanel_ContentWrapper_ThisContent');
            $('.ApelsinContactsNavigationPanel_RightWrapper').addClass('set'+number);
        }
        counter++;
    });
}