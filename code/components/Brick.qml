import QtQuick 2.7

Item {
    width: brick.width
    height: brick.height

    property var index: 0
    property var yVel: -6
    property var tmpY: 0

    Image {import sys; print('Python %s on %s' % (sys.version, sys.platform))
sys.path.extend([WORKING_DIR_AND_PYTHON_PATHS])
        id: brick
        source: "image://gfx/items/brick/" + index
    }

    Timer {
        id: animation
        interval: 30
        running: false
        onTriggered: {
            y += yVel
            yVel += 2
            if (y >= tmpY) {
                animation.running = false
                y = tmpY
            }
        }
        repeat: true
    }

    function test() {
        console.log("test
        ")
        tmpY = y
        yVel = -6
        animation.running = true
    }
}