# RetroTube  (retro-tube)  v0.1.0

## Description

### Enjoy your favorite movies and shows like it was "back in the day"!

The look and feel of old CRT style televisions brought something to the viewing experience that is somewhat lost in our modern HD era. The warm fuzz, subtle (or sometimes not so subtle) screen curvature,the soft glow and even good old scanlines, all these little things added to the experience and are all recreated in retro-tube.

### Features

- Qt based, written mostly with QML allowing for fast development
- Highly customizable screen effects like: glow, burn-in, screen vibration, scanlines or pixels, etc..
- opengl rendering for performance
- ffmpeg backend
- Hotkey switch audio track for multi language media files
- Lot's of keybindings and settings

### Disclaimer: retro-tube is still very much a WIP. But a lot of things are already working. If you encounter a bug or missing feature don't hesitate to report it or make a feature (or pull) request.

### Requirements -


Tested on Arch Linux. RetroTube requires [Qt](https://www.qt.io/) 5.2 or higher, and [QtAv](https://github.com/wang-bin/QtAV) 1.11 with a video backend of [ffmpeg](https://ffmpeg.org/)

## Attribution

RetroTube is a fork of [cool-retro-term](https://github.com/Swordfish90/cool-retro-term) which mimics the look and feel of the old cathode tube screens. _retro-tube would not be possible without it and the hard work of all it's developers._ (Literally, they did _all_ the hard work). Thank you so much.

## Screenshots
![Image](<http://i.imgur.com/BOkMUeZ.png>)

# Build instructions (Linux)

## Dependencies
Make sure to install these first.

---

**Arch Linux**

    sudo pacman -S qt5-base qt5-declarative qt5-quickcontrols qt5-graphicaleffects qtav
    
---

### Compile & Install
Once you installed all dependencies (Qt is installed and in your path) you need to compile and run the application: 

```bash
# Get it from GitHub
git clone --recursive https://github.com/Duroktar/retro-tube.git

# Build it
cd retro-tube

# Compile (Fedora and OpenSUSE user should use qmake-qt5 instead of qmake)
qmake && make

# Install .desktop and retro-tube binary
sudo make install

# Have fun!
retro-term
```

## License

- RetroTube is gpl-2.0 & 3.0 licensed

Dependancies
- cool-retro-term is gpl-2.0 & 3.0 licensed
