#!/bin/bash
set -oue pipefail

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub it.mijorus.gearlever 
flatpak install -y flathub com.ranfdev.DistroShelf