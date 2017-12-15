import QtQuick 2.7

Item {
    id: mario
    x: 100; y: 495
    width: image.width
    height: image.height

    property var camera_x: 0
    property var index: 0
    property var style: "small_normal"
    property var path: "image://gfx/mario/" + style + "/" + index

    Image {
        id: image
        source: path
    }

    states: [
        State {
            name: "standing"
        },

        State {
            name: "walking"
            PropertyChanges {
                target: mario
            }
        },

        State {
            name: "falling"
        },

        State {
            name: "jumping"
        }
    ]

    Timer {
        interval: 16
        running: false
        repeat: true
        onTriggered: Mario.update()
    }
}