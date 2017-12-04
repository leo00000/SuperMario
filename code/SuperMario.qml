import QtQuick 2.7
import QtQuick.Window 2.2

import "levels"
import "components"

Window {
    title: "SuperMario @ leo"
    x: Screen.desktopAvailableWidth - 800; y: 0
    maximumHeight : 600
    maximumWidth : 800
    minimumHeight : 600
    minimumWidth : 800
    visible: true

    FontLoader { id: localFont; source: "../resources/fonts/Fixedsys.ttf" }

    Item {
        id: root
        anchors.fill: parent
        state: "menu"

        Menu {
            id: menu
            visible: true
            focus: true
        }

        Level_1_1 {
            id: level
            visible: false
        }

        InfoText{
            id: info
            state: root.state
        }

        Mario {
            id: mario
        }

        states: [
            State {
                name: "menu"
            },

            State {
                name: "gaming"
            }
        ]

        transitions: Transition{
            ScriptAction {
                script: {
                    info.maskVisible = true
                    root.state == "gaming" ? info.alive = true : info.die = true
                    mario.visible = false
                    delay.start()
                }
            }
        }

        Timer {
            id: delay
            interval: 1500;
            running: false;
            repeat: false;
            onTriggered: {
                info.maskVisible = false
                if (root.state == "gaming") {
                    info.alive = false
                    menu.visible = false
                    menu.focus = false
                    level.visible = true
                    mario.visible = true
                    level.focus = true
                } else {
                    info.die = false
                    menu.visible = true
                    menu.focus = true
                    level.visible = false
                    mario.visible = true
                    level.focus = false
                }
            }
        }
    }
}