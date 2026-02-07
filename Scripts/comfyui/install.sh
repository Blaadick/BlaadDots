#!/bin/bash

# yay -S sentencepiece-bin

git clone https://github.com/comfyanonymous/ComfyUI
cd ComfyUI

python -m venv .venv
source .venv/bin/activate
pip install --no-cache-dir --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm7.1
pip install -r requirements.txt
pip install -r manager_requirements.txt
