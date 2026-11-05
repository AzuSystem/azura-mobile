import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Window

Item {
    id: wallpaper
    width: parent.width
    height: parent.height

    Image {
        source: "../assets/1101450_kyokaz.jpg"
        anchors.fill: parent    
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
    }
}