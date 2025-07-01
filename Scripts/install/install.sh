main_packages=(
    hyprlock
    hypridle
    hyprpicker
    qt6ct
    kvantum
    nwg-look
    fish
    wl-clipboard
    grim
    slurp
    brightnessctl
    playerctl
    ttf-jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra

    blaadpapers
    eww
    quickshell
    hyprshell
    matugen-bin
)

install_pkgs() {
    yay -S "$@" --noconfirm --answerclean A --answerdiff N --removemake
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
    cd ~/Documents/DotFiles
    cp -af Configs/* ~/.config
    mkdir ~/.icons
    cp -af Icons/* ~/.icons
    cp -af Pictures/* ~/Pictures
    mkdir ~/Scripts
    cp -af Scripts/* ~/Scripts
}

setup_yay
install_pkgs "${main_packages[@]}"
setup_omf
setup_themes
