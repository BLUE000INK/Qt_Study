import QtQuick 2.15
import QtQuick.Window 2.15
import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("TabWidgetShow")
    color: "#2e2f30"
    MyTabWidget {
        id: tabs
        anchors.fill: parent

        Rectangle {
            property string title: "Red"
            anchors.fill: parent
            color: "#e3e3e3"

            Rectangle {
                anchors.fill: parent
                anchors.margins: 20
                color: "#ff7f7f"
                Text {
                    width: parent.width - 20
                    anchors.centerIn: parent
                    horizontalAlignment: Qt.AlignHCenter
                    text: "Roses are red"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                }
            }
        }

        Rectangle {
            property string title: "Green"
            anchors.fill: parent
            color: "#e3e3e3"

            Rectangle {
                anchors.fill: parent
                anchors.margins: 20
                color: "#7fff7f"
                Text {
                    width: parent.width - 20
                    anchors.centerIn: parent
                    horizontalAlignment: Qt.AlignHCenter
                    text: "Flower stems are green"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                }
            }
        }

        Rectangle {
            property string title: "Blue"
            anchors.fill: parent
            color: "#e3e3e3"

            Rectangle {
                anchors.fill: parent
                anchors.margins: 20
                color: "#7f7fff"
                Text {
                    width: parent.width - 20
                    anchors.centerIn: parent
                    horizontalAlignment: Qt.AlignHCenter
                    text: "Violets are blue"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
}
