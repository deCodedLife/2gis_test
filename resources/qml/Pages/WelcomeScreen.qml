import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material


import "../"
import "../Base"
import "../States"

AppPage {

    property string readme:
        "Данное приложение создано для нахождения вхождения слов в тексте. " +
        "Чтобы использовать программу необходимо выбрать любой текстовый файл " +
        "с расширением .txt Вы можете воспользоваться генератором текста " +
        "fish-text.ru"

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

            text: readme
            wrapMode: Text.WrapAnywhere
            font.pointSize: Settings.h3
            color: Settings.defaultTextColor
        }

        Text {
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter

            text: "Чтобы продолжить нажмите на экран"
            wrapMode: Text.WrapAnywhere
            font.pointSize: Settings.h4
            color: Settings.defaultTextColor
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: { AppLoader.openEffect( () => AppLoader.loadPage( "Pages/HomePage.qml" ) ) }
    }

    onAfterInit: {
        AppHeader.hide()
        BottomSheet.hide()
    }
}
