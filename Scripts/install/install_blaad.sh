source ~/Documents/DotFiles/Scripts/install/install.sh

arch_packages=(
    #AOR
    zed
    firefox
    torbrowser-launcher
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
    openal
    flite

    #AUR
    jetbrains-toolbox
    vesktop
    youtube-music
    aseprite
    zerotier-one
)
flatpak_packages=(
    com.obsproject.Studio
    com.usebottles.bottles
    net.blockbench.Blockbench
)

install_pkgs ${arch_packages[@]}
yay -Rnsu $(yay -Qqtd) --noconfirm
yay -Rns dolphin vim htop --noconfirm

flatpak install ${flatpak_packages[@]}
