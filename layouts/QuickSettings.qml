import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Window

Item {
    id: quicksettings
    width: 720
    height: 1280

    property real distancePastDrag: statusbarDrag - 200
    property real constantResistance: 0.18


    opacity: statusbarDrag / 500

    NumberAnimation {
        id: fadeIn
        target: quicksettings
        property: "opacity"

        duration: 150
    }

    // google gave me this formula, so i shall work it out
    // b = d * x / (d + c * x)

    // Source: google search overview
    // x: The raw distance pulled past the boundary (x = pointer_pos - limit).
    // d: The reference dimension (the width or height of the scroll container/view).
    // c: The constant of elasticity or resistance. For standard iOS UIScrollView, c ≈ 0.55.
    // b: The actual clamped/dampened displacement rendered on screen. 
    //    As x → ∞, the term inside the parenthesis approaches 1.0, meaning b asymptotically approaches
    //    d ⋅ (1 - something) < d, so the element can never travel a full screen-height past the edge.
    //    - Source: https://stackoverflow.com/questions/22133503/rubber-band-effect

    readonly property bool isSoftwareRendered: GraphicsInfo.api === GraphicsInfo.Software
    property date currentTime: new Date()
    property bool isTablet: false

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: currentTime = new Date()
    }

    FontLoader { 
        id: dmsans
        source: "../assets/fonts/DMSans-VariableFont.ttf" 
    }

    FontLoader { 
        id: inter
        source: "../assets/fonts/Inter-Regular.ttf" 
    }

    MultiEffect {
        source: backgroundBlurSrc
        anchors.fill: parent

        blurEnabled: true
        blurMax: 64
        blur: 1
        autoPaddingEnabled: false
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

    Image {
        source: "../assets/noise.png"
        opacity: 0.05
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    Item {
        id: quickSettingsContent
        // anchors.fill: parent
        width: wallpaper.width
        height: wallpaper.height

        y: ( height * constantResistance * distancePastDrag ) / ( height + constantResistance * distancePastDrag )
        Connections {
            target: window
            function onWasStatusbarDragReleasedChanged() {
                returnAnim.to = 0
                returnAnim.start()

                fadeIn.to = 1;
                fadeIn.start()
            }
        }

        SpringAnimation {
            id: returnAnim
            target: quickSettingsContent
            property: "y"

            spring: 3
            damping: 0.25
            duration: 150
        }

        Item {
            width: 720
            height: quicksettings.height

            anchors.horizontalCenter: isTablet ? undefined : parent.horizontalCenter

            Column {
                spacing: -25
                x: 69
                y: 85

                Item {
                    width: sourceTimeLabel.width
                    height: sourceTimeLabel.height

                    Text {
                        id: sourceTimeLabel
                        text: Qt.formatTime(currentTime, "hh:mm")
                        font.pixelSize: 128
                        font.family: dmsans.name
                        font.weight: Font.Medium
                        color: "#CCffffff"
                        style: Text.Outline
                        styleColor: "#20000000"
                        visible: isSoftwareRendered
                    }

                    MultiEffect {
                        source: sourceTimeLabel
                        anchors.fill: sourceTimeLabel
                        opacity: 0.8
                        // x: 69
                        // y: 104

                        shadowEnabled: !isSoftwareRendered
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
                        text: Qt.formatDate(currentTime, "dddd, MMM d") 
                        font.pixelSize: 48
                        font.family: inter.name
                        font.weight: Font.ExtraLight
                        color: "#99ffffff"
                        style: Text.Outline
                        styleColor: "#20000000"
                        visible: isSoftwareRendered
                    }

                    MultiEffect {
                        source: sourceDateLabel
                        anchors.fill: sourceDateLabel
                        opacity: 0.6
                        // x: 69
                        // y: 220

                        shadowEnabled: !isSoftwareRendered
                        shadowColor: "#000000"
                        shadowOpacity: 0.48
                        blurMax: 8
                        shadowBlur: 1
                        shadowVerticalOffset: 4
                        shadowHorizontalOffset: 0
                    }
                }

            }

            Item {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 606
                height: 118
                y: 376

                Rectangle {
                    id: wifiBtn
                    width: 278
                    height: 118
                    radius: 24
                    color: "transparent"
                    visible: isSoftwareRendered
                    anchors.left: parent.left


                    Image {
                        source: "../assets/ui/qs/wifi_on.png"
                        anchors.fill: parent
                    }
                    Item {
                        id: wifiBtnContent
                        anchors.fill: parent
                        visible: isSoftwareRendered


                        Text {
                            id: wifiName
                            text: "neighbour dude"
                            font.pixelSize: 20
                            font.weight: Font.Medium
                            color: "white"
                            x: 104
                            y: 39
                            width: 148
                            elide: Text.ElideRight
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
                        anchors.fill: wifiBtnContent
                        source: wifiBtnContent

                        shadowEnabled: !isSoftwareRendered
                        shadowColor: "#000000"
                        shadowOpacity: 0.15
                        blurMax: 6
                        shadowBlur: 1
                        shadowVerticalOffset: 3
                        shadowHorizontalOffset: 0
                    }

                }

                Rectangle {
                    id: bluetoothBtn
                    width: 278
                    height: 118
                    radius: 24
                    color: "transparent"
                    anchors.right: parent.right
                    visible: isSoftwareRendered

                    Image {
                        source: "../assets/ui/qs/bluetooth_on.png"
                        anchors.fill: parent
                    }

                    Item {
                        id: bluetoothBtnContent
                        anchors.fill: parent
                        visible: isSoftwareRendered


                        Text {
                            id: bluetoothName
                            text: "cool headphones"
                            font.pixelSize: 20
                            font.weight: Font.Medium
                            color: "white"
                            x: 104
                            y: 39
                            width: 148
                            elide: Text.ElideRight
                        }

                        Text {
                            text: "Bluetooth"
                            font.pixelSize: 12
                            font.weight: Font.Light
                            color: "white"
                            x: 104
                            y: 63
                        }                    
                    }

                    MultiEffect {
                        anchors.fill: bluetoothBtnContent
                        source: bluetoothBtnContent

                        shadowEnabled: !isSoftwareRendered
                        shadowColor: "#000000"
                        shadowOpacity: 0.15
                        blurMax: 6
                        shadowBlur: 1
                        shadowVerticalOffset: 3
                        shadowHorizontalOffset: 0
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

                MultiEffect {
                    source: bluetoothBtn
                    anchors.fill: bluetoothBtn

                    shadowEnabled: true
                    shadowColor: "#000000"
                    shadowOpacity: 0.25
                    blurMax: 12
                    shadowBlur: 1
                    shadowVerticalOffset: 4
                    shadowHorizontalOffset: 0
                }

            }

            Item {
                id: buttonGrid
                width: 603
                height: 500
                y: 545
                visible: isSoftwareRendered
                anchors.horizontalCenter: parent.horizontalCenter


                Grid {
                    // anchors.fill: parent

                    // cellWidth: 118
                    // cellHeight: 118
                    columns: 4
                    spacing: 44
                    // interactive: false
                    // keyNavigationEnabled: true

                    Rectangle {
                        id: mobileData
                        width: 118
                        height: 118
                        radius: 59
                        color: "transparent"

                        Image {
                            source: "../assets/ui/qs/mobiledata_off.png"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        width: 118
                        height: 118
                        radius: 59
                        color: "transparent"

                        Image {
                            source: "../assets/ui/qs/torch_off.png"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        width: 118
                        height: 118
                        radius: 59
                        color: "transparent"

                        Image {
                            source: "../assets/ui/qs/dnd_off.png"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        width: 118
                        height: 118
                        radius: 59
                        color: "transparent"

                        Image {
                            source: "../assets/ui/qs/screenshot.png"
                            anchors.fill: parent
                        }
                    }


                }
            }

            MultiEffect {
                source: buttonGrid
                anchors.fill: buttonGrid

                shadowEnabled: !isSoftwareRendered
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