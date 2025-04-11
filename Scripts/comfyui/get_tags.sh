if [[ -z "$1" ]]; then
    echo "Post link or id not provided"
    exit
fi

if [[ "$1" =~ ^[1-9]+$ ]]; then
    RESPONSE=$(curl -s "https://danbooru.donmai.us/posts/$1.json")
else
    RESPONSE=$(curl -s "$1.json")
fi

if [ -z "$RESPONSE" ]; then
    echo "Error during API request"
    exit
fi

TAGS=$(echo "$RESPONSE" | grep -Po '"tag_string_general":"\K[^"]+' | sed 's/ /, /g; s/_/ /g')

echo $TAGS
wl-copy $TAGS
