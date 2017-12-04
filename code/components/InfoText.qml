import QtQuick 2.7

Item {
    id: info
    anchors.fill: parent
    property int score: 0
    property var maskVisible: false
    property var alive: false
    property var die: false

    Rectangle {
        anchors.fill: parent
        color: "black"
        visible: maskVisible
    }

    Item {

    }

    Label {
        text: "MARIO"
        x: 75; y: 30
    }

    Label {
        text: parent.score
        x: 75; y: 50
    }

    Label {
        text: "WORLD"
        x: 420; y: 30
    }

    Label {
        text: "TIME"
        x: 620; y: 30
    }
}