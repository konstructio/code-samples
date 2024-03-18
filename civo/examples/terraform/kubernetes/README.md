# create a civo kubernetes cluster

```
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
