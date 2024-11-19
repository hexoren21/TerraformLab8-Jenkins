#!/bin/bash
# Path to the Docker daemon.json file
DOCKER_CONFIG_PATH="/etc/docker/daemon.json"
sudo apt update
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
# sleep 5
# # Check if the daemon.json file exists
# if [ -f "$DOCKER_CONFIG_PATH" ]; then
#     echo "The file $DOCKER_CONFIG_PATH exists. Updating the file..."
# else
#     echo "The file $DOCKER_CONFIG_PATH does not exist. Creating a new file..."
#     sudo touch "$DOCKER_CONFIG_PATH"
# fi

# # Add the configuration to allow Docker to listen on port 2375 for remote access
# echo '{
#   "hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"]
# }' | sudo tee "$DOCKER_CONFIG_PATH" > /dev/null

# Restart the Docker service for the changes to take effect
# echo "Restarting the Docker service..."
# sudo systemctl restart docker

# Check if Docker is listening on port 2375
# echo "Checking if Docker is listening on port 2375..."

# newgrp docker
# sudo groupadd docker
# sudo usermod -aG docker ubuntu
sudo sed -i '1i\PubkeyAuthentication no' /etc/ssh/sshd_config
sudo sed -i '2i\PasswordAuthentication yes' /etc/ssh/sshd_config
sleep 15
# 2. Restart usługi SSH
sudo systemctl restart ssh

# 3. Ustawienie hasła dla użytkownika 'ubuntu'
echo "ubuntu:admin12#" | sudo chpasswd