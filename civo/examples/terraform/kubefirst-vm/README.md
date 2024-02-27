# kubefirst virtual machine in civo cloud

```
# visit this link for your civo token https://dashboard.civo.com/security
export CIVO_REGION="nyc1"
export TF_VAR_civo_region=$CIVO_REGION
export TF_VAR_civo_token=$CIVO_TOKEN
export TF_VAR_ssh_key_pub=$(cat ~/.ssh/id_rsa.pub)
terraform init
terraform apply

PUBLIC_IP=$(terraform output -json | jq .kubefirst_vm_public_ip.value)
ssh -i ~/.ssh/id_rsa root@$PUBLIC_IP

export GITHUB_TOKEN=$your-github-token
kubefirst version

kubefirst-cli golang utility version: v2.2.17

kubefirst k3d create

```
