import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material


import "../"
import "../Base"
import "../States"

AppPage {

    ColumnLayout
    {
        anchors.fill: parent
        anchors.margins: {
            left: Settings.minimalMargin
            right: Settings.minimalMargin
        }

        Text {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            text: "Settings"
            wrapMode: Text.WrapAnywhere
            font.pointSize: Settings.h3
            color: Settings.defaultTextColor
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: AppLoader.openEffect( () => AppLoader.loadPage( "Pages/Words.qml" ) )
    }

    onAfterInit: {
    }
}
