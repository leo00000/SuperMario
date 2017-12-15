import QtQuick 2.7
import "../components"
import "../SuperMario.js" as SuperMario

Item {
    anchors.fill: parent
    visible: false

    Image {
        id: background
        x: -mario.camera_x
        source: "image://gfx/level_1_1"
    }

    Item {
        id: ground
        anchors.left: background.left
        visible: false

        Rectangle {
            x: 0; y: 535
            width: 2953
            height: 65

            color: "green"
        }


        Rectangle {
            x: 3048; y: 535
            width: 635
            height: 65
            color: "red"
        }

        Rectangle {
            x: 3819; y: 535
            width: 2735
            height: 65
            color: "black"
        }

        Rectangle {
            x: 6647; y: 535
            width: 9085 - 6647
            height: 65
            color: "grey"
        }
    }

    Item {
        id: pipes
        anchors.left: background.left
        visible: false

        Rectangle {
            x: 1202; y:452
            width: 83
            height: 85
        }

        Rectangle {
            x: 1631; y:409
            width: 83
            height: 140
        }

        Rectangle {
            x: 1973; y:366
            width: 83
            height: 170
        }

        Rectangle {
            x: 2445; y:366
            width: 83
            height: 170
        }

        Rectangle {
            x: 6989; y:452
            width: 83
            height: 85
        }

        Rectangle {
            x: 7675; y:452
            width: 83
            height: 85
        }
    }

    Item {
        id: steps
        anchors.left: background.left
        visible: false

        Rectangle {
            x: 5745; y:495
            width: 40
            height: 44
        }

        Rectangle {
            x: 5788; y:452
            width: 40
            height: 44 * 2
        }

        Rectangle {
            x: 5831; y:409
            width: 40
            height: 44 * 3
        }

        Rectangle {
            x: 5874; y:366
            width: 40
            height: 44 * 4
        }

        /**/
        Rectangle {
            x: 6001; y:366
            width: 40
            height: 44 * 4
        }

        Rectangle {
            x: 6044; y:408
            width: 40
            height: 44 * 3
        }

        Rectangle {
            x: 6087; y:452
            width: 40
            height: 44 * 2
        }

        Rectangle {
            x: 6130; y:495
            width: 40
            height: 44
        }

        /**/
        Rectangle {
            x: 6345; y:495
            width: 40
            height: 44
        }

        Rectangle {
            x: 6388; y:452
            width: 40
            height: 44 * 2
        }

        Rectangle {
            x: 6431; y:409
            width: 40
            height: 44 * 3
        }

        Rectangle {
            x: 6474; y:366
            width: 40
            height: 44 * 4
        }

        Rectangle {
            x: 6517; y:366
            width: 40
            height: 44 * 4
        }

        /**/
        Rectangle {
            x: 6644; y:366
            width: 40
            height: 44 * 4
        }

        Rectangle {
            x: 6687; y:408
            width: 40
            height: 44 * 3
        }

        Rectangle {
            x: 6728; y:452
            width: 40
            height: 44 * 3
        }

        Rectangle {
            x: 6771; y:495
            width: 40
            height: 44
        }

        /**/
        Rectangle {
            x: 7760; y:495
            width: 40
            height: 44
        }

        Rectangle {
            x: 7803; y:452
            width: 40
            height: 44 * 2
        }

        Rectangle {
            x: 7845; y:409
            width: 40
            height: 44 * 3
        }

        Rectangle {
            x: 7888; y:366
            width: 40
            height: 44 * 4
        }

        Rectangle {
            x: 7931; y:323
            width: 40
            height: 44 * 5
        }

        Rectangle {
            x: 7974; y:280
            width: 40
            height: 44 * 6
        }

        Rectangle {
            x: 8017; y:237
            width: 40
            height: 44 * 7
        }

        Rectangle {
            x: 8060; y:194
            width: 40
            height: 44 * 8
        }

        Rectangle {
            x: 8103; y:194
            width: 40
            height: 44 * 8
        }


        Rectangle {
            x: 8488; y:495
            width: 40
            height: 44
        }

    }

    Item {
        id: bricks
        anchors.left: background.left

        Brick {
            x: 858; y: 365
        }

        Brick {
            x: 944; y: 365
        }

        Brick {
            x: 1030; y: 365
        }

        Brick {
            x: 3299; y: 365
        }

        Brick {
            x: 3385; y: 365
        }

        Brick {
            x: 3430; y: 193
        }

        Brick {
            x: 3473; y: 193
        }

        Brick {
            x: 3516; y: 193
        }

        Brick {
            x: 3559; y: 193
        }

        Brick {
            x: 3602; y: 193
        }

        Brick {
            x: 3645; y: 193
        }

        Brick {
            x: 3688; y: 193
        }

        Brick {
            x: 3731; y: 193
        }

        Brick {
            x: 3901; y: 193
        }

        Brick {
            x: 3944; y: 193
        }

        Brick {
            x: 3987; y: 193
        }
        /**/
        Brick {
            x: 4030; y: 365
        }

        Brick {
            x: 4287; y: 365
        }
        /**/
        Brick {
            x: 4330; y: 365
        }

        Brick {
            x: 5058; y: 365
        }

        Brick {
            x: 5187; y: 193
        }

        Brick {
            x: 5230; y: 193
        }

        Brick {
            x: 5273; y: 193
        }

        Brick {
            x: 5488; y: 193
        }

        Brick {
            x: 5574; y: 193
        }

        Brick {
            x: 5617; y: 193
        }

        Brick {
            x: 5531; y: 365
        }

        Brick {
            x: 5574; y: 365
        }

        Brick {
            x: 7202; y: 365
        }

        Brick {
            x: 7245; y: 365
        }

        Brick {
            x: 7331; y: 365
        }
    }

    Item {
        id: coinBoxes
        anchors.left: background.left


        CoinBox {
            x: 685; y:365
        }

        CoinBox {
            x: 901; y:365
        }

        CoinBox {
            x: 987; y:365
        }

        CoinBox {
            x: 943; y:193
        }

        CoinBox {
            x: 3342; y:365
        }

        CoinBox {
            x: 4030; y:193
        }

        CoinBox {
            x: 4544; y:365
        }

        CoinBox {
            x: 4672; y:365
        }

        CoinBox {
            x: 4672; y:193
        }

        CoinBox {
            x: 4800; y:365
        }

        CoinBox {
            x: 5531; y:193
        }

        CoinBox {
            x: 7288; y:365
        }
    }

    Item {
        id: flag
    }

    Item {
        id: enemies
        anchors.left: background.left

        Goomba {
            x: 510 + 500; y: 495
            visible: mario.camera_x >= x - 800
        }

        Goomba {
            x: 1400 + 500; y: 495
            visible: mario.camera_x >= x - 800
        }

        Goomba {
            x: 1740 + 500; y: 495
            visible: mario.camera_x >= x - 800
        }

        Goomba {
            x: 3080 + 500; y: 193
            visible: mario.camera_x >= x - 800
        }
        Goomba {
            x: 3090 + 500; y: 193
            visible: mario.camera_x >= x - 800
        }

        Goomba {
            x: 3750 +500; y: 495
            visible: mario.camera_x >= x - 800
        }

//        Goomba {
//            x: 4150 +500; y: 495
//            visible: mario.camera_x >= x - 800
//        }

        Goomba {
            x: 4470 +500; y: 495
            visible: mario.camera_x >= x - 800
        }
        Goomba {
            x: 4950 +500; y: 495
            visible: mario.camera_x >= x - 800
        }
        Goomba {
            x: 5100 +500; y: 495
            visible: mario.camera_x >= x - 800
        }
        Goomba {
            x: 6800 +500; y: 495
            visible: mario.camera_x >= x - 800
        }
        Goomba {
            x: 8504 +500; y: 495
            visible: mario.camera_x >= x - 800
        }
        Goomba {
            x: 8775 +500; y: 495
            visible: mario.camera_x >= x - 800
        }
        Goomba {
            x: 2740 +500; y: 495
            visible: mario.camera_x >= x - 800
        }
        Goomba {
            x: 2740 +500; y: 495
            visible: mario.camera_x >= x - 800
        }

        Koopa {
            x: 600; y: 495
//            visible: mario.camera_x >= x - 800
        }

    }

    Timer {
        interval: 16
        running: parent.visible
        repeat: true
        onTriggered: SuperMario.update()
    }

    Keys.onPressed: {
        if (event.isAutoRepeat) return
        SuperMario.keyPress(event.key)
    }

    Keys.onReleased: {
        if (event.isAutoRepeat) return
        SuperMario.keyRelease(event.key)
    }

//    MouseArea {
//        anchors.fill: parent
//        onClicked: console.log(ground.resources[0])
//    }
}