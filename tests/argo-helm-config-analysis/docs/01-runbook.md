# Runbook operativo

## 1) Verificar herramientas y cluster

```bash
kubectl version --client
helm version
argocd version --client
kubectl cluster-info
kubectl get nodes
```

## 2) Render Helm (sin desplegar)

```bash
helm template demo-files ./tests/argo-helm-config-analysis/charts/config-injection-demo --set mode=files > /tmp/demo-files.yaml
helm template demo-env ./tests/argo-helm-config-analysis/charts/config-injection-demo --set mode=env > /tmp/demo-env.yaml
```

## 3) Validacion directa en Kubernetes

```bash
kubectl create ns argo-helm-config-test
kubectl apply -n argo-helm-config-test -f /tmp/demo-files.yaml
kubectl rollout status deploy/config-injection-demo -n argo-helm-config-test --timeout=120s
kubectl logs deploy/config-injection-demo -n argo-helm-config-test
```

Cambiar a modo `env`:

```bash
kubectl delete -n argo-helm-config-test -f /tmp/demo-files.yaml
kubectl apply -n argo-helm-config-test -f /tmp/demo-env.yaml
kubectl rollout status deploy/config-injection-demo -n argo-helm-config-test --timeout=120s
kubectl logs deploy/config-injection-demo -n argo-helm-config-test
```

## 4) Validacion ArgoCD desde Git

1. Edita `argocd/application-files.yaml` y `argocd/application-env.yaml`:
   - reemplaza `REPLACE_ME_REPO_URL` por tu repo.

2. Aplica ambas Applications:

```bash
kubectl apply -f tests/argo-helm-config-analysis/argocd/application-files.yaml
kubectl apply -f tests/argo-helm-config-analysis/argocd/application-env.yaml
```

3. Sincroniza y espera estado:

```bash
argocd app sync config-injection-demo-files
argocd app wait config-injection-demo-files --health --sync --timeout 180
argocd app sync config-injection-demo-env
argocd app wait config-injection-demo-env --health --sync --timeout 180
```

4. Valida logs por namespace:

```bash
kubectl logs deploy/config-injection-demo -n argo-helm-config-test-files
kubectl logs deploy/config-injection-demo -n argo-helm-config-test-env
```
