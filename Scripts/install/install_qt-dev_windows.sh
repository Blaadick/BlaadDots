#!/bin/bash

packages=(

)

install_pkgs() {
    yay -S "$@" --noconfirm --removemake --needed
}

install_pkgs "${packages[@]}"
