import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import ".."
import "../States"

Item {
    id: body
    clip: true

    Layout.leftMargin:   Settings.is_mobile ? 0 : Settings.minimalMargin
    Layout.rightMargin:  Settings.is_mobile ? 0 : Settings.minimalMargin
    Layout.bottomMargin: Settings.is_mobile ? 0 : Settings.defaultmargin

    property int maxWidth: 640
    visible: BottomSheet.isVisible

    Connections{
        target: BottomSheet

        function onSheetOpened() {
            background.state = "opened"
            draggablePage.state = "opened"
        }
    }

    MouseArea {
        anchors.fill: parent
        enabled: background.state === "opened"
        propagateComposedEvents: true
        onClicked: {
            background.state = "closed"
            draggablePage.state = "closed"
        }
    }

    ColumnLayout {
        width: body.width
        height: body.height

        Rectangle {
            id: background
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"

            state: "closed"
            states: [
                State {
                    name: "closed"
                    PropertyChanges {
                        target: background
                        color: "transparent"
                    }
                },
                State {
                    name: "opened"
                    PropertyChanges {
                        target: background
                        color: Qt.rgba(0, 0, 0, .4)
                    }
                }
            ]

            transitions: [
                Transition {
                    ColorAnimation {
                        properties: "color"
                        duration: 200
                        easing.type: Easing.InOutQuart
                    }
                }
            ]


            Rectangle {
                id: draggablePage

                width: body.width > maxWidth ? maxWidth : body.width
                height: 400
                clip: true

                y: body.height - dragHandlerArea.height
                x: body.width / 2 - width / 2

                Drag.active: true

                transitions: Transition {
                    PropertyAnimation { properties: "y"; easing.type: Easing.InOutQuad; duration: 200 }
                    PropertyAnimation { properties: "radius"; easing.type: Easing.InOutQuad; duration: 200 }
                }

                state: "closed"
                states: [
                    State {
                        name: "closed"
                        PropertyChanges {
                            target: draggablePage
                            radius: 10
                            y: body.height - dragHandlerArea.height
                        }
                    },
                    State {
                        name: "opened"
                        PropertyChanges {
                            target: draggablePage
                            radius: 20
                            y: body.height - 390
                        }
                    }
                ]

                radius: 20
                color: Material.backgroundColor

                ColumnLayout {
                    width: parent.width
                    height: parent.height

                    Item {
                        id: dragHandlerArea
                        Layout.fillWidth: true
                        height: dragHandler.height + Settings.defaultmargin * 2
                        Drag.active: true
                        Drag.hotSpot.y: 20

                        Rectangle {
                            id: dragHandler
                            anchors.margins: {
                                top: Settings.defaultmargin
                                bottom: Settings.defaultmargin
                            }
                            anchors.centerIn: parent
                            width: 32
                            height: 4
                            color: Material.primaryTextColor
                            radius: 2
                        }

                        MouseArea {
                           id: dragArea

                           property int dY: 0

                           anchors.fill: parent
                           cursorShape: Qt.UpArrowCursor

                           drag.target: draggablePage
                           drag.axis: Drag.YAxis
                           drag.maximumY: body.height - dragHandlerArea.height
                           drag.minimumY: body.height - 390

                           onPressed: dY = draggablePage.y
                           onReleased: {
                               if ( draggablePage.y > dY ) {
                                   background.state = "closed"
                                   draggablePage.state = "closed"
                               }
                               if ( draggablePage.y < dY ) {
                                   background.state = "opened"
                                   draggablePage.state = "opened"
                               }
                           }
                       }
                    }



                    Flickable {
                        id: flickable

                        contentWidth: draggablePage.width
                        contentHeight: BottomSheet.pageHeight
                        interactive: false

                        Layout.fillWidth: true
                        height: 340 //body.height

                        Connections {
                            target: BottomSheet
                            function onReloadFlickable() { flickable.contentY = BottomSheet.pageHeight }
                        }

                        Loader {
                            id: loader

                            property bool isBottomSheet: true

                            width: draggablePage.width
                            height: 340
                            source: [ QML, BottomSheet.currentPage ].join("/")
                            onSourceChanged: flickable.contentY = 0
                        }
                    }
                }
            }
        }
    }
}
