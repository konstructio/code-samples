#!/usr/bin/env bash
echo "update /etc/hosts file on virtual machines"

vm_1_public_ip=$(terraform output -json | jq -r '.kubernetes_vms_1_public_ip.value')
vm_2_public_ip=$(terraform output -json | jq -r '.kubernetes_vms_2_public_ip.value')
vm_3_public_ip=$(terraform output -json | jq -r '.kubernetes_vms_3_public_ip.value')
PUBLIC_IP_LIST=($vm_1_public_ip $vm_2_public_ip $vm_3_public_ip)

vm_1_private_etc_hosts=$(terraform output -json | jq -r '.kubernetes_vms_1_private_etc_hosts.value')
vm_1_public_etc_hosts=$(terraform output -json | jq -r '.kubernetes_vms_1_public_etc_hosts.value')
vm_2_private_etc_hosts=$(terraform output -json | jq -r '.kubernetes_vms_2_private_etc_hosts.value')
vm_2_public_etc_hosts=$(terraform output -json | jq -r '.kubernetes_vms_2_public_etc_hosts.value')
vm_3_private_etc_hosts=$(terraform output -json | jq -r '.kubernetes_vms_3_private_etc_hosts.value')
vm_3_public_etc_hosts=$(terraform output -json | jq -r '.kubernetes_vms_3_public_etc_hosts.value')

echo "Waiting for nodes to be ready..."
sleep 5
host_file_append="${vm_1_private_etc_hosts}"$'\n'"${vm_1_public_etc_hosts}"
host_file_append="$host_file_append"$'\n'"${vm_2_private_etc_hosts}"$'\n'"${vm_2_public_etc_hosts}"
host_file_append="$host_file_append"$'\n'"${vm_3_private_etc_hosts}"$'\n'"${vm_3_public_etc_hosts}"

echo "${host_file_append}"

# append /etc/hosts on each ip adress with the other ip adresses
echo "Adding hosts entries to each node..."
for ip in "${PUBLIC_IP_LIST[@]}"; do
    echo "Waiting for $ip to be ready..."
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip "echo -e '${host_file_append}' | sudo tee -a /etc/hosts"
done

