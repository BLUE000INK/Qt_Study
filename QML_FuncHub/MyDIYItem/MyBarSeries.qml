import QtQuick 2.15
import QtCharts 2.15

BarSeries {
    property alias barCurveDataList: barCurveDataList
    BarSet {
        id: barCurveDataList
        label: "风速"
    }
}
