{{- define "config-injection-demo.name" -}}
{{- default .Chart.Name .Values.app.name -}}
{{- end -}}

{{- define "config-injection-demo.fullname" -}}
{{- printf "%s" (include "config-injection-demo.name" .) -}}
{{- end -}}
