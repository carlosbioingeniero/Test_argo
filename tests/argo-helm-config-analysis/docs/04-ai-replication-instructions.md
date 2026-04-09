# Instrucciones para replicar con IA

## Objetivo

Replicar una prueba Helm + ArgoCD que compare inyeccion de configuracion por:

- archivos (`mode=files`)
- variables de entorno (`mode=env`)

## Requisitos de implementacion

1. Mantener nombre del chart: `config-injection-demo`.
2. Condicionar en `deployment.yaml`:
   - `volumeMounts` y `volumes` solo cuando `mode=files`.
3. Crear dos Applications ArgoCD con namespaces separados:
   - `argo-helm-config-test-files`
   - `argo-helm-config-test-env`
4. Habilitar en ambas:
   - `automated.prune: true`
   - `automated.selfHeal: true`
   - `syncOptions: [CreateNamespace=true]`

## Flujo obligatorio de validacion

1. `helm template` para `files` y `env`.
2. `kubectl apply` y `kubectl logs` para ambos.
3. `kubectl apply` de Applications ArgoCD.
4. `argocd app sync` y `argocd app wait`.
5. Validar `Synced`/`Healthy` y diferencias en logs.

## Prompt reusable

```text
Replica en este repositorio una prueba Helm + ArgoCD para comparar inyeccion de configuracion por archivos vs variables de entorno.

Requisitos:
1) Crea la estructura tests/argo-helm-config-analysis.
2) Implementa chart con parametro mode (files|env), ConfigMap y Deployment condicional.
3) Crea dos Applications ArgoCD (files/env) con namespaces separados y sync automatica.
4) Incluye docs: README, runbook, test-plan, findings.
5) Incluye comandos de validacion Synced/Healthy y logs esperados.
6) Documenta limitacion: ConfigMap no es para secretos.
```
