#!/bin/bash
set -oue pipefail

# Desktop Environment and Applications
dnf copr enable -y imput/helium
dnf in -y @kde-desktop vlc gwenview helium-bin 
#Clean Up
dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all

# Flatpaks
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub it.mijorus.gearlever 
flatpak install -y flathub com.ranfdev.DistroShelf

#Service Perfs
systemctl disable flatpak-add-fedora-repos.service
systemctl mask systemd-remount-fs.service