<?php 
    global $_SITECONFIG;
?>

<script>
function show_hide(idName) {
    if(document.getElementById('checkbox_'+idName).checked) {
        document.getElementById(idName).style.display = '';
    } else {
        document.getElementById(idName).style.display = 'none';
    }
    return true;
}
function change_show_hide() {
    show_hide('shopIDbuildings');
    show_hide('shopIDdescription');
    show_hide('shopIDworkersList');
    show_hide('shopIDmap');
    show_hide('shopIDinf');
    show_hide('shopIDreviews');
    return true;
}
function reviewPageLacation(id,url) {
    var s = document.getElementById(id);
    var item1 = s.options[s.selectedIndex].value;
    window.location.href='http://<?php echo $_SITECONFIG->getHostName();?>/' + url + item1;
}
</script>
