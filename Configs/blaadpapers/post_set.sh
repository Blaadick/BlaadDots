wallpaperName=$(basename "$1")
hyprctl -q notify 1 1500 0 "Wallpaper: ${wallpaperName%.*}"
matugen image "$1"
