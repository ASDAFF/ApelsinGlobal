<script>
function show_hide(idName,arr) {
    if(document.getElementById(idName).style.display=='none') {
        serviceCenterGroups.style.display = '';
    } else {
        document.getElementById(idName).style.display = 'none';
    }
    for(var i=0; i<arr.length; i++) {
        document.getElementById(arr[i]).style.display = 'none';
    }
    return true;
}
</script>

<script>
    function showServiceCenterGroup(count) {
        var id = "";
        var id2 = "";
        var index = document.getElementById('serviceCenterGroups').selectedIndex - 1;
        var idSelect = "";
        if(index>=0) {
            for(var i=0; i<count; i++) {
                id = 'serviceCenterGroup_' + i;
                id2 = 'ServiceCentersGroupBlock_' + i;
                if(document.getElementById(id)) {
                    document.getElementById(id).style.display = 'none';
                }
                if(document.getElementById(id2)) {
                    document.getElementById(id2).style.display = 'none';
                }
            }
            id = 'serviceCenterGroup_' + index;
            id2 = 'ServiceCentersGroupBlock_' + index;
            if(document.getElementById(id)) {
                document.getElementById(id).style.display = '';
            }
            if(document.getElementById(id2)) {
                document.getElementById(id2).style.display = '';
            }
        } else {
            for(var i=0; i<count; i++) {
                idSelect = 'serviceCenterGroup_' + i;
                if(document.getElementById(idSelect)) {
                    showServiceCenterWG(i,document.getElementById(idSelect).options.length);
                }
            }
            for(var i=0; i<count; i++) {
                id = 'serviceCenterGroup_' + i;
                id2 = 'ServiceCentersGroupBlock_' + i;
                if(document.getElementById(id)) {
                    document.getElementById(id).style.display = 'none';
                }
                if(document.getElementById(id2)) {
                    document.getElementById(id2).style.display = '';
                }
            }
        }
    }
    
    function showServiceCenter(count) {
        var id = "";
        if(!document.getElementById('serviceCenterGroups')) {
            return;
        }
        var group = document.getElementById('serviceCenterGroups').selectedIndex - 1;
        var idSelect = 'serviceCenterGroup_' + group;
        if(!document.getElementById(idSelect)) {
            return;
        }
        var index = document.getElementById(idSelect).selectedIndex - 1;
        if(index>=0) {
            for(var i=0; i<count; i++) {
                id = 'ServiceCenterBlock_' + group + "_" + i;
                if(document.getElementById(id)) {
                    document.getElementById(id).style.display = 'none';
                }
            }
            id = 'ServiceCenterBlock_' + group + "_" + index;
            if(document.getElementById(id)) {
                document.getElementById(id).style.display = '';
            }
        } else {
            for(var i=0; i<count; i++) {
                id = 'ServiceCenterBlock_' + group + "_" + i;
                if(document.getElementById(id)) {
                    document.getElementById(id).style.display = '';
                }
            }
        }
    }
    
    function showServiceCenterWG(group,count) {
        var id = "";  
        for(var i=0; i<count; i++) {
            id = 'ServiceCenterBlock_' + group + "_" + i;
            if(document.getElementById(id)) {
                document.getElementById(id).style.display = '';
            }
        }
    }
</script>

<?php
include_once './components/ServiceCenters/classes/AllServiceCenters.php';
global $COMPONENT_ALL_SERVICE_CENTERS;
$COMPONENT_ALL_SERVICE_CENTERS = new AllServiceCenters();
echo $COMPONENT_ALL_SERVICE_CENTERS->getJS();

?>