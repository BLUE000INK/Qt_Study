import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../MyDIYBtn"

Popup {
    //叶片控制弹窗
    id: pop_FanBladeControl
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
                text: "叶片控制"
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
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: " 角度° "
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "120°"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "120°"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "120°"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "扭矩Nm"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "120"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "120"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "120"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "叶片状态"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "正常"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "正常"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                MyLabel {
                    implicitWidth: parent.width / 4
                    implicitHeight: parent.height / 3
                    text: "正常"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
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
                    id: labelAutoAngle
                    implicitWidth: 150
                    implicitHeight: 30
                    text: "变桨控制(开)"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                RowLayout {
                    MyPushBtn {
                        btnText: "+"
                        height: 30
                        width: 80
                    }
                    MyPushBtn {
                        id: switchAutoAngle
                        btnText: "开/关"
                        width: 100
                        height: 30
                        property bool btnAutoAngle: true

                        onClicked: {
                            if (btnAutoAngle) {
                                btnAutoAngle = false
                                labelAutoAngle.text = "变桨控制(关)"
                            } else {
                                btnAutoAngle = true
                                labelAutoAngle.text = "变桨控制(开)"
                            }
                        }
                    }
                    MyPushBtn {
                        btnText: "-"
                        width: 80
                        height: 30
                    }
                }
                MyLabel {
                    implicitWidth: 170
                    implicitHeight: 30
                    text: "角度比例" + pop_FanBladeControl.angleRate + "%"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                Slider {
                    stepSize: 1
                    from: 0
                    to: 100
                    value: 100
                    implicitWidth: parent.width / 4 * 2
                    implicitHeight: 30
                    orientation: Qt.Horizontal
                    onValueChanged: {
                        pop_FanBladeControl.angleRate = value
                    }
                }
                MyLabel {
                    implicitWidth: 170
                    implicitHeight: 30
                    text: "功率比例" + pop_FanBladeControl.powerRate + "%"
                    pixelSize: 20
                    color: "#FFFFFF"
                }
                Slider {
                    stepSize: 1
                    from: 0
                    to: 100
                    value: 100
                    implicitWidth: parent.width / 4 * 2
                    implicitHeight: 30
                    orientation: Qt.Horizontal
                    onValueChanged: {
                        pop_FanBladeControl.powerRate = value
                    }
                }
            }
        }
    }
}
