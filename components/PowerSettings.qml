import QtQuick 2.0
import QtQuick.Controls 2.0

Row {
    spacing: 40

    signal sleepClicked()
    signal restartClicked()
    signal shutdownClicked()

    Column {
        id: sleep

        Image {
            id: sleepIcon
            source: "../resources/sleep.png"
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: sleepClicked()
            }
        }

        Label {
            text: "Sleep"
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Column {
        id: restart

        Image {
            id: restartIcon
            source: "../resources/restart.png"
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: restartClicked()
            }
        }

        Label {
            text: "Restart"
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Column {
        id: shutdown

        Image {
            id: shutdownIcon
            source: "../resources/power.png"
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: shutdownClicked()
            }
        }

        Label {
            text: "Shut Down"
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
