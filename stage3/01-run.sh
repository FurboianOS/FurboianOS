#!/bin/bash -e

#Set default session for GDM
install -m 644 files/def-session.conf "${ROOTFS_DIR}/etc/gdm/custom.conf"

on_chroot << EOF
	systemctl set-default graphical.target
EOF
