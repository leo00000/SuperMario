import QtQuick 2.7
Rectangle {
      width: 100; height: 100
      color: "red"

      SequentialAnimation on x {
          loops: Animation.Infinite
          PropertyAnimation { to: 50 }
          PropertyAnimation { to: 0 }
      }
  }