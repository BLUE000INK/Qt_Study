import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("btnTest")
    color: "#2e2f30"
    Rectangle {
        id: root
        anchors.centerIn: parent
        color: "#FFFFFF"
        width: 364
        height: 817
        Rectangle {
            width: parent.width
            height: 50
            color: "#95f204"
            Text {
                text: qsTr("其他")
                font.pixelSize: 30
                anchors.centerIn: parent
            }
        }
        SwipeView {
            id: swipeView
            anchors.fill: parent
            anchors.topMargin: 50
            currentIndex: 0
            clip: true
            background: Rectangle {
                color: "blue"
            }
            Rectangle {
                color: "#225baa"
                Flow {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10
                    leftPadding: 10
                    Repeater {
                        model: [["1", "12345", "kVar"], ["2", "2345", "kVar"], ["3", "12345", "kVar"], ["4", "2345", "kVar"]]
                        MyDataLabel {
                            width: 320
                            propertyName: modelData[0]
                            propertyData: modelData[1]
                            propertyUnit: modelData[2]
                        }
                    }
                }
            }

            Rectangle {
                color: "#225baa"
                Flow {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10
                    leftPadding: 10
                    Repeater {
                        model: [["1", "12345", "kVar"], ["2", "2345", "kVar"], ["3", "12345", "kVar"], ["4", "2345", "kVar"]]
                        MyDataLabel {
                            width: 320
                            propertyName: modelData[0]
                            propertyData: modelData[1]
                            propertyUnit: modelData[2]
                        }
                    }
                }
            }

            Rectangle {
                color: "#225baa"
                Flow {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10
                    leftPadding: 10
                    Repeater {
                        model: [["1", "12345", "kVar"], ["2", "2345", "kVar"], ["3", "12345", "kVar"], ["4", "2345", "kVar"]]
                        MyDataLabel {
                            width: 320
                            propertyName: modelData[0]
                            propertyData: modelData[1]
                            propertyUnit: modelData[2]
                        }
                    }
                }
            }
        }
        PageIndicator {
            id: indicator

            count: swipeView.count
            currentIndex: swipeView.currentIndex

            anchors.bottom: swipeView.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
