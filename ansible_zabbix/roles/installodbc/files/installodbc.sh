#!/bin/bash

#Download appropriate package for the OS version
#Choose only ONE of the following, corresponding to your OS version
#RHEL 7
curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/mssql-release.repo

#RHEL 8
curl https://packages.microsoft.com/config/rhel/8/prod.repo | tee /etc/yum.repos.d/mssql-release.repo

#RHEL 9
curl https://packages.microsoft.com/config/rhel/9/prod.repo | tee /etc/yum.repos.d/mssql-release.repo

dnf remove unixODBC-utf16 unixODBC-utf16-devel #to avoid conflicts
ACCEPT_EULA=Y dnf install -y msodbcsql17
# optional: for bcp and sqlcmd
ACCEPT_EULA=Y dnf install -y mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
# optional: for unixODBC development headers
dnf install -y unixODBC-devel

sudo yum remove unixODBC-utf16 unixODBC-utf16-devel #to avoid conflicts
sudo ACCEPT_EULA=Y yum install -y msodbcsql18
# optional: for bcp and sqlcmd
sudo ACCEPT_EULA=Y yum install -y mssql-tools18
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc