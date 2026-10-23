#!/bin/bash
set -oue pipefail

#bootable
dnf in -y selinux-policy-targeted coreutils xz glibc systemd python3 grub2-tools grub2-tools-extra grub2-tools-minimal efibootmgr grub2-efi-x64 grub2-efi-x64-cdboot grub2-pc grub2-pc-modules shim-x64 rpm shadow-utils lorax-templates-generic squashfs-tools skopeo isomd5sum xorriso

# Desktop Environment and Applications
dnf copr enable -y imput/helium fedora-45-x86_64
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