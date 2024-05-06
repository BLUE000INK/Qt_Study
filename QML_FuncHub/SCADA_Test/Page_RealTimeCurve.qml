import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.0
import QtQml.Models 2.2
import "../MyDIYBtn"
import "../MyDIYItem"

Item {
    id: root
    clip: true
    Rectangle {
        color: "#224455"
        anchors.fill: parent
        Rectangle {
            color: "transparent"
            anchors.fill: parent
            anchors.margins: 20
            clip: true
            Popup {
                id: pop_CurveMenu
                width: 1860
                height: 817
                closePolicy: Popup.NoAutoClose
                Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    clip: true
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0
                        Rectangle {
                            Layout.fillWidth: true
                            height: 600
                            color: "#896743"
                            border.width: 2
                            clip: true
                            Flow {
                                anchors.fill: parent
                                anchors.margins: 20
                                spacing: 15
                                Repeater {
                                    id: repeater_CurveMenu
                                    model: curveChoiceModel
                                    delegate: CheckDelegate {
                                        width: 240
                                        height: 40
                                        text: curveName
                                        font.pixelSize: 20
                                        checked: curveChoiceShow
                                        background: Rectangle {
                                            color: "grey"
                                            border.width: 2
                                        }
                                    }
                                }
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "blue"
                            Flow {
                                anchors.fill: parent
                                anchors.margins: 20
                                spacing: 20
                                MyPushBtn {
                                    id: btnSeriesMenuConfirm
                                    width: 200
                                    height: 40
                                    btnText: "确定"
                                    signal sig_initSeriesCheck
                                    onClicked: {
                                        //首先清空chart中的所有曲线
                                        myChart.chart.removeAllSeries()
                                        console.log("清空chart")
                                        for (var i = 0; i < repeater_CurveMenu.count; i++) {
                                            curveChoiceModel.setProperty(
                                                        i, "curveChoiceShow",
                                                        repeater_CurveMenu.itemAt(
                                                            i).checked)
                                            if (repeater_CurveMenu.itemAt(
                                                        i).checked) {

                                                //向chart中添加选中的这些曲线
                                                var curveNAME = curveChoiceModel.get(
                                                            i).curveName
                                                myChart.addSeries(curveNAME, 2)
                                                var curveCOLOR = curveChoiceModel.get(
                                                            i).curveColor
                                                myChart.setSeriesColor(
                                                            curveNAME,
                                                            curveCOLOR)
                                            }
                                        }

                                        delegateModel_CurveChoice.setSelectedGroup()
                                        console.log("chart.count is :" + myChart.chart.count)
                                        sig_initSeriesCheck()
                                        pop_CurveMenu.close()
                                    }
                                }
                                MyPushBtn {
                                    width: 200
                                    height: 40
                                    btnText: "取消"
                                    onClicked: {
                                        pop_CurveMenu.close()
                                    }
                                }
                            }
                        }
                    }
                }
            }
            ColorDialog {
                id: colorDialog_CurveColor
                title: "设置曲线颜色"
                property int curveindex: 0
                property string curveName
                property string selectedCurveColor
                onAccepted: {
                    console.log("choiceColor" + colorDialog_CurveColor.color)
                    selectedCurveColor = currentColor

                    curveChoiceModel.setProperty(curveindex, "curveColor",
                                                 selectedCurveColor)
                    myChart.setSeriesColor(curveName, currentColor)
                }
            }
            RowLayout {
                anchors.fill: parent
                spacing: 0
                Rectangle {
                    id: rect_CurveBox
                    color: "#885566"
                    width: 460
                    Layout.fillHeight: true
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0
                        Rectangle {
                            Layout.fillWidth: true
                            height: 90
                            color: "transparent"
                            MyPushBtn {
                                anchors.fill: parent
                                onClicked: {
                                    pop_CurveMenu.open()
                                }
                            }
                        }
                        DelegateModel {
                            id: delegateModel_CurveChoice
                            model: ListModel {
                                id: curveChoiceModel
                                ListElement {
                                    curveName: "平均风速"
                                    curveColor: "#115511"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "平均风向"
                                    curveColor: "#223322"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "机舱位置"
                                    curveColor: "#337733"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "机舱位置与最佳位置"
                                    curveColor: "#444444"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "功率"
                                    curveColor: "#555555"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "叶片1角度"
                                    curveColor: "#666666"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "叶片2角度"
                                    curveColor: "#235698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "叶片3角度"
                                    curveColor: "#235698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "环境温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "机舱温度"
                                    curveColor: "#235698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "发电机温度1"
                                    curveColor: "#235698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "发电机温度2"
                                    curveColor: "#235698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "发电机温度3"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "发电机转速"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "叶轮转速"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "叶片1扭矩"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "叶片2扭矩"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "叶片3扭矩"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "变桨电机1温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "变桨电机2温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "变桨电机3温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "电网电压1"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "电网电压2"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "电网电压3"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "网侧电流1"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "网侧电流2"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "网侧电流3"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "发电机侧轴承温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "非驱动侧轴承温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "机侧电抗温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "300柜温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "310柜温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "320柜温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "UPS电池温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "齿轮箱温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "齿轮轴承温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "冷却水温度(热)"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "冷却水温度(冷)"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "变频器功率"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "变频器功率指令"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "400V功率"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "机侧电流"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "定子电流"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "总电流"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "网侧电流"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "故障电流"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "机侧IGBT温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "网侧IGBT温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "网侧电抗温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "滤波版温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "驱动向加速传感器"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "非驱动向加速传感器"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "驱动链摆动"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "驱动方向震动"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "非驱动方向震动"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "电池状态"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "UPS电池电压"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "偏航状态"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "PLC状态"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "PLC子状态"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "限制功率比例"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "限制叶片比例"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "水压状态"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "日发电量"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "月发电量"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "无功"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                                ListElement {
                                    curveName: "定子柜温度"
                                    curveColor: "#232698"
                                    curveChoiceShow: false
                                }
                            }
                            delegate: Rectangle {
                                color: "transparent"
                                width: 460
                                height: 70
                                RowLayout {
                                    anchors.margins: 10
                                    spacing: 10
                                    anchors.fill: parent
                                    MyLabel {
                                        text: curveName
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                    }
                                    Rectangle {
                                        width: 50
                                        height: 50
                                        radius: 25
                                        border.width: 5
                                        color: curveColor
                                        border.color: mouseArea_CurveColor.containsMouse ? "#FFFFFF" : "#000000"
                                        MouseArea {
                                            id: mouseArea_CurveColor
                                            anchors.fill: parent
                                            focus: true
                                            hoverEnabled: true
                                            onClicked: {

                                                //单击出现颜色选择器
                                                colorDialog_CurveColor.curveindex = index
                                                colorDialog_CurveColor.curveName = curveName
                                                console.log("click index is:" + index)
                                                colorDialog_CurveColor.color = curveColor
                                                colorDialog_CurveColor.open()
                                            }
                                        }
                                    }
                                    CheckBox {
                                        id: checkBox_series
                                        width: 50
                                        height: 50
                                        checked: true
                                        onCheckedChanged: {
                                            if (checked) {
                                                myChart.showSeries(curveName)
                                            } else {
                                                myChart.hideSeries(curveName)
                                            }
                                        }
                                        Connections {
                                            target: btnSeriesMenuConfirm
                                            function onSig_initSeriesCheck() {
                                                checkBox_series.checked = true
                                            }
                                        }
                                    }
                                }
                            }
                            groups: [
                                DelegateModelGroup {
                                    id: delegateModelGroup_selectedGroup
                                    name: "selectedGroup"
                                    includeByDefault: false
                                }
                            ]
                            function setSelectedGroup() {
                                //通过curveChoiceShow属性筛选是否添加进组
                                for (var i = 0; i < items.count; i++) {
                                    items.removeGroups(i, 1, "selectedGroup")
                                    if (curveChoiceModel.get(
                                                i).curveChoiceShow) {
                                        items.addGroups(i, 1, "selectedGroup")
                                    }
                                }
                            }
                            filterOnGroup: "selectedGroup"
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#563489"

                            ListView {
                                anchors.fill: parent
                                model: delegateModel_CurveChoice
                                focus: true
                                clip: true
                                ScrollBar.vertical: ScrollBar {}
                            }
                        }
                    }
                }
                Rectangle {
                    id: rect_Chart
                    color: "#225566"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    anchors.margins: 20
                    MyTimeCurveChart {
                        id: myChart
                        anchors.fill: parent
                    }
                    Component.onCompleted: {
                        myChart.startMoveXAxis(true)
                    }
                }
            }
        }
    }
}
