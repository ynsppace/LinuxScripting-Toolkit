#!/bin/bash

#
# Its necessary to have access to repositories of Redhat for the version of operating System(RHEL7|8|9)
#  cat /etc/os-release to verify version
# 
# Update package repositories
echo "Updating packages"
sudo yum update -y

# Install EPEL repository
echo "Installing EPEL repository"
sudo yum install epel-release -y

# Install Ansible
echo "Installing Ansible..."
sudo yum install ansible -y

# Verify Ansible installation
echo "Verifying Ansible installation"

# Check if ansible command is available
if command -v ansible &> /dev/null; then
    echo "ansible command is available."
else
    echo "Error: ansible command is not available."
fi

# Check if ansible-config command is available
if command -v ansible-config &> /dev/null; then
    echo "ansible-config command is available."
else
    echo "Error: ansible-config command is not available."
fi

# Check if ansible-console command is available
if command -v ansible-console &> /dev/null; then
    echo "ansible-console command is available."
else
    echo "Error: ansible-console command is not available."
fi

# Check if ansible-connection command is available
if command -v ansible-connection &> /dev/null; then
    echo "ansible-connection command is available."
else
    echo "Error: ansible-connection command is not available."
fi

# Check if ansible-doc command is available
if command -v ansible-doc &> /dev/null; then
    echo "ansible-doc command is available."
else
    echo "Error: ansible-doc command is not available."
fi

# Check if ansible-galaxy command is available
if command -v ansible-galaxy &> /dev/null; then
    echo "ansible-galaxy command is available."
else
    echo "Error: ansible-galaxy command is not available."
fi

# Check if ansible-inventory command is available
if command -v ansible-inventory &> /dev/null; then
    echo "ansible-inventory command is available."
else
    echo "Error: ansible-inventory command is not available."
fi

# Check if ansible-playbook command is available
if command -v ansible-playbook &> /dev/null; then
    echo "ansible-playbook command is available."
else
    echo "Error: ansible-playbook command is not available."
fi

# Check if ansible-pull command is available
if command -v ansible-pull &> /dev/null; then
    echo "ansible-pull command is available."
else
    echo "Error: ansible-pull command is not available."
fi

# Check if ansible-vault command is available
if command -v ansible-vault &> /dev/null; then
    echo "ansible-vault command is available."
else
    echo "Error: ansible-vault command is not available."
fi

echo "Ansible installation and testing completed."