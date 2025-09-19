import QtQuick

Item {
    id: clock
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    anchors.margins: 10

    property var date: new Date()

    Text {
        anchors.right: clock.right
        anchors.verticalCenter: clock.verticalCenter
        text: Qt.formatDateTime(clock.date, "HH:mm:ss\nyyyy.MM.dd")
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.family: "monospace"
        color: "white"
    }

    Timer {
        running: true
        repeat: true
        interval: 1000

        onTriggered: {
            clock.date = new Date()
        }
    }
}
