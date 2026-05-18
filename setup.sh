#!/bin/bash

set -e

echo "======================================="
echo "DeepSeek-R1 RunPod Auto Setup"
echo "======================================="

apt-get update
apt-get install -y git wget curl python3 python3-pip

mkdir -p /workspace/deepseek-r1
cd /workspace/deepseek-r1

echo "Installing Python dependencies..."

pip3 install --upgrade pip

cat <<EOF > requirements.txt
transformers
accelerate
torch
sentencepiece
safetensors
EOF

pip3 install -r requirements.txt

echo "Creating inference script..."

cat <<EOF > start.py
from transformers import AutoTokenizer, AutoModelForCausalLM
import torch

MODEL_NAME = "deepseek-ai/DeepSeek-R1-Distill-Llama-70B"

print("Loading tokenizer...")
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)

print("Loading model...")
model = AutoModelForCausalLM.from_pretrained(
    MODEL_NAME,
    torch_dtype=torch.float16,
    device_map="auto"
)

prompt = "Explain why cloud GPUs are useful for large language models."

messages = [
    {"role": "user", "content": prompt}
]

input_text = tokenizer.apply_chat_template(
    messages,
    tokenize=False
)

inputs = tokenizer(input_text, return_tensors="pt").to(model.device)

print("Generating response...")

outputs = model.generate(
    **inputs,
    max_new_tokens=200,
    temperature=0.7
)

response = tokenizer.decode(outputs[0], skip_special_tokens=True)

print("\n================ MODEL OUTPUT ================\n")
print(response)
EOF

echo "======================================="
echo "Setup Complete"
echo "======================================="
echo ""
echo "Run the model with:"
echo "python3 start.py"
