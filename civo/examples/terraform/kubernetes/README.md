# create a civo kubernetes cluster

```sh
# visit this link for your civo token https://dashboard.civo.com/security
export CIVO_REGION="nyc1"
export TF_VAR_civo_region=$CIVO_REGION
export TF_VAR_civo_token=$CIVO_TOKEN
export TF_VAR_cluster_name=argocd1
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
