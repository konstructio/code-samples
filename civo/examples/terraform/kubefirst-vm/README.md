# kubefirst virtual machine in civo cloud

```
cd terraform/modules/civo
export TF_VAR_civo_cloud_region="nyc1"
# visit this link for your civo token https://dashboard.civo.com/security
export TF_VAR_civo_token=$your-civo-token
export TF_VAR_ssh_key_pub=$(cat ~/.ssh/id_rsa.pub)
terraform init
terraform apply

PUBLIC_IP=$(civo --region nyc1 --output json instance show kubefirst-vm | jq -r .public_ip)
ssh -i ~/.ssh/id_rsa root@$PUBLIC_IP

export GITHUB_TOKEN=$your-github-token
kubefirst version

kubefirst-cli golang utility version: v2.2.17

kubefirst k3d create

```
