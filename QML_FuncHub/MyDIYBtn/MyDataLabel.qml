import QtQuick 2.11
import QtQuick.Layouts 1.15

Item {
    id: root
    width: 300
    height: 50
    property real fontSize: 20
    property alias propertyName: propertyName.text
    property alias propertyData: propertyData.text
    property alias propertyUnit: propertyUnit.text

    Rectangle {
        anchors.fill: parent
        color: "#669fe5"
        border.width: 2
        RowLayout {
            anchors.fill: parent
            spacing: 0
            Rectangle {
                color: "transparent"
                Layout.fillHeight: true
                width: root.width * 0.4
                Text {
                    id: propertyName
                    color: "#141313"
                    anchors.fill: parent
                    text: qsTr("text")
                    //horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.margins: 10
                    font.pixelSize: root.fontSize
                    elide: Text.ElideRight
                }
            }
            Rectangle {
                color: "transparent"
                Layout.fillHeight: true
                width: root.width * 0.4
                Text {
                    id: propertyData
                    text: qsTr("text")
                    style: Text.Outline
                    anchors.fill: parent
                    //horizontalAlignment: Text.AlignHCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.margins: 10
                    font.pixelSize: root.fontSize
                    elide: Text.ElideRight
                }
            }
            Rectangle {
                color: "transparent"
                Layout.fillHeight: true
                width: root.width * 0.2
                Text {
                    id: propertyUnit
                    color: "#2f1ee4"
                    text: qsTr("text")
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    anchors.margins: 10
                    font.pixelSize: root.fontSize
                    elide: Text.ElideRight
                }
            }
        }
    }
}
