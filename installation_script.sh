#!/bin/bash

# Update package list
sudo apt update

#install git
sudo apt install git

#Install Git LFS 
git lfs fetch
git lfs checkout
git lfs pull

#unzip deployment scripts

# Upgrade installed packages
sudo apt upgrade -y

# Install Ansible
sudo apt install ansible -y

echo "Ansible installed successfully."

ansible --version


# Read the current content of the file into a variable
original_content=$(<inventory/inventory.ini)

# Modify the variable's value
new_value=$(whoami)
modified_content="${original_content/ansible_user=*/ansible_user=\"$new_value\"}"

# Write the modified content to a temporary file
echo "$modified_content" > inventory/inventory.tmp

# Replace the original file with the temporary file
mv inventory/inventory.tmp inventory/inventory.ini

#Install docker and docker compose
dpkg -i docker-compose-plugin_2.20.2-1~ubuntu.22.04~jammy_arm64.deb  docker-ce_24.0.5-1~ubuntu.22.04~jammy_arm64.deb docker-ce-rootless-extras_24.0.5-1~ubuntu.22.04~jammy_arm64.deb docker-ce-cli_24.0.5-1~ubuntu.22.04~jammy_arm64.deb docker-ce-cli_20.10.24~3-0~ubuntu-jammy_arm64.deb docker-buildx-plugin_0.11.2-1~ubuntu.22.04~jammy_arm64.deb containerd.io_1.6.22-1_arm64.deb 

#Load images
source images.sh

#unzip sigdep3 project

#Replace db with production DB
mv *.sql sigdep/sigdep.sql

# Store the current working directory
current_dir=$(pwd)

# Change to the Sigdep directory
cd /path/to/your/directory

# Run your desired command in the specific directory
docker compose -f docker-compose-pilot.yml up -d
# Change back to the original directory (optional)
#cd "$current_dir"