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

    Item {
        id: mainContent
        anchors.fill: parent

        Wallpaper {}

        StatusBar {}

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

        QuickSettings {}        
    }
}