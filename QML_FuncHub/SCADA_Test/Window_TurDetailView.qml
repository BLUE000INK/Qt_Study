import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../MyDIYBtn"
import "../MyDIYItem"

Window {
    width: 1900
    height: 909
    visible: true
    title: qsTr("TurDetailView")
    color: "#225b95"
    SwipeView {
        id: swipeView
        anchors.fill: parent
        clip: true
        currentIndex: 0
        Rectangle {
            color: "#2255aa"
            Page_RealTimeCurve {
                anchors.centerIn: parent
                width: 1900
                height: 857
            }
        }
        Rectangle {
            color: "#335b22"
            Page_PowerCurve {
                anchors.centerIn: parent
                width: 1900
                height: 857
            }
        }
    }
    PageIndicator {
        id: indicator

        count: swipeView.count
        currentIndex: swipeView.currentIndex

        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
