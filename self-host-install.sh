#! /bin/bash
kind create cluster --config kind-config.yaml
kubectl cluster-info --context kind-kind
kind load docker-image whisperqday:qday
kind load docker-image streamlitqday:qday
helm install whisper-streamlit-helm whisper-streamlit-helm
sleep 10
kubectl port-forward service/streamlit 8501:8501