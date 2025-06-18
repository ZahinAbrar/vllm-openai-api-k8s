from fastapi import FastAPI
from pydantic import BaseModel
from transformers import pipeline

app = FastAPI()
summarizer = pipeline("summarization", model="sshleifer/distilbart-cnn-12-6")

class InputText(BaseModel):
    text: str

@app.post("/summarize")
def summarize(req: InputText):
    result = summarizer(req.text, max_length=100, min_length=30, do_sample=False)
    return {"summary": result[0]["summary_text"]}
