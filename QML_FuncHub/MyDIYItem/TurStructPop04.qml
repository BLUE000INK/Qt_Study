import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../MyDIYBtn"

Popup {
    //变频器控制弹窗
    id: pop_VFDControl
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
                text: "变频器控制"
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
                columns: 4
                MyLabel {
                    implicitWidth: 170
                    implicitHeight: 30
                    text: "机侧电流(A)"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 50
                    implicitHeight: 30
                    text: "245"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 170
                    implicitHeight: 30
                    text: "网侧电流(A)"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 50
                    implicitHeight: 30
                    text: "123"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 170
                    implicitHeight: 30
                    text: "总电流"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 50
                    implicitHeight: 30
                    text: "632"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 170
                    implicitHeight: 30
                    text: "直流母线电压(V)"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 50
                    implicitHeight: 30
                    text: "832"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "定子电流5S平均(A)"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 50
                    implicitHeight: 30
                    text: "256"
                    pixelSize: 20
                    color: "#FFFFFF"
                    Layout.columnSpan: 3
                }
            }
        }
    }
}
