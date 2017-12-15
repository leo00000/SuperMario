import QtQuick 2.7

Item {
    id: content
    property var xVel: 0
    property var yVel: 0
    z: 30

    Image {
        id: coin
        property var index: 0
        visible: false
        source: "image://gfx/items/coin/" + index
    }

    Image {
        id: mushroom
        visible: false
        source: "image://gfx/items/mushroom"
    }

    Image {
        id: life_mushroom
        visible: false
        source: "image://gfx/items/life_mushroom"
    }

    Image {
        id: flower
        property var index: 0
        visible: false
        source: "image://gfx/items/flower/" + index
    }

    Timer {
        id: coin_timer
        interval: 30
        running: true
        repeat: true
        onTriggered: {
            coin.index < 3 ? coin.index += 1 : coin.index = 0
            if (y > -content.parent.width) {
                content.destroy()
            } else {
//                console.log(content.parent.width, parent.width, coin.width, width)
                content.y += yVel
                yVel += 1.01
            }
        }
    }

    states: [
        State {
            name: "coin"
            PropertyChanges { target: coin; visible: true }
            PropertyChanges {
                target: content;
                width: coin.width;
                height: coin.height;
                anchors.horizontalCenter: content.parent.horizontalCenter
//                anchors.bottom: content.parent.top
                y: -content.parent.width
                yVel: -15
            }
        },

        State {
            name: "mushroom"
            PropertyChanges { target: mushroom; visible: true }
            PropertyChanges { target: content; width: mushroom.width; height: mushroom.height}
        },

        State {
            name: "life_mushroom"
            PropertyChanges { target: life_mushroom; visible: true }
            PropertyChanges { target: content; width: life_mushroom.width; height: life_mushroom.height}
        },

        State {
            name: "flower"
            PropertyChanges { target: flower; visible: true }
            PropertyChanges { target: content; width: flower.width; height: flower.height}
        }
    ]
}