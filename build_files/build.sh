#!/bin/bash

# Desktop Environment and Utilities
dnf in -y @kde-desktop vlc gwenview

# Web Browser
dnf copr enable -y imput/helium
dnf in -y helium-bin 

# Virtualization \ Containerization \ Networking
dnf in -y @virtualization distrobox

# Flatpaks
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub it.mijorus.gearlever 
flatpak install -y flathub com.ranfdev.DistroShelf

#Clean Up
dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all