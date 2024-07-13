import QtQuick
import QtCharts
import QtQuick.Layouts
import QtQuick.Controls.Material


import "../"
import "../Base"
import "../States"

AppPage {

    property list<string> words: [ "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015" ]

    Material.theme: Settings.currentTheme
    Material.accent: Settings.currentAccent
    pageHeight: page.implicitHeight

    ColumnLayout {
        id: page
        anchors.fill: parent
        anchors.margins: {
            left: Settings.minimalMargin
            right: Settings.minimalMargin
        }

        ChartView {
            Layout.fillWidth: true
            height: words.length * 50

            title: "Вхождения слов"
            legend.alignment: Qt.AlignBottom
            antialiasing: true

            HorizontalBarSeries {

                id: mySeries
                axisY: BarCategoryAxis { categories: words }
                BarSet { label: "Количество"; values: [ 2, 3, 4, 5, 6, 2, 3, 4, 5, 6, 2, 3, 4, 5, 6 ] }
            }
        }

        Button {
            Layout.fillWidth: true
            flat: true
            highlighted: true
            text: "Старт"
        }
    }

    onAfterInit: {
        AppHeader.show()
        AppHeader.color = "transparent"
        AppHeader.title = ""
        AppHeader.addOption( "tune.svg", () => BottomSheet.open() )
        BottomSheet.loadPage( "Pages/Options.qml" )
    }
}
