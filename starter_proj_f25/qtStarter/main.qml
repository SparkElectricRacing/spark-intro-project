import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: window
    width: 1024
    height: 600
    visible: true
    title: "Racing Display"
    color: "black"

    // Vehicle data backend
    VehicleData {
        id: vehicle
    }

    Item {
        width: 1024
        height: 600
        property string currentTime: "00:00:00"
        property double currentSeconds : 0
        property bool faulted : false
        transform: Rotation { origin.x: 512; origin.y: 300; angle: debugMode ? 0 : 180}

        // ******** BACKGROUND RECTANGLE ********
        Rectangle {
            id: background
            width: parent.width
            height: parent.height
            color: "black"
            z: -1
        }

        Text{
            id: rpm_label
            x: 8
            y: 522
            text: "rpm"
            horizontalAlignment: Text.AlignRight
            font.pointSize: 31
            font.bold: false
            width: 97
            height: 48
            color: "white"
            font.family: "Chakra Petch"

            Text {
                id: rpm_value
                x: 13
                y: -86
                width: 139
                height: 80
                color: "#ffffff"
                text: vehicle.rpm
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 40
                font.family:  "Chakra Petch"
                font.bold: false
            }
        }

        Text {
            id: soc_readout
            x: 333
            y: 519
            width: 359
            height: 72
            color: "#ffffff"
            text: ((vehicle.battery).toFixed(1)) + "%"
            font.italic: true
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 45
            font.bold: false
            font.family:  "Chakra Petch"
        }

        Text {
            id: current_time_box
            x: -5
            y: 4
            width: 97
            height: 30
            color: "#ffffff"
            text: currentTime
            font.pointSize: 28
            font.family:  "Chakra Petch"
            font.bold: false
        }

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                currentTime = Qt.formatDateTime(new Date(), "hh:mm:ss")
                currentSeconds += 1
            }
        }

        Text {
            x: 555
            y: 333
            width: 469
            height: 52
            color: "#ffffff"
            text: "150 Nm"
            horizontalAlignment: Text.AlignRight
            font.pointSize: 28
            font.bold: false
            font.family:  "Chakra Petch"
        }

        Text {
            id:coolant_temp
            x: 549
            y: 4
            width: 469
            height: 52
            color: "#ffffff"
            text: vehicle.temperature.toFixed(1) + " ºC"
            horizontalAlignment: Text.AlignRight
            font.pointSize: 28
            font.bold: false
            font.family:  "Chakra Petch"
        }

        Item {
            id: speedgauge
            x: 263
            y: 2
            width: 500
            height: 500
            scale: 0.9
            z: 1

            Image {
                id: image
                x: 0
                y: 0
                width: 500
                height: 500
                z: 1
                antialiasing: true
                sourceSize.height: 800
                sourceSize.width: 800
                fillMode: Image.PreserveAspectFit
                source: "images/cutout.png"
            }

            Rectangle {
                id: arm
                x: 248
                y: 66
                width: 5
                height: 368
                color: "#00000000"
                radius: 20
                transformOrigin: Item.Center
                rotation: -115 + ((vehicle.speed / 180) * 240)
                z: -1

                Behavior on rotation {
                    NumberAnimation {
                        duration: 100
                        easing.type: Easing.InOutQuart
                    }
                }

                Rectangle {
                    id: needle
                    x: -70
                    y: -52
                    width: 120
                    height: 120
                    radius: 1
                    rotation: 99
                    gradient: Gradient {
                        GradientStop {
                            position: 1
                            color: "#00000000"
                        }
                        GradientStop {
                            position: 0.5
                            color: "#0057e0"
                        }
                        GradientStop {
                            position: 0
                            color: "#00000000"
                        }
                    }
                    z: 0
                }
            }

            Text{
                id: mphspeed
                x: 99
                y: 149
                z: 1
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 110
                font.bold: false
                width: 303
                height: 213
                color: "white"
                text: vehicle.speed
                font.family: "Chakra Petch"
            }

            Text {
                id: mphlabel
                x: 202
                y: 378
                width: 97
                height: 52
                color: "#ffffff"
                text: "mph"
                font.italic: true
                z: 1
                font.pointSize: 31
                font.bold: false
                font.family:  "Chakra Petch"
            }
        }

        Text {
            id: voltage_value
            x: 831
            y: 442
            width: 177
            height: 74
            color: "#ffffff"
            text: "400.0"
            horizontalAlignment: Text.AlignRight
            font.family: "Chakra Petch"
            font.pointSize: 40
            font.bold: false
        }

        Text {
            id: voltage_label
            x: 911
            y: 522
            width: 97
            height: 48
            color: "#ffffff"
            text: "volts"
            font.bold: false
            font.family: "Chakra Petch"
            horizontalAlignment: Text.AlignRight
            font.pointSize: 31
        }
    }
}
