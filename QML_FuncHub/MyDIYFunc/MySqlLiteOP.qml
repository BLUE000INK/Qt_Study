import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4
import QtQuick.LocalStorage 2.15
import "../MyDIYBtn"
import "../MyJS/MysqlLite.js" as MyDB

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("sqlLite数据库操作")
    color: "#2e2f30"
    property var listModel
    Component.onCompleted: {
        MyDB.initDatabase()
        //MyDB.insertData("color", "blue")
    }
    Row {
        height: 50
        width: 606
        spacing: 2
        MyPushBtn {
            height: 50
            width: 200
            btnText: "增加"
            onClicked: {

            }
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "删除"
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "修改"
        }
        MyPushBtn {
            height: 50
            width: 200
            btnText: "查询"
            onClicked: {
                root.listModel = MyDB.readAllData()
            }
        }
    }
    TableView {
        id: myTableView
        anchors.fill: parent
        anchors.topMargin: 60
        model: root.listModel
        TableViewColumn {
            id: titleColumn
            role: "name"
            title: "Name"
            width: myTableView.viewport.width / 2
        }
        TableViewColumn {
            id: authorColumn
            role: "value"
            title: "Value"
            width: myTableView.viewport.width / 2
        }
        headerDelegate: Rectangle {
            height: 50
            color: "#2eaaaa"
            border.width: 2
            MyLable {
                anchors.fill: parent
                text: styleData.value
            }
        }
        rowDelegate: Rectangle {
            height: 50
            color: styleData.selected ? "#4e001f" : "#4eaa1f"
        }
        itemDelegate: Rectangle {
            focus: true
            anchors.fill: parent
            anchors.margins: 5
            color: styleData.selected ? "#808080" : "transparent"
            border.width: 2
            MyLable {
                anchors.fill: parent
                text: styleData.value
                onClicked: {

                    myTableView.currentRow = styleData.row
                }
            }
        }
    }
}
