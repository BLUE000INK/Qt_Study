import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml.Models 2.15
import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("动画效果测试")
    color: "#2e2f30"
    ObjectModel {
        id: btnsModel

        RectLabel {
            id: btn01
            width: 80
            height: width * $GoldNumber
            text: "放缩"
            onClicked: {
                animate01.start()
            }
        }
        RectLabel {
            id: btn02
            width: 80
            height: width * $GoldNumber
            text: "晃动"
            onClicked: {
                animate02.start()
            }
        }
        RectLabel {
            id: btn03
            width: 80
            height: width * $GoldNumber
            text: "变色"
            onClicked: {
                animate03.start()
            }
        }
        RectLabel {
            id: btn04
            width: 80
            height: width * $GoldNumber
            text: "弹簧"
            onClicked: {
                animate04.start()
            }
        }
    }
    GridView {
        anchors.fill: parent
        anchors.margins: 50
        cellWidth: 100
        cellHeight: 100
        focus: true
        model: btnsModel
    }
    SequentialAnimation {
        id: animate01
        PropertyAnimation {
            target: btn01
            properties: "scale"
            to: 1.5
            duration: 10
        }
        PropertyAnimation {
            target: btn01
            properties: "scale"
            to: 1
            duration: 10
        }
    }
    SequentialAnimation {
        id: animate02
        PropertyAnimation {
            target: btn02
            properties: "rotation"
            to: 30
            duration: 100
        }
        PropertyAnimation {
            target: btn02
            properties: "rotation"
            to: -30
            duration: 100
        }
        PropertyAnimation {
            target: btn02
            properties: "rotation"
            to: 0
            duration: 100
        }
    }
    SequentialAnimation {
        id: animate03
        ColorAnimation {
            target: btn03
            properties: "color"
            to: "red"
            duration: 1000
        }
        ColorAnimation {
            target: btn03
            properties: "color"
            to: "#00ed5f"
            duration: 1000
        }
    }
    SequentialAnimation {
        id: animate04
        ParallelAnimation {
            SpringAnimation {
                target: btn04
                property: "x"
                spring: 3
                damping: 0.06
                epsilon: 0.25
                //from: btn04.x
                to: btn04.x + 100
                duration: 1000
            }
            SpringAnimation {
                target: btn04
                property: "y"
                spring: 3
                damping: 0.06
                epsilon: 0.25
                //from: btn04.y
                to: btn04.y + 100
                duration: 1000
            }
        }
        ParallelAnimation {
            SpringAnimation {
                target: btn04
                property: "x"
                spring: 3
                damping: 0.06
                epsilon: 0.25
                from: btn04.x + 100
                to: btn04.x
                duration: 1000
            }
            SpringAnimation {
                target: btn04
                property: "y"
                spring: 3
                damping: 0.06
                epsilon: 0.25
                from: btn04.y + 100
                to: btn04.y
                duration: 1000
            }
        }
    }
}
