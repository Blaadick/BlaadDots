rm -rf ~/DotFiles/Configs/*
rm -rf ~/DotFiles/Icons/*
rm -rf ~/DotFiles/Scripts/*

mkdir ~/DotFiles/Configs/vesktop/
mkdir ~/DotFiles/Configs/fish/
mkdir ~/DotFiles/Configs/zed/

cp -a ~/.config/eww/ ~/DotFiles/Configs/
cp -a ~/.config/fastfetch/ ~/DotFiles/Configs/
cp -a ~/.config/hypr/ ~/DotFiles/Configs/
cp -a ~/.config/kitty/ ~/DotFiles/Configs/
cp -a ~/.config/nvim/ ~/DotFiles/Configs/
cp -a ~/.config/vesktop/settings ~/DotFiles/Configs/vesktop/settings/
cp -a ~/.config/fish/config.fish ~/DotFiles/Configs/fish/
cp -a ~/.config/fontconfig/ ~/DotFiles/Configs/
cp -a ~/.config/matugen/ ~/DotFiles/Configs/
cp -a ~/.config/hyprswitch.css ~/DotFiles/Configs/
cp -a ~/.config/zed/settings.json ~/DotFiles/Configs/zed/
cp -a ~/.config/blaadpapers.json ~/DotFiles/Configs/

cp -a ~/.icons/* ~/DotFiles/Icons/
cp -a ~/Scripts/* ~/DotFiles/Scripts/

if [[ -n $1 ]]; then
    git add *
    git commit -m "$1"
    git push
fi
