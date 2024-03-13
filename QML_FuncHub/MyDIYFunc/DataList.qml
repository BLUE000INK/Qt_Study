import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.2
import QML_Model_FoodsList 1.0
import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("List数据表")
    color: "#2e2f30"
    DelegateModel {
        id: visualModel
        model: Model_FoodsList
        delegate: Rectangle {
            height: 50
            implicitHeight: 50
            implicitWidth: childrenRect.width
            color: "transparent"
            Row {
                spacing: 0
                Rectangle {
                    height: 50
                    width: 205
                    color: "transparent"
                    visible: Model_FoodsList.columnVisible[0]
                    Rectangle {
                        height: 50
                        width: 200
                        color: "#4d3ef1"
                        MyLable {
                            anchors.fill: parent
                            text: index + 1
                        }
                    }
                }
                Rectangle {

                    height: 50
                    width: 205
                    color: "transparent"
                    visible: Model_FoodsList.columnVisible[1]
                    Rectangle {
                        height: 50
                        width: 200
                        color: "#4d3ef1"
                        MyLable {
                            anchors.fill: parent
                            text: foodName
                        }
                    }
                }
                Rectangle {

                    height: 50
                    width: 205
                    color: "transparent"
                    visible: Model_FoodsList.columnVisible[2]
                    Rectangle {
                        height: 50
                        width: 200
                        color: "#4d3ef1"
                        MyLable {
                            anchors.fill: parent
                            text: foodPrice
                        }
                    }
                }
                Rectangle {

                    height: 50
                    width: 205
                    color: "transparent"
                    visible: Model_FoodsList.columnVisible[3]
                    Rectangle {
                        height: 50
                        width: 200
                        color: "#4d3ef1"
                        MyLable {
                            anchors.fill: parent
                            text: foodCalories
                        }
                    }
                }
                Rectangle {

                    height: 50
                    width: 205
                    color: "transparent"
                    visible: Model_FoodsList.columnVisible[4]
                    Rectangle {
                        height: 50
                        width: 200
                        color: "#4d3ef1"
                        MyLable {
                            anchors.fill: parent
                            text: foodWeight
                        }
                    }
                }
                Rectangle {

                    height: 50
                    width: 205
                    color: "transparent"
                    visible: Model_FoodsList.columnVisible[5]
                    Rectangle {
                        height: 50
                        width: 200
                        color: "#4d3ef1"
                        MyLable {
                            anchors.fill: parent
                            text: foodDesc
                        }
                    }
                }
            }
        }
    }
    TableView {
        id: list_Foods
        anchors.fill: parent
        anchors.topMargin: 100
        rowSpacing: 5
        clip: true
        model: visualModel
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}
        ScrollBar.horizontal: ScrollBar {}
    }
    Rectangle {
        id: list_Foods_Header
        width: parent.width
        height: 50
        x: -list_Foods.contentX
        anchors.bottom: list_Foods.top
        anchors.bottomMargin: 10
        color: "transparent"

        Row {
            anchors.fill: parent
            spacing: 5
            Repeater {
                model: 6
                Rectangle {
                    width: 200
                    height: 50
                    color: "#d97bd6"
                    visible: Model_FoodsList.columnVisible[index]
                    MyLable {
                        anchors.fill: parent
                        text: Model_FoodsList.headerData(index, Qt.Horizontal)
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onDoubleClicked: {
                            if (index === 0) {
                                Model_FoodsList.columnVisible = [true, true, true, true, true, true]
                            } else {
                                var myVisible = Model_FoodsList.columnVisible
                                myVisible[index] = false
                                Model_FoodsList.columnVisible = myVisible
                            }
                        }
                        onClicked: {
                            Model_FoodsList.sortByColumn(index)
                        }
                    }
                }
            }
        }
    }
}
