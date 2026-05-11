#!/usr/bin/bash

# yay -S sentencepiece-bin

git clone https://github.com/comfyanonymous/ComfyUI
cd ComfyUI

python -m venv .venv
source .venv/bin/activate
pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm7.2
pip install -r requirements.txt
pip install -r manager_requirements.txt
