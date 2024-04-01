import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../MyDIYBtn"
import QML_MyThread01 1.0

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("QThreadStudy")
    color: "#2e2f30"
    property int numberA: 0
    Timer {
        id: myTimer
        //default is 1000ms
        interval: 100
        repeat: true
        onTriggered: {
            root.numberA++
            myBtn.btnText = root.numberA
        }
    }
    MyPushBtn {
        id: myBtn
        height: 50
        width: 100
        anchors.centerIn: parent
        btnText: "0"
        radius: 10
        property bool threadState: false
        onClicked: {
            if (threadState) {
                MyThread01.terminate()
                threadState = false
            } else {
                MyThread01.start()
                threadState = true
            }
            //MyThread01.start()
            //myTimer.running ? myTimer.stop() : myTimer.start()
        }
        Connections {
            target: MyThread01
            function onThreadSignal(val) {
                myBtn.btnText = val
            }
        }
    }

    //可能是qmltype信息不全，有M16警告，这里屏蔽下
    //@disable-check M16
    onClosing: function (closeevent) {
        //CloseEvent的accepted设置为false就能忽略该事件
        //closeevent.accepted = false
        MyThread01.terminate()
        console.log("窗口关闭")
    }
}
