import QtQuick 2.15
import QtCharts 2.15
import QML_ChartController 1.0

Item {
    id: root
    property alias chart: myChart
    Rectangle {
        anchors.fill: parent
        color: "#556677"
        ChartView {
            id: myChart
            anchors.fill: parent
            anchors.margins: 10
            animationOptions: ChartView.NoAnimation
            //animationOptions: ChartView.SeriesAnimations
            theme: ChartView.ChartThemeBrownSand
            //抗锯齿
            antialiasing: true
            legend.visible: true
            ValueAxis {
                id: axisXX
                min: 0
                max: 100
                labelsFont.bold: true
                tickCount: 11
            }
            BarCategoryAxis {
                id: barCategoriesAxis
                categories: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
            }
            ValueAxis {
                id: axisYY
                min: 0
                max: 100
                labelsFont.bold: true
            }

            DateTimeAxis {
                id: dateTimeAxis
                min: ChartController.getLeftDateTime()
                max: ChartController.getRightDateTime()
                tickCount: 10
                labelsFont.bold: true
                format: "hh:mm:ss"
            }
        }
    }
    Timer {
        id: myTimer
        //default is 1000ms
        interval: 1000
        repeat: true
        property int baseNumber: 100
        onTriggered: {
            root.xRangeMove(1)
            //myChart.series(0).append(baseNumber++, Math.random() * 100)
            addAllSeriesPoint()
        }
    }
    function addAllSeriesPoint() {
        for (var i = 0; i < myChart.count; i++) {
            myChart.series(i).append(ChartController.getLocalTimeToPointX(),
                                     ChartController.getSeriesValue(
                                         myChart.series(i).name))

            //当曲线中的点超过600个则删去第一个点
            if (myChart.series(i).count > 600) {
                myChart.series(i).remove(0)
            }
        }
    }
    function xRangeMove(val) {
        axisXX.min = axisXX.min + val
        axisXX.max = axisXX.max + val

        // dateTimeAxis.min = ChartController.getLeftDateTime()
        // dateTimeAxis.max = ChartController.getRightDateTime()
        dateTimeAxis.min = ChartController.dateTimeAddSecs(dateTimeAxis.min, 1)
        dateTimeAxis.max = ChartController.dateTimeAddSecs(dateTimeAxis.max, 1)
    }
    function startMoveXAxis(val) {
        if (val) {
            myTimer.start()
        } else {
            myTimer.stop()
        }
    }

    function addSeries(name, axisXType) {
        if (myChart.series(name) !== null) {
            console.log(name + "--曲线存在")
            return
        }

        var series
        if (axisXType === 1) {
            //用于普通静态曲线
            //无法自定义创建的曲线，后续应替换为使用Qt.createComponent("xxx.qml").createObject(parent)
            series = Qt.createComponent("MySeries.qml").createObject(myChart)
            myChart.setAxisX(axisXX, series)
            myChart.setAxisY(axisYY, series)
            series.name = name
            for (var i = 0; i < 100; i++) {
                if (i % 5 === 0) {
                    series.append(i, Math.random() * 100)
                }
            }
        } else if (axisXType === 2) {
            //用于实时数据曲线
            series = Qt.createComponent("MySeries.qml").createObject(myChart)

            myChart.setAxisX(dateTimeAxis, series)
            myChart.setAxisY(axisYY, series)
            series.name = name
            // series = myChart.createSeries(ChartView.SeriesTypeLine, name,
            //                               dateTimeAxis, axisY)
            init10minSeries(name)
        } else if (axisXType === 3) {
            //用于柱状图
            series = Qt.createComponent("MyBarSeries.qml").createObject(myChart)
            myChart.setAxisX(barCategoriesAxis, series)
            myChart.setAxisY(axisYY, series)
            series.name = name
            //series.barCurveDataList.append("风速", [50, 20, 40, 50, 20, 45, 30, 50, 20, 10])
            console.log("add barsize is:" + series.barCurveDataList.label)
        }
        console.log("add series name is:" + name)
    }
    function init10minSeries(name) {
        //初始化曲线的十分钟数据
        //填充曲线的十分钟的数据
        for (var i = 0; i < 600; i++) {
            myChart.series(name).append(
                        ChartController.getLocalTimeToPointX(
                            ) - (600 - i) * 1000,
                        ChartController.getInitSeriesValue(name, i))
        }
    }
    function hideSeries(name) {
        if (myChart.series(name) !== null) {
            myChart.series(name).visible = false
        }
    }
    function showSeries(name) {
        if (myChart.series(name) !== null) {
            myChart.series(name).visible = true
        }
    }
    function setSeriesColor(name, color) {
        myChart.series(name).color = color
    }
}
