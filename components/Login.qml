import QtQuick 2.4
import SddmComponents 2.0
import QtQuick.Controls 1.4

StackView {
    id: stack
    property int textBoxWidth: 200
    property int textBoxHeight: 30

    delegate: StackViewDelegate {

        pushTransition: StackViewTransition {
            PropertyAnimation {
                target: enterItem
                property: "opacity"
                from: 0
                to: 1
                duration: 500
            }

            PropertyAnimation {
                target: exitItem
                property: "opacity"
                from: 1
                to: 0
                duration: 500
            }

            NumberAnimation {
                target: enterItem
                property: "x"
                from: exitItem.x + 500
                to: exitItem.x
                duration: 500
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: exitItem
                property: "x"
                from: exitItem.x
                to: exitItem.x - 500
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }

        popTransition: StackViewTransition {
            PropertyAnimation {
                target: enterItem
                property: "opacity"
                from: 0
                to: 1
                duration: 500
            }

            PropertyAnimation {
                target: exitItem
                property: "opacity"
                from: 1
                to: 0
                duration: 500
            }

            NumberAnimation {
                target: enterItem
                property: "x"
                from: exitItem.x - 500
                to: exitItem.x
                duration: 500
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: exitItem
                property: "x"
                from: exitItem.x
                to: exitItem.x + 500
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }
    }

    initialItem: currentUserPrompt
    onCurrentItemChanged: currentItem.forceActiveFocus()

    Component {
        id: currentUserPrompt

        FocusScope {
            id: currentUserScope
            onFocusChanged: currentUserFocus.focus = true

            Column {
                spacing: 10
                anchors.centerIn: parent

                Label {
                    text: "zach"
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                PasswordBox {
                    focus: true
                    width: textBoxWidth; height: textBoxHeight
                    anchors.horizontalCenter: parent.horizontalCenter

                    onTextChanged: {
                        stack.push(newUserPrompt)
                    }
                }
            }
        }
    }

    Component {
        id: newUserPrompt

        FocusScope {
            id: newUserFocus
            onFocusChanged: newUserFocus.focus = true

            Column {
                spacing: 10
                anchors.centerIn: parent

                TextField {
                    focus: true
                    textColor: "black"
                    width: textBoxWidth; height: textBoxHeight
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                PasswordBox {
                    width: textBoxWidth; height: textBoxHeight
                    anchors.horizontalCenter: parent.horizontalCenter

                    onTextChanged: {
                        stack.pop()
                    }
                }
            }
        }
    }
}


