import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: root
    property alias pixelSize: myText.font.pixelSize
    property alias text: myText.text
    property alias color: myText.color
    property alias elide: myText.elide
    property alias hasElide: text_JudgeElide.hasElide
    signal clicked
    Text {
        id: myText
        color: "#000000"
        text: qsTr("Text")
        elide: Text.ElideRight
        anchors.fill: parent
        anchors.margins: 10
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Text {
            id: text_JudgeElide
            property bool hasElide: parent.width < width
            visible: false
            text: parent.text
            font.pixelSize: 0
        }
    }
    ToolTip {
        id: tip_filePath
        delay: 500
        text: root.text
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.clicked()
        }
        onEntered: {
            if (root.hasElide)
                tip_filePath.visible = true
        }
        onExited: {
            tip_filePath.visible = false
        }
    }
}
