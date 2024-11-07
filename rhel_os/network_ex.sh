#!/bin/bash
# 1)
# Create a connection profile for the new network interface on server using a text editing tool. 
# Assign the IP 172.10.10.110/24 with gateway 172.10.10.1 and set it to autoactivate at system reboots. 
# Deactivate and reactive this interface at the command prompt

# For old versions of RedHat. In more recents, its can be used NetworkManager(nmcli)
#vim /etc/sysconfig/network-scripts/ifcfg-eth1
#TYPE=ethernet
#BOOTPROTO=none
#ONBOOT=yes
#IPADDR=172.31.22.106
#GATEWAY=172.31.16.1
#PREFIX=24
#DEVICE=eth1

#To activate
#ifup eth1 (won´t exist in rhel9)
#nmcli con sh
#ip a s

# 2)
#  Create a connection profile using the nmcli command for the new network interface that was added to server2. 
#  Assign the IP 172.10.10.120/24 with gateway 172.10.10.1, and set it to autoactivate at system reboot.
#  Deactivate and reactivate this interface at the command prompt

# nmcli con add type ethernet ifname eth1 ipv4.addresses 172.10.10.120 ipv4.gateway 172.10.10.1 autoconnect yes 
# nmcli con down name_con
# nmcli con up name_con

#  3)
#Update the /etc/hosts file on both server1 and server2. 
#Add the IP addresses assigned to both connections and map them to hostnames . 
#Test connectivity from server to client and from client to server using their IP addresses and then their hostnames

# vim /etc/hosts
# 172.31.22.105 srvopsls

#   4)
# Determine the current active zone. Add and activate a permanent rule to allow HTTP traffic on port 80, and then add a runtime
# rule for traffic intended for TCP port 443. Add a permanent rule to the internal zone for TCP port range 5901 to 5910.
# Confirm the changes and display the contents of the affected zone files. Switch the default zone to the internal zone and 
# activate it

firewall-cmd --get-default-zone
firewall-cmd --add-service=http --permanent
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=443/tcp #runtime rule
firewall-cmd --add-port=5901-5910/tcp --zone=intenal --permanent
firewall-cmd --reload
firewall-cmd --list-all --zone=internal
firewall-cmd --get-active-zones

#   5)
#   Remove the 2 permanent rules added above. Switch back to the public zone as the default zone, and confirm the changes

firewall-cmd --remove-service=http --zone=public --permanent
firewall-cmd --remove-port=5901-5910 --zone=internal --permanent