import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Window

Window {
    id: window
    visible: true
    // width: height * ( 9/16 )
    // height: 1280
    title: "Azura Mobile"
    color: "black"

    property real statusbarDrag: 0
    property bool wasStatusbarDragReleased: false

    Component.onCompleted: {
        width = height * ( 9/16 )
    }

    Wallpaper { id: wallpaper }

    Item {
        id: container
        anchors.fill: parent
        scale: Math.min(window.width / 720, window.height / 1280) 
        transformOrigin: Item.Top

        // Item {
        //     id: wallpaper
        //     anchors.fill: parent
 // height: window.height / scale



        // }

        Item {
            width: window.width
            height: window.height / container.scale

            ShaderEffectSource {
                id: backgroundBlurSrc
                anchors.fill: parent
                sourceItem: wallpaper
                sourceRect: Qt.rect(0, 0, wallpaper.width, wallpaper.height)
                live: true
                visible: false
            }

            QuickSettings { id: qs }   

            StatusBar {}

        }
    }
}