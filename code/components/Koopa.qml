import QtQuick 2.7

Item {
    id: koopa
    width: image.width
    height: image.height
    property var offset: 0
    property var name: "koopa"
    property var index: 0
    property var isSquished: false
    property var isLeft: true
    property var isFall: false

    Image {
        id: image
        source: "image://gfx/items/koopa/" + index
    }

    Timer {
        id: timer
        interval: 100
        running: parent.visible
        repeat: true
        onTriggered: parent.update()
    }

    Timer {
        id: delay
        interval: 500
        running: false
        repeat: false
        onTriggered: parent.visible = false
    }

    function update() {
        var x = koopa.x
        var y = koopa.y
        isLeft ? x -= 5 : x += 5
        isFall ? y += 5 : null
//        console.log(koopa.width, koopa.height)

        if (x < -parent.x || x > 800 - parent.x || y > 600) {
            console.log("disappear", x)
            koopa.visible = false
            return
        }

        if (isSquished) {
            index = 2
            timer.running = false
            delay.running = true
            return

        } else {
            index == 0 && !isFall ? index = 1 : index = 0
            koopa.x = x
            koopa.y = y
        }
    }


}