import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Material

import "."
import "Base"
import "States"

AppWindow
{
    width: 450
    height: 720

    x: Settings.is_mobile ? 0 : Screen.width - 460
    y: Settings.is_mobile ? 0 : (Screen.height / 2) - (height / 2)

    onAfterInit: {
        AppLoader.loadPage( "Pages/WelcomeScreen.qml" )
    }
}
