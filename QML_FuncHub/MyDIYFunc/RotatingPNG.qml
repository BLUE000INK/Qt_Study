import QtQuick 2.15
import QtQuick.Window 2.15
import "../MyDIYBtn"

Window {
    title: "风机图片旋转"
    width: 500
    height: 500
    visible: true
    color: "#2e2f30"
    Rectangle {
        id: rect_Image
        width: height
        height: parent.height
        anchors.centerIn: parent
        color: "transparent"
        Image {
            //风机柱子
            id: turPole
            anchors.fill: parent
            source: "qrc:/MySrc/picture/fanPole.png"
            smooth: true
        }
        Image {
            //风机叶片
            id: turBlade
            anchors.fill: parent
            source: "qrc:/MySrc/picture/fanBlade.png"
            smooth: true
            transform: Rotation {
                id: turBladeRotation
                origin.x: rect_Image.width / 2
                origin.y: rect_Image.width * 0.426
            }
        }
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                if (mouse.button === Qt.LeftButton) {
                    fanRotation.restart()
                } else if (mouse.button === Qt.RightButton) {
                    fanRotation.stop()
                }
            }
        }
        RotationAnimation {
            id: fanRotation
            target: turBladeRotation
            from: 0
            to: 360
            duration: 2000
            loops: Animation.Infinite
            alwaysRunToEnd: true
        }
    }
}
