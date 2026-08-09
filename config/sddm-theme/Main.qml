import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Rectangle {
    id: root

    width: Screen.width
    height: Screen.height
    color: "transparent"

    // Background

    Image {
        id: bg
        anchors.fill: parent
        source: "wallpaper.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.35
    }

    // Clock

    Rectangle {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: root.height * 0.09

        color: "transparent"

        Text {
            id: time

            anchors.horizontalCenter: parent.horizontalCenter

            property string currentTime: ""

            color: "#f9e9ec"

            font {
                family: "Inter"
                pixelSize: 120
                weight: Font.Bold
            }

            text: currentTime

            function updateTime() {
                currentTime = Qt.formatTime(new Date(), "HH:mm")
            }

            Component.onCompleted: updateTime()

            Timer {
                interval: 1000
                running: true
                repeat: true

                onTriggered: time.updateTime()
            }
        }
    }

    // Login

    TextField {
        id: passwordField

        width: 190
        height: 36

        anchors.centerIn: parent

        leftPadding: 15
        rightPadding: 15

        placeholderText: "Password"
        placeholderTextColor: "#1F2421"

        echoMode: TextInput.Password

        font.family: "Inter"
        font.pixelSize: 12

        focus: true

        onAccepted: loginButton.clicked()

        background: Rectangle {
            radius: 15
            color: "#f9e9ec"
        }
    }

    Button {
        id: loginButton

        width: 30
        height: 30

        anchors.right: passwordField.right
        anchors.rightMargin: 3
        anchors.verticalCenter: passwordField.verticalCenter

        text: ""

        onClicked: {
            sddm.login(
                "shara",
                passwordField.text,
        	0
            )
        }

        background: Rectangle {
            radius: 15
            color: "#9CC5A1"
        }

        contentItem: Text {
            text: loginButton.text
            color: "#11111b"

            font.family: fontFamily
            font.pixelSize: baseFontSize
            font.bold: true

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Text {
        id: errorText

        anchors.top: passwordField.bottom
        anchors.horizontalCenter: passwordField.horizontalCenter
        anchors.topMargin: 10

        color: "#f7768e"

        font.family: fontFamily
        font.pixelSize: baseFontSize * 0.85

        wrapMode: Text.WordWrap

        text: ""
    }

    Connections {
        target: sddm

        function onLoginFailed() {
            errorText.text = "Login failed"
            passwordField.text = ""
            passwordField.forceActiveFocus()
        }
    }
    Component.onCompleted: {
        passwordField.forceActiveFocus()
    }
}
