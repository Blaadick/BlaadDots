#!/bin/bash

source ~/Scripts/install/install.sh

arch_packages=(
    thunar
    qview
    haruna
    amberol
    steam
    discord
    obsidian
    intellij-idea-community-edition
    zed
    neovim
    prismlauncher
    qbittorrent
    obs-studio
    songrec
    bitwarden
    scrcpy
    zerotier-one
    btop
    fastfetch
    wine
    wine-mono
    wine-gecko
    winetricks
    yt-dlp
    xpadneo-dkms                   # Gemepads support
    dualsensectl                   # DualSense settings
    jdk8-openjdk
    jdk17-openjdk
    jdk21-openjdk
    jdk25-openjdk
    openal                         # Minecraft forge sound fix
    flite                          # Minecraft narrator fix

    zen-browser-bin
    clion
    clion-jre
    pear-desktop-bin
    aseprite-bin
    blockbench-bin
    reaper
    bottles
    protonplus
    thunar-archive-plugin
    ark                             # Thunar archives manager
    tumbler                         # Thunar thubnail generator
    mkinitcpio-firmware             # Pacman full update warnings fix
)

install_gamemode() {
    install_pkgs gamemode lib32-gamemode
    sudo usermod -aG gamemode $(whoami)
}

set_mime() {
    local file_manadger_app="org.gnome.Nautilus.desktop"
    local text_editor_app="dev.zed.Zed.desktop"
    local picture_app="com.interversehq.qView.desktop"
    local video_app="org.kde.haruna.desktop"
    local audio_app="io.bassi.Amberol.desktop"

    xdg-mime default $file_manadger_app inode/directory

    xdg-mime default $picture_app image/png
    xdg-mime default $picture_app image/webp
    xdg-mime default $picture_app image/jpeg
    xdg-mime default $picture_app image/svg+xml

    xdg-mime default $video_app video/mp4
    xdg-mime default $video_app video/mpeg
    xdg-mime default $video_app video/x-matroska

    xdg-mime default $audio_app audio/flac
    xdg-mime default $audio_app audio/mpeg
    xdg-mime default $audio_app audio/ogg
    xdg-mime default $audio_app audio/webm
    xdg-mime default $audio_app audio/x-flac+ogg
}

install_pkgs "${arch_packages[@]}"
yay -Rns dolphin vim htop --noconfirm
yay -Rnsu $(yay -Qqtd) --noconfirm

install_gamemode
set_mime

echo "Bladick's dotfiles installation done."
