FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-runtime

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    python3-pip

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY start.py .

CMD ["python", "start.py"]
