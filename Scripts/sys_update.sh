#!/bin/bash

yay -Syu --noconfirm --removemake
yay -Rnsu $(yay -Qqtd) --noconfirm

flatpak update
flatpak uninstall --unused
