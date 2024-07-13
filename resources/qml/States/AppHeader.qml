pragma Singleton

import QtQuick
import QtQuick.Controls.Material

QtObject {
    property string title: ""
    property string subtitle: ""
    property bool isVisible: true
    property color color: Material.accentColor

    /** {
      *   "icon": "",
      *   "useEffect": true,
      *   "action" () => {}
      * }
    */
    property var options: []

    function hide() {
        isVisible = false
    }

    function show() {
        isVisible = true
    }

    function addOption( icon, action, useEffect = false ) {
        let newObject = options ?? []
        newObject.push({ "icon": icon, "action": action, "useEffect": useEffect })

        options = []
        options = newObject
    }
}
