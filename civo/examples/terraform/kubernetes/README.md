# create a civo kubernetes cluster

```sh
# visit this link for your civo token https://dashboard.civo.com/security
export CLUSTER_NAME="argocd4"
export CIVO_REGION="nyc1"
export TF_VAR_civo_region=$CIVO_REGION
export TF_VAR_civo_token=$CIVO_TOKEN
export TF_VAR_cluster_name=$CLUSTER_NAME
terraform init
terraform apply

export KUBECONFIG=./kubeconfig-$TF_VAR_cluster_name

civo k8s config $TF_VAR_cluster_name --region $CIVO_REGION --save
```

## create a secret for external dns

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: external-dns
---
apiVersion: v1
kind: Secret
metadata:
  name: external-dns-secrets
  namespace: external-dns
type: Opaque
stringData:
  token: $CIVO_TOKEN
EOF
```

## add argocd

```sh
kubectl kustomize https://github.com/kubefirst/manifests/argocd/cloud\?ref\=main | kubectl apply -f -

watch kubectl get pods -n argocd
```

## add registry

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: registry
  namespace: argocd
  annotations:
    argocd.argoproj.io/sync-wave: '1001'
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://github.com/kubefirst/code-samples.git
    path: gitops/examples/registry
    targetRevision: add-trifecta
  destination:
    name: in-cluster
    namespace: argocd
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
```
