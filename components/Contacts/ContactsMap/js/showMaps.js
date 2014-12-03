function ShowMap1() {
    var map1 = document.getElementById("ContactsMapBox1");
    var map2 = document.getElementById("ContactsMapBox2");
    var map3 = document.getElementById("ContactsMapBox3");
    map1.style.display = "block";
    map2.style.display = "none";
    map3.style.display = "none";
}

function ShowMap2() {
    var map1 = document.getElementById("ContactsMapBox1");
    var map2 = document.getElementById("ContactsMapBox2");
    var map3 = document.getElementById("ContactsMapBox3");
    map1.style.display = "none";
    map2.style.display = "block";
    map3.style.display = "none";
} 

function ShowMap3() {
    var map1 = document.getElementById("ContactsMapBox1");
    var map2 = document.getElementById("ContactsMapBox2");
    var map3 = document.getElementById("ContactsMapBox3");
    map1.style.display = "none";
    map2.style.display = "none";
    map3.style.display = "block";
}

function ShowMap() {
    var select = document.getElementById("ContactsMapSelector").value;
    if(select==1) {
        ShowMap1();
    }
    if(select==2) {
        ShowMap2();
    }
    if(select==3) {
        ShowMap3();
    }
}