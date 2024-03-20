import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("右键菜单")
    color: "#2e2f30"
    Rectangle {
        width: 50
        height: 50
        color: "blue"
        anchors.centerIn: parent
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                if (mouse.button === Qt.RightButton) {
                    rightMenu.popup()
                }
            }
        }
        Menu {
            id: rightMenu
            width: 100
            Action {
                text: "启动风机"
            }
            Action {
                text: "停止风机"
            }
            Action {
                text: "风机维护"
            }
            Action {
                text: "风机复位"
            }
            Action {
                text: "急停复位"
            }
            Menu {
                title: "故障信息"
                width: 450
                MenuItem {
                    height: rightMenu.width
                    Rectangle {
                        anchors.fill: parent
                        color: "#d0334455"
                    }
                }
            }
            delegate: MenuDelegate {}
            //            background: Rectangle {
            //                color: "blue"
            //            }
        }
    }
}
