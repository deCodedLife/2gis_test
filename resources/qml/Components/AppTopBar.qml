import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import "."
import ".."
import "../Base"
import "../States"

Rectangle {
    width: parent.width
    height: 64
    color: AppHeader.color
    enabled: AppHeader.isVisible
    visible: AppHeader.isVisible
    z: 10

    Item {
        id: header
        anchors.fill: parent
        anchors.leftMargin: Settings.defaultmargin + Settings.minimalMargin
        anchors.rightMargin: Settings.defaultmargin + Settings.minimalMargin

        RowLayout{
            anchors.fill: parent

            anchors.topMargin: Settings.defaultmargin
            anchors.bottomMargin: Settings.defaultmargin
            Layout.alignment: Qt.AlignVCenter


            RowLayout {
                spacing: Settings.defaultmargin
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignVCenter
                clip: true

                Button {
                    Layout.preferredWidth: 32
                    Layout.preferredHeight: 32

                    id: actionButton
                    icon.source: [ IMAGES, "back.svg" ].join("/")
                    icon.color: Material.primaryTextColor
                    icon.width: 24
                    icon.height: 24
                    flat: true
                    padding: 0
                    topInset: 0
                    bottomInset: 0
                    verticalPadding: 0
                    leftPadding: 0
                    rightPadding: 0

                    onClicked: AppLoader.goBack()

                    width: 32
                    height: 32

                    Layout.alignment: Qt.AlignVCenter
                }

                ColumnLayout{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 0
                    clip: true
                    enabled: AppHeader.title.length != 0 || AppHeader.subtitle.length != 0

                    Text {
                        id: title
                        text: AppHeader.title
                        color: Material.primaryTextColor
                        font.pointSize: AppHeader.subtitle == "" ? Settings.h4 : Settings.h6
                    }

                    Text {
                        id: subtitle
                        visible: AppHeader.subtitle != ""
                        text: AppHeader.subtitle
                        color: Material.primaryTextColor
                        opacity: 0.7
                        font.pointSize: Settings.h7
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true
                Layout.alignment: Qt.AlignLeft
                enabled: AppHeader.options.length != 0

                ListView {
                    id: optionsList
                    orientation: ListView.Horizontal
                    layoutDirection: Qt.RightToLeft
                    Layout.fillWidth: true
                    height: 32
                    spacing: Settings.minimalMargin

                    interactive: false
                    model: AppHeader.options

                    delegate: Button {
                        icon.source: [ IMAGES, modelData[ "icon" ]].join("/")
                        icon.color: Material.primaryTextColor
                        icon.width: 32
                        icon.height: 32
                        flat: true
                        width: 32
                        height: 32
                        padding: 0
                        topInset: 0
                        bottomInset: 0
                        verticalPadding: 0
                        leftPadding: 0
                        rightPadding: 0
                        onClicked: {
                            icon.color = Material.accentColor
                            AppLoader.pageHeight = 0
                            AppLoader.reloadFlickable()
                            if ( modelData[ "useEffect" ] ) AppLoader.openEffect( modelData[ "action" ] )
                            else modelData[ "action" ]()
                            defaultColor.start()
                        }

                        ColorAnimation on icon.color {
                            Material.theme: Settings.currentTheme
                            id: defaultColor
                            to: Material.primaryTextColor
                            running: false
                            duration: 300
                            easing.type: Easing.InOutQuart
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: actionButton.enabled = AppLoader.pagesDom.length > 1
}
