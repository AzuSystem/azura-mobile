import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Window

Item {
    id: statusbar
    // x: ( parent.width / 2 ) - ( width / 2 )
    y: 16
    // width: ( 85 / parent.width ) * 100 // my math is legit just down the drain huh...
    // width: parent.width * ( 85 / 100 ) 
    width: parent.width
    height: 24

    Item {
        x: 52
        height: 24

        Text {
            text: "25:00"
            font.family: Font.Normal
            font.pixelSize: 24
            color: "white"
        }
    }


    Item {
        x: statusbar.width - width - 52
        height: 24

        Text {
            text: "25:00"
            font.family: Font.Normal
            font.pixelSize: 24
            color: "white"
        }
    }

}