<script>
function nextStep(id,nextid) {
//    alert(document.getElementById(id).style.display);
//    alert(id);
    document.getElementById(id).style.display = 'none';
//    alert(document.getElementById(id).style.display);
    document.getElementById(nextid).style.display = 'block';
    return true;
}

function vacanciesText(show,hide,hide2) {
    document.getElementById(hide).style.display = 'none';
    document.getElementById(hide2).style.display = 'none';
    document.getElementById(show).style.display = 'block';
    return true;
}

function vacanciesText(show,hide,hide2) {
    document.getElementById(hide).style.display = 'none';
    document.getElementById(hide2).style.display = 'none';
    document.getElementById(show).style.display = 'block';
    return true;
}


Array.prototype.in_array = function(p_val) {
    for(var i = 0, l = this.length; i < l; i++)  {
        if(this[i] == p_val) {
            return true;
        }
    }
    return false;
}

function vacanciesSelected(value,array) {
    if(array.in_array(value)) {
        document.getElementById('noselect_vacancies_text').style.display = 'none';
        document.getElementById('no_vacancies_text').style.display = 'none';
        document.getElementById('yes_vacancies_text').style.display = 'block';
    } else {
        if(value=="") {
            document.getElementById('no_vacancies_text').style.display = 'none';
            document.getElementById('yes_vacancies_text').style.display = 'none';
            document.getElementById('noselect_vacancies_text').style.display = 'block';
        } else {
            document.getElementById('noselect_vacancies_text').style.display = 'none';
            document.getElementById('yes_vacancies_text').style.display = 'none';
            document.getElementById('no_vacancies_text').style.display = 'block';
        }
    }
    return true;
}

</script>

<script type="text/javascript">
$(document).ready(function() {
    ContentToColumns('#VacanciesValidBlockArchive',['#VacanciesValidBlockColumn_01','#VacanciesValidBlockColumn_02']);
});
</script>