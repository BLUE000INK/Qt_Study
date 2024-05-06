import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../MyDIYBtn"

Popup {
    //加热器控制弹窗
    id: pop_HeaterControl
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
                text: "加热控制"
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
                    text: "风速仪加热反馈"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "OFF"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "齿轮箱加热反馈"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "OFF"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "发电机加热接触器"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "OFF"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "手动加热状态"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: 200
                    implicitHeight: 30
                    text: "手动加热关闭"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
            }
        }
    }
}
