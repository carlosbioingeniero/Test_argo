# Test plan (resumen)

## Escenarios

### A) `mode=files`
- Render Helm con `--set mode=files`.
- Desplegar y validar logs con `TEXT_FILE` y `MULTILINE_FILE`.

### B) `mode=env`
- Render Helm con `--set mode=env`.
- Desplegar y validar que no aparezcan `TEXT_FILE` ni `MULTILINE_FILE`.

## Validacion ArgoCD

1. `kubectl apply` de ambas Applications.
2. `argocd app sync` y `argocd app wait`.
3. Confirmar:
   - `Sync Status: Synced`
   - `Health Status: Healthy`

## Criterio de cierre

- Diferencia funcional `files` vs `env` evidenciada por logs.
- Dos Applications (`files` y `env`) saludables y sincronizadas.
- Hallazgos documentados en `docs/03-findings.md`.
