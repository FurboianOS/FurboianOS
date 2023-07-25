#!/bin/bash -e

remove_games="n"

on_chroot << EOF
touch /etc/polkit-1/localauthority.conf.d/51-admin.conf
  sh -c 'echo "[Configuration]" >> /etc/polkit-1/localauthority.conf.d/51-admin.conf'
  sh -c 'echo "AdminIdentities=unix-group:sudo;unix-group:admin" >> /etc/polkit-1/localauthority.conf.d/51-admin.conf'
  systemctl set-default graphical.target
  systemctl start gdm
  systemctl enable gdm
  update-alternatives --install /usr/bin/x-www-browser \
  x-www-browser /usr/bin/chromium-browser 86
  update-alternatives --install /usr/bin/gnome-www-browser \
  gnome-www-browser /usr/bin/chromium-browser 86
  apt-mark auto python3-pyqt5 python3-opengl
  if [ "$remove_games" == "y" ]; then
    apt remove -y aisleriot five-or-more four-in-a-row gnome-2048 gnome-chess gnome-games gnome-klotski gnome-mahjongg gnome-mines gnome-nibbles gnome-robots gnome-sudoku gnome-taquin gnome-tetravex hitori hoichess iagno lightsoff quadrapassel swell-foop tali
  fi
EOF
