yay -S sentencepiece

git clone https://github.com/comfyanonymous/ComfyUI
cd ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager
cd ..

python -m venv venv
source venv/bin/activate
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.4
pip install -r requirements.txt
pip install -r custom_nodes/ComfyUI-Manager/requirements.txt
