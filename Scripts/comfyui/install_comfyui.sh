git clone https://github.com/comfyanonymous/ComfyUI
cd ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager
cd ..

python -m venv venv
cd venv/bin
./pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu124
./pip install -r ../../requirements.txt
./pip install -r ../../custom_nodes/ComfyUI-Manager/requirements.txt
