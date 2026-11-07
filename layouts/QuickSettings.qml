import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Window

Item {
    id: quicksettings
    width: parent.width
    height: parent.height

    FontLoader { 
        id: dmsans
        source: "../assets/fonts/DMSans-VariableFont.ttf" 
    }

    FontLoader { 
        id: inter
        source: "../assets/fonts/Inter-Regular.ttf" 
    }

    Rectangle {
        anchors.fill: parent
        opacity: 0.6

        // Image {
        //     source: "../assets/qsref.png"
        //     width: 720
        //     height: 1520
        // }

        gradient: Gradient {
            GradientStop { position: 0.15; color: "black" }
            GradientStop { position: 1.00; color: "transparent" }
        }
    }

    Item {
        width: 720
        height: quicksettings.height

        Column {
            spacing: -25
            x: 69
            y: 85

            Item {
                width: sourceTimeLabel.width
                height: sourceTimeLabel.height

                Text {
                    id: sourceTimeLabel
                    text: "14:00"
                    font.pixelSize: 128
                    font.family: dmsans.name
                    font.weight: Font.Medium
                    color: "#CCffffff"
                    style: Text.Outline
                    styleColor: "#20000000"
                    visible: false
                }

                MultiEffect {
                    source: sourceTimeLabel
                    anchors.fill: sourceTimeLabel
                    opacity: 0.8
                    // x: 69
                    // y: 104

                    shadowEnabled: true
                    shadowColor: "#000000"
                    shadowOpacity: 0.35
                    blurMax: 12
                    shadowBlur: 1
                    shadowVerticalOffset: 4
                    shadowHorizontalOffset: 0
                }
            }

            Item {
                width: sourceDateLabel.width
                height: sourceDateLabel.height

                Text {
                    id: sourceDateLabel
                    text: "Wednesday, Oct 1"
                    font.pixelSize: 48
                    font.family: inter.name
                    font.weight: Font.ExtraLight
                    color: "#99ffffff"
                    style: Text.Outline
                    styleColor: "#20000000"
                    visible: false
                }

                MultiEffect {
                    source: sourceDateLabel
                    anchors.fill: sourceDateLabel
                    opacity: 0.6
                    // x: 69
                    // y: 220

                    shadowEnabled: true
                    shadowColor: "#000000"
                    shadowOpacity: 0.48
                    blurMax: 8
                    shadowBlur: 1
                    shadowVerticalOffset: 4
                    shadowHorizontalOffset: 0
                }
            }

        }

        Row {
            y: 376

            Rectangle {
                id: wifiBtn
                width: 278
                height: 118
                radius: 24
                color: "transparent"
                visible: false

                Image {
                    id: wifiBtnBase
                    source: "../assets/ui/qs/bigButton_red.png"
                    anchors.fill: parent
                }

                Image {
                    id: wifiIcon
                    source: "../assets/ui/qs/icons/wifi.png"
                    width: 50
                    height: 36
                    x: 36
                    y: 41
                    visible: false
                }

                MultiEffect {
                    source: wifiIcon
                    anchors.fill: wifiIcon

                    shadowEnabled: true
                    shadowColor: "#000000"
                    shadowOpacity: 0.15
                    blurMax: 6
                    shadowBlur: 1
                    shadowVerticalOffset: 4
                    shadowHorizontalOffset: 0
                }

                Text {
                    text: "neighbour dude"
                    font.pixelSize: 20
                    font.weight: Font.Medium
                    color: "white"
                    x: 104
                    y: 39
                }

                Text {
                    text: "Wi-Fi"
                    font.pixelSize: 12
                    font.weight: Font.Light
                    color: "white"
                    x: 104
                    y: 63
                }
            }

            MultiEffect {
                source: wifiBtn
                anchors.fill: wifiBtn

                shadowEnabled: true
                shadowColor: "#000000"
                shadowOpacity: 0.25
                blurMax: 12
                shadowBlur: 1
                shadowVerticalOffset: 4
                shadowHorizontalOffset: 0
            }

        }
    }
}