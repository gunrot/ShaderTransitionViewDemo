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

    ListModel {
        id: modelShaders
        ListElement { effect: "CrazyParametricFun" }
        ListElement { effect: "Mosaic" }
        ListElement { effect: "Bounce" }
        ListElement { effect: "ColourDistance" }
        ListElement { effect: "Wind" }
        ListElement { effect: "VerticalWind" }
        ListElement { effect: "PinWheel" }
        ListElement { effect: "CircleOpen" }
        ListElement { effect: "DirectionalWipe" }
        ListElement { effect: "RadialWipe" }
        ListElement { effect: "Pixelize" }
        ListElement { effect: "Flip" }
        ListElement { effect: "Fold" }
        ListElement { effect: "Doorway" }
        ListElement { effect: "FadeColor" }
        ListElement { effect: "Morph" }
        ListElement { effect: "PolkaDots" }
        ListElement { effect: "Squeeze" }
        ListElement { effect: "HorizontalSlide" }
        ListElement { effect: "VerticalSlide" }
        ListElement { effect: "CrossZoom" }
        ListElement { effect: "Swirl" }
        ListElement { effect: "LinearBlur" }
        ListElement { effect: "Swap" }
        ListElement { effect: "CrossHatch" }
        ListElement { effect: "BurnOut" }
        ListElement { effect: "Cube" }
        ListElement { effect: "PageCurl" }
        ListElement { effect: "GlitchDisplace" }
        ListElement { effect: "DoomScreen" }
        ListElement { effect: "Kaleidoscope" }
        ListElement { effect: "DefocusBlur" }
        ListElement { effect: "Flyeye" }
        ListElement { effect: "RandomSquares" }
        ListElement { effect: "Reveal" }
        ListElement { effect: "CircleCrop" }
        ListElement { effect: "StereoViewer" }
        ListElement { effect: "PuzzleRight" }
        ListElement { effect: "WarpFade" }
        ListElement { effect: "AtmosphericSlideshow" }

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
            duration: 1500
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
            model: modelShaders
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
                    text: effect
                    font.bold: delegateWrapper.ListView.isCurrentItem ? true : false
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listView.currentIndex = index;
                        stView.transition = effect;

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


