import QtQuick 2.0
import QtGraphicalEffects 1.15
import QtQuick.Controls 1.4 as Control14

Item {
    id: root
    property alias btnText: btn_Text.text
    property alias btnTextSize: btn_Text.font.pixelSize
    property alias radius: buttonRect.radius
    property alias btnBgColor: buttonRect.color
    property bool checked: false
    property Control14.ExclusiveGroup exclusiveGroup: null
    state: ""
    signal clicked
    signal entered
    signal exited
    onExclusiveGroupChanged: {
        if (exclusiveGroup) {
            exclusiveGroup.bindCheckable(root)
        }
    }
    Rectangle {
        id: buttonRect
        anchors.fill: parent
        radius: 0
        color: "#00ed5f"
        border.width: 2
        clip: true
        Text {
            id: btn_Text
            anchors.centerIn: parent
            text: "btn"
            font.pixelSize: 20
        }
        MouseArea {
            id: buttonMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.state = "hover"
                root.entered()
            }
            onExited: {
                root.exited()
            }
            onClicked: {
                //parent.buttonChecked = true
                //buttonRect.state = "checked"
                root.clicked()
            }
            onPressed: {
                root.state = "pressed"
            }
            onReleased: {
                root.state = ""
            }
        }
    }
    states: [
        State {
            //鼠标移出时返回原来的状态
            name: "hover"
            when: buttonMouseArea.containsMouse
            PropertyChanges {
                target: buttonRect
                color: "#353637"
            }
        },
        State {
            //控件未选中时返回原来的状态
            name: "checked"
            when: root.checked
            PropertyChanges {
                target: buttonRect
                color: "#225b95"
            }
        },
        State {
            //控件点击时切换
            name: "pressed"
            PropertyChanges {
                target: buttonRect
                color: "#008787"
            }
        }
    ]
}
