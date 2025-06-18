# 🚀 vLLM Inference API with Docker + Kubernetes

This project demonstrates how to containerize and deploy a vLLM-based OpenAI-compatible inference server, simulating large model deployment (70B+) using smaller Hugging Face models.

## 📦 Model Used
- `facebook/opt-125m` (used here for Colab compatibility)
- Swap out with any large model like LLaMA 2 70B, Falcon, etc. in production

## 🐳 Docker Usage
```bash
docker build -t vllm-api .
docker run -p 8000:8000 vllm-api
```

Access at: `http://localhost:8000/v1/completions`

## ☸️ Kubernetes Deployment
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

Then access with:
```bash
curl http://<EXTERNAL-IP>/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "facebook/opt-125m", "prompt": "Hello AI,", "max_tokens": 50}'
```

## 📄 License
MIT
