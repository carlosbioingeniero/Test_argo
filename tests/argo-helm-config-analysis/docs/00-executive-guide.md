# Guia ejecutiva: Helm + ArgoCD

## Objetivo

Validar y comparar dos estrategias de inyeccion de configuracion para workloads en Kubernetes:

- `mode=files`: leer config desde archivos montados.
- `mode=env`: leer config desde variables de entorno.

## Arquitectura de la prueba

- Un chart Helm (`config-injection-demo`) con parametro `mode`.
- Un `ConfigMap` con datos `text` y `multiline`.
- Un `Deployment` que imprime en logs:
  - `MODE`
  - `TEXT_ENV`, `MULTILINE_ENV`
  - `TEXT_FILE`, `MULTILINE_FILE` cuando existen
- Dos Applications de ArgoCD:
  - `config-injection-demo-files`
  - `config-injection-demo-env`

## Resultado esperado

- Ambos escenarios despliegan correctamente.
- En `files` se observan salidas de archivo.
- En `env` no aparecen salidas de archivo.
- ArgoCD deja ambas apps en `Synced` y `Healthy`.
