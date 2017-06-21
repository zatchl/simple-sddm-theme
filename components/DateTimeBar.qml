import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: root
    property date dateTime: new Date()
    property color color: "white"
    property alias dateFont: date.font
    property alias timeFont: time.font

    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: root.dateTime = new Date()
    }

    Rectangle {
        id: bar
        color: "transparent"
        width: root.width

        Label {
            id: date
            anchors.left: parent.left
            anchors.leftMargin: 5
            color: root.color
            text: Qt.formatDate(root.dateTime, Qt.DefaultLocaleLongDate)
            font.pointSize: 14
        }

        Label {
            id: time
            anchors.right: parent.right
            anchors.rightMargin: 5
            color: root.color
            text: Qt.formatTime(root.dateTime, "hh:mm")
            font.pointSize: 14
        }
    }
}


