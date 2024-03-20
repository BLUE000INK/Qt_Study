import QtQuick 2.11
import QtQuick.Controls 2.15

MenuItem {
    id: root
    contentItem: Text {
        id: labelTxt
        text: root.text
        font: root.font
        opacity: enabled ? 1.0 : 0.3
        color: root.highlighted ? "#00AFFF" : "#FFFFFF"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    background: Rectangle {
        anchors.centerIn: root
        anchors.fill: parent
        opacity: enabled ? 1 : 0.3
        color: root.highlighted ? "#33373F" : "#44553F"
    }
}
