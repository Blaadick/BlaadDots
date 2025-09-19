shortcuts=(
    user-dirs-update-gtk.desktop
    java-java17-openjdk.desktop
    java-java21-openjdk.desktop
    jconsole-java17-openjdk.desktop
    jconsole-java21-openjdk.desktop
    jshell-java17-openjdk.desktop
    jshell-java21-openjdk.desktop
    electron34.desktop
    electron35.desktop
    cmake-gui.desktop
    btop.desktop
    fish.desktop
    nvim.desktop
    avahi-discover.desktop
    bssh.desktop
    bvnc.desktop
)

cd /usr/share/applications/
sudo rm -f ${shortcuts[@]}
