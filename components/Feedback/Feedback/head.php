<script type="text/javascript">
// переключает кнопку hide_show в комментах и присваивает уникальный ID для #showComments
function showComments(id) {
    if ($("#feedbackShowComments"+id).is(':visible')) {
        $(".feedback_hide_show"+id).removeClass("feedbackHideButton");
        $(".feedback_hide_show"+id).addClass("feedbackShowButton").text('Смотреть комментарии').attr("title",'Смотреть комментарии');
    } else {
        $(".feedback_hide_show"+id).removeClass("feedbackShowButton");
        $(".feedback_hide_show"+id).addClass("feedbackHideButton").text('Свернуть комментарии').attr("title",'Свернуть комментарии');
    }
    $("#feedbackShowComments"+id).toggle("slow"); 
    return false;  
};

function setLike(feedback, ip, like) {  
    $.ajax({
        type: "POST",
        url: "./components/Feedback/script/add_remove_Like.php",
        data: {"feedback":feedback,
                "ip":ip,
                "like":like
                },
        cache: false,						
        success: function(result){
               $('#feedbackPanelLike'+feedback).html(result);
       }
    });
    return false;	
};
</script>
<link rel="stylesheet" href="./components/Feedback/css/feedback.css" type="text/css" />