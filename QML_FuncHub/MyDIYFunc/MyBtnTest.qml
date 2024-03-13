import QtQuick 2.15
import QtQuick.Window 2.15
import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("btnTest")
    color: "#2e2f30"
    MyInputBox {
        width: 400
        height: 80
        anchors.centerIn: parent
        textInput.width: 400 - 80
        textInput.font.pixelSize: 40
    }
}
