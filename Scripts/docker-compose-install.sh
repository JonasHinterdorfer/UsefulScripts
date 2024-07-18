#!/bin/bash

# Main script starts here
echo "Welcome to Docker and Docker Compose installer script!"

export SUDO_ASKPASS=/usr/bin/ssh-askpass
# Function call to install Docker and Docker Compose locally
    sudo apt update 

    # Install required packages to allow apt to use a repository over HTTPS
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

    # Add Docker’s official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo -A apt-key add -

    # Add Docker repository for Ubuntu 20.04 (replace with your Ubuntu version if different)
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    # Update the package database with the Docker packages from the newly added repo
    sudo apt update

    # Install Docker engine
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    # Apply executable permissions to the Docker Compose binary
    sudo chmod +x /usr/local/bin/docker-compose

    # Optional: Add current user to the docker group to run Docker commands without sudo -A
    sudo usermod -aG docker $USER

    # Print Docker and Docker Compose versions installed
    docker --version
    docker-compose --version

echo "Installation complete."
