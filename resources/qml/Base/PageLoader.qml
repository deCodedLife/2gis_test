import QtQuick
import QtQuick.Layouts

import ".."

Item {
    id: body
    clip: true

    Layout.leftMargin:   Settings.is_mobile ? 0 : Settings.minimalMargin
    Layout.rightMargin:  Settings.is_mobile ? 0 : Settings.minimalMargin
    Layout.bottomMargin: Settings.is_mobile ? 0 : Settings.defaultmargin
    Layout.maximumWidth: 1200
    Layout.alignment: Qt.AlignHCenter

    Flickable {
        id: flickable

        contentWidth: body.width
        contentHeight: AppLoader.pageHeight
        interactive: AppLoader.isFlickable

        width: body.width
        height: body.height

        Connections {
            target: AppLoader
            function onReloadFlickable() {
                flickable.contentY = AppLoader.pageHeight
            }
        }

        Loader {
            id: loader
            width: body.width
            height: body.height
            source: [ QML, AppLoader.currentPage ].join("/")
            onSourceChanged: flickable.contentY = 0
        }
    }
}
