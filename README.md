# RetroTube  (aka: HDbDamned)  v0.1.0

![image](https://raw.githubusercontent.com/Duroktar/retro-tube/master/app/qml/images/married.png)

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

## Install

# Build instructions (Linux)

Build retro-tube yourself, you know, the retro way.

## Dependencies
Make sure to install these first.

---

**Ubuntu 14.04**

    sudo apt-get install build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qtdeclarative5-controls-plugin qtdeclarative5-qtquick2-plugin libqt5qml-graphicaleffects qtdeclarative5-dialogs-plugin qtdeclarative5-localstorage-plugin qtdeclarative5-window-plugin

---

**Ubuntu 16.10**

    sudo apt-get install build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qml-module-qtquick-controls qtdeclarative5-qtquick2-plugin libqt5qml-graphicaleffects qml-module-qtquick-dialogs qtdeclarative5-localstorage-plugin qtdeclarative5-window-plugin

---

**Ubuntu 17.04**

    sudo apt install build-essential libqt5qml-graphicaleffects qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings qml-module-qtquick-controls qml-module-qtquick-dialogs qmlscene qt5-default qt5-qmake qtdeclarative5-dev qtdeclarative5-localstorage-plugin qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin

---

**Ubuntu 17.10**

    sudo apt-get install build-essential qml-module-qtgraphicaleffects qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings qml-module-qtquick-controls qml-module-qtquick-dialogs qmlscene qt5-default qt5-qmake qtdeclarative5-dev qtdeclarative5-localstorage-plugin qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin

---

**Debian Jessie and above**

    sudo apt install build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtquick-dialogs qml-module-qtquick-localstorage qml-module-qtquick-window2 qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel

---

**Fedora**
This command should install the known fedora dependencies:

    sudo yum -y install qt5-qtbase qt5-qtbase-devel qt5-qtdeclarative qt5-qtdeclarative-devel qt5-qtgraphicaleffects qt5-qtquickcontrols redhat-rpm-config

or:

    sudo dnf -y install qt5-qtbase qt5-qtbase-devel qt5-qtdeclarative qt5-qtdeclarative-devel qt5-qtgraphicaleffects qt5-qtquickcontrols redhat-rpm-config

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

sudo make install

# Have fun!
./retro-tube
```

## Build instructions (macOS)

1. Install [Xcode](https://developer.apple.com/xcode/) and agree to the licence agreement
2. Enter the following commands into the terminal:

**Brew**

```sh
brew install qt5
git clone --recursive https://github.com/Duroktar/retro-tube.git
export CPPFLAGS="-I/usr/local/opt/qt5/include"
export LDFLAGS="-L/usr/local/opt/qt5/lib"
export PATH=/usr/local/opt/qt5/bin:$PATH
cd retro-tube
qmake && make
mkdir retro-tube.app/Contents/PlugIns
cp -r qmltermwidget/QMLTermWidget retro-tube.app/Contents/PlugIns
open retro-tube.app
```

**MacPorts**

```sh
sudo port install qt5
git clone --recursive https://github.com/Duroktar/retro-tube.git
cd retro-tube
/opt/local/libexec/qt5/bin/qmake && make
mkdir retro-tube.app/Contents/PlugIns
cp -r qmltermwidget/QMLTermWidget retro-tube.app/Contents/PlugIns
open retro-tube.app
```

## License

- RetroTube is gpl-2.0 & 3.0 licensed

Dependancies
- cool-retro-term is gpl-2.0 & 3.0 licensed
