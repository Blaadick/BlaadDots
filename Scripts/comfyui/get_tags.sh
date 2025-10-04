#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Post link or id not provided"
    exit
fi

if [[ "$1" =~ ^[1-9]+$ ]]; then
    response=$(curl -s "https://danbooru.donmai.us/posts/$1.json")
else
    response=$(curl -s "$1.json")
fi

if [ -z "$response" ]; then
    echo "Error during API request"
    exit
fi

tags=$(echo "$response" | grep -Po '"tag_string_general":"\K[^"]+' | sed 's/ /, /g; s/_/ /g')

echo "$tags"
wl-copy "$tags"
