# retro-tube

## Description
retro-tube is a terminal emulator which mimics the look and feel of the old cathode tube screens.
It has been designed to be eye-candy, customizable, and reasonably lightweight.

It uses the QML port of qtermwidget (Konsole) developed by me: https://github.com/Swordfish90/qmltermwidget .

This terminal emulator works under Linux and OSX and requires Qt 5.2 or higher.

## Screenshots
![Image](<http://i.imgur.com/I6wq1cC.png>)
![Image](<http://i.imgur.com/12EqlpL.png>)
![Image](<http://i.imgur.com/Lx0acQz.jpg>)

## Build instructions (Linux)

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
## Dependencies
Make sure to install these first.

---

**Ubuntu 14.04**

    sudo apt-get install build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qtdeclarative5-controls-plugin qtdeclarative5-qtquick2-plugin libqt5qml-graphicaleffects qtdeclarative5-dialogs-plugin qtdeclarative5-localstorage-plugin qtdeclarative5-window-plugin

---

**Ubuntu 16.10**

    sudo apt-get install build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qml-module-qtquick-controls qtdeclarative5-qtquick2-plugin libqt5qml-graphicaleffects qml-module-qtquick-dialogs qtdeclarative5-localstorage-plugin qtdeclarative5-window-plugin

---

**Debian Jessie**

    sudo apt-get install build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtquick-dialogs qml-module-qtquick-localstorage qml-module-qtquick-window2

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


## TODO

- ensure original authors work is honored.
- Readme
- dist packages
- screenshots
- icons
- windows test

## Ideas

- Make volume green numbers on the corner of the screen like on old tv's

- make channel dial with loud "clack" noise that switches between preset channels.

- Allow to enter url to stream

