#!/usr/bin/env bash

echo "update /etc/hosts file on virtual machines"
terraform output -json 

echo "Waiting for nodes to be ready..."
sleep 5
IP_LIST=()
IP_PRIVATE_LIST=()
HOSTS_FILE_APPEND=""

echo "Getting IP addresses of master nodes..."
for i in {1..3}; do
    echo k1-master-$i
    ip=$(civo --region nyc1 --output json instance show k1-master-$i | jq -r '.public_ip')
    ip_private=$(civo --region nyc1 --output json instance show k1-master-$i | jq -r '.private_ip')
    sleep 1
    IP_LIST+=($ip)
    HOSTS_FILE_APPEND+="$ip k1-master-$i\n$ip_private k1-master-$i"$'\n'
done
echo "IP_LIST: ${IP_LIST[*]}"
echo "${HOSTS_FILE_APPEND}"

# append /etc/hosts on each ip adress with the other ip adresses
echo "Adding hosts entries to each node..."
for ip in "${IP_LIST[@]}"; do
    echo "Waiting for $ip to be ready..."
    ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$ip "echo -e '${HOSTS_FILE_APPEND}' | sudo tee -a /etc/hosts"
done

