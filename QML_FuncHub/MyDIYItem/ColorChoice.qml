import QtQuick 2.15
import QtQuick.Dialogs 1.0

ColorDialog {
    id: colorDialog
    title: "Please choose a color"
    onAccepted: {
        console.log("You chose: " + colorDialog.color)
    }
    onRejected: {
        console.log("Canceled")
    }
}
