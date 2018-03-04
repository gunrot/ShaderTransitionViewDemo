import QtQuick 2.5
import QtQuick.Window 2.2

import ShaderTransitionView 1.0

Window {
    visible: true

    width: 1000
    height: 600

    Image {
        id: background
        anchors.fill: parent
        source: "qrc:/qml/background1.jpg"
    }


    Rectangle {
        id: wrapperContent

        color: "transparent"
        border.color: "lightgrey"

        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: wrapperRightPanel.left
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        STView {
            id: stView
            anchors.fill: parent
            duration: 2000
        }
    }


    Rectangle {
        id: wrapperRightPanel
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        width: 220
        color: "transparent"

        ListView {
            id: listView
            clip: true
            anchors.fill: parent
            model: GlTransitions.getEffects()
            spacing: 5
            focus: true
            delegate: Rectangle {
                id: delegateWrapper
                width: parent.width*0.94
                height: 60
                color: "transparent"
                border.color: delegateWrapper.ListView.isCurrentItem ? "white" : "lightgrey"
                border.width: delegateWrapper.ListView.isCurrentItem ? 2 : 1
                Text {
                    color: delegateWrapper.ListView.isCurrentItem ? "white" : "lightgrey"
                    anchors.centerIn: parent
                    text: modelData
                    font.bold: delegateWrapper.ListView.isCurrentItem ? true : false
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listView.currentIndex = index;
                        stView.transition = modelData;

                    }
                }
            }
        }
        ScrollBar {
            flickable: listView
        }
    }

    Component.onCompleted: {
        stView.push("qrc:/qml/PageExample1.qml")
    }
}


