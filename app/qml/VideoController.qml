/*******************************************************************************
* Copyright (c) 2017 "Scott Doucet"
* https://github.com/Duroktar/retro-tube
*
* This file is part of retro-tube.
*
* retro-tube is free software: you can redistribute it and/or modify
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
import QtAV 1.6

MediaPlayer {
    id: mediaPlayer
    source: appSettings.currentMedia
    audioTrack: appSettings.audioTrack
    onStatusChanged: {
        if (status == MediaPlayer.Loading)
            console.log("Loading " + source)
        else if (status == MediaPlayer.Buffering)
            console.log("Buffering")
        else if (status == MediaPlayer.Buffered)
            console.log("Buffered")
        else if (status == MediaPlayer.EndOfMedia)
            console.log("End")
        else if (status == MediaPlayer.InvalidMedia)
            console.log("Invalid")
    }
}
