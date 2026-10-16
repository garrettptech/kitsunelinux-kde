FROM ghcr.io/garrettptech/kitsunelinux-base:latest

# Desktop Environment and Utilities
RUN dnf in -y @kde-desktop vlc gwenview

# Web Browser
RUN dnf copr enable -y imput/helium
RUN dnf in -y helium-bin 

# Virtualization \ Containerization \ Networking
RUN dnf in -y @virtualization distrobox

# Flatpaks
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y flathub it.mijorus.gearlever 
RUN flatpak install -y flathub com.ranfdev.DistroShelf

#Clean Up
RUN dnf upgrade -y --refresh && dnf autoremove -y && dnf clean all

RUN bootc container lint