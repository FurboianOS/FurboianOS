#!/bin/bash -e

on_chroot << EOF
update-alternatives --install /usr/bin/x-www-browser \
  x-www-browser /usr/bin/chromium-browser 86
update-alternatives --install /usr/bin/gnome-www-browser \
  gnome-www-browser /usr/bin/chromium-browser 86
  apt-mark auto python3-pyqt5 python3-opengl
  touch /etc/polkit-1/localauthority.conf.d/51-admin.conf
  sh -c 'echo "[Configuration]" >> /etc/polkit-1/localauthority.conf.d/51-admin.conf'
  sh -c 'echo "AdminIdentities=unix-group:sudo;unix-group:admin" >> /etc/polkit-1/localauthority.conf.d/51-admin.conf'
EOF
