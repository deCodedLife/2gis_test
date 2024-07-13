import QtQuick
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Controls.Material


import ".."
import "../Base"
import "../States"

AppPage
{
    Material.theme: Settings.currentTheme
    Material.accent: Settings.currentAccent

    pageHeight: parent.height

    FileDialog {
        id: fileDialog
        nameFilters: ["Text files (*.txt)"]
        fileMode: FileDialog.OpenFile
        onAccepted: {
            let file = selectedFile.toString()
            if ( Qt.platform.os === "windows" ) file = file.split( "file:///" )[ 1 ]
            else file = file.split( "file://" )[ 1 ]
            console.log( file )
        }
    }

    ColumnLayout
    {
        anchors.fill: parent
        anchors.margins: {
            left: Settings.defaultmargin
            right: Settings.defaultmargin
        }

        TextField {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop

            text: "15"
            placeholderText: "Максимальное кол-во слов"
        }

        Button {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignBottom

            flat: true
            highlighted: true
            text: "Открыть файл"

            onClicked: fileDialog.open()
        }


    }

    onAfterInit: {
    }
}
