import QtQuick
import QtCharts
import QtQuick.Layouts
import QtQuick.Controls.Material

import TextOccurrences

import "../"
import "../Base"
import "../States"
import "../Components"

AppPage {
    id: page

    property list<string> defaultWords: [ "Клякса", "Лев", "цвет", "шляпа" ]
    property list<int> defaultValues: [ 2, 3, 4, 5 ]

    property var words: defaultWords
    property var values: defaultValues

    Material.theme: Settings.currentTheme
    Material.accent: Settings.currentAccent
    pageHeight: body.implicitHeight
    height: parent.height

    Dialog {
        id: messageDialog
        property string description: ""

        anchors.centerIn: parent
        width: parent.width / 1.5

        title: ""
        visible: false

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            Text {
                text: messageDialog.description
                wrapMode: Text.WrapAnywhere
                font.pointSize: Settings.h2
                color: Settings.defaultTextColor
            }
        }

        modal: true
        standardButtons: Dialog.Ok
    }

    ColumnLayout {
        id: body
        width: parent.width
        height: parent.height

        anchors.margins: {
            left: Settings.minimalMargin
            right: Settings.minimalMargin
        }

        StatusBar {
            id: statusBar

            title: "Загрузка данных"
            value: parser.wordsParsed
            min: 0
            max: parser.wordsSummary

            property bool isPaused: false

            width: parent.width
            Layout.preferredHeight: statusBar.contentHeight
            Layout.fillWidth: true
            Layout.margins: {
                left: Settings.defaultmargin
                right: Settings.defaultmargin
            }

            Component.onCompleted: {
                addOption( "stop.svg", "", stop )
                addOption( "pause.svg", "play", pause )
            }

            function stop() {
                words = defaultWords
                values = defaultValues
                xAxis.min = 0
                xAxis.max = 5
                hide()
            }

            function pause() {
                if ( isPaused ) {
                    isPaused = false
                    console.log( "play" )
                }
                else {
                    isPaused = true
                    console.log( "pause" )
                }
            }
        }

        ChartView {
            id: chart

            Layout.fillWidth: true
            height: words.length * 80
            implicitHeight: words.length * 80

            title: "Вхождения слов"
            antialiasing: true

            titleColor: "white"
            backgroundColor: Material.dialogColor

            HorizontalBarSeries {
                id: mySeries
                axisY: BarCategoryAxis {
                    labelsColor: "white"
                    categories: page.words
                    gridLineColor: "transparent"
                }
                axisX: ValueAxis {
                    id: xAxis
                    tickCount: 5
                    gridVisible: false
                    labelsColor: "white"
                    labelFormat: "%i"
                    min: 0
                    max: 5
                }
                BarSet {
                    id: barset
                    label: "Количество"
                    labelColor: "white"
                    borderColor: "transparent"
                    color: Material.color(Material.Green, Material.Shade200)
                    values: page.values
                }
            }
        }

        Button {
            Layout.fillWidth: true
            Layout.margins: {
                left: Settings.minimalMargin
                right: Settings.minimalMargin
            }

            flat: true
            highlighted: true
            text: "Старт"
            enabled: statusBar.state === "closed"
            onClicked: {
                if ( Settings.selectedFile === "" ) {
                    messageDialog.title = "Ошибка"
                    messageDialog.description = "Файл не выбран"
                    messageDialog.visible = true
                    return
                }
                parser.start()
            }
        }
    }

    onAfterInit: {
        AppHeader.show()
        AppHeader.color = "transparent"
        AppHeader.title = ""
        AppHeader.addOption( "tune.svg", () => BottomSheet.open() )
        BottomSheet.loadPage( "Pages/Options.qml" )
    }

    Connections {
        target: parser

        function onBusyChanged( state ) {
            if ( state ) statusBar.show();
            else statusBar.hide();
        }

        function onValuesChanged( newValues ) {
            let maxX = 0
            newValues.map( ( num ) => {
                // if ( value < minX ) minX = value
                if ( num > maxX ) maxX = num
            } )
            xAxis.min = 0
            xAxis.max = maxX
            values = newValues
        }

        function onLabelsChanged( newLabels ) {
            words = newLabels
        }
    }

    TextOccurences {
        id: parser
        wordsCount: Settings.wordsCount
        file: Settings.selectedFile
    }
}
