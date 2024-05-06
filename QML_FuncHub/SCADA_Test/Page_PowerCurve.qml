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
                    id: rect_CurveLeft
                    color: "#885566"
                    width: 460
                    Layout.fillHeight: true
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 20
                        DelegateModel {
                            id: delegateModel_CurveChoice
                            model: ListModel {
                                id: curveChoiceModel
                                ListElement {
                                    curveName: "功率曲线"
                                    curveColor: "#FF0000"
                                    curveChoiceShow: true
                                }
                                ListElement {
                                    curveName: "风速时间比例"
                                    curveColor: "#00FF55"
                                    curveChoiceShow: true
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
                                    }
                                }
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            height: 300
                            color: "#229944"
                            Rectangle {
                                id: dateRectangle
                                color: "transparent"
                                //border.color: "#38d3dc"
                                anchors.fill: parent
                                property date date
                                property var monthsList: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                                property color labelColor: "#f48fb1"
                                property string year: yearsTumbler.currentItem.text
                                property string month: monthsTumbler.currentItem.text

                                Row {
                                    anchors.fill: parent
                                    Tumbler {
                                        id: yearsTumbler
                                        width: parent.width / 2 - 50
                                        height: parent.height
                                        wheelEnabled: true
                                        font.pointSize: 16
                                        font.family: "微软雅黑"
                                        onCurrentItemChanged: {

                                            //var year = currentItem.text
                                            //var month = monthsTumbler.currentIndex + 1
                                        }
                                    }
                                    Label {
                                        width: 20
                                        text: "年"
                                        font.bold: true
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.pointSize: 13
                                        font.family: "微软雅黑"
                                        color: dateRectangle.labelColor
                                    }

                                    Tumbler {
                                        id: monthsTumbler
                                        width: parent.width / 2 - 40
                                        height: parent.height
                                        model: dateRectangle.monthsList
                                        font.pointSize: 16
                                        font.family: "微软雅黑"
                                        onCurrentIndexChanged: {

                                            //var year = yearsTumbler.currentItem.text
                                            //var month = currentIndex + 1
                                        }
                                    }
                                    Label {
                                        width: 70
                                        text: "月"
                                        font.bold: true
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.pointSize: 13
                                        font.family: "微软雅黑"
                                        color: dateRectangle.labelColor
                                    }
                                }

                                Component.onCompleted: {
                                    initialize()
                                }

                                function initialize() {
                                    //初始化控件
                                    var yearsList = []
                                    date = new Date()
                                    var year = date.getFullYear()
                                    for (var i = 0; i < 8; i++) {
                                        var y = year - i
                                        yearsList.push(y)
                                    }
                                    yearsTumbler.model = yearsList
                                    yearsTumbler.currentIndex = 0
                                    var month = date.getMonth()
                                    monthsTumbler.currentIndex = month
                                }
                            }
                        }
                        MyPushBtn {
                            Layout.fillWidth: true
                            height: 100
                            btnText: "载入" + dateRectangle.year + "年" + dateRectangle.month + "月数据"
                            onClicked: {
                                console.log("load :" + dateRectangle.year + "年"
                                            + dateRectangle.month + "月")
                            }
                        }
                        MyPushBtn {
                            Layout.fillWidth: true
                            height: 100
                            btnText: "载入汇总数据"
                            onClicked: {

                            }
                        }
                        Repeater {
                            model: delegateModel_CurveChoice
                        }
                        Rectangle {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "transparent"
                        }
                    }
                }
                Rectangle {
                    id: rect_CurveRight
                    color: "#225566"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    anchors.margins: 20
                    MyTimeCurveChart {
                        id: myChart
                        anchors.fill: parent
                    }
                }
            }
        }
        Component.onCompleted: {
            //首先清空chart中的所有曲线
            myChart.chart.removeAllSeries()
            myChart.addSeries(curveChoiceModel.get(0).curveName, 1)
            myChart.setSeriesColor(curveChoiceModel.get(0).curveName,
                                   curveChoiceModel.get(0).curveColor)

            myChart.addSeries(curveChoiceModel.get(1).curveName, 3)
            //myChart.setSeriesColor(curveChoiceModel.get(1).curveName,curveChoiceModel.get(1).curveColor)
        }
    }
}
