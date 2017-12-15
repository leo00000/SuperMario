import QtQuick 2.7

Item {
    id: coinBox
    width: image.width
    height: image.height

    property var index: 0
    property var content: "coin"
    property var isOpen: false
    property var component
    property var yVel: -6
    property var tmpY: 0

    Image {
        id: image
        source: "image://gfx/items/coin_box/" + index
    }

    Timer {
        id: timer
        interval: 250
        running: parent.visible
        onTriggered: {parent.update(); tmpY =y}
        repeat: true
    }

    Timer {
        id: bump
        interval: 30
        running: false
        onTriggered: {
            y += yVel
            yVel += 2
            if (y >= tmpY) {
                bump.running = false
                y = tmpY
            }
        }
        repeat: true
    }

    function update() {
        if (!coinBox.isOpen) {
            index == 1 ? index = 0 : index += 1
        } else {
            bump.running = true
            index = 3
            timer.running = false
            component = Qt.createComponent("Content.qml")
            component.createObject(coinBox, {"x": 0, "y": 0, "state": content})
        }
    }
}