for i in {4..1000}; do
    echo "Page $i start"

    for wallpaper in $(curl -s "https://wallhaven.cc/api/v1/search?categories=010&page=$i" | jq -r ".data[].path"); do
        curl -LOs $wallpaper

        echo "Wallpaper $wallpaper downloaded"
    done

    echo "Page $i done"
done
