sudo pacman -Syu
sudo pacman -S $(cat ~/DotFiles/Scripts/aur_official_packages.lst | grep -v "#")
sudo pacman -Rns dolphin vim htop

flatpak install flathub net.blockbench.Blockbench

git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd

yay -S $(cat ~/DotFiles/Scripts/aur_unofficial_packages.lst | grep -v "#")

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish &
omf install bobthefish

cd ~/DotFiles
cp -a Configs/* ~/.config
mkdir ~/.icons
cp -a Icons/* ~/.icons
cp -a Pictures/* ~/Pictures
mkdir ~/Scripts
cp -a Scripts/* ~/Scripts
cd

cd ~/.local/share
git clone https://github.com/vinceliuice/Graphite-gtk-theme
cd Graphite-gtk-theme
./install.sh -d ~/.themes -c dark --tweaks rimless normal -l
cd ..

git clone https://github.com/vinceliuice/Graphite-kde-theme
cd Graphite-kde-theme
./install.sh -t default -c dark --rimless
cd
