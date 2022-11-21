{{/*
Expand the name of the chart.
*/}}
{{- define "uptick-django.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "uptick-django.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
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
{{- define "uptick-django.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "uptick-django.labels" -}}
helm.sh/chart: {{ include "uptick-django.chart" . }}
{{ include "uptick-django.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "uptick-django.selectorLabels" -}}
app.kubernetes.io/name: {{ include "uptick-django.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "uptick-django.selectorLabelsFg" -}}
app.kubernetes.io/name: {{ include "uptick-django.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}-fg
{{- end }}

{{- define "uptick-django.selectorLabelsBg" -}}
app.kubernetes.io/name: {{ include "uptick-django.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}-bg
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "uptick-django.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "uptick-django.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
