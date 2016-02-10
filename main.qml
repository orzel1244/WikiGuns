import QtQuick 2.3
import QtQuick.Window 2.2
import "json"
import "material"
import "scripts/Main.js" as MainScript



Window {
    id: window1
    visible: true
    width: 400
    height: 600
    FontLoader {
            id: robotoMedium
            source: "/fonts/Roboto-Medium.ttf"
        }
    Item { // main place
        width: parent.width
        height: parent.height-topBar.height
        anchors.top: topBar.bottom
        anchors.topMargin: 0
        Text{
            id: startInfo
            width: parent.width/1.3
            height: parent.height
            text: "Welcome in my app, thanks for downloading, remember to rate!"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 11
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 25
        }
    }
    Rectangle { // Top Bar
            id: topBar
            width: parent.width
            height: 56
            color: "#03A9F4"
            anchors.horizontalCenter: parent.horizontalCenter
            Item {
                id: itemBar
                width: parent.height
                height: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 0
                    Image {
                        id: imageBar
                        sourceSize.height: 500
                        sourceSize.width: 500
                        fillMode: Image.Stretch
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        source: "icons/menu.png"
                        }
                        MouseArea {
                            id: xc
                            width: parent.width
                            height: parent.height
                            onClicked: { box.state = MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin); console.log(MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin))}
                        }
                        PaperRipple{
                            id: ripple
                            radius: 3 * dp
                            mouseArea: xc
                        }
            }
    }
    Rectangle {
        id: box
        state: "start"
        width: 210
        height: parent.height-topBar.height
        color: "#2196F3"
        anchors.top: topBar.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: -box.width
        NumberAnimation on anchors.leftMargin {
            from: -box.width
            to: 0
            duration: 350
            running: box.state == "wysuniete"
        }
        NumberAnimation on anchors.leftMargin {
            from: 0
            to: -box.width
            duration: 350
            running: box.state == "zasuniete"
        }

        Column {
                spacing: 5
                anchors.fill: parent
                anchors.margins: 5
                anchors.bottomMargin: 0

                Text{
                    color: "#ffffff"
                    text: "Pistols"
                    width: parent.width
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 17
                    font.family: robotoMedium.name
                }
                ListView {
                    id: list1
                    width: parent.width
                    height: parent.width/2
                    maximumFlickVelocity: 2502
                    flickDeceleration: 1497
                    boundsBehavior: Flickable.StopAtBounds
                    flickableDirection: Flickable.AutoFlickDirection
                    contentHeight: 69
                    JSONListModel {
                        id: jsonModel1
                        query: "$.guns.pistols[*]"
                        source: "gunsList.txt"
                    }
                    model: jsonModel1.model
                    section.delegate: sectionDelegate
                    section.property: "name"
                    section.criteria: ViewSection.FirstCharacter
                    delegate: Component {

                        Text {
                            width: parent.width
                            height: 30
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 16
                            color: "white"
                            font.family: robotoMedium.name
                            verticalAlignment: Text.AlignVCenter
                            text: model.name
                            PaperRipple {
                                id: ripple
                                radius: 3 * dp
                                mouseArea: mouseAreaxx
                                }
                            MouseArea {
                                id: mouseAreaxx
                                anchors.fill: parent
                                //onClicked: ammoText.text = model.ammo
                                //onReleased: rectangle1.released()
                            }
                        }
                    }
                }
                Text{
                    color: "#ffffff"
                    text: "Rifles"
                    width: parent.width
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 17
                    font.family: robotoMedium.name
                }
                ListView {
                    id: list2
                    width: parent.width
                    height: parent.height/2
                    boundsBehavior: Flickable.StopAtBounds
                    flickableDirection: Flickable.AutoFlickDirection
                    contentHeight: 69
                    JSONListModel {
                        id: jsonModel2
                        query: "$.guns.rifles[*]"
                        source: "gunsList.txt"
                    }
                    model: jsonModel2.model
                    section.delegate: sectionDelegate
                    section.property: "name"
                    section.criteria: ViewSection.FirstCharacter
                    delegate: Component {

                        Text {
                            width: parent.width
                            height: 30
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 16
                            color: "white"
                            font.family: robotoMedium.name
                            verticalAlignment: Text.AlignVCenter
                            text: model.name
                            PaperRipple {
                                id: ripple
                                radius: 3 * dp
                                mouseArea: mouseAreaxxx
                                }
                            MouseArea {
                                id: mouseAreaxxx
                                anchors.fill: parent
                                onClicked: MainScript.weapon() //ammoText.text = model.ammo
                                //onReleased: rectangle1.released()
                            }
                        }
                    }
                }
        }
    }

}
