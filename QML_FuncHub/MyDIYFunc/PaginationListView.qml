import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.centerIn: parent
    anchors.margins: 50

    property int itemPerPage: 6
    property int currentPage: 1

    //共有多少页
    property int name: value
}
