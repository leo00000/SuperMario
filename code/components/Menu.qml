import QtQuick 2.7

Item {
    visible: true
    anchors.fill: parent

    Image {
        source: "image://gfx/level_1_1"
    }

    Image {
        x: 200; y: 75
        source: "image://gfx/logo"
    }

    Image {
        id: cursor
        x: 220; y: 350
        source: "image://gfx/items/cursor"

        property bool isPlayer2: false

        states: [
            State {
                name: "player1"
                when: cursor.isPlayer2
                PropertyChanges {
                    target: cursor
                    y: 380
                }
            }
        ]
    }

    Label {
        text: "1 PLAYER GAME"
        x: 250; y: 350
    }

    Label {
        text: "2 PLAYER GAME"
        x: 250; y: 380
    }

    Keys.onPressed: {
        if (event.key == Qt.Key_Up || event.key == Qt.Key_Down) {
            cursor.isPlayer2 = !cursor.isPlayer2
        }
        if (event.key == Qt.Key_Enter || event.key == Qt.Key_Return) {
            if (!cursor.isPlayer2) {
                root.state = "gaming"
            }
        }
    }


}