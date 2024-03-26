{{/*
Expand the name of the chart (whisper).
*/}}
{{- define "whisper.whisper-llm-streamlit.name" -}}
{{- default .Chart.Name .Values.whisper.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "whisper.whisper-llm-streamlit.fullname" -}}
{{- if .Values.whisper.fullnameOverride }}
{{- .Values.whisper.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.whisper.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "whisper.whisper-llm-streamlit.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "whisper.whisper-llm-streamlit.labels" -}}
helm.sh/chart: {{ include "whisper.whisper-llm-streamlit.chart" . }}
{{ include "whisper.whisper-llm-streamlit.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "whisper.whisper-llm-streamlit.selectorLabels" -}}
app.kubernetes.io/name: {{ include "whisper.whisper-llm-streamlit.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "whisper.whisper-llm-streamlit.serviceAccountName" -}}
{{- if .Values.whisper.serviceAccount.create }}
{{- default (include "whisper.whisper-llm-streamlit.fullname" .) .Values.whisper.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.whisper.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Expand the name of the chart.
*/}}
{{- define "streamlit.whisper-llm-streamlit.name" -}}
{{- default .Chart.Name .Values.streamlit.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "streamlit.whisper-llm-streamlit.fullname" -}}
{{- if .Values.streamlit.fullnameOverride }}
{{- .Values.streamlit.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.streamlit.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "streamlit.whisper-llm-streamlit.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "streamlit.whisper-llm-streamlit.labels" -}}
helm.sh/chart: {{ include "streamlit.whisper-llm-streamlit.chart" . }}
{{ include "streamlit.whisper-llm-streamlit.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "streamlit.whisper-llm-streamlit.selectorLabels" -}}
app.kubernetes.io/name: {{ include "streamlit.whisper-llm-streamlit.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "streamlit.whisper-llm-streamlit.serviceAccountName" -}}
{{- if .Values.streamlit.serviceAccount.create }}
{{- default (include "streamlit.whisper-llm-streamlit.fullname" .) .Values.streamlit.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.streamlit.serviceAccount.name }}
{{- end }}
{{- end }}