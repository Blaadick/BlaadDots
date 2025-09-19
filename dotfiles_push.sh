cd ~/Documents/BlaadDots

rm -rf ./Configs/*
rm -rf ./Scripts/*

mkdir ./Configs/fish/
mkdir ./Configs/zed/

cp -a ~/.config/quickshell/ ./Configs/
cp -a ~/.config/fastfetch/ ./Configs/
cp -a ~/.config/hypr/ ./Configs/
cp -a ~/.config/kitty/ ./Configs/
cp -a ~/.config/nvim/ ./Configs/
cp -a ~/.config/fish/config.fish ./Configs/fish/
cp -a ~/.config/fontconfig/ ./Configs/
cp -a ~/.config/zed/settings.json ./Configs/zed/
cp -a ~/.config/blaadpapers/ ./Configs/
cp -a ~/Scripts/* ./Scripts/

rm ./Configs/hypr/hyprpaper.conf # Because blaadpapers generates them

if [[ -n $1 ]]; then
    git add .
    git commit -m "$1"
    git push
fi
