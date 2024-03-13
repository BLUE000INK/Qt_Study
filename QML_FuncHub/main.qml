import QtQuick 2.15
import QtQuick.Window 2.15
import "./MyDIYBtn"
import "./MyDIYFunc"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("FuncHub")
    color: "#2e2f30"
    Loader {
        id: loader_FuncWindow
        //异步加载
        asynchronous: true
    }
    Flow {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        MyPushBtn {
            height: 50
            width: 200
            btnText: "读取文件"
            onClicked: {
                loader_FuncWindow.source = "qrc:/MyDIYFunc/ReadFileFromSystem.qml"
            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "Table数据表"
            onClicked: {
                loader_FuncWindow.source = "qrc:/MyDIYFunc/DataTable.qml"
            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "List数据表"
            onClicked: {
                loader_FuncWindow.source = "qrc:/MyDIYFunc/DataList.qml"
            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "TabWidgetShow"
            onClicked: {
                loader_FuncWindow.source = "qrc:/MyDIYFunc/MyTabWidgetShow.qml"
            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "btnTest"
            onClicked: {
                loader_FuncWindow.source = "qrc:/MyDIYFunc/MyBtnTest.qml"
            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "输入确认控件"
            onClicked: {
                loader_FuncWindow.source = "qrc:/MyDIYFunc/InputAndConfirm.qml"
            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "分页列表"
            onClicked: {
                loader_FuncWindow.source = "qrc:/MyDIYFunc/PaginationListView.qml"
            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "风机图片旋转"
            onClicked: {
                loader_FuncWindow.source = "qrc:/MyDIYFunc/RotatingPNG.qml"
            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "sqlLite数据库"
            onClicked: {
                loader_FuncWindow.source = "qrc:/MyDIYFunc/MySqlLiteOP.qml"
            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "刷新"
            onClicked: {
                loader_FuncWindow.source = ""
            }
        }
    }
}
