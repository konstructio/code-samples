locals {
  startup_script = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    wget \
    libnss3-tools \
    --yes
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin --yes
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
mv kubectl /usr/local/bin/
chmod +x /usr/local/bin/kubectl
apt-get install wget libnss3-tools
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64
mv mkcert-v1.4.4-linux-amd64 /usr/bin/mkcert
chmod +x /usr/bin/mkcert
mkcert -install
kubectl version
export KUBEFIRST_VERSION=`curl https://github.com/kubefirst/kubefirst/releases/latest  -Ls -o /dev/null -w %%{url_effective} | grep -oE "[^/]+$"`
curl -s -LO "https://github.com/kubefirst/kubefirst/releases/download/$${KUBEFIRST_VERSION}/kubefirst_$${KUBEFIRST_VERSION:1}_linux_amd64.tar.gz"
tar -xvf kubefirst_$${KUBEFIRST_VERSION:1}_linux_amd64.tar.gz -C /usr/local/bin/
chmod +x /usr/local/bin/kubefirst
ssh-keyscan gitlab.com >> ~/.ssh/known_hosts
ssh-keyscan github.com >> ~/.ssh/known_hosts
kubefirst version
EOF
}