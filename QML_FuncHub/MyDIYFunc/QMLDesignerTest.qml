import QtQuick 2.15
import QtQuick.Window 2.15
import "../MyDIYBtn"

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("QMLDesigner")
    color: "#000000"
    Rectangle {
        id: rectBg
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: "#43e97b"
            }

            GradientStop {
                position: 1
                color: "#38f9d7"
            }
        }
        Item {
            id: myBall

            Rectangle {
                id: rectCircle
                x: 220
                y: 140
                width: 100
                height: 100
                color: "#e72b14"
                radius: width * 0.5
                border.width: 5
                gradient: Gradient {
                    orientation: Gradient.Vertical
                    GradientStop {
                        position: 0
                        color: "#f83600"
                    }
                    GradientStop {
                        position: 1
                        color: "#f9d423"
                    }
                }
            }
            Keys.enabled: true
            focus: true
            Keys.onPressed: {
                if (event.key === Qt.Key_Up) {
                    rectCircle.y -= 3
                } else if (event.key === Qt.Key_Down) {
                    rectCircle.y += 3
                } else if (event.key === Qt.Key_Left) {
                    rectCircle.x -= 3
                } else if (event.key === Qt.Key_Right) {
                    rectCircle.x += 3
                }
            }
        }
    }
}
