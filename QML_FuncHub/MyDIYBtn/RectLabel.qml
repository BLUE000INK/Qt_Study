import QtQuick 2.11

Item {
    id: root
    property alias text: mylabel.text
    property alias color: bgRect.color
    signal clicked
    Rectangle {
        id: bgRect
        anchors.fill: parent
        border.width: 2
        color: "#00ed5f"
        Text {
            id: mylabel
            color: "#000000"
            anchors.fill: parent
            anchors.margins: 10
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.clicked()
            }
        }
    }
}
