
{{- define "launcher_name" }}
{{ .Release.Name }}-launcher
{{- end }}

{{- define "service_name" }}
{{ .Release.Name }}-svc
{{- end }}

{{- define "database_name" }}
{{ .Release.Name }}-db
{{- end }}

{{- define "config_name" }}
{{ .Release.Name }}-config
{{- end }}

{{- define "secret_name" }}
{{ .Release.Name }}-secret
{{- end }}