import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QML_QTcpController 1.0
import QtQuick.Dialogs 1.3
import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QTcp")
    color: "#2e2f30"
    MyPushBtn {
        anchors.centerIn: parent
        width: 100
        height: 30
        btnText: "服务器"
        anchors.verticalCenterOffset: -50
        onClicked: {
            QTcpController.initServerEnv()
            myLoader.sourceComponent = com_server
        }
    }
    MyPushBtn {
        anchors.centerIn: parent
        width: 100
        height: 30
        btnText: "客户端"
        anchors.verticalCenterOffset: 50
        onClicked: {
            QTcpController.initClientEnv()
            myLoader.sourceComponent = com_client
        }
    }
    Loader {
        id: myLoader
        anchors.fill: parent
    }
    Component {
        //服务器
        id: com_server
        Rectangle {
            id: rect_server
            anchors.fill: parent
            gradient: Gradient {
                //@disable-check M16
                orientation: Gradient.Vertical
                GradientStop {
                    position: 0
                    color: "#92fe9d"
                }

                GradientStop {
                    position: 1
                    color: "#00c9ff"
                }
            }
            ColumnLayout {
                anchors.fill: parent
                Rectangle {
                    height: 50
                    border.width: 2
                    Layout.fillWidth: true
                    color: "transparent"
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 2
                        spacing: 5
                        property alias myIP: inputIP.textInput.text
                        property alias myPort: inputPort.textInput.text
                        MyInputBox {
                            id: inputIP
                            Layout.fillHeight: true
                            width: 200
                            radius: 0
                            textInput.placeholderText: "服务器IP"
                            textInput.font.pixelSize: 20
                        }
                        MyInputBox {
                            id: inputPort
                            Layout.fillHeight: true
                            width: 80
                            radius: 0
                            textInput.placeholderText: "端口号"
                            textInput.font.pixelSize: 20
                        }
                        Rectangle {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "transparent"
                        }
                        MyPushBtn {
                            id: btnConn
                            Layout.fillHeight: true
                            width: 100
                            radius: 10
                            btnText: "start"
                            onClicked: {
                                if (QTcpController.createServer(
                                            parent.myIP, parent.myPort)) {
                                    enabled = false
                                    btnClose.enabled = true
                                    inputIP.enabled = false
                                    inputPort.enabled = false
                                    myBusyIndicator.running = true
                                    rect_server.insertMsg("服务器创建成功！！！")
                                } else {
                                    rect_server.insertMsg(
                                                "服务器创建失败！！！检查设置的IP和端口号是否冲突")
                                }
                            }
                        }
                        MyPushBtn {
                            id: btnClose
                            Layout.fillHeight: true
                            width: 100
                            radius: 10
                            btnText: "close"
                            enabled: false
                            onClicked: {
                                QTcpController.closeServer()
                                rect_server.insertMsg("已关闭服务器")
                                rectOP.visible = false
                                btnClose.enabled = false
                                myBusyIndicator.running = false
                                btnConn.enabled = true
                                inputIP.enabled = true
                                inputPort.enabled = true
                            }
                        }
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    border.width: 2
                    color: "transparent"
                    ColumnLayout {
                        anchors.fill: parent
                        Rectangle {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "transparent"
                            ScrollView {
                                anchors.fill: parent
                                anchors.margins: 10
                                TextArea {
                                    id: myTextBox
                                    font.pixelSize: 20
                                    readOnly: true
                                }
                            }
                        }
                        Rectangle {
                            id: rectOP
                            Layout.fillWidth: true
                            height: 50
                            border.width: 2
                            color: "transparent"
                            visible: false
                            RowLayout {
                                anchors.fill: parent
                                MyInputBox {
                                    id: inputMsg
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    radius: 0
                                    textInput.placeholderText: "请输入信息"
                                    textInput.font.pixelSize: 20
                                }
                                MyPushBtn {
                                    id: btnSend
                                    Layout.fillHeight: true
                                    width: 100
                                    radius: 10
                                    btnText: "send"
                                    onClicked: {
                                        if (QTcpController.sendMsgToClient(
                                                    inputMsg.textInput.text)) {
                                            rect_server.insertMsg(
                                                        "server:" + inputMsg.textInput.text)
                                            inputMsg.textInput.clear()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        BusyIndicator {
                            id: myBusyIndicator
                            anchors.centerIn: parent
                            running: false
                            width: 100
                            height: 100
                            MyLabel {
                                width: 300
                                height: 30
                                text: "。。。等待客户接入。。。"
                                pixelSize: 20
                                anchors.centerIn: parent
                                anchors.verticalCenterOffset: 100
                                visible: parent.running
                            }
                        }
                    }
                }
            }
            function insertMsg(msg) {
                myTextBox.append(msg)
            }
            Connections {
                target: QTcpController
                function onClientLogIn() {
                    myBusyIndicator.running = false
                    rectOP.visible = true
                    myTextBox.append("新用户登入服务器")
                }
                function onSendInfo(val) {
                    myTextBox.append(val)
                }
                function onClientExited() {
                    myTextBox.append("客户端退出")
                    rectOP.visible = false
                    myBusyIndicator.running = true
                }
            }
        }
    }
    Component {
        //客户端
        id: com_client
        Rectangle {
            id: rect_client
            anchors.fill: parent
            gradient: Gradient {
                //@disable-check M16
                orientation: Gradient.Vertical
                GradientStop {
                    position: 0
                    color: "#ff5858"
                }

                GradientStop {
                    position: 1
                    color: "#f09819"
                }
            }
            ColumnLayout {
                anchors.fill: parent
                Rectangle {
                    height: 50
                    border.width: 2
                    Layout.fillWidth: true
                    color: "transparent"
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 2
                        spacing: 5
                        property alias myIP: inputIP.textInput.text
                        property alias myPort: inputPort.textInput.text
                        MyInputBox {
                            id: inputIP
                            Layout.fillHeight: true
                            width: 200
                            radius: 0
                            textInput.placeholderText: "服务器地址"
                            textInput.font.pixelSize: 20
                        }
                        MyInputBox {
                            id: inputPort
                            Layout.fillHeight: true
                            width: 80
                            radius: 0
                            textInput.placeholderText: "端口号"
                            textInput.font.pixelSize: 20
                        }
                        Rectangle {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "transparent"
                        }
                        MyPushBtn {
                            id: btnConn
                            Layout.fillHeight: true
                            width: 100
                            radius: 10
                            btnText: "连接"
                            onClicked: {
                                if (QTcpController.connectServer(
                                            parent.myIP, parent.myPort)) {
                                    inputIP.enabled = false
                                    inputPort.enabled = false
                                    enabled = false
                                    btnClose.enabled = true
                                    myBusyIndicator.running = true
                                }
                            }
                        }
                        MyPushBtn {
                            id: btnClose
                            Layout.fillHeight: true
                            width: 100
                            radius: 10
                            btnText: "断开"
                            enabled: false
                            onClicked: {
                                QTcpController.closeClient()
                                rect_client.insertMsg("已断开与服务器的连接")
                                rectOP.visible = false
                                myBusyIndicator.running = false
                                inputIP.enabled = false
                                inputPort.enabled = false
                                enabled = false
                                btnConn.enabled = true
                            }
                        }
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    border.width: 2
                    color: "transparent"
                    ColumnLayout {
                        anchors.fill: parent
                        Rectangle {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "transparent"
                            ScrollView {
                                anchors.fill: parent
                                anchors.margins: 10
                                TextArea {
                                    id: myTextBox
                                    font.pixelSize: 20
                                    readOnly: true
                                }
                            }
                        }
                        Rectangle {
                            id: rectOP
                            Layout.fillWidth: true
                            height: 50
                            border.width: 2
                            color: "transparent"
                            RowLayout {
                                anchors.fill: parent
                                MyInputBox {
                                    id: inputMsg
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    radius: 0
                                    textInput.placeholderText: "请输入信息"
                                    textInput.font.pixelSize: 20
                                }
                                MyPushBtn {
                                    id: btnSend
                                    Layout.fillHeight: true
                                    width: 100
                                    radius: 10
                                    btnText: "send"
                                    onClicked: {
                                        if (QTcpController.sendMsgToServer(
                                                    inputMsg.textInput.text)) {
                                            rect_client.insertMsg(
                                                        "client:" + inputMsg.textInput.text)
                                            inputMsg.textInput.clear()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        BusyIndicator {
                            id: myBusyIndicator
                            anchors.centerIn: parent
                            running: false
                            width: 100
                            height: 100
                            MyLabel {
                                width: 300
                                height: 30
                                text: "。。。连接服务器中。。。"
                                pixelSize: 20
                                anchors.centerIn: parent
                                anchors.verticalCenterOffset: 100
                                visible: parent.running
                            }
                        }
                    }
                }
            }
            function insertMsg(msg) {
                myTextBox.append(msg)
            }
            Connections {
                target: QTcpController
                function onConnectSucceed() {
                    myBusyIndicator.running = false
                    rectOP.visible = true
                    myTextBox.append("成功连接服务器")
                }
                function onSendInfo(val) {
                    myTextBox.append(val)
                }
                function onServerClosed() {
                    myTextBox.append("服务器已关闭")
                    rectOP.visible = false
                    myBusyIndicator.running = true
                }
            }
        }
    }

    //可能是qmltype信息不全，有M16警告，这里屏蔽下
    //@disable-check M16
    onClosing: function (closeevent) {
        //CloseEvent的accepted设置为false就能忽略该事件
        //closeevent.accepted = false
        QTcpController.releaseSrc()
        console.log("窗口关闭")
    }
}
