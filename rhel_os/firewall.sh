#!/bin/bash
# Accept or reject networks connections to system services with firewalld rules

firewall-cmd --get-default-zone
firewall-cmd --get-zones #list of available zones
firewall-cmd --zone=public --add-source=192.168.0.0/24 --permanent
firewall-cmd --reload
#List the rules by zone
firewall-cmd --zone=public --list-all

firewall-cmd --get-active-zones