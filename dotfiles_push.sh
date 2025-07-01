cd ~/Documents/BlaadDots

rm -rf ./Configs/*
# rm -rf ./Icons/*
rm -rf ./Scripts/*

mkdir ./Configs/vesktop/
mkdir ./Configs/fish/
mkdir ./Configs/zed/

cp -a ~/.config/eww/ ./Configs/
cp -a ~/.config/fastfetch/ ./Configs/
cp -a ~/.config/hypr/ ./Configs/
cp -a ~/.config/kitty/ ./Configs/
cp -a ~/.config/nvim/ ./Configs/
cp -a ~/.config/vesktop/settings ./Configs/vesktop/settings/
cp -a ~/.config/fish/config.fish ./Configs/fish/
cp -a ~/.config/fontconfig/ ./Configs/
cp -a ~/.config/zed/settings.json ./Configs/zed/
cp -a ~/.config/blaadpapers/ ./Configs/
# cp -a ~/.icons/* ./Icons/
cp -a ~/Scripts/* ./Scripts/

sudo cp /etc/pacman.conf ./ConfigsOther/pacman.conf

rm ./Configs/hypr/hyprpaper.conf # Because blaadpapers generates them

if [[ -n $1 ]]; then
    git add .
    git commit -m "$1"
    git push
fi
