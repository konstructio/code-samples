# create virtual machines in civo cloud to be used as k3s agents

```
# visit this link for your civo token https://dashboard.civo.com/security
export CIVO_REGION="nyc1"
export TF_VAR_civo_region=$CIVO_REGION
export TF_VAR_civo_token=$CIVO_TOKEN
export TF_VAR_ssh_key_pub=$(cat ~/.ssh/id_rsa.pub)
terraform init
terraform apply

PUBLIC_IP=$(civo --region $CIVO_REGION --output json instance show kubefirst-vm | jq -r .public_ip)
ssh -i ~/.ssh/id_rsa root@$PUBLIC_IP

```
