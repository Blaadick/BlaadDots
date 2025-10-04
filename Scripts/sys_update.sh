#!/bin/bash

yay -Syu --noconfirm --answerclean A --answerdiff N --removemake
yay -Rnsu $(yay -Qqtd) --noconfirm

flatpak update
flatpak uninstall --unused
