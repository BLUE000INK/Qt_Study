import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../MyDIYBtn"

Popup {
    //齿轮箱控制弹窗
    id: pop_GearBoxControl
    width: 500
    height: 350
    opacity: 1
    padding: 10
    clip: true
    property int angleRate: 100
    property int powerRate: 100
    property alias lowOliPumpSwitch: switchLowOilPump.checked
    property alias highOliPumpSwitch: switchHighOilPump.checked
    property alias coolingFanSwitch: switchCoolingFan.checked
    property alias oilLevelSwitch: switchOilLevel.checked
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
                text: "齿轮箱油冷散热控制"
                color: "#FFFFFF"
                myTextHorizontal: Text.AlignLeft
                pixelSize: 25
            }
        }
        Rectangle {
            height: 140
            Layout.fillWidth: true
            color: "transparent"
            GridLayout {
                anchors.fill: parent
                columns: 4
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "低速油泵"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                Switch {
                    id: switchLowOilPump
                    checked: true
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "冷却风扇"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                Switch {
                    id: switchCoolingFan
                    checked: true
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "高速油泵"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                Switch {
                    id: switchHighOilPump
                    checked: true
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "油位开关"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                Switch {
                    id: switchOilLevel
                    checked: true
                }
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
        }
    }
}
