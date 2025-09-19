import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.bar



ShellRoot {
    Variants {
        model: Quickshell.screens

        Item {
            property ShellScreen modelData

            // PanelWindow {
            //     anchors.left: true
            //     anchors.right: true
            //     anchors.bottom: true
            //     implicitHeight: 55
            //     color: "transparent"
            //     screen: modelData

            //     Clock {}
            // }


            PanelWindow {
                anchors.left: true
                anchors.right: true
                anchors.bottom: true
                anchors.top: true
                color: "transparent"
                screen: modelData
                mask: Region {}

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.reset();

                        let radius = 10;
                        let top = 10;
                        let left = 10;
                        let right = 10;
                        let bottom = 10;
                        let col = Qt.rgba(0, 0, 0, 0.3);

                        // Сначала рисуем внешнюю заливку рамки
                        ctx.fillStyle = col;
                        ctx.beginPath();
                        ctx.rect(0, 0, width, height);
                        ctx.fill();

                        // Переключаемся на "вырезание"
                        ctx.globalCompositeOperation = "destination-out";
                        ctx.fillStyle = Qt.rgba(0, 0, 0, 1);  // непрозрачный цвет обязателен

                        ctx.beginPath();
                        ctx.moveTo(left + radius, top);
                        ctx.lineTo(width - right - radius, top);
                        ctx.quadraticCurveTo(width - right, top, width - right, top + radius);

                        ctx.lineTo(width - right, height - bottom - radius);
                        ctx.quadraticCurveTo(width - right, height - bottom, width - right - radius, height - bottom);

                        ctx.lineTo(left + radius, height - bottom);
                        ctx.quadraticCurveTo(left, height - bottom, left, height - bottom - radius);

                        ctx.lineTo(left, top + radius);
                        ctx.quadraticCurveTo(left, top, left + radius, top);

                        ctx.closePath();
                        ctx.fill();

                        // Вернуть режим обратно
                        ctx.globalCompositeOperation = "source-over";
                    }
                }

                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    height: 55
                    color: "transparent"

                    // Clock {}
                }
            }
        }
    }
}
