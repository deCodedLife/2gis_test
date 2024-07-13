import QtQuick
import QtCharts
import QtQuick.Layouts
import QtQuick.Controls.Material


import "../"
import "../Base"
import "../States"

AppPage {

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: {
            left: Settings.minimalMargin
            right: Settings.minimalMargin
        }

        ChartView {
            Layout.fillWidth: true
            height: 400

            title: "Вхождения слов"
            legend.alignment: Qt.AlignBottom
            antialiasing: true

            // BarSeries {
            //     id: mySeries
            //     axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
            //     BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
            //     BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
            //     BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
            // }
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
