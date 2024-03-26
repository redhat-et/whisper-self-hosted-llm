FROM python:3.9-slim

WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY whisper_client.py /app
EXPOSE 8501

ENTRYPOINT ["streamlit", "run", "whisper_client.py"]
