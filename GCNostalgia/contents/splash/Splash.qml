/*
 * Optimized for fast load: GameCube-style KDE splash
 * Copyright 2025 Valkyries taking Flight/Valkyrie System <valkyrie-sys@proton.me>
 * License: GNU GPL v2 or later
 */

import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "#000000"
    property int stage: 0

    Component.onCompleted: introAnimation.running = true

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        visible: true

        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: gridUnit
            property int smallSpacing: Math.max(2, gridUnit / 4)
        }

        AnimatedImage {
            id: face
            source: "images/plasma_d.gif"
            paused: false
            anchors.fill: parent
            smooth: false
            cache: true
            asynchronous: false
            visible: true
        }

        Image {
            id: topRightPlasmaLogo
            source: "images/plasma.svgz"
            sourceSize.height: units.gridUnit * 10
            sourceSize.width: units.gridUnit * 10
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: units.gridUnit
            opacity: 0.5
            visible: true
        }

        AnimatedImage {
            id: busyIndicator
            source: "images/busywidget.gif"
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height - 135
            sourceSize.height: units.gridUnit * 6
            sourceSize.width: units.gridUnit * 6
            cache: true
            asynchronous: false
            visible: true

            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 0
                duration: 2000
                loops: Animation.Infinite
            }
        }

        Row {
            id: bottomTextAndLogo
            opacity: 0.5
            spacing: units.smallSpacing * 2
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: units.gridUnit
            visible: true

            Text {
                color: "#eff0f1"
                renderType: Screen.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering
                text: "Can You Feel The Nostalgia?"
                font.pointSize: 24
                font.bold: true
            }

            Image {
                source: "images/kde.svgz"
                sourceSize.height: units.gridUnit * 10
                sourceSize.width: units.gridUnit * 10
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 500 // much faster fade-in
        easing.type: Easing.OutCubic
    }
}
