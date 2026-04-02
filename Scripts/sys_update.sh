#!/bin/bash

yay -Syu --noconfirm --removemake

echo -e "\e[34m::\e[0m Searching for orphan packages..."
orphan=$(yay -Qqtd)
if [[ -n $orphan ]]; then
    yay -Rns $orphan --noconfirm
else
    echo " there is nothing to do"
fi
