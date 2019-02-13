TEMPLATE = subdirs

CONFIG += ordered

SUBDIRS += qmltermwidget
SUBDIRS += app

desktop.files += retro-tube.desktop
desktop.path += /usr/share/applications

INSTALLS += desktop
