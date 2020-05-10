import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3

Item {
    id: item
    property int processNum: 0
    property int segmentNum: 0
    property string fitting: "First Fit"
    function isInt(n){
        return Number(n) === n && n % 1 === 0 && Number(n) !== 0;
    }
    ListModel {
        id: segmentslist
    }
    GridLayout {
        id: basicsconfigration
        columns: 2
        rows: 3
        columnSpacing: 15
        rowSpacing: 10
        anchors.top: parent.top
        anchors.left: parent.left
        Text {
            id: segmenttext
            text: "Segments Number:"
            font.bold: true
            font.family: "Comic Sans MS"
            Layout.row: 1
            Layout.column: 0
            color: "orange"
            visible: false
        }
        CustomizingSpinBox {
            id: segmentnumber
            from: 1
            Layout.column: 1
            Layout.row: 1
            visible: false
        }
        CustomizingButton {
            id: addprocess
            text: "+ Add Process"
            Layout.column: 0
            Layout.row: 0
            onClicked: {
                segmentnumber.visible = true
                segmenttext.visible = true
                sumbitsegmentNumber.visible = true
            }
        }
        CustomizingButton {
            id: sumbitsegmentNumber
            text: "Submit"
            Layout.column: 0
            Layout.row: 2
            visible: false
            onClicked: {
                processNum++
                segmentNum = segmentnumber.value
                for(var i = 0 ; i < segmentNum ; i++)
                {
                    segmentslist.append({"name":"Segment "+(i+1)})
                }
                segmentsconfigration.visible = true
            }
        }
    }
    GridLayout {
        id: segmentsconfigration
        columns: 3
        rows: 5
        columnSpacing: 15
        rowSpacing: 10
        anchors.top: basicsconfigration.bottom
        anchors.left: basicsconfigration.left
        anchors.topMargin: 15
        visible: false
        Text {
            text: "Segment No. :"
            font.bold: true
            font.family: "Comic Sans MS"
            Layout.row: 0
            Layout.column: 0
            color: "orange"
        }
        Text {
            text: "Segment Name:"
            font.bold: true
            font.family: "Comic Sans MS"
            Layout.row: 1
            Layout.column: 0
            color: "orange"
        }
        Text {
            text: "Segment Base:"
            font.bold: true
            font.family: "Comic Sans MS"
            Layout.row: 2
            Layout.column: 0
            color: "orange"
        }
        Text {
            text: "Segment Size:"
            font.bold: true
            font.family: "Comic Sans MS"
            Layout.row: 3
            Layout.column: 0
            color: "orange"
        }
        Text {
            id: wrongsegbase
            text: "Please enter a +ve int segment base"
            font.family: "Comic Sans MS"
            Layout.row: 1
            Layout.column: 2
            color: "orange"
            visible: false
        }
        Text {
            id: wrongsegsize
            text: "Please enter a +ve int segment size"
            font.family: "Comic Sans MS"
            Layout.row: 2
            Layout.column: 2
            color: "orange"
            visible: false
        }
        CustomizingComboBox {
            id: segmentnum
            model: segmentslist
            Layout.column: 1
            Layout.row: 0
            focus: true
        }
        CustomizingTextField {
            id: segmentname
            placeholderText: "Enter Seg Name"
            Layout.column: 1
            Layout.row: 1
        }
        CustomizingTextField {
            id: segmentbase
            placeholderText: "Enter Seg Base"
            Layout.column: 1
            Layout.row: 2
        }
        CustomizingTextField {
            id: segmentsize
            placeholderText: "Enter Seg Size"
            Layout.column: 1
            Layout.row: 3
        }
        CustomizingButton {
            id: submitsegment
            text: "Submit Segment"
            Layout.column: 0
            Layout.row: 4
            onClicked: {
            }
        }
    }
}
