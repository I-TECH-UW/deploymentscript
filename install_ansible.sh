#!/bin/bash

# Update package list
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Install Ansible
sudo apt install ansible -y

echo "Ansible installed successfully."

ansible --version
