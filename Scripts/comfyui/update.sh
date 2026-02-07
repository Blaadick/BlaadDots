#!/bin/bash

cd ~/ComfyUI
source .venv/bin/activate

git pull
pip install -r requirements.txt
pip install -r manager_requirements.txt
