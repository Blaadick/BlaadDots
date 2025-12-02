#!/bin/bash

packages=(
    android-ndk
    android-sdk
    android-sdk-build-tools
    android-sdk-cmdline-tools-latest
    android-sdk-platform-tools
    android-aarch64-qt6-base
    android-aarch64-qt6-quick3d
    android-platform

    qtcreator
    qt6-examples
)

install_pkgs() {
    yay -S "$@" --noconfirm --removemake
}

install_pkgs "${packages[@]}"
