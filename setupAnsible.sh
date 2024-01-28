#!/bin/bash

#
# Its necessary to have access to repositories of Redhat for the version of operating System(RHEL7|8|9)
#  cat /etc/os-release to verify version
# 
# Update package repositories
echo "Updating package repositories..."
sudo yum update -y

# Install EPEL repository
echo "Installing EPEL repository..."
sudo yum install epel-release -y

# Install Ansible
echo "Installing Ansible..."
sudo yum install ansible -y

# Verify Ansible installation
echo "Verifying Ansible installation..."

# List of Ansible commands to test
ansible_commands=(
    ansible
    ansible-config
    ansible-console
    ansible-connection
    ansible-doc
    ansible-galaxy
    ansible-inventory
    ansible-playbook
    ansible-pull
    ansible-vault
)

for cmd in "${ansible_commands[@]}"; do
    if command -v "$cmd" &> /dev/null; then
        echo "$cmd command is available."
    else
        echo "Error: $cmd command is not available."
    fi
done

echo "Ansible installation and testing completed."