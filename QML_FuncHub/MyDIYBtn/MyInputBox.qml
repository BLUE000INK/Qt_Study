import QtQuick 2.0

FocusScope {
    id: root
    property alias textInput: textInput
    property alias radius: rect.radius
    Rectangle {
        id: rect
        anchors.fill: parent
        border.width: 3
        border.color: textInput.activeFocus ? "#000000" : "#0782d8"
        radius: height / 2
        clip: true
        TextInput {
            id: textInput
            maximumLength: 10
            clip: true
            anchors.centerIn: parent
            verticalAlignment: Text.AlignVCenter
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            textInput.forceActiveFocus()
        }
    }
}
