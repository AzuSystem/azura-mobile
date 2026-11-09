import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Window

Item {
	id: statusbar
	width: parent.width
	height: 32 + 24

	Item {
		// x: ( parent.width / 2 ) - ( width / 2 )
		y: 16
		// width: ( 85 / parent.width ) * 100 // my math is legit just down the drain huh...
		// width: parent.width * ( 85 / 100 ) 
		width: parent.width
		height: 24

		Item {
			height: 24
			anchors.left: parent.left
			anchors.leftMargin: 52

			Text {
				text: "25:00"
				font.family: Font.Normal
				font.pixelSize: 24
				color: "white"
			}
		}


		Item {
			height: 24
			anchors.right: parent.right
			anchors.rightMargin: 52

			Text {
				text: "25:00"
				font.family: Font.Normal
				font.pixelSize: 24
				color: "white"
			}
		}
	}

	DragHandler {
		id: statusbarDragHandler
		target: null

		onActiveTranslationChanged: {
			statusbarDrag = statusbarDragHandler.activeTranslation.y
		}

		onActiveChanged: {
			if (!active) {
				wasStatusbarDragReleased = true;
			} else {
				wasStatusbarDragReleased = false;
			}
		}
	}
}