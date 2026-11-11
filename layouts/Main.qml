import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Window

Window {
    id: window
    visible: true
    width: height * ( 9/16 )
    // height: 1280
    title: "Azura Mobile"
    color: "black"

    property real statusbarDrag: 0
    property bool wasStatusbarDragReleased: false

    Wallpaper { id: wallpaper }

    Item {
        anchors.fill: parent
        scale: window.width / 720
        transformOrigin: Item.Top
        // Item {
        //     id: wallpaper
        //     anchors.fill: parent
 height: window.height / scale



        // }

        Item {
            anchors.fill: parent

            ShaderEffectSource {
                id: backgroundBlurSrc
                anchors.fill: parent
                sourceItem: wallpaper
                sourceRect: Qt.rect(0, 0, width, height)
                live: true
                visible: false
            }

            QuickSettings { id: qs }   

            StatusBar {}

        }
    }
}