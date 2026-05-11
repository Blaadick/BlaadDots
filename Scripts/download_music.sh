#!/usr/bin/bash

if [[ -z $1 ]]; then
    echo -e "Usage:\n   $0 <url>"
    exit 0
fi

tmp_dir=$(mktemp -d)
url=$1

echo "Downloading files..."
yt-dlp --audio-format opus --audio-quality 0 --extract-audio --write-thumbnail -o "$tmp_dir/audio.%(ext)s" -o "thumbnail:$tmp_dir/raw_cover.%(ext)s" --quiet "$url"

echo "Preparing metadata..."
magick "$tmp_dir/raw_cover.webp" -gravity center -crop 1:1 -resize 1024x1024 "$tmp_dir/cover.webp"
metadata=$(yt-dlp -J "$url")
title=$(jq -r ".title" <<< "$metadata")
artist=$(jq -r "(.artist // .channel)" <<< "$metadata")
album=$(jq -r "(.album // .playlist // \"Unknown Album\")" <<< "$metadata")
release_date=$(jq -r "(.release_date // .upload_date) | .[0:4]" <<< "$metadata")

opustags "$tmp_dir/audio.opus" \
    --set "TITLE=$title" \
    --set "ARTIST=$artist" \
    --set "ALBUM=$album" \
    --set "DATE=$release_date" \
    --set-cover "$tmp_dir/cover.webp" \
    -o "$HOME/Music/$artist - $title.opus" \
    &> /dev/null

echo "Track sved as \"$artist - $title.opus\""
rm -r "$tmp_dir"
