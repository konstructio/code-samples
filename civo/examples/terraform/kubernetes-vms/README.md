# create virtual machines in civo cloud to be used as k3s agents

```sh
cd civo/examples/terraform/kubernetes-vms
# visit this link for your civo token https://dashboard.civo.com/security
export CIVO_REGION="nyc1"
export TF_VAR_civo_region=$CIVO_REGION
export TF_VAR_civo_token=$CIVO_TOKEN
export TF_VAR_ssh_key_pub=$(cat ~/.ssh/id_rsa.pub)
export TF_VAR_ssh_key_private=$(cat ~/.ssh/id_rsa)
terraform init
terraform apply
```

## todo 
- make host count dynamic leveraging terraform splat operator
- 