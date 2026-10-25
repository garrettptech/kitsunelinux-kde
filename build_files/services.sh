#!/bin/bash
set -oue pipefail

systemctl disable flatpak-add-fedora-repos.service
systemctl mask systemd-remount-fs.service