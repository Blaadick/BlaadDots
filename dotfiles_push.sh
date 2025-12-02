#!/bin/bash

copy_blaadpapers_conf() {
    cp -a ~/.config/blaadpapers/ ./Configs/
}

copy_fastfetch_conf() {
    cp -a ~/.config/fastfetch/ ./Configs/
}

copy_fish_conf() {
    mkdir ./Configs/fish
    cp -a ~/.config/fish/config.fish ./Configs/fish/
}

copy_fontconfig_conf() {
    cp -a ~/.config/fontconfig/ ./Configs/
}

copy_hyprland_conf() {
    mkdir ./Configs/hypr
    cp -a ~/.config/hypr/default/ ./Configs/hypr/
    cp -a ~/.config/hypr/hyprland.conf ./Configs/hypr/
    cp -a ~/.config/hypr/hyprlock.conf ./Configs/hypr/

    mkdir ./Configs/hypr/custom
    cd ./Configs/hypr/custom
    touch autostart.conf env.conf keybinds.conf monitors.conf rules.conf
    cd ../../..
}

copy_kitty_conf() {
    cp -a ~/.config/kitty/ ./Configs/
}

copy_nvim_conf() {
    cp -a ~/.config/nvim/ ./Configs/
}

copy_quickshell_conf() {
    cp -a ~/.config/quickshell/ ./Configs/
}

copy_zed_conf() {
    mkdir ./Configs/zed
    cp -a ~/.config/zed/settings.json ./Configs/zed/
}


rm -rf ./Configs/*
copy_blaadpapers_conf
copy_fastfetch_conf
copy_fish_conf
copy_fontconfig_conf
copy_hyprland_conf
copy_kitty_conf
copy_nvim_conf
copy_quickshell_conf
copy_zed_conf


rm -rf ./Scripts/*
cp -a ~/Scripts/* ./Scripts/


if [[ -n $1 ]]; then
    git add .
    git commit -m "$1"
    git push
fi
