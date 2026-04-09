# argo-helm-config-analysis

Prueba tecnica para comparar inyeccion de configuracion en Kubernetes con Helm usando dos modos:

- `files`: ConfigMap montado en `/etc/config/*`.
- `env`: ConfigMap inyectado como variables de entorno.

## Lectura recomendada

1. `docs/00-executive-guide.md`
2. `docs/01-runbook.md`
3. `docs/02-test-plan.md`
4. `docs/03-findings.md`
5. `docs/04-ai-replication-instructions.md`
6. `docs/05-prerequisites-analysis.md`

## Estructura

- `charts/config-injection-demo`: chart Helm.
- `argocd/application-files.yaml`: Application para modo `files`.
- `argocd/application-env.yaml`: Application para modo `env`.

## Prerrequisitos

- `kubectl` y acceso a un cluster Kubernetes.
- `helm` instalado.
- `argocd` CLI para la fase GitOps.
- Repositorio Git accesible desde ArgoCD.
