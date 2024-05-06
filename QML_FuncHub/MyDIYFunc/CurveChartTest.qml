import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QML_ChartController 1.0
import "../MyDIYBtn"
import "../MyDIYItem"

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("曲线探索")
    color: "#2e2f30"
    property int seriesName: 0
    Flow {
        Layout.fillWidth: true
        height: 100
        padding: 10
        spacing: 10
        MyPushBtn {
            btnText: "添加曲线"
            width: 180
            height: 40
            onClicked: {
                myChart.addSeries("mySeries" + root.seriesName++, 1)
            }
        }
        MyPushBtn {
            property bool xAxisMove: false
            btnText: "移动横轴"
            width: 180
            height: 40
            onClicked: {
                xAxisMove = !xAxisMove
                myChart.startMoveXAxis(xAxisMove)
            }
        }
    }
    MyTimeCurveChart {
        id: myChart
        anchors.fill: parent
        anchors.topMargin: 100
    }
}
