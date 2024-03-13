import QtQuick 2.15
import QtQuick.Window 2.15
import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("输入确认控件")
    color: "#2e2f30"
    MyInputBox {
        id: myInputBox
        width: 40
        height: 40
        anchors.centerIn: parent
        textInput.font.pixelSize: 20
        radius: width / 2
        textInput.maximumLength: 3
        textInput.anchors.horizontalCenterOffset: -10
        MyPushBtn {
            id: myBtn
            width: parent.height
            height: width
            radius: width / 2
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            btnText: ""
            Image {
                source: "qrc:/MySrc/picture/list_search.png"
                anchors.fill: parent
                anchors.margins: 5
            }
            onEntered: {
                if (myInputBox.width == 40) {
                    animEntered.start()
                }
                myInputBox.forceActiveFocus()
            }
            onExited: {

                //animExited.start()
            }
            onClicked: {
                myBtn.forceActiveFocus()
            }
        }
    }
    //并行动画
    ParallelAnimation {
        id: animEntered
        NumberAnimation {
            target: myInputBox
            property: "width"
            to: 200
            duration: 1000
        }
        //动画2
        NumberAnimation {
            target: myBtn
            property: "rotation"
            from: 0
            to: 360
            duration: 1000
        }
    }
    ParallelAnimation {
        id: animExited
        NumberAnimation {
            target: myInputBox
            property: "width"
            to: 40
            duration: 1000
        }
        //动画2
        NumberAnimation {
            target: myBtn
            property: "rotation"
            from: 0
            to: -360
            duration: 1000
        }
    }
}
