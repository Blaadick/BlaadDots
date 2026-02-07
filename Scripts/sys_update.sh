#!/bin/bash

yay -Syu --noconfirm --removemake

echo -e "\n\e[34m::\e[0m Searching for orphan packages..."
orphan=$(yay -Qqtd)
if [[ "$orphan" == '\n' ]]; then
    yay -Rnsu "$orphan" --noconfirm
else
    echo " there is nothing to do"
fi
