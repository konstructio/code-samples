#!/usr/bin/env bash
echo "Add hosts in SSH config file (FRED)"

vm_1_public_ip=$(terraform output -json | jq -r '.kubernetes_vms_1_public_ip.value')
vm_2_public_ip=$(terraform output -json | jq -r '.kubernetes_vms_2_public_ip.value')
vm_3_public_ip=$(terraform output -json | jq -r '.kubernetes_vms_3_public_ip.value')

echo "
Host ${vm_1_public_ip}
Host ${vm_2_public_ip}
Host ${vm_3_public_ip}
  User root
  IdentityFile ${TF_VAR_ssh_private_key_path}
  IdentitiesOnly yes" >> ~/.ssh/config
