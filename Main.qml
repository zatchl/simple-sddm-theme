import QtQuick 2.6
import SddmComponents 2.0
import QtQuick.Controls 2.0
import "components"

Rectangle {
    id: root
    width: 1000; height: 1000
    color: "lightgray"

    LayoutMirroring.enabled: Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    Repeater {
        id: screens
        model: screenModel
        Background {
            x: geometry.x; y: geometry.y; width: geometry.width; height:geometry.height
            source: config.background
            fillMode: Image.Tile
            onStatusChanged: {
                if (status == Image.Error && source !== config.defaultBackground) {
                    source = config.defaultBackground
                }
            }
        }

        onItemAdded: {
            if (index == 0) {
                dateTimeBar.width = item.width
            }
        }
    }

    DateTimeBar {
        id: dateTimeBar
        anchors.top: root.top
    }

    Login {
        id: login
        anchors.centerIn: root
    }

    PowerSettings {
        anchors.bottom: root.bottom
        anchors.horizontalCenter: root.horizontalCenter
        onSleepClicked: sddm.suspend()
        onRestartClicked: sddm.reboot()
        onShutdownClicked: sddm.powerOff()
    }
}

