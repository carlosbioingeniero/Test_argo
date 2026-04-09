# Hallazgos y recomendacion

## Evidencia esperada

### `mode=files`
- `MODE=files`
- aparecen `TEXT_ENV` y `MULTILINE_ENV`
- aparecen `TEXT_FILE` y `MULTILINE_FILE`

### `mode=env`
- `MODE=env`
- aparecen `TEXT_ENV` y `MULTILINE_ENV`
- no aparecen `TEXT_FILE` ni `MULTILINE_FILE`

## Resultado ArgoCD esperado

- `config-injection-demo-files`: `Synced` + `Healthy`
- `config-injection-demo-env`: `Synced` + `Healthy`

## Limitaciones

- Usa `ConfigMap` (no apto para secretos).
- No evalua rendimiento ni recarga en caliente.

## Recomendacion

- Preferir `files` para configuracion estructurada o multilinea.
- Preferir `env` para valores cortos y simples.
