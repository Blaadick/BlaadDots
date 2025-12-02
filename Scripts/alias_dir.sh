for file in *; do
    antialiasing "$(realpath "$file")" 512 512
done
