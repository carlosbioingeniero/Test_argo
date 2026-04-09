# Analisis de prerrequisitos (macOS)

## Estado detectado en este entorno

- `kubectl`: instalado (`v1.31.1`).
- `docker`: instalado (`28.5.1`).
- `helm`: no detectado en `PATH`.
- `argocd`: no detectado en `PATH`.
- Conectividad Kubernetes actual: `Forbidden` contra endpoint EKS (falta acceso/autenticacion para el contexto actual).

## Requeridos para replicar el ejercicio

Minimo obligatorio:

1. Cluster Kubernetes accesible con permisos para crear namespaces y recursos.
2. `kubectl`.
3. `helm`.
4. `argocd` CLI (para fase GitOps).

Opcional recomendado:

- `jq` para inspecciones JSON.
- `k9s` para observabilidad de recursos.

## Instalacion recomendada en macOS (Homebrew)

```bash
brew update
brew install helm argocd jq
```

Si no tienes cluster local y quieres uno rapido:

```bash
brew install --cask docker
brew install kind
```

## Validacion post-instalacion

```bash
kubectl version --client
helm version
argocd version --client
docker --version
```

## Riesgos/bloqueos frecuentes

- **Kubeconfig sin permisos**: aunque `kubectl` exista, puede fallar con `Forbidden`.
- **ArgoCD sin acceso al repo**: para SSH, usar deploy key sin passphrase o HTTPS+token.
- **CRDs de ArgoCD en clusters restringidos**: si falla `kubectl apply`, intentar `--server-side`.
