#!/bin/bash

source ~/Documents/BlaadDots/Scripts/install/install.sh

arch_packages=(
    zed
    steam
    obsidian
    qbittorrent
    prismlauncher
    nautilus
    qview
    haruna
    amberol
    scrcpy
    zerotier-one
    neovim
    btop
    fastfetch
    flatpak
    wine
    wine-mono
    wine-gecko
    winetricks
    yt-dlp
    cups
    cups-pdf
    gutenprint
    jdk8-openjdk
    jdk17-openjdk
    jdk21-openjdk
    openal                         # Minecraft forge sound fix
    flite                          # Minecraft narrator fix

    zen-browser-bin
    pear-desktop-bin
    vesktop
    aseprite
    blockbench-bin
    jetbrains-toolbox
    bottles
    proton-ge-custom-bin
    protondb-cli
    v4l2loopback-dkms               # OBS virtual webcam fix
    v4l2loopback-utils              # OBS virtual webcam fix
    mkinitcpio-firmware             # Pacman full update warnings fix
)
flatpak_packages=(
    com.obsproject.Studio
)

install_gamemode() {
    install_pkgs gamemode lib32-gamemode
    sudo usermod -aG gamemode $(whoami)
}

install_pkgs "${arch_packages[@]}"
yay -Rnsu $(yay -Qqtd) --noconfirm
yay -Rns dolphin vim htop --noconfirm
flatpak install "${flatpak_packages[@]}"

install_gamemode

echo "Bladick's dotfiles installation done."
