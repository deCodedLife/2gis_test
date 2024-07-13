pragma Singleton

import QtQuick
import QtQuick.Controls.Material

QtObject
{
    signal reloadFlickable
    signal sheetOpened

    property int pageHeight: 0
    property bool isVisible: false
    property string currentPage: ""


    function loadPage( page ) {
        pageHeight = 0
        currentPage = page
        isVisible = true
    }

    function open() {
        sheetOpened()
    }


    function hide() {
        isVisible = false
    }

    function show() {
        isVisible = true
    }
}
