#! /bin/bash
docker build -t whisperqday:qday whisper-model-service
docker build -t streamlitqday:qday streamlit
wget --no-config --quiet --show-progress -O ggml-small.bin https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.bin