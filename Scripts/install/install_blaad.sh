source ~/Documents/DotFiles/Scripts/install/install.sh

arch_packages=(
    zed
    steam
    obsidian
    qbittorrent
    prismlauncher
    nautilus
    loupe
    blueman
    neovim
    btop
    fish
    fastfetch
    github-cli
    flatpak
    7zip
    xdg-desktop-portal-hyprland
    cups
    cups-pdf
    gutenprint
    jdk8-openjdk
    jdk17-openjdk
    jdk21-openjdk
    openal                         # Minecraft forge sound fix
    flite                          # Minecraft narrator warning fix

    zen-browser-bin
    youtube-music
    vesktop
    aseprite
    jetbrains-toolbox
    zerotier-one
    v4l2loopback-dkms               # OBS virtual webcam fix
    v4l2loopback-utils              # OBS virtual webcam fix
    mkinitcpio-firmware             # Pacman full update warnings fix
)
flatpak_packages=(
    com.obsproject.Studio
    com.usebottles.bottles
    net.blockbench.Blockbench
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
