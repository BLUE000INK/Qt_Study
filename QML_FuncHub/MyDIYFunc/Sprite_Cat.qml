import QtQuick 2.15
import QtQuick.Window 2.15
import "../MyDIYBtn"

Window {
    id: root
    width: 100
    height: 100
    visible: true
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    color: "transparent"
    Rectangle {
        id: body_cat
        anchors.fill: parent
        color: "transparent"

        //        Image {
        //            id: image_cat
        //            anchors.fill: parent
        //            source: "qrc:/Picture/Pet01/cat_drop01.png"
        //        }
        Item {
            id: anime_DropSprite
            width: 256
            height: 256
            anchors.fill: parent
            SpriteSequence {
                id: dropSprite
                anchors.fill: parent
                interpolate: false
                goalSprite: ""

                Sprite {
                    name: "_01"
                    source: "qrc:/MySrc/picture/cat_drop01.png"
                    frameWidth: 570
                    frameHeight: 570
                    frameCount: 1
                    frameDuration: 200
                    //frameDurationVariation: 400
                    to: {
                        "_02": 1
                    }
                }

                Sprite {
                    name: "_02"
                    source: "qrc:/MySrc/picture/cat_drop02.png"
                    frameCount: 1
                    frameWidth: 570
                    frameHeight: 570
                    frameDuration: 1200
                    //frameDurationVariation: 400
                    to: {
                        "_03": 1
                    }
                }

                Sprite {
                    name: "_03"
                    source: "qrc:/MySrc/picture/cat_drop03.png"
                    frameCount: 1
                    frameWidth: 570
                    frameHeight: 570
                    frameDuration: 200
                    //frameDurationVariation: 400
                    to: {
                        "_04": 1
                    }
                }

                Sprite {
                    name: "_04"
                    source: "qrc:/MySrc/picture/cat_drop04.png"
                    frameCount: 1
                    frameWidth: 570
                    frameHeight: 570
                    frameDuration: 200
                    //frameDurationVariation: 400
                    to: {
                        "_01": 1
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            //cursorShape: pressed ? Qt.OpenHandCursor : Qt.CloseHandCursor
            onPressed: {

            }
        }
        DragHandler {
            //窗口拖动
            onActiveChanged: {
                if (active) {
                    root.startSystemMove()
                }
            }
        }

        ParallelAnimation {
            id: anime_dropAppearances
            PropertyAnimation {
                target: root
                property: "y"
                to: (Screen.height - body_cat.height) / 2
                duration: 1000
            }
            PropertyAnimation {
                target: body_cat
                property: "scale"
                from: 0.3
                to: 1
                duration: 1000
            }
        }
        Component.onCompleted: {
            anime_dropAppearances.start()
        }
    }

    Component.onCompleted: {
        root.x = (Screen.width - body_cat.width) / 2
        root.y = -body_cat.height
    }
}
