import QtQuick
import QtQuick.Controls.Material

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Calling C++ from QML")

    Column {
        width: root.width
        spacing: 10
        anchors.left: parent.left
        Row {
            Text {
                id: txt
                width: 150
                height: 50
                text: "Regular Method"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }
            Button {
                text: "Call c++ method"
                onClicked: () => {
                    BWorker.regularMethod()
                    txt.text = "This is C++ talking, regularMethod called. !!"
                }
            }
        }

        Row {
            Text {
                id: txt2
                width: 150
                height: 50
                text: "Regular Method"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }
            Button {
                text: "Call c++ method"
                onClicked: () => {
                    txt2.text = BWorker.regularMethodWithParameter("Jean", 84)
                }
            }
        }

        Text {
            id: returnTextId
            width: parent.width
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: qsTr("Return")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font {
                bold: true
                italic: true
                capitalization: Font.AllUppercase
                pointSize: 30
                weight: Font.ExtraBold
            }
        }

        Row {
            spacing: 10
            anchors.right: parent.right

            Text {
                text: "regularMethodWithReturn("
            }
            TextField {
                id: nameFieldId
                placeholderText: qsTr("Name")
                text: qsTr("John")
            }
            Text {
                text: qsTr(",")
            }
            TextField {
                id: ageTextFieldId
                placeholderText: qsTr("Age")
                inputMethodHints: Qt.ImhDigitsOnly
                text: qsTr("25")
            }
            Text {
                text: qsTr(")")
            }
            Button {
                text: qsTr("Call C++ method")
                onClicked: {
                    if (nameFieldId.text !== null && ageTextFieldId.text !== null) {
                        var response = BWorker.regularMethodWithParameter(nameFieldId.text, parseInt(ageTextFieldId.text))
                        returnTextId.text = response
                    } else {
                        console.log("One of the two required field are empty !")
                    }
                }
            }
        }
    }
    Other {}

}
