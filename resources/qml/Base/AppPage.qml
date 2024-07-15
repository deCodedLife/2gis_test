import QtQuick
import QtQuick.Controls.Material

import "."
import ".."
import "../States"

Item
{
    id: page
    clip: true

    signal afterInit()
    property int pageHeight: 0
    property int defaultHeight: parent.height
    property bool isLoaded: true
    property bool fromBottomSheet: parent.isBottomSheet ?? false

    Component.onCompleted: {
        if ( fromBottomSheet ) {
            afterInit()
            return
        }

        AppHeader.options = []
        AppHeader.color = Material.accentColor
        AppHeader.title = ""
        AppHeader.subtitle = ""
        AppHeader.isVisible = true
        Settings.currentTheme = Material.Dark

        defaultHeight = height
        afterInit()
    }

    onPageHeightChanged: {
        if( fromBottomSheet ) return
        if ( height > defaultHeight && isLoaded ) AppLoader.reloadFlickable()
        AppLoader.pageHeight = height
    }

    onHeightChanged: {
        height = pageHeight
        AppLoader.pageHeight = height
    }
}
