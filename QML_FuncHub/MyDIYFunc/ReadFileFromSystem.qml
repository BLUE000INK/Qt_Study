import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.platform 1.1
import "../MyDIYBtn"

Window {
    title: "读取文件"
    width: 500
    height: 500
    visible: true
    color: "#2e2f30"
    Rectangle {
        color: "#695d5d"
        width: 400
        height: 50
        radius: 25
        anchors.centerIn: parent
        MyLabel {
            id: label_file
            anchors.left: parent.left
            anchors.right: btn_selectFile.left
            height: 50
            elide: Text.ElideMiddle
            text: fileDialog.file
        }
        MyPushBtn {
            id: btn_selectFile
            anchors.right: parent.right
            width: 50
            height: 50
            radius: 25
            btnText: "+"
            onClicked: {
                fileDialog.open()
            }
        }
        FileDialog {
            id: fileDialog
            acceptLabel: "选中"
            nameFilters: ["MP3 files (*)", "HTML files (*.html *.htm)"]
        }
    }
}
