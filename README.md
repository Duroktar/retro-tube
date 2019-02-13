# RetroTube  (retro-tube, aka: HDbDamned)  v0.1.0

![image](https://raw.githubusercontent.com/Duroktar/retro-tube/master/app/qml/images/married.png)

## Description
retro-tube is a terminal emulator turned video player which mimics the look and feel of the old cathode tube screens.
It has been designed to be eye-candy, customizable, and reasonably lightweight.

It uses the QML port of qtermwidget (Konsole) developed by Swordfish90: https://github.com/Swordfish90/qmltermwidget .

This terminal emulator works under Linux and macOS and requires Qt 5.2 or higher.

## Install

## Build instructions (Linux)

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

    sudo pacman -S qt5-base qt5-declarative qt5-quickcontrols qt5-graphicaleffects
    
---

**openSUSE**

Add repository with latest Qt 5 (this is only needed on openSUSE 13.1, Factory already has it):

    sudo zypper ar http://download.opensuse.org/repositories/KDE:/Qt5/openSUSE_13.1/ KDE:Qt5

Install dependencies:

    sudo zypper install libqt5-qtbase-devel libqt5-qtdeclarative-devel libqt5-qtquickcontrols libqt5-qtgraphicaleffects

---

**Anyone else**

Install Qt directly from here http://qt-project.org/downloads . Once done export them in you path (replace "_/opt/Qt5.3.1/5.3/gcc_64/bin_" with your correct folder):
    
    export PATH=/opt/Qt5.3.1/5.3/gcc_64/bin/:$PATH
---

### Compile
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
