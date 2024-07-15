import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import ".."
import "../States"

Item {
    id: base

    property var options: []
    property string title: ""
    property int min: 0
    property int max: 100
    property int value: 0
    property int contentHeight: body.implicitHeight

    state: "closed"
    height: body.implicitHeight

    states: [
        State {
            name: "closed"
            PropertyChanges {
                target: base
                opacity: 0
                visible: false
            }
        },
        State {
            name: "opened"
            PropertyChanges {
                target: base
                opacity: 1
                visible: true
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            properties: "opacity"
            easing.type: Easing.InOutQuart
            duration: 200
        }
    }

    ColumnLayout {
        id: body
        anchors.fill: parent

        RowLayout {
            Text {
                text: title
                wrapMode: Text.WrapAnywhere
                font.pointSize: Settings.h3
                color: Settings.defaultTextColor
            }

            ListView {
                id: optionsList
                orientation: ListView.Horizontal
                layoutDirection: Qt.RightToLeft
                Layout.fillWidth: true
                height: 24
                spacing: Settings.minimalMargin

                interactive: false
                model: base.options

                delegate: Button {
                    property string currentIcon: [ IMAGES, modelData[ "icon" ]].join("/")
                    icon.source: currentIcon
                    icon.color: Material.primaryTextColor
                    icon.width: 24
                    icon.height: 24
                    flat: true
                    width: 24
                    height: 24
                    padding: 0
                    topInset: 0
                    bottomInset: 0
                    verticalPadding: 0
                    leftPadding: 0
                    rightPadding: 0
                    onClicked: {
                        icon.color = Material.accentColor

                        if ( modelData[ "nextIcon" ] !== "" ) {
                            if ( currentIcon === [ IMAGES, modelData[ "icon" ]].join("/") ) {
                                icon.source = [ IMAGES, modelData[ "nextIcon" ]].join("/")
                                currentIcon = [ IMAGES, modelData[ "nextIcon" ]].join("/")
                            }
                            else {
                                icon.source = [ IMAGES, modelData[ "icon" ]].join("/")
                                currentIcon = [ IMAGES, modelData[ "icon" ]].join("/")
                            }
                        }

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

        ProgressBar {
            Layout.fillWidth: true
            from: min
            to: max
            value: base.value
        }

    }

    function show() {
        state = "opened"
    }

    function hide() {
        state = "closed"

        let buff = base.options
        base.options = []
        base.options = buff
    }

    function addOption( icon, nextIcon = "", action, useEffect = false ) {
        let newObject = options ?? []
        newObject.push({ "icon": icon, "action": action, "nextIcon": nextIcon, "useEffect": useEffect })

        options = []
        options = newObject
    }

}
