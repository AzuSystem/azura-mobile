import QtQuick
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

        gradient: Gradient {
            GradientStop { position: 0.15; color: "black" }
            GradientStop { position: 1.00; color: "transparent" }
        }
    }

    Item {
        width: 720
        height: quicksettings.height

        Row {
            Text {
                text: "14:00"
                font.pixelSize: 128
                font.family: dmsans.name
                font.weight: Font.Medium
                x: 69
                y: 104
                color: "#CCffffff"
                // style: Text.Outline
                // styleColor: "#20000000"
            }

            Text {
                text: "Wednesday, Oct 1"
                font.pixelSize: 48
                font.family: inter.name
                font.weight: Font.ExtraLight
                x: 69
                y: 220

            }
        }
    }
}