#!/bin/bash
set -oue pipefail

cp -avf "/ctx/system_files"/. /

app_pkgs=(
    @kde-desktop 
    NetworkManager
    vlc 
    gwenview
)

# Install & Cleanup
dnf install -y "${app_pkgs[@]}" && dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all