#
# spec file for package retro-tube
#
# Copyright © 2019 Scott Doucet <duroktar@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

Name:       retro-tube
Summary:    RetroTube
Version:    1.0
Release:    0%{?dist}
Group:      System/X11/Terminals
License:    GPL-3.0+
URL:        https://github.com/Duroktar/retro-tube

# For this spec file to work, the retro-tube sources must be located
# in a directory named retro-tube-0.9 (with "0.9" being the version
# number defined above).
# If the sources are compressed in another format than .tar.xz, change the
# file extension accordingly.
Source0:    %{name}-%{version}.tar.xz

BuildRequires: pkgconfig(Qt5Core)
BuildRequires: pkgconfig(Qt5Declarative)
BuildRequires: pkgconfig(Qt5Gui)
BuildRequires: pkgconfig(Qt5Quick)
BuildRequires: desktop-file-utils

# Package names only verified with Fedora and openSUSE.
# Should the packages in your distro be named dirrerently,
# see http://en.opensuse.org/openSUSE:Build_Service_cross_distribution_howto
%if 0%{?fedora}
Requires:      qt5-qtbase
Requires:      qt5-qtbase-gui
Requires:      qt5-qtdeclarative
Requires:      qt5-qtgraphicaleffects
Requires:      qt5-qtquickcontrols
%endif

%if 0%{?suse_version}
Requires:      libqt5-qtquickcontrols
Requires:      libqt5-qtbase
Requires:      libQt5Gui5
Requires:      libqt5-qtdeclarative
Requires:      libqt5-qtgraphicaleffects
%endif

%description
retro-tube is a terminal emulator which tries to mimic the look and feel
of the old cathode tube screens. It has been designed to be eye-candy,
customizable, and reasonably lightweight.

%prep
%setup -q

%build
qmake-qt5
make %{?_smp_mflags}

%install
# Work around weird qmake behaviour: http://davmac.wordpress.com/2007/02/21/qts-qmake/
make INSTALL_ROOT=%{buildroot} install

desktop-file-install                            \
--dir=${RPM_BUILD_ROOT}%{_datadir}/applications \
%{name}.desktop

%files
%defattr(-,root,root,-)
%doc gpl-2.0.txt gpl-3.0.txt README.md
%{_bindir}/%{name}
%{_libdir}/qt5/qml/
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/*/*

%clean
rm -rf %{buildroot}

%changelog
