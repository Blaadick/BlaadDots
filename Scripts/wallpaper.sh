isNsfw=false
silent=false

if [[ $# == 0 ]]; then
    echo There is no parameters
    exit
fi

for arg in $@; do
    case $arg in
        --nsfw) isNsfw=true ;;
        --silent) silent=true ;;
    esac
done

case $1 in
    random)
        if [[ $isNsfw == true ]]; then
            randomWallpaper=$(ls ~/Pictures/Wallpapers/*NS.png | shuf -n 1)
        else
            randomWallpaper=$(ls ~/Pictures/Wallpapers/*.png | grep -vE NS.png | shuf -n 1)
        fi

        wallpaperName=$(basename $randomWallpaper)

        cp $randomWallpaper ~/Pictures/CurrentWallpaper.png
    ;;

    set)
        if [[ -z $2 ]]; then
            echo "No file path was specified"
            exit
        elif [[ ! -f $2 ]]; then
            echo "Not a file"
            exit
        elif [[ ! $2 =~ .png ]]; then
            echo "Not an png image"
            exit
        fi

        wallpaperName=$(basename $2)

        cp $2 ~/Pictures/CurrentWallpaper.png
    ;;

    *)
        echo Unknown parameter
        exit
    ;;
esac

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "~/Pictures/CurrentWallpaper.png"
hyprctl hyprpaper wallpaper ", ~/Pictures/CurrentWallpaper.png"

if [[ $silent == false ]]; then
    hyprctl notify 5 2000 0 "Wallpaper $wallpaperName set!"
fi

matugen image ~/Pictures/CurrentWallpaper.png
