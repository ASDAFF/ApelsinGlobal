var AnimatedHeader_BlocksAmount = 0;
var AnimatedHeader_RandomAmountMax = 20;
//var AnimatedHeader_ChangeTime = 5000;
var AnimatedHeader_ChangeTime = 1000;
var AnimatedHeader_ColorBase = '0123456789ABCDEF';
var AnimatedHeader_Color = new Array();
var AnimatedHeader_IMG = new Array();

function AnimatedHeader_RandomFunction(amount) {
    return Math.floor((Math.random() * amount) + 1);
}

function AnimatedHeader_color() {
    var color = '#'
        + AnimatedHeader_ColorBase[AnimatedHeader_RandomFunction(AnimatedHeader_ColorBase.length)-1]
        + AnimatedHeader_ColorBase[AnimatedHeader_RandomFunction(AnimatedHeader_ColorBase.length)-1]
        + AnimatedHeader_ColorBase[AnimatedHeader_RandomFunction(AnimatedHeader_ColorBase.length)-1]
        + AnimatedHeader_ColorBase[AnimatedHeader_RandomFunction(AnimatedHeader_ColorBase.length)-1]
        + AnimatedHeader_ColorBase[AnimatedHeader_RandomFunction(AnimatedHeader_ColorBase.length)-1]
        + AnimatedHeader_ColorBase[AnimatedHeader_RandomFunction(AnimatedHeader_ColorBase.length)-1];
//    alert(color);
    return color;
}
function AnimatedHeader_InitializationColors(amount) {
    AnimatedHeader_Color = new Array();
    for(var i=0; i<amount; i++) {
        AnimatedHeader_Color.push(AnimatedHeader_color());
    }
}
//function AnimatedHeader_InitializationIMG(amount) {
//    AnimatedHeader_IMG = new Array();
//    for(var i=1; i<amount; i++) {
//        AnimatedHeader_IMG.push('http://vk.com/images/stickers/' + i + '/64.png');
//    }
//}
function AnimatedHeader_InitializationIMG(imgArray) {
    AnimatedHeader_IMG = imgArray;
//    alert(AnimatedHeader_IMG.length);
//    alert(AnimatedHeader_IMG[0]);
//    alert(imgArray);
//    var test = ['1','2','3','4','5'];
//    alert(test);
}

function AnimatedHeader_InitializationBlocks(amount,imgArray) {
    AnimatedHeader_BlocksAmount = amount;
//    AnimatedHeader_InitializationColors(AnimatedHeader_BlocksAmount * 3);
    AnimatedHeader_InitializationIMG(imgArray);
}

function AnimatedHeader_Random(number) {
//    $('#AnimatedHeaderCell_' + number).css('background-color', AnimatedHeader_Color[AnimatedHeader_RandomFunction(AnimatedHeader_BlocksAmount * 2)]);
    $('#AnimatedHeaderCell_' + number).css('background-image', 'url(' + AnimatedHeader_IMG[AnimatedHeader_RandomFunction(AnimatedHeader_IMG.length)-1] + ')');
}

function AnimatedHeader_RandomAll() {
    for(var i=1; i <= AnimatedHeader_BlocksAmount; i++) {
        AnimatedHeader_Random(i);
    }
}

function AnimatedHeader_RandomAmount() {
    for(var i=1; i <= AnimatedHeader_RandomFunction(AnimatedHeader_BlocksAmount); i++) {
        AnimatedHeader_Random(AnimatedHeader_RandomFunction(AnimatedHeader_BlocksAmount));
    }
}

function AnimatedHeader_Animation() {
    AnimatedHeader_RandomAmount();
    setTimeout(AnimatedHeader_Animation, AnimatedHeader_ChangeTime);
}

function AnimatedHeader_START(amount,imgArray) {
    AnimatedHeader_InitializationBlocks(amount,imgArray);
    AnimatedHeader_RandomAll();
    setTimeout(AnimatedHeader_Animation, AnimatedHeader_ChangeTime);
}