if [ "$#" -ne 3 ]; then
    echo "Использование: $0 <директория> <искомое_слово> <новое_слово>"
    exit 1
fi

find "$1" -type f -print0 | while IFS= read -r -d '' file; do
    echo "$file"
    sed -i "s/$2/$3/g" "$file"
done
