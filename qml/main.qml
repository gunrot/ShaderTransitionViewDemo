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
        ListElement { effect: "Dreamy" }
        ListElement { effect: "Squareswire" }
        ListElement { effect: "ColourDistance" }
        ListElement { effect: "WipeLeft" }
        ListElement { effect: "WipeRight" }
        ListElement { effect: "Swap" }
        ListElement { effect: "Angular" }
        ListElement { effect: "Swirl" }
        ListElement { effect: "Burn" }
        ListElement { effect: "UndulatingBurnOut" }
        ListElement { effect: "ButterflyWaveScrawler" }
        ListElement { effect: "Hexagonalize" }
        ListElement { effect: "Directionalwarp" }
        ListElement { effect: "Radial" }
        ListElement { effect: "Luminance_melt" }
        ListElement { effect: "Rotate_scale_fade" }
        ListElement { effect: "Kaleidoscope" }
        ListElement { effect: "DirectionalWipe" }
        ListElement { effect: "ZoomInCircles" }
        ListElement { effect: "Flyeye" }
        ListElement { effect: "CircleCrop" }
        ListElement { effect: "GridFlip" }
        ListElement { effect: "PinWheel" }
        ListElement { effect: "WipeUp" }
        ListElement { effect: "CrazyParametricFun" }
        ListElement { effect: "Multiply_blend" }
        ListElement { effect: "DreamyZoom" }
        ListElement { effect: "Polar_function" }
        ListElement { effect: "Windowblinds" }
        ListElement { effect: "CrossZoom" }
        ListElement { effect: "Bounce" }
        ListElement { effect: "Pixelize" }
        ListElement { effect: "Fade" }
        ListElement { effect: "Ripple" }
        ListElement { effect: "Cube" }
        ListElement { effect: "Morph" }
        ListElement { effect: "Crosswarp" }
        ListElement { effect: "VerticalSlide" }
        ListElement { effect: "Circle" }
        ListElement { effect: "DoomScreenTransition" }
        ListElement { effect: "Luma" }
        ListElement { effect: "Heart" }
        ListElement { effect: "Cannabisleaf" }
        ListElement { effect: "Mosaic" }
        ListElement { effect: "Perlin" }
        ListElement { effect: "Wind" }
        ListElement { effect: "Squeeze" }
        ListElement { effect: "CircleOpen" }
        ListElement { effect: "Doorway" }
        ListElement { effect: "Fadegrayscale" }
        ListElement { effect: "FadeColor" }
        ListElement { effect: "RandomSquares" }
        ListElement { effect: "CrossHatch" }
        ListElement { effect: "Colorphase" }
        ListElement { effect: "HorizontalSlide" }
        ListElement { effect: "WipeDown" }
        ListElement { effect: "GlitchDisplace" }

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
            duration: 900
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


