/*
 * Copyright 2014 Marco Martin <mart@kde.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2,
 * or (at your option) any later version, as published by the Free
 * Software Foundation
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "#000000"

    property int stage: 0 // Initialize stage to 0
    // Set a minimum display duration for the splash screen
    property int minimumDisplayTime: 4000 // 4 seconds (adjust as needed)

    onStageChanged: {
        // Stage 1 usually means the splash screen is starting to animate in.
        if (stage === 1) {
            introAnimation.running = true;
            // Start the timer when the intro animation begins
            splashExitTimer.start();
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0 // Start hidden, then fade in with introAnimation
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Rectangle {
            id: imageSource
            color: "transparent"
            anchors.fill: parent
            clip: true;

            AnimatedImage {
                id: face
                source: "images/plasma_d.gif"
                paused: false
                anchors.fill: parent
                smooth: false
                visible: true
            }
        }

        // NEW: Plasma logo in the top-right corner
        Image {
            id: topRightPlasmaLogo
            source: "images/plasma.svgz" // Make sure this path is correct
            sourceSize.height: units.gridUnit * 12 // Adjust size as needed
            sourceSize.width: units.gridUnit * 12 // Adjust size as needed
            anchors {
                top: parent.top
                right: parent.right
                margins: units.gridUnit // Use the grid unit for consistent spacing
            }
            opacity: 0.5 // Match the opacity of the bottom text/logo
        }

        AnimatedImage {
            id: busyIndicator
            // In the middle of the remaining space
            y: parent.height - 135
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: units.gridUnit
            source: "images/busywidget.gif"
            sourceSize.height: units.gridUnit * 4
            sourceSize.width: units.gridUnit * 4
            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 0 // Set to 360 to have Gamecube busywidget Spin a full circle
                duration: 2000 // Faster rotation for busy indicator
                loops: Animation.Infinite
            }
        }
        Row {
            id: bottomTextAndLogo
            opacity: 0.5 // Start with some transparency
            spacing: units.smallSpacing * 2
            anchors {
                bottom: parent.bottom
                left: parent.left // Align to the left
                margins: units.gridUnit
            }
            Text {
                color: "#eff0f1"
                // Work around Qt bug where NativeRendering breaks for non-integer scale factors
                // https://bugreports.qt.io/browse/QTBUG-67007
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

    // This animator fades in the entire content
    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000 // Fade in quickly (1 second)
        easing.type: Easing.InOutQuad
    }

    // This animator fades out the entire content when it's time to exit
    OpacityAnimator {
        id: exitAnimation
        running: false
        target: content
        from: 1
        to: 0
        duration: 800 // Fade out over 0.8 seconds
        easing.type: Easing.OutQuad
    }
}
