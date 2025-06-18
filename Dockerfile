FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

RUN apt-get update && apt-get install -y python3 python3-pip git && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    pip install --upgrade pip

RUN pip install git+https://github.com/vllm-project/vllm.git \
    accelerate transformers

ENV MODEL_NAME=facebook/opt-125m
EXPOSE 8000

CMD ["python", "-m", "vllm.entrypoints.openai.api_server", "--model", "facebook/opt-125m", "--host", "0.0.0.0", "--port", "8000"]
