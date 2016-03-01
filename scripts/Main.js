var isStartTextExits = true;
var isMainTextExits = false;
//import "./Sizes.js"
//

function calc(){
    var pistolsCount = pistolsList.count;
    var riflesCount = riflesList.count;
    var heavyCount = heavyList.count;
    pistolsList.height = 25+(38*pistolsCount);
    riflesList.height = 25+(38*riflesCount);
    heavyList.height = 25+(38*heavyCount);
    listFlickable.contentHeight = (25*3)+(25*3)+(38*riflesCount)+(38*pistolsCount)+(38*heavyCount);
    mainPlace.contentHeight = 42+mainHeader.height+imageContainer.height+genaralInfo.height+genaralInfo_info.height;
}

function close(boxWidth, boxState, boxLeftMargin){
    if(boxState == "wysuniete" && boxLeftMargin == 0){
        boxState = "zasuniete";
    }
    return boxState;
}

function openOrClose(boxWidth, boxState, boxLeftMargin) {
    calc();
    if(boxState == "start"){
        boxState = "wysuniete";
    }
    else{
        if(boxState == "wysuniete" && boxLeftMargin == 0){
            boxState = "zasuniete";
        }
        else{ if(boxState == "zasuniete" && boxLeftMargin == (-boxWidth)){
            listFlickable.contentY = 0;
            boxState = "wysuniete";
            }
        }
    }
    return boxState;
}
function checkRemove(){
    if(isStartTextExits){
        startInfo.destroy();
        isStartTextExits = false;
    }
}

function apply(Name, Ammo, Info, Image){
    checkRemove();
    mainHeader.text = qsTr(Name);
    gunImage.source = qsTr("../imgs/"+Image);
    genaralInfo.text = qsTr("General info");
    genaralInfo_info.text = qsTr(Info);
    mainColumn.height = Screen.width*2;
    mainPlace.contentY = 0;
}
