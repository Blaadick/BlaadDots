#!/bin/bash

main_packages=(
    hyprlock
    hyprpicker
    qt6ct
    kvantum
    nwg-look
    fish
    wl-clipboard
    brightnessctl
    playerctl
    ttf-jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra

    blaadpapers
    hyprpaper
    quickshell
    hyprshell
)

install_pkgs() {
    yay -S "$@" --noconfirm --removemake
}

setup_yay() {
    cd ~

    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..

    rm -rf yay
}

setup_omf() {
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish &
    omf install bobthefish
}

setup_themes() {
    install_pkgs papirus-icon-theme

    cd ~

    git clone https://github.com/vinceliuice/Graphite-gtk-theme
    cd Graphite-gtk-theme
    ./install.sh -c dark --tweaks rimless normal -l
    cd ..

    git clone https://github.com/vinceliuice/Graphite-kde-theme
    cd Graphite-kde-theme
    ./install.sh -t default -c dark --rimless
    cd ..

    rm -rf Graphite-gtk-theme Graphite-kde-theme
}

setup_dotfiles() {
    cd ~/Documents/BlaadDots

    mkdir -p ~/.icons
    mkdir -p ~/Scripts

    cp -af Configs/* ~/.config
    cp -af Icons/* ~/.icons
    cp -af Pictures/* ~/Pictures
    cp -af Scripts/* ~/Scripts
}

setup_yay
install_pkgs "${main_packages[@]}"
setup_dotfiles
setup_omf
setup_themes

echo "Dotfiles installation done."
