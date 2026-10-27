#!/bin/bash
set -oue pipefail

rm -rf /var/run && ln -s /run /var/run

cp -avf "/ctx/system_files"/. /

sudo dnf install -y 'dnf5-command(copr)'
echo -n "max_parallel_downloads=10" >> /etc/dnf/dnf.conf

app_pkgs=(
    ntfs-3g
    btrfs-progs
    langpacks-en
    glibc-all-langpacks

    tmux
    micro
    btop 
    fastfetch 
    flatpak 
    distrobox 
    @virtualization

    @kde-desktop 
    NetworkManager
    vlc 
    gwenview
)

# Install & Cleanup
dnf install -y "${app_pkgs[@]}" && dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all