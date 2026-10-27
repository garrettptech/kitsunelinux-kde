#!/bin/bash
set -oue pipefail

app_pkgs=(
    @kde-desktop 
    NetworkManager
    vlc 
    gwenview 
    helium-bin 
)

# Install & Cleanup
dnf copr enable -y imput/helium fedora-45-x86_64
dnf install -y "${app_pkgs[@]}" && dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all