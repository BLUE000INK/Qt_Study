import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../MyDIYBtn"
import "../MyDIYItem"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("btnTest")
    color: "#334455"
    MyPushBtn {
        anchors.centerIn: parent
        width: 50
        height: 50
        onClicked: {
            popTest.open()
        }
    }
    ColorChoice {
        id: popTest
    }
}
