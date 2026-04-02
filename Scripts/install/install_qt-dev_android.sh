#!/bin/bash

packages=(
    android-ndk
    android-sdk
    android-sdk-build-tools
    android-sdk-cmdline-tools-latest
    android-sdk-platform-tools
    android-aarch64-qt6-base
    android-aarch64-qt6-declarative
    android-aarch64-qt6-imageformats
    android-aarch64-qt6-shadertools
    android-aarch64-qt6-svg
    android-aarch64-qt6-translations
    android-platform
)

install_pkgs() {
    yay -S "$@" --noconfirm --removemake --needed
}

install_pkgs "${packages[@]}"
