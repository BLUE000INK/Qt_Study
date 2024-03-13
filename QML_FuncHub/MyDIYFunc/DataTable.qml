import QtQuick 2.15
import QtQuick.Window 2.15
import QML_Model_FoodsTable 1.0
import QtQuick.Controls 2.15
import QtQml.Models 2.2
import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Table数据表")
    color: "#2e2f30"
    TableView {
        id: table_Foods
        anchors.fill: parent
        anchors.topMargin: 100
        columnSpacing: 5
        rowSpacing: 5
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}
        ScrollBar.horizontal: ScrollBar {}
        property variant columnWidthArray: [100, 100, 100, 100, 400]
        columnWidthProvider: function (index) {
            return columnWidthArray[index]
        }
        rowHeightProvider: function (index) {
            return 50
        }
        model: Model_FoodsTable
        delegate: Rectangle {
            color: "#4d3ef1"
            border.color: "#000000"
            MyLable {
                anchors.fill: parent
                text: display
            }
        }
    }
    Rectangle {
        id: table_Foods_Header
        width: parent.width
        height: 50
        x: -table_Foods.contentX
        anchors.bottom: table_Foods.top
        anchors.bottomMargin: 10
        color: "transparent"
        Row {
            anchors.fill: parent
            spacing: table_Foods.columnSpacing
            Repeater {
                model: table_Foods.columns > 0 ? table_Foods.columns : 0
                Rectangle {
                    width: table_Foods.columnWidthArray[index]
                    height: 50
                    color: "#d97bd6"
                    MyLable {
                        anchors.fill: parent
                        text: Model_FoodsTable.headerData(index, Qt.Horizontal)
                    }
                }
            }
        }
    }
}
