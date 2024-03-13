import QtQuick 2.0

Item {
    id: tabWidget
    property real headerHeight: 40
    // Setting the default property to stack.children means any child items
    // of the TabWidget are actually added to the 'stack' item's children.
    // See the "Property Binding"
    // documentation for details on default properties.
    default property alias content: stack.children

    property int current: 0

    onCurrentChanged: setOpacities()
    Component.onCompleted: setOpacities()

    function setOpacities() {
        for (var i = 0; i < stack.children.length; ++i) {
            stack.children[i].opacity = (i == current ? 1 : 0)
        }
    }

    Row {
        id: header

        Repeater {
            model: stack.children.length
            delegate: Rectangle {
                width: tabWidget.width / stack.children.length
                height: tabWidget.headerHeight

                Rectangle {
                    width: parent.width
                    height: 3
                    anchors {
                        bottom: parent.bottom
                        bottomMargin: 3
                    }
                    color: tabWidget.current === index ? "#acb2c2" : "blue"
                }
                //                BorderImage {
                //                    anchors {
                //                        fill: parent
                //                        leftMargin: 2
                //                        topMargin: 5
                //                        rightMargin: 1
                //                    }
                //                    border {
                //                        left: 7
                //                        right: 7
                //                    }
                //                    source: "tab.png"
                //                    visible: tabWidget.current === index
                //                }
                Text {
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    anchors.fill: parent
                    text: stack.children[index].title
                    elide: Text.ElideRight
                    font.bold: tabWidget.current === index
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: tabWidget.current = index
                }
            }
        }
    }

    Item {
        id: stack
        width: tabWidget.width
        anchors.top: header.bottom
        anchors.bottom: tabWidget.bottom
    }
}
