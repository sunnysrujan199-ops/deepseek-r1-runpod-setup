# How to Run DeepSeek-R1 on RunPod (Easy GPU Setup Guide)

This repository shows the fastest way to deploy DeepSeek-R1 on a cloud GPU using RunPod.

DeepSeek-R1 is one of the most powerful open-source reasoning models available right now, but it is too large for most consumer laptops. Using RunPod allows you to run the model on high-VRAM GPUs without buying expensive hardware.

---

# Why Use RunPod?

DeepSeek-R1 requires substantial GPU memory for inference.

Most users encounter:
- CUDA out-of-memory errors
- Slow local inference
- Incompatible laptop GPUs
- Extremely long generation times

RunPod solves this by providing instant cloud GPUs optimized for AI workloads.

Launch a GPU here:

[https://runpod.io?ref=i1znw01t]

---

# Recommended GPU

For the 70B distilled model:

| GPU | Recommended |
|------|-------------|
| RTX 4090 | Minimum |
| A100 80GB | Best |
| H100 | Ideal |

---

# Deploy in Under 10 Minutes

## Step 1 — Create a RunPod Instance

1. Go to RunPod
2. Deploy a new GPU pod
3. Select:
   - Ubuntu template
   - CUDA enabled
   - At least 48GB VRAM recommended

---

# Step 2 — Connect to Your Pod

Open the terminal inside RunPod.

Clone this repository:

```bash
git clone https://github.com/YOUR_USERNAME/deepseek-r1-runpod-setup.git
cd deepseek-r1-runpod-setup
```

---

# Step 3 — Run the Setup Script

```bash
chmod +x setup.sh
./setup.sh
```

The script automatically:
- Installs dependencies
- Downloads DeepSeek-R1
- Configures Transformers
- Creates the inference script

---

# Step 4 — Start Inference

```bash
python3 start.py
```

You should see generated reasoning output directly in the terminal.

---

# Model Used

This setup uses:

DeepSeek-R1-Distill-Llama-70B

From Hugging Face:
https://huggingface.co/deepseek-ai

---

# Common Errors

## CUDA Out of Memory

Use:
- Larger GPU
- Quantized model
- Tensor parallelism

Recommended:
- A100 80GB

---

## Slow Downloads

The model weights are extremely large.

Possible fixes:
- Use RunPod network volumes
- Use Hugging Face cache
- Choose a datacenter closer to your region

---

# SEO Keywords

- how to run DeepSeek-R1 on RunPod
- DeepSeek-R1 RunPod tutorial
- DeepSeek-R1 cloud GPU setup
- Run DeepSeek-R1 cheaply
- DeepSeek-R1 inference guide
- DeepSeek-R1 deployment tutorial

---

# Why This Repository Exists

Many users want to try DeepSeek-R1 immediately but cannot run it locally because:
- insufficient VRAM
- incompatible GPUs
- RAM limitations
- expensive hardware requirements

This repository provides a simple one-command setup optimized for cloud GPUs.

---

# License

MIT
