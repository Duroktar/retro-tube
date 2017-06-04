/*******************************************************************************
* Copyright (c) 2013 "Filippo Scognamiglio"
* https://github.com/Swordfish90/cool-retro-term
*
* This file is part of cool-retro-term.
*
* cool-retro-term is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*******************************************************************************/

import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.0
import QtAV 1.6

ApplicationWindow{
    id: terminalWindow

    width: 1024
    height: 768

    // Save window properties automatically
    onXChanged: appSettings.x = x
    onYChanged: appSettings.y = y
    onWidthChanged: appSettings.width = width
    onHeightChanged: appSettings.height = height

    // Load saved window geometry and show the window
    Component.onCompleted: {        
        appSettings.handleFontChanged();

        x = appSettings.x
        y = appSettings.y
        width = appSettings.width
        height = appSettings.height

        visible = true
    }

    minimumWidth: 320
    minimumHeight: 240

    visible: false

    property bool fullscreen: appSettings.fullscreen
    onFullscreenChanged: visibility = (fullscreen ? Window.FullScreen : Window.Windowed)

    //Workaround: Without __contentItem a ugly thin border is visible.
    menuBar: CRTMainMenuBar{
        id: mainMenu
        visible: (Qt.platform.os === "osx" || appSettings.showMenubar)
        __contentItem.visible: mainMenu.visible
    }

    color: "#00000000"
    title: terminalContainer.title || qsTr("cool-retro-term")

    Action {
        id: showMenubarAction
        text: qsTr("Show Menubar")
        enabled: Qt.platform.os !== "osx"
        shortcut: "Ctrl+Shift+M"
        checkable: true
        checked: appSettings.showMenubar
        onTriggered: appSettings.showMenubar = !appSettings.showMenubar
    }
    Action {
        id: fullscreenAction
        text: qsTr("Fullscreen")
        enabled: Qt.platform.os !== "osx"
        shortcut: "Alt+F11"
        onTriggered: appSettings.fullscreen = !appSettings.fullscreen;
        checkable: true
        checked: appSettings.fullscreen
    }
    Action {
        id: quitAction
        text: qsTr("Quit")
        shortcut: "Ctrl+Shift+Q"
        onTriggered: Qt.quit();
    }
    Action{
        id: showsettingsAction
        text: qsTr("Settings")
        onTriggered: {
            settingswindow.show();
            settingswindow.requestActivate();
            settingswindow.raise();
        }
    }
    Action{
        id: copyAction
        text: qsTr("Copy")
        shortcut: Qt.platform.os === "osx" ? StandardKey.Copy : "Ctrl+Shift+C"
    }
    Action{
        id: pasteAction
        text: qsTr("Paste")
        shortcut: Qt.platform.os === "osx" ? StandardKey.Paste : "Ctrl+Shift+V"
    }
    Action{
        id: zoomIn
        text: qsTr("Zoom In")
        shortcut: "Ctrl++"
        onTriggered: appSettings.incrementScaling();
    }
    Action{
        id: zoomOut
        text: qsTr("Zoom Out")
        shortcut: "Ctrl+-"
        onTriggered: appSettings.decrementScaling();
    }
    Action{
        id: showAboutAction
        text: qsTr("About")
        onTriggered: {
            aboutDialog.show();
            aboutDialog.requestActivate();
            aboutDialog.raise();
        }
    }

    // Player actions
    Action {
        id: openFileAction
        text: qsTr("Open media")
        shortcut: "Ctrl+O"
        onTriggered: {
            fileDialog.visible = true;
        }
    }

    Action {
        id: pauseMediaAction
        text: qsTr("Pause media")
        shortcut: "Ctrl+P"
        onTriggered: {
            if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                mediaPlayer.pause()
            } else if (mediaPlayer.playbackState === MediaPlayer.PausedState){
                mediaPlayer.play()
            }
        }
    }
    Action {
        id: startMediaAction
        text: qsTr("Start media")
        shortcut: "Ctrl+K"
        onTriggered: {
            mediaPlayer.play();
        }
    }

    Action {
        id: stopMediaAction
        text: qsTr("Stop media")
        shortcut: "Ctrl+J"
        onTriggered: {
            mediaPlayer.stop();
            ksession.clearScreen();
        }
    }
    Item {
        anchors.fill: parent
        focus: true
        Keys.onPressed: {
            switch (event.key) {
            case Qt.Key_Right:
                mediaPlayer.fastSeek = event.isAutoRepeat
                mediaPlayer.seek(mediaPlayer.position + 10000)
                break
            case Qt.Key_Left:
                mediaPlayer.fastSeek = event.isAutoRepeat
                mediaPlayer.seek(mediaPlayer.position - 10000)
                break
            case Qt.Key_Up:
                mediaPlayer.volume = Math.min(2, mediaPlayer.volume+0.05)
                break
            case Qt.Key_Down:
                mediaPlayer.volume = Math.max(0, mediaPlayer.volume-0.05)
                break
            case Qt.Key_Space:
                if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                    mediaPlayer.pause()
                } else if (mediaPlayer.playbackState === MediaPlayer.PausedState){
                    mediaPlayer.play()
                }
                break
            case Qt.Key_Plus:
                mediaPlayer.playbackRate += 0.1;
                console.log("mediaPlayer.playbackRate: " + mediaPlayer.playbackRate);
                break;
            case Qt.Key_Minus:
                mediaPlayer.playbackRate = Math.max(0.1, mediaPlayer.playbackRate - 0.1);
                break;
            case Qt.Key_F:
                appSettings.fullscreen = !appSettings.fullscreen
                break
            case Qt.Key_L:
                if (appSettings.audioTrack + 1 < mediaPlayer.internalAudioTracks.length) {
                    appSettings.audioTrack++;
                } else {
                    appSettings.audioTrack = 0;
                }
                break
            case Qt.Key_A:
                if (appSettings.fillMode === VideoOutput.Stretch) {
                    appSettings.fillMode = VideoOutput.PreserveAspectFit
                } else if (appSettings.fillMode === VideoOutput.PreserveAspectFit) {
                    appSettings.fillMode = VideoOutput.PreserveAspectCrop
                } else {
                    appSettings.fillMode = VideoOutput.Stretch
                }
                break
            case Qt.Key_O:
                fileDialog.open()
                break;
            case Qt.Key_N:
                mediaPlayer.stepForward()
                break
            case Qt.Key_B:
                mediaPlayer.stepBackward()
                break;
            //case Qt.Key_Back:
            case Qt.Key_Q:
                Qt.quit()
                break
            }
        }
    }
    VideoController{
        id: mediaPlayer
    }

    ApplicationSettings{
        id: appSettings
    }
    TerminalContainer{
        id: terminalContainer
        y: appSettings.showMenubar ? 0 : -2 // Workaroud to hide the margin in the menubar.
        width: parent.width * appSettings.windowScaling
        height: (parent.height + Math.abs(y)) * appSettings.windowScaling

        transform: Scale {
            xScale: 1 / appSettings.windowScaling
            yScale: 1 / appSettings.windowScaling
        }
    }
    SettingsWindow{
        id: settingswindow
        visible: false
    }
    AboutDialog{
        id: aboutDialog
        visible: false
    }
    OpenFileDialog{
        id: fileDialog
        visible: false
    }

    Loader{
        anchors.centerIn: parent
        active: appSettings.showTerminalSize
        sourceComponent: SizeOverlay{
            z: 3
            terminalSize: terminalContainer.terminalSize
        }
    }
    onClosing: {
        // OSX Since we are currently supporting only one window
        // quit the application when it is closed.
        if (Qt.platform.os === "osx")
            Qt.quit()
    }
}
