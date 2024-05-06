import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../MyDIYBtn"

Popup {
    //偏航控制弹窗
    id: pop_YawControl
    width: 500
    height: 350
    opacity: 1
    padding: 10
    clip: true
    property int angleRate: 100
    property int powerRate: 100
    background: Rectangle {
        color: "#29333f"
    }
    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        Rectangle {
            height: 30
            Layout.fillWidth: true
            color: "transparent"
            MyLabel {
                anchors.fill: parent
                text: "偏航控制"
                color: "#FFFFFF"
                myTextHorizontal: Text.AlignLeft
                pixelSize: 25
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            GridLayout {
                anchors.fill: parent
                columns: 2
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "偏航状态"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "正常"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "风向"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "东南15度"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "机舱位置"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "124°224°111°"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "机舱位置偏差"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "10°1°2°"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
            }
        }
    }
}
