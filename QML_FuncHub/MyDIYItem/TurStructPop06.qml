import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../MyDIYBtn"

Popup {
    //散热器控制弹窗
    id: pop_RadiatorControl
    width: 500
    height: 350
    opacity: 1
    padding: 10
    clip: true
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
                text: "冷却控制"
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
                    text: "冷却水温度(热)°C"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "-"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "冷却水温度(冷)°C"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "-"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "变频器冷却泵"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                Rectangle {
                    width: 50
                    height: 50
                    radius: 25
                    color: "blue"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "水压状态"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "-"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
            }
        }
    }
}
