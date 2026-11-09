import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Window

Window {
    id: window
    visible: true
    width: 720
    height: 1280
    title: "Azura Mobile"

    property real statusbarDrag: 0
    property bool wasStatusbarDragReleased: false

    Item {
        anchors.fill: parent
        Item {
            id: mainContent
            anchors.fill: parent

            Wallpaper {}


        }

        Item {
            anchors.fill: parent

            ShaderEffectSource {
                id: backgroundBlurSrc
                anchors.fill: parent
                sourceItem: mainContent
                sourceRect: Qt.rect(0, 0, width, height)
                live: true
                visible: false
            }

            QuickSettings { id: qs }   

            StatusBar {}

        }
    }
}