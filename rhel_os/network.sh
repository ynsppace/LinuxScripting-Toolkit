#!/bin/bash

#Listing interfaces UP and DOWN
ip -br addr show
#Listing IP
ip addr show
#Listing Statistics
ip -s link show
#Listing Routing Table
ip route

#Trace a Route(To troublehoot)
#tracepath or traceroute 
tracepath access.redhat.com

#Port and Services
#ss or netstat
ss -ta
netstat -t

#NetworkManager with nmcli

#Status of devices
nmcli dev status

#Listing existing connections
nmcli con show
#Listing active connections
nmcli con show --active
#Details of connection
nmcli con show eth0
#Reload Configurations
nmcli con reload
#Permissions of user in NetworkManager
nmcli gen permissions

#Editing Network connections with nmtui

#ETHTOOL -->  configuration of Network Interface Cards
# ethtool device
ethtool eth0 